-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2020 lúc 02:43 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nganhang`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_KhachHang` (IN `Ma_KH` VARCHAR(9), OUT `result` INT)  BEGIN
	if not EXISTS (SELECT * FROM taikhoangui where MaKH = Ma_KH)THEN
    	if not EXISTS (SELECT * FROM taikhoanvay where MaKH = Ma_KH) THEN
        	DELETE FROM khachhang WHERE MaKH = Ma_KH;
            set result = 1;
        ELSE
        	set result = 0;
        end if;
    ELSE
    	set result = 0;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_TaiKhoanGoi` (IN `Ma_CN` VARCHAR(4), IN `So_TKG` VARCHAR(6), OUT `result` INT)  BEGIN
	if EXISTS (SELECT * FROM taikhoangui where MaCN = Ma_CN and SoTKG = So_TKG)THEN
        DELETE FROM taikhoangui WHERE MaCN = Ma_CN and SoTKG = So_TKG;
        set result = 1;
    ELSE
    	set result = 0;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_ChiNhanh` (IN `Ma_CN` VARCHAR(4), IN `Ma_NH` INT, IN `Tai_San` BIGINT, IN `Thanh_Pho` VARCHAR(30), OUT `result` INT)  BEGIN
	DECLARE row_before int;
    DECLARE row_after int;
    select count(*) into row_before from chinhanh;
    INSERT IGNORE INTO chinhanh values (Ma_CN,Ma_NH,Tai_San,Thanh_Pho);
    select count(*) into row_after from chinhanh;
    if(row_after > row_before) then
    	set result = 1;
    else 
    	set result = 0;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_NganHang` (IN `Ma_NH` INT, IN `Ten_NH` VARCHAR(100), OUT `success` INT)  BEGIN
	IF EXISTS (SELECT MaNH FROM nganhang where MaNH = Ma_NH) THEN
    	set success = 0;
    ELSE
		INSERT INTO nganhang values(Ma_NH, Ten_NH);
        set success = 1;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KiemTra_KhachHang` (IN `Ma_KH` VARCHAR(9), OUT `result` INT, OUT `Ten_KH` VARCHAR(50), OUT `Dia_Chi` VARCHAR(200))  BEGIN
    if EXISTS (SELECT * from khachhang WHERE MaKH = Ma_KH) THEN
    	SELECT TenKH into Ten_KH from khachhang WHERE MaKH = Ma_KH;
        SELECT DiaChi into Dia_Chi from khachhang WHERE MaKH = Ma_KH;
        set result = 1;
    ELSE
    	set result = 0;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KiemTra_TKG` (IN `So_TKG` VARCHAR(6), OUT `result` INT, OUT `So_Tien_Gui` INT, OUT `Ma_KH` VARCHAR(9))  BEGIN
    if EXISTS (SELECT * from taikhoangui WHERE SoTKG = So_TKG) THEN
    	SELECT SoTienGui into So_Tien_Gui from taikhoangui WHERE SoTKG = So_TKG;
        SELECT MaKH into Ma_KH from taikhoangui WHERE SoTKG = So_TKG;
        set result = 1;
    ELSE
    	set result = 0;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TB_TKG` (OUT `result` BIGINT)  BEGIN
    select AVG(SoTienGui)
    into result
    FROM taikhoangui;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_KhachHang` (IN `Ma_KH` VARCHAR(9), IN `Ten_KH` VARCHAR(50), IN `Dia_Chi` VARCHAR(200), OUT `result` INT)  BEGIN
	if exists (SELECT * from khachhang where MaKH = Ma_KH) THEN
    	if (Ten_KH = '') then
    	UPDATE nganhang
        set DiaChi = Dia_Chi
        WHERE MaKH = Ma_KH;
        set result = 1;
        ELSEIF (Dia_Chi = '') THEN
        UPDATE nganhang
        set TenKH = Ten_KH
        WHERE MaKH = Ma_KH;
        set result = 1;
        end if;
    ELSE
    	set result = 0;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_NganHang` (IN `Ma_NH` INT, IN `Ten_NH` VARCHAR(100), OUT `result` INT)  BEGIN
	if exists (SELECT * from nganhang where MaNH = Ma_NH) THEN
    	UPDATE nganhang
        set TenNH = Ten_NH
        WHERE MaNH = Ma_NH;
        set result = 1;
    ELSE
    	set result = 0;
    end if;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chinhanh`
--

CREATE TABLE `chinhanh` (
  `MaNH` int(11) NOT NULL,
  `MaCN` varchar(4) NOT NULL,
  `ThanhPhoCN` varchar(30) NOT NULL,
  `TaiSan` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chinhanh`
--

INSERT INTO `chinhanh` (`MaNH`, `MaCN`, `ThanhPhoCN`, `TaiSan`) VALUES
(1, 'CN01', 'Da Lat', 2000000000),
(2, 'CN02', 'Nha Trang', 2700000000),
(3, 'CN03', 'Thanh Hoa', 4500000000),
(4, 'CN04', 'TP HCM', 6000000000),
(5, 'CN05', 'Da Nang', 7000000000),
(6, 'CN06', 'Da Lat', 8000000000),
(2, 'CN12', 'Hue', 1400000000),
(3, 'CN13', 'Da Nang', 3600000000),
(4, 'CN14', 'Ha Noi', 5700000000),
(1, 'CN21', 'Ha Noi', 3500000000),
(2, 'CN22', 'Ha Noi', 4500000000),
(3, 'CN23', 'Da Lat', 2400000000),
(1, 'CN31', 'Da Nang', 4000000000),
(2, 'CN32', 'TP HCM', 5600000000),
(3, 'CN33', 'Can Tho', 5400000000),
(3, 'CN43', 'Nam Dinh', 3600000000);

--
-- Bẫy `chinhanh`
--
DELIMITER $$
CREATE TRIGGER `Them_ChiNhanh` AFTER INSERT ON `chinhanh` FOR EACH ROW BEGIN
	if not EXISTS (SELECT * from nganhang WHERE MaNH = new.MaNH) THEN
    	DELETE FROM chinhanh WHERE MaNH = new.MaNH;
    end if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Xoa_ChiNhanh` BEFORE DELETE ON `chinhanh` FOR EACH ROW BEGIN
	DELETE FROM taikhoanvay WHERE MaCN = old.MaCN;
    DELETE FROM taikhoangui WHERE MaCN = old.MaCN;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(9) NOT NULL,
  `TenKH` varchar(50) NOT NULL,
  `DiaChi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `DiaChi`) VALUES
('111222333', 'Ho Thi Thanh Thao', '456 Le Duan, Ha Noi'),
('112233445', 'Tran Van Tien', '12 Dien Bien Phu, Q1, TP.HCM'),
('123412341', 'Nguyen Van Thao', '34 Tran Phu, TP Nha Trang'),
('123456789', 'Nguyen Thi Hoa', '1/4 Hoang Van Thu, Da Lat'),
('221133445', 'Nguyen Thi Kim Mai', '4 Tran Binh Trong, Da Lat'),
('222111333', 'Do Tien Dong', '123 Tran Phu, Nam Dinh'),
('331122445', 'Bui Thi Dong', '345 Tran Hung Dao, Thanh Hoa'),
('333111222', 'Tran Dinh Hung', '783 Ly Thuong Kiet, Can Tho'),
('441122335', 'Nguyen Dinh Cuong', 'P12 Thanh Xuan Nam, Q Thanh Xuan'),
('456456456', 'Tran Nam Son', '5 Le Duan, TP Da Nang'),
('551122334', 'Tran Thi Khanh Van', '1A Ho Tung Mau, Da Lat'),
('987654321', 'Ho Thanh Son', '209 Tran Hung Dao, Q5, TP.HCM');

--
-- Bẫy `khachhang`
--
DELIMITER $$
CREATE TRIGGER `Xoa_KhachHang` BEFORE DELETE ON `khachhang` FOR EACH ROW BEGIN
	DELETE FROM taikhoanvay WHERE MaKH = old.MaKH;
    DELETE FROM taikhoangui WHERE MaKH = old.MaKH;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `macn_taisan_lonnhat`
-- (See below for the actual view)
--
CREATE TABLE `macn_taisan_lonnhat` (
`MaCN` varchar(4)
,`TaiSan` bigint(11)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `macn_tongtiengui`
-- (See below for the actual view)
--
CREATE TABLE `macn_tongtiengui` (
`MaCN` varchar(4)
,`TongSoTienGui` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganhang`
--

CREATE TABLE `nganhang` (
  `MaNH` int(11) NOT NULL,
  `TenNH` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nganhang`
--

INSERT INTO `nganhang` (`MaNH`, `TenNH`) VALUES
(1, 'Ngan Hang Cong Thuong'),
(2, 'Ngan Hang Ngoai Thuong'),
(3, 'Ngan Hang Nong Nghiep'),
(4, 'Ngan Hang A Chau'),
(5, 'Ngan Hang Thuong Tin'),
(6, 'Ngan Hang Dau Tu'),
(8, 'Ngan Hang Vietcombank');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoangui`
--

CREATE TABLE `taikhoangui` (
  `MaKH` varchar(9) DEFAULT NULL,
  `MaCN` varchar(4) NOT NULL,
  `SoTKG` varchar(6) NOT NULL,
  `SoTienGui` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoangui`
--

INSERT INTO `taikhoangui` (`MaKH`, `MaCN`, `SoTKG`, `SoTienGui`) VALUES
('123456789', 'CN01', '00001C', 127000000),
('221133445', 'CN02', '00002A', 12500000),
('456456456', 'CN03', '00003H', 123000000),
('222111333', 'CN05', '00005A', 1200000),
('987654321', 'CN05', '00005D', 345000000),
('123412341', 'CN05', '00005N', 45000000),
('987654321', 'CN06', '00006A', 10000000),
('331122445', 'CN13', '00003A', 27000000),
('551122334', 'CN14', '00004D', 560000000),
('123456789', 'CN14', '00004P', 35400000),
('123412341', 'CN21', '00001B', 67000000),
('222111333', 'CN22', '00002G', 56000000),
('987654321', 'CN23', '00004F', 4500000),
('333111222', 'CN33', '00003D', 47000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoanvay`
--

CREATE TABLE `taikhoanvay` (
  `MaKH` varchar(9) NOT NULL,
  `MaCN` varchar(4) NOT NULL,
  `SoTKV` varchar(6) NOT NULL,
  `SoTienVay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoanvay`
--

INSERT INTO `taikhoanvay` (`MaKH`, `MaCN`, `SoTKV`, `SoTienVay`) VALUES
('111222333', 'CN01', '10001A', 10000000),
('333111222', 'CN02', '10002A', 6000000),
('551122334', 'CN04', '10004A', 20000000),
('221133445', 'CN05', '10005G', 15000000),
('987654321', 'CN06', '10006A', 12100000),
('112233445', 'CN12', '10002D', 12000000),
('441122335', 'CN13', '10003F', 5500000);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `ten_taisan_nganhang`
-- (See below for the actual view)
--
CREATE TABLE `ten_taisan_nganhang` (
`TenNH` varchar(100)
,`TongTaiSan` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `tp_nhcongthuong`
-- (See below for the actual view)
--
CREATE TABLE `tp_nhcongthuong` (
`ThanhPhoCN` varchar(30)
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `macn_taisan_lonnhat`
--
DROP TABLE IF EXISTS `macn_taisan_lonnhat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `macn_taisan_lonnhat`  AS  select `chinhanh`.`MaCN` AS `MaCN`,`chinhanh`.`TaiSan` AS `TaiSan` from `chinhanh` where `chinhanh`.`TaiSan` >= all (select `chinhanh`.`TaiSan` from `chinhanh`) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `macn_tongtiengui`
--
DROP TABLE IF EXISTS `macn_tongtiengui`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `macn_tongtiengui`  AS  select `taikhoangui`.`MaCN` AS `MaCN`,sum(`taikhoangui`.`SoTienGui`) AS `TongSoTienGui` from `taikhoangui` group by `taikhoangui`.`MaCN` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `ten_taisan_nganhang`
--
DROP TABLE IF EXISTS `ten_taisan_nganhang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ten_taisan_nganhang`  AS  select `n`.`TenNH` AS `TenNH`,sum(`c`.`TaiSan`) AS `TongTaiSan` from (`chinhanh` `c` join `nganhang` `n`) where `c`.`MaNH` = `n`.`MaNH` group by `n`.`TenNH` ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `tp_nhcongthuong`
--
DROP TABLE IF EXISTS `tp_nhcongthuong`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tp_nhcongthuong`  AS  select `c`.`ThanhPhoCN` AS `ThanhPhoCN` from (`chinhanh` `c` join `nganhang` `n`) where `c`.`MaNH` = `n`.`MaNH` and `n`.`TenNH` = 'Ngan Hang Cong Thuong' ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD PRIMARY KEY (`MaCN`,`MaNH`),
  ADD KEY `ChiNhanh_NganHang` (`MaNH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`);

--
-- Chỉ mục cho bảng `nganhang`
--
ALTER TABLE `nganhang`
  ADD PRIMARY KEY (`MaNH`);

--
-- Chỉ mục cho bảng `taikhoangui`
--
ALTER TABLE `taikhoangui`
  ADD PRIMARY KEY (`MaCN`,`SoTKG`);

--
-- Chỉ mục cho bảng `taikhoanvay`
--
ALTER TABLE `taikhoanvay`
  ADD PRIMARY KEY (`MaCN`,`SoTKV`),
  ADD KEY `TaiKhoanVay_KhachHang` (`MaKH`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `nganhang`
--
ALTER TABLE `nganhang`
  MODIFY `MaNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD CONSTRAINT `ChiNhanh_NganHang` FOREIGN KEY (`MaNH`) REFERENCES `nganhang` (`MaNH`);

--
-- Các ràng buộc cho bảng `taikhoanvay`
--
ALTER TABLE `taikhoanvay`
  ADD CONSTRAINT `TaiKhoanVay_ChiNhanh` FOREIGN KEY (`MaCN`) REFERENCES `chinhanh` (`MaCN`),
  ADD CONSTRAINT `TaiKhoanVay_KhachHang` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
