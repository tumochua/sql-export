/* 
--Trigger
có 3 loại trigger
- login
- after
- instead of = thay thế


*/
drop table lop
drop table sinh_vien

create table lop(
	ma int,
	ten varchar(10),
	so_luong_sinh_vien int default 0,
	constraint PK_lop primary key(ma) 
)
create table sinh_vien(
	ma int,
	ten nvarchar(30),
	ma_lop int,
	constraint PK_SV primary key(ma),
	constraint FK_SV_LOP foreign key(ma_lop) references lop(ma) on delete cascade
)

insert into lop(ma,ten) values
(1,'sql'),
(2,'web'),
(3,'crypto')
insert into lop(ma,ten) values
(4,'html')

select * from lop
select * from sinh_vien

--Thêm sinh viên
drop trigger them_sinh_vien

create  trigger them_sinh_vien
on sinh_vien
after insert
as
begin
	declare @ma_lop int = (select ma_lop from inserted)
	update lop
	set
	so_luong_sinh_vien += 1
	where ma=@ma_lop
	select*from inserted
end

insert into sinh_vien values
(10, 'viet', 1)

--Xóa sinh viên
create or alter trigger xoa_sinh_vien
on sinh_vien
after delete
as
begin
	
	declare @ma_lop int = (select ma_lop from deleted)
	update lop
	set
	so_luong_sinh_vien -= 1
	where ma=@ma_lop
	select*from deleted
end
delete from sinh_vien where ma=5
drop trigger xoa_sinh_vien
--Cập nhật sinh viên
create or alter trigger sua_sinh_vien
on sinh_vien
after update
as
begin
	declare @ma_lop_cu int = (select ma_lop from deleted)
	update lop
	set
	so_luong_sinh_vien -= 1
	where ma=@ma_lop_cu

	declare @ma_lop_moi int = (select ma_lop from inserted)
	update lop
	set
	so_luong_sinh_vien += 1
	where ma=@ma_lop_moi

	select ma, ten as ten_truoc_sua, ma_lop as ma_lop_truoc_sua from deleted
	select ma, ten as ten_sau_sua, ma_lop as ma_lop_sau_sua from inserted
end
update sinh_vien
set ma_lop = 3
where ma=5
drop trigger sua_sinh_vien

--Thêm nhiều sinh viên
create or alter trigger them_nhieu_sinh_vien
on sinh_vien
after insert
as
begin
	update lop
	set so_luong_sinh_vien += i.sinh_vien_moi
	from
	lop join
	(select ma_lop,count(*) as sinh_vien_moi from inserted
	group by ma_lop) as i
	on lop.ma = i.ma_lop

	select*from lop
	select*from sinh_vien
end
delete from sinh_vien
insert into sinh_vien values
(1, N'Cường', 1),
(2, N'Cườngg', 2),
(3, 'Nam', 3),
(4, N'Thảo', 2)

--Xóa nhiều sinh viên
create or alter trigger xoa_nhieu_sinh_vien
on sinh_vien
after delete
as
begin
	update lop
	set so_luong_sinh_vien -= d.sinh_vien_bi_xoa
	from
	lop join
	(select ma_lop,count(*) as sinh_vien_bi_xoa from deleted
	group by ma_lop) as d
	on lop.ma = d.ma_lop

	select*from lop
	select*from sinh_vien
end
delete from sinh_vien where ma_lop =2

--Cập nhật nhiều sinh viên
create or alter trigger sua_nhieu_sinh_vien
on sinh_vien
after update
as
begin
	update lop
	set so_luong_sinh_vien -= d.sinh_vien_bi_xoa
	from
	lop join
	(select ma_lop,count(*) as sinh_vien_bi_xoa from deleted
	group by ma_lop) as d
	on lop.ma = d.ma_lop

	update lop
	set so_luong_sinh_vien += i.sinh_vien_moi
	from
	lop join
	(select ma_lop,count(*) as sinh_vien_moi from inserted
	group by ma_lop) as i
	on lop.ma = i.ma_lop

	select*from deleted
	select*from inserted
end

update sinh_vien 
set ten = 'Nug' where ma_lop = 2



--Có 2 bảng
--Kho (mã, tên, tổng tài sản, sức chứa)
--Sản phẩm (mã, tên, số lượng, giá trị, mã kho)

create table kho(
ma int identity,
ten nvarchar(50) not null,
tong_tai_san int,
suc_chua int,
primary key (ma)
);

create table san_pham(
ma int identity,
ten nvarchar(50) not null,
so_luong int,
gia_tri int not null,
ma_kho int not null,
primary key (ma),
foreign key (ma_kho) references kho(ma)
);

--Tạo procedure để thêm và hiển thị lại giá trị vừa thêm ở từng bảng

create or alter procedure proc_them_kho
@ten nvarchar(50),
@tong_tai_san int null ,
@suc_chua int null
as
begin
		insert into kho(ten,tong_tai_san,suc_chua)
		values (@ten,@tong_tai_san,@suc_chua);
		select * from kho where ma in (select scope_identity())
end

select * from kho
proc_them_kho @ten = N'Xuân', @tong_tai_san = 500, @suc_chua = 30

create or alter procedure proc_them_san_pham
@ten nvarchar(50),
@so_luong int = null ,
@gia_tri int  = -1,
@ma_kho int 
as
begin
		insert into san_pham(ten,so_luong,gia_tri,ma_kho)
		values (@ten,@so_luong,@gia_tri,@ma_kho);
		select * from san_pham where ma in (select scope_identity())
end
proc_them_san_pham @ten = N'Tivi',@so_luong = 2, @gia_tri = 100, @ma_kho = 4

--Khi cập nhật sản phẩm thì cập nhật tổng tài sản tương ứng với kho

create or alter trigger tinh_tong_tai_san
on san_pham
after update
as begin
	select * from inserted
	select * from deleted
	select * from kho
	update kho
	set tong_tai_san = tong_tai_san + i.gia_tri*i.so_luong
	from kho 
		join inserted as i 
		on kho.ma = i.ma_kho
	update kho
	set tong_tai_san = tong_tai_san - d.gia_tri*d.so_luong
	from kho
		join deleted as d
		on kho.ma = d.ma_kho
	select * from kho
	select * from san_pham
end

drop trigger tinh_tong_tai_san
select * from kho
select * from san_pham

update san_pham
set ma_kho = 5
where ma in (4,5)

--Khi xoá kho thì kiểm tra sản phẩm có tồn tại không, nếu không mới được xoá

create or alter trigger xoa_kho
on kho
instead of delete
as 
begin
	if	exists (select san_pham.ten from san_pham
			join deleted as d on san_pham.ma_kho = d.ma)
		begin
		select * from kho
		select * from san_pham
		end
	else
		begin
		delete from kho where ma in (select deleted.ma from deleted)
		select * from kho
		select * from san_pham
		end
		
end

delete from kho where ma in (5,6)
select * from kho
select * from san_pham

--(*: Kiểm tra sức chứa tương ứng với tổng số lượng sản phẩm, nếu còn dư mới được cập nhật vào kho đó)

create or alter trigger them_san_pham_kiem_tra_kho
on san_pham
instead of insert 
as
begin
	
	select ma_kho,sum(so_luong) as so_luong into #tong_so_luong from inserted group by ma_kho
	update #tong_so_luong
	set #tong_so_luong.so_luong += tong_so_san_pham
	from #tong_so_luong join (select ma_kho, sum(so_luong) as tong_so_san_pham from san_pham group by ma_kho) as m on #tong_so_luong.ma_kho = m.ma_kho
	select * from #tong_so_luong

	insert into san_pham
	select them.ten , them.so_luong , them.gia_tri, them.ma_kho 
	from #tong_so_luong join kho on #tong_so_luong.ma_kho = kho.ma right join inserted as them on kho.ma = them.ma_kho
	where  #tong_so_luong.so_luong <= kho.suc_chua
	
	select * from san_pham
	select * from kho
end

insert into san_pham
values ('Laptop',1,80,6),(N'Máy tính bảng',10,120,5)
select * from kho
select * from san_pham