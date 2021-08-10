
create table SinhVien (
MSSV char(8) primary key,
Hoten nvarchar(30) not null,
Namsinh int,
DiemMon1 float,
DiemMon2 float,
DiemMon3 float,
Email char(30),
Dienthoai char(11)
)

SELECT * FROM SinhVien

insert into SinhVien values ('1710261', N'Võ Ngọc Tâm', 1999, 10, 10, 10, '1710261@dlu.edu.vn', '0389750032');
insert into SinhVien values ('1710233', N'Đặng Trần Hữu Nhân', 1999, 5, 5, 5, '1710233@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710196', N'Nguyễn Đăng Khoa', 1999, 7, 9, 9, '1710196@dlu.edu.vn', '035547878');
insert into SinhVien values ('1714234', N'Hứa Đình Doanh', 1999, 7, 9, 9, '1714234@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710264', N'Huỳnh Lê Hữu Thành', 1999, 8, 9, 9, '1710264@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710144', N'Nguyễn Đức Đề', 1999, 8, 9, 9, '1710144@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710156', N'Phạm Bá Xuân Duy', 1999, 8, 9, 9, '1710156@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710204', N'Bùi Đức Hoàng Lâm', 1999, 8, 9, 9, '1710204@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710303', N'Phạm Hoàng Việt', 1999, 8, 9, 9, '1710303@dlu.edu.vn', '035547878');
insert into SinhVien values ('1710285', N'Lê Anh Trí', 1999, 8, 9, 9, '1710285@dlu.edu.vn', '035547878');


update dbo.SinhVien
set DiemMon1=8.5
where MSSV='1710261'


delete from dbo.SinhVien where MSSV='1710233'