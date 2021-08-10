use nganhang;

-- 1.1 Thêm dữ liệu vào bảng NganHang, ChiNhanh. Nếu thành công trả về 1, ngược lại trả
-- về 0.

DROP PROCEDURE IF EXISTS `insertNganHangTable`;
DELIMITER $$
CREATE PROCEDURE `insertNganHangTable`(
	TenNH VARCHAR(30),
	OUT Result int(1)
)
BEGIN
       START TRANSACTION; 
       insert into `quanlynganhang`.`NganHang` (`TenNH`) values (TenNH);
       IF ROW_COUNT() > 0 THEN 
		   set Result = 1;
           COMMIT; 
       ELSE
		   set Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;

set @Result = 0;
call quanlynganhang.insertNganHangTable('Ngan Hang A Dong', @Result);
select @Result;


DROP PROCEDURE IF EXISTS `insertChiNhanhTable`;
DELIMITER $$
CREATE PROCEDURE `insertChiNhanhTable`(
	MaCN char(4),
    ThanhPhoCN varchar(20),
    TaiSan bigint,
    MaNH int(2),
    OUT Result int(1)
)
BEGIN
       START TRANSACTION; 
       INSERT INTO `quanlynganhang`.`ChiNhanh` (`MaCN`, `ThanhPhoCN`, `TaiSan`, `MaNH`) 
       VALUES (MaCN, ThanhPhoCN, TaiSan, MaNH);
       IF ROW_COUNT() > 0 THEN
		   set Result = 1;
           COMMIT; 
       ELSE
		   set Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;

-- call procedure 1.0
-- set @Result = 0;
-- call quanlynganhang.insertNganHangTable('Ngan Hang A Dong', @Result);
-- select @Result;

-- set @Result = 0;
-- call quanlynganhang.insertChiNhanhTable('CN01', 'Da Lat', 500000, 1, @Result);
-- select @Result;


-- 1.2 Cập nhật dữ liệu cho bảng NganHang, KhachHang. Nếu thành công trả về 1. Ngược
-- lại trả về 0.
DROP PROCEDURE IF EXISTS `updateNganHangTable`;
DELIMITER $$
CREATE PROCEDURE `updateNganHangTable`(
	TenNH VARCHAR(30), 
    MaNH int(2),
    OUT Result int(1)
)
BEGIN
       START TRANSACTION; 
       UPDATE `quanlynganhang`.`NganHang` SET `TenNH` = TenNH WHERE (`MaNH` = MaNH);
       IF ROW_COUNT() > 0 THEN 
		   SET Result = 1;
           COMMIT; 
       ELSE
		   SET Result = 0;	
           ROLLBACK;
       END IF;
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS `updateKhachHangTable`;
DELIMITER $$
CREATE PROCEDURE `updateKhachHangTable`(
	MaKH char(10), 
    TenKH varchar(30), 
    DiaChi varchar(50),
    Out Result int(1)
)
BEGIN
       START TRANSACTION; 
       UPDATE `quanlynganhang`.`KhachHang` SET `TenKH` = TenKH, `DiaChi` = DiaChi WHERE (`MaKH` = MaKH);
       IF ROW_COUNT() > 0 THEN 
           SET Result = 1;
           COMMIT; 
       ELSE
           SET Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;

-- 1.3 Xóa, dữ liệu trong các bảng KhachHang, TaiKhoanGoi. Nếu thành công trả về 1,
-- ngược lại trả về 0.
DROP PROCEDURE IF EXISTS `deleteTaiKhoanVayTable`;
DELIMITER $$
CREATE PROCEDURE `deleteTaiKhoanVayTable`(
	MaKH char(10),
    out Result int(1)
)
BEGIN
       START TRANSACTION; 
       DELETE FROM `quanlynganhang`.`TaiKhoanVay` WHERE (`MaKH` = MaKH);

       IF ROW_COUNT() > 0 THEN 
           SET Result = 1;
           COMMIT; 
       ELSE
           SET Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `deleteTaiKhoanGoiTable`;
DELIMITER $$
CREATE PROCEDURE `deleteTaiKhoanGoiTable`(
	MaKH char(10),
    out Result int(1)
)
BEGIN
       START TRANSACTION; 
       DELETE FROM `quanlynganhang`.`TaiKhoanGoi` WHERE (`MaKH` = MaKH);

       IF ROW_COUNT() > 0 THEN 
           SET Result = 1;
           COMMIT; 
       ELSE
           SET Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS `deleteKhachHangTable`;
DELIMITER $$
CREATE PROCEDURE `deleteKhachHangTable`(
	MaKH char(10),
    out Result int(1)
)
BEGIN
       START TRANSACTION; 
	   DELETE FROM `quanlynganhang`.`KhachHang` WHERE (`MaKH` = MaKH);

       IF ROW_COUNT() > 0 THEN 
           SET Result = 1;
           COMMIT; 
       ELSE
           SET Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;

-- 1.4 Dua tien vao so tai khoan, neu tai khoan goi do ko ton tai, tra ve 0, nguoc lai tra ve 
-- so tien goi va ma kh cua nguoi do

-- 1.6 tinh trung binh tai khoan goi
DROP PROCEDURE IF EXISTS `avarageTaiKhoanGoiTable`;
DELIMITER $$
CREATE PROCEDURE `avarageTaiKhoanGoiTable`(
	MaKH char(10),
    out Result int(1)
)
BEGIN
       START TRANSACTION; 
       select a.MaKH, AVG(SoTienGoi)
	   from TaiKhoanGoi as a
	   Group by MaKH;

       IF ROW_COUNT() > 0 THEN 
           SET Result = 1;
           COMMIT; 
       ELSE
           SET Result = 0;
           ROLLBACK;
       END IF;
END$$
DELIMITER ;


-- 2. View
-- 2.1 Xem tat ca nhung thanh pho co chi nhanh cua ngan hang cong thuong
drop view if exists ThanhPhoChiNhanhNganHangCongThuong;
CREATE VIEW ThanhPhoChiNhanhNganHangCongThuong as
select ThanhPhoCN
from ChiNhanh, NganHang
where TenNH like '%Cong Thuong%';

-- 2.2 Xem thong tin ngan hang va tong tai san ngan hang
drop view if exists ThongTinNganHang;
CREATE VIEW ThongTinNganHang as
select TenNH, sum(SoTienGoi) as tongsotien
from NganHang, TaiKhoanGoi
group by TenNH;

-- 2.3 xem macn va tai san cua chi nhanh co tai san lon nhat
drop view if exists ThongTinTaiSanLonNhat;
CREATE VIEW ThongTinTaiSanLonNhat as
select * 
from ChiNhanh 
order by TaiSan desc limit 1;

-- 2.4. Xem tổng số tiền mà mỗi chi nhánh ngân hàng đang được khách hàng gởi.
drop view if exists TongSoTienMoiChiNhanh;
CREATE VIEW TongSoTienMoiChiNhanh as
select MaCN, Sum(TaiSan) as TaiSan from KhachHang, ChiNhanh group by MaCN;

-- 3 Trigger
-- 3.1 Tạo trigger khi xóa dữ liệu khách hàng thì tài khoản gởi và vay của khách hàng đó cũng xóa.
DROP TRIGGER IF EXISTS HandleTriggerDeleteCustomer;
DELIMITER $$
CREATE TRIGGER HandleTriggerDeleteCustomer
BEFORE DELETE ON `KhachHang`
FOR EACH ROW
BEGIN
	Set @maKH = OLD.MaKH;
    DELETE FROM `TaiKhoanGoi` WHERE MaKH = @maKH;
    DELETE FROM `TaiKhoanVay` WHERE MaKH = @maKH;
END $$

-- 3.2. Tạo trigger khi xóa dữ liệu chi nhánh ngân hàng thì các tài khoản gởi và vay thuộc chi nhánh đó cũng xóa.
DROP TRIGGER IF EXISTS HandleTriggerDeleteBranch;
DELIMITER $$
CREATE TRIGGER HandleTriggerDeleteBranch
BEFORE DELETE ON `ChiNhanh`
FOR EACH ROW
BEGIN
	Set @maCN = OLD.MaCN;
    DELETE FROM `TaiKhoanGoi` WHERE MaCN = @maCN;
    DELETE FROM `TaiKhoanVay` WHERE MaCN = @maCN;
END $$
-- test
DELETE FROM `ChiNhanh` WHERE MaCN = 'CN01';

-- 3.3 tạo trigger để không cho phép xóa 2 mẫu tin trong bảng NganHang đồng thời.
DROP TRIGGER IF EXISTS NotAlowDeleteTwoRecords;
DELIMITER $$
CREATE TRIGGER NotAlowDeleteTwoRecords
BEFORE DELETE ON `NganHang`
FOR EACH ROW
BEGIN
	IF(@row_being_deleted IS NULL) THEN
    	SET @row_being_deleted = 1;
    ELSE
    	SET @row_being_deleted = NULL;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể xóa từ 2 ngân hàng cùng lúc trở lên!';
    END IF;
END $$





