-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2020 lúc 11:10 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `MSSV` int(10) NOT NULL,
  `HoTen` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `NamSinh` int(5) NOT NULL,
  `DiemMon1` int(5) NOT NULL,
  `DiemMon2` int(5) NOT NULL,
  `DiemMon3` int(5) NOT NULL,
  `Email` text COLLATE utf8_unicode_ci NOT NULL,
  `DienThoai` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`MSSV`, `HoTen`, `NamSinh`, `DiemMon1`, `DiemMon2`, `DiemMon3`, `Email`, `DienThoai`) VALUES
(0, '', 0, 0, 0, 10, '', 0),
(17112020, 'Tý', 1999, 9, 7, 8, 'ty@gmail.com', 1234567890),
(17112021, 'Sửu', 1999, 5, 7, 6, 'suu@gmail.com', 1234567891),
(17112022, 'Dần', 1998, 3, 8, 6, 'dan@gmail.com', 1234567892),
(17112023, 'Mão', 1997, 4, 6, 9, 'mao@gmail.com', 1234567893),
(17112024, 'Thìn', 2000, 5, 9, 8, 'thin@gmail.com', 1234567894),
(17112025, 'Tị', 1998, 7, 6, 3, 'ti@gmail.com', 1234567895),
(17112026, 'Ngọ', 1999, 4, 8, 7, 'ngo@gmail.com', 1234567896),
(17112027, 'Mùi', 1998, 7, 3, 5, 'mui@gmail.com', 1234567897),
(17112028, 'Thân', 1999, 9, 7, 4, 'than@gmail.com', 1234567898),
(17112029, 'Dậu', 1997, 7, 3, 5, 'dau@gmail.com', 1234567899);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MSSV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
