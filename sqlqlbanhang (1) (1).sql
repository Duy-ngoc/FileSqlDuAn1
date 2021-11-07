/*
- Sửa lại quy tắc đặt tên: MaNV, TenNV,.....
- Giới hạn của kí tự tăng lên 255
- Hình ảnh thì varchar không dấu
- Các trạng thái luôn luôn có kiểu bit (trừ 1 số trường hợp đặt biệt)
- Đặt GO ở cuối mỗi câu lệnh để thực hiện tuần tự khi excute
*/

-- drop database QuanLyNhaHang_Nhom_Flames

create database QuanLyNhaHang_Nhom_Flames;
GO


use QuanLyNhaHang_Nhom_Flames;
GO


create table NHANVIEN
(
	MaNV int identity primary key,
	TenNV nvarchar(255) not null,
	Email varchar(255) not null,
	NgaySinh date not null,
	GioiTinh bit not null,
	DiaChi nvarchar(255) not null,
	SDT varchar(15),
	VaiTro bit not null,
	TrangThai bit not null,
	HinhAnh varchar(255), -- địa chỉ nên không dấu
	MatKhau varchar(100) not null

);
GO

 create table DANHMUCMONAN
 (
	MaDM int identity primary key,
	TenDM nvarchar(255) not null
 );
 GO

 create table MONAN
 (
	MaMon int identity primary key,
	TenMon nvarchar(255) not null,
	DonViTinh nvarchar(50) not null,
	DonGia float not null, -- nvarchar -> float
	HinhAnh varchar(255),
	TinhTrang bit not null, -- nvarchar -> bit: còn / hết
	MaDM int references  DANHMUCMONAN(MaDM),
 );
 GO

  create table BAN
(
    MaBan int identity primary key,
    TenBan nvarchar(255) not null,
    TrangThai bit  not null -- nvarchar -> bit: trống / không trống
);
 GO
 
 create  table HOADON
 (
	MaHD int identity primary key,
	NgayLap date default GETDATE() not null,
	TongTien nvarchar(100) not null,
	MaBan int references  BAN(MaBan),
	MaNV int references NHANVIEN(MaNV)
 );
  
   create  table HOADONCHITIET
   (
	MaHD int  references  HOADON(MaHD),
	MaMon int  references  MONAN(MaMon),
	SoLuong int not null,
	Primary key (MaHD,MaMon)
   );
   --đùa tý thôi
   --them nhan vien
     insert into NHANVIEN values (N'Võ Minh Chiến','minhchienhk38@gmail.com','2002-08-21','1','Hà tĩnh','0985624685','1','1','\Resources\macdinh.png','E99A18C428CB38D5F260853678922E03')
   insert into NHANVIEN values (N'Ngô Tất Tố','tattay@gmail.com','2002-08-21','1','Hà tĩnh','0985624685','0','1','\Resources\macdinh.png','E99A18C428CB38D5F260853678922E03')