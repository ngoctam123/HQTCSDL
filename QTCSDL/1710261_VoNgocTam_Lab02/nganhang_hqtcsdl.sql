-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 10, 2020 lúc 01:22 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nganhang_hqtcsdl`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chinhanh`
--

CREATE TABLE `chinhanh` (
  `MaNH` int(11) NOT NULL,
  `MaCN` varchar(500) NOT NULL,
  `ThanhPhoCN` varchar(500) NOT NULL,
  `TaiSan` float NOT NULL
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
(1, 'CN11', 'TP HCM', 5000000000),
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL,
  `TenKH` varchar(500) NOT NULL,
  `DiaChi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `DiaChi`) VALUES
(111222333, 'Ho Thi Thanh Thao', '456 Le Duan, Ha Noi'),
(112233445, 'Tran Van Tien', '12 Dien Ben Phu, Q1, TPHCM'),
(123123123, 'Phan Thi Quynh Nhu', '54 Hai Ba Trung, Ha Noi'),
(123412341, 'Nguyen Van Thao', '34 Tran Phu TP Nha Trang'),
(123456789, 'Nguyen Thi Hoa', '1/4 Hoang Van Thu, Da Lat'),
(221133445, 'Nguyen Thi Mai', '4 Tran Binh Trong, Da Lat'),
(222111333, 'Do Tien Dong ', '123 Tran Phu, Nam Dinh'),
(331122445, 'Bui Thi Dong', '345 Tran Hung Dao, Thanh Hoa'),
(333111222, 'Tran Dinh Hung', '783 Ly Thuong Kiet, Can Tho'),
(441122335, 'Nguyen Dinh Cuong', 'P12 Thanh Xuan Nam, Q Thanh Xuan'),
(456456456, 'Tran Nam Son', '5 Le Duan, TP Da Nang'),
(551122334, 'Tran Thi Khanh Van', '1A Ho Tung Mau, Da Lat'),
(987654321, 'Ho Thanh Son', '209 Tran Hung Dao, Q5, TP HCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganhang`
--

CREATE TABLE `nganhang` (
  `MaNH` int(11) NOT NULL,
  `TenNH` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nganhang`
--

INSERT INTO `nganhang` (`MaNH`, `TenNH`) VALUES
(1, 'Ngan Hang Cong Thuong'),
(2, 'Ngan Hang Ngoai Thuong'),
(3, 'Ngan Hang Nong Nghiep'),
(4, 'Ngan Hang A Chau'),
(5, 'Ngan Hang Thuong Tin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoangui`
--

CREATE TABLE `taikhoangui` (
  `MaKH` int(11) NOT NULL,
  `MaCN` varchar(500) NOT NULL,
  `SoTKG` varchar(500) NOT NULL,
  `SoTienGui` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoangui`
--

INSERT INTO `taikhoangui` (`MaKH`, `MaCN`, `SoTKG`, `SoTienGui`) VALUES
(123123123, 'CN01', '00001A', 10000000),
(123456789, 'CN01', '00001C', 127000000),
(221133445, 'CN02', '00002A', 12500000),
(456456456, 'CN03', '00003H', 123000000),
(222111333, 'CN05', '00005A', 1200000),
(987654321, 'CN05', '00005D', 345000000),
(123412341, 'CN05', '00005N', 45000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoanvay`
--

CREATE TABLE `taikhoanvay` (
  `MaKH` int(11) NOT NULL,
  `MaCN` varchar(50) NOT NULL,
  `SoTKV` varchar(10) NOT NULL,
  `SoTienVay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoanvay`
--

INSERT INTO `taikhoanvay` (`MaKH`, `MaCN`, `SoTKV`, `SoTienVay`) VALUES
(111222333, 'CN01', '10001A', 10000000),
(987654321, 'CN11', '10001D', 45000000),
(333111222, 'CN02', '10002A', 6000000),
(112233445, 'CN12', '10002D', 12000000),
(441122335, 'CN13', '10003F', 5500000),
(551122334, 'CN04', '10004A', 20000000),
(123123123, 'CN14', '10005A', 12500000),
(221133445, 'CN05', '10005G', 15000000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD PRIMARY KEY (`MaCN`),
  ADD KEY `MaNH` (`MaNH`);

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
  ADD PRIMARY KEY (`SoTKG`),
  ADD KEY `MaKH` (`MaKH`,`MaCN`),
  ADD KEY `MaCN` (`MaCN`);

--
-- Chỉ mục cho bảng `taikhoanvay`
--
ALTER TABLE `taikhoanvay`
  ADD PRIMARY KEY (`SoTKV`),
  ADD KEY `MaKH` (`MaKH`,`MaCN`),
  ADD KEY `MaCN` (`MaCN`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chinhanh`
--
ALTER TABLE `chinhanh`
  ADD CONSTRAINT `chinhanh_ibfk_1` FOREIGN KEY (`MaNH`) REFERENCES `nganhang` (`MaNH`);

--
-- Các ràng buộc cho bảng `taikhoangui`
--
ALTER TABLE `taikhoangui`
  ADD CONSTRAINT `taikhoangui_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `taikhoangui_ibfk_2` FOREIGN KEY (`MaCN`) REFERENCES `chinhanh` (`MaCN`);

--
-- Các ràng buộc cho bảng `taikhoanvay`
--
ALTER TABLE `taikhoanvay`
  ADD CONSTRAINT `taikhoanvay_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `taikhoanvay_ibfk_2` FOREIGN KEY (`MaCN`) REFERENCES `chinhanh` (`MaCN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
