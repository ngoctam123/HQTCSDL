-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2020 lúc 04:33 PM
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
-- Cơ sở dữ liệu: `quanlysanpham`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteProducts` (IN `masp` CHAR(10))  BEGIN
	DELETE FROM sanpham
    WHERE sanpham.MaSP = masp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts` ()  BEGIN
	SELECT s.*, l.TenLoaiSP FROM sanpham s, loaisanpham l;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProducts_MaLoaiSP` (IN `maloaisp` CHAR(10))  BEGIN
	SELECT s.*, l.TenLoaiSP 
    FROM sanpham s, loaisanpham l 
    WHERE s.MaLoaiSP = l.MaLoaiSP AND s.MaLoaiSP = maloaisp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertProducts` (IN `masp` CHAR(10), IN `tensp` VARCHAR(200), IN `soluongnhap` INT(11), IN `giaban` INT(20), IN `giakhuyenmai` INT(20), IN `mancc` CHAR(10), IN `maloaisp` CHAR(10), IN `mota` VARCHAR(500), IN `hinhanh` CHAR(20))  BEGIN
	INSERT INTO sanpham (MaSP, TenSP, SoLuongNhap, GiaBan, GiaKhuyenMai, MaNCC, MaLoaiSP, MoTa, HinhAnh)
    VALUES (masp, tensp, soluongnhap, giaban, giakhuyenmai, mancc, maloaisp, mota, hinhanh);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProducts` (IN `masp` CHAR(10), IN `tensp` VARCHAR(100), IN `soluongnhap` INT(11), IN `giaban` INT(20), IN `giakhuyenmai` INT(20), IN `mancc` CHAR(10), IN `maloaisp` CHAR(10), IN `mota` VARCHAR(500), IN `hinhanh` CHAR(20))  BEGIN
	UPDATE sanpham
    SET TenSP=tensp, 
        SoLuongNhap = soluongnhap, 
        GiaBan = giaban, 
        GiaKhuyenMai = giakhuyenmai, 
        MaNCC = mancc, 
        MaLoaiSP = maloaisp, 
        MoTa = mota, 
        HinhAnh = hinhanh
    WHERE MaSP = masp;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucnang`
--

CREATE TABLE `chucnang` (
  `IDChucNang` char(10) NOT NULL,
  `TenChucNang` varchar(50) NOT NULL,
  `MoTaChucNang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSP` char(10) NOT NULL,
  `TenLoaiSP` varchar(50) NOT NULL,
  `LienKet` char(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSP`, `TenLoaiSP`, `LienKet`) VALUES
('1', 'Trang điểm', 'trang-diem'),
('2', 'Dưỡng da', 'duong-da'),
('3', 'Bộ sản phẩm', 'bo-san-pham'),
('4', 'Nước hoa', 'nuoc-hoa'),
('5', 'Thương hiệu', 'thuong-hieu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaitaikhoan`
--

CREATE TABLE `loaitaikhoan` (
  `MaLoaiTK` char(10) NOT NULL,
  `TenLoaiTK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNCC` char(10) NOT NULL,
  `TenNhaCC` varchar(50) NOT NULL,
  `GhiChu` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNhaCC`, `GhiChu`) VALUES
('CCK', 'Khác', 'Các nhà cung cấp sản phẩm không nhiều'),
('HQ-3CE', '3CE', ''),
('HQ-MAC', 'MAC', ''),
('P-Chanel', 'Chanel', ''),
('Y-Bvlgari', 'Bvlgari', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quyenhan`
--

CREATE TABLE `quyenhan` (
  `IDQH` char(10) NOT NULL,
  `IDChucNang` char(10) NOT NULL,
  `MaLoaiTK` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(5) NOT NULL,
  `TenSP` varchar(200) NOT NULL,
  `SoLuongNhap` int(11) NOT NULL,
  `GiaBan` int(20) NOT NULL,
  `GiaKhuyenMai` int(20) DEFAULT NULL,
  `MaNCC` char(10) NOT NULL,
  `MaLoaiSP` char(10) NOT NULL,
  `MoTa` varchar(500) NOT NULL,
  `ThungRac` int(1) NOT NULL,
  `HinhAnh` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `SoLuongNhap`, `GiaBan`, `GiaKhuyenMai`, `MaNCC`, `MaLoaiSP`, `MoTa`, `ThungRac`, `HinhAnh`) VALUES
(4, 'Sữa Rửa Mặt Chanel La Mousse Crème Nettoyante Anti-Pollution Cleansing Cream-To-Foam 150ML', 5, 1450000, 0, 'P-Chanel', '1', '', 0, 'sua-rua-mat-chanel-la-mousse.png'),
(5, 'Son 3CE Disney Mickey Tatoo Lip Tint Màu Luztic ( Phiên Bản Giới Hạn)', 20, 450000, 399000, 'HQ-3CE', '1', 'Son 3CE Disney Mickey Tatoo Lip Tint Luztic màu son có màu cam san hô đáng iu mới nhất, Hot nhất thuộc phiên bản giới hạn của 3CE x Disney Mickey Mouse chắc chắn dòng son này sẽ có lớp tint bám màu tốt, lâu trôi không làm các Nàng thất vọng đâu nhé.', 0, 'son-3ce-luztic_65dff25601bc40489a31153cf6b977f0_2048x2048.png'),
(6, 'Son MAC 924 Reverence - Powder Kiss Lipstick', 5, 540000, 0, 'HQ-MAC', '1', '', 0, 'son-mac924-reverence-powder-kiss-lipstick.jpg'),
(7, 'Son 3CE Kem Cloud Lip Tint Màu Beige Avenue ( Vừa Ra Mắt)', 20, 299000, 0, 'HQ-3CE', '1', 'Son 3CE Cloud Lip Tint Beige Avenue có tông cam đất phù hợp với xu thế hiện nay, màu son sẽ khiến nhiều nàng ngạc nhiên bởi tỷ lệ hòa trộn hoàn hảo. Son 3CE Beige Avenue có sắc cam có phần chiếm ưu thế hơn một chút, bởi vậy màu son khá dễ dùng khi lên môi.', 0, 'son-3CE-kem-cloud-lip-tint-mau-Beige Avenue.jpg'),
(8, 'Son 3CE Kem Cloud Lip Tint Màu Beige Avenue ( Vừa Ra Mắt)', 20, 299000, 0, 'HQ-3CE', '1', 'Son 3CE Cloud Lip Tint Beige Avenue có tông cam đất phù hợp với xu thế hiện nay, màu son sẽ khiến nhiều nàng ngạc nhiên bởi tỷ lệ hòa trộn hoàn hảo. Son 3CE Beige Avenue có sắc cam có phần chiếm ưu thế hơn một chút, bởi vậy màu son khá dễ dùng khi lên môi.', 0, ''),
(9, 'Son 3CE Kem Cloud Lip Tint Màu Beige Avenue ( Vừa Ra Mắt)', 20, 299000, 0, 'HQ-3CE', '1', 'Son 3CE Cloud Lip Tint Beige Avenue có tông cam đất phù hợp với xu thế hiện nay, màu son sẽ khiến nhiều nàng ngạc nhiên bởi tỷ lệ hòa trộn hoàn hảo. Son 3CE Beige Avenue có sắc cam có phần chiếm ưu thế hơn một chút, bởi vậy màu son khá dễ dùng khi lên môi.', 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `IDTK` char(10) NOT NULL,
  `TenDangNhap` varchar(20) NOT NULL,
  `MatKhau` char(10) NOT NULL,
  `MaLoaiTK` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chucnang`
--
ALTER TABLE `chucnang`
  ADD PRIMARY KEY (`IDChucNang`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSP`);

--
-- Chỉ mục cho bảng `loaitaikhoan`
--
ALTER TABLE `loaitaikhoan`
  ADD PRIMARY KEY (`MaLoaiTK`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNCC`);

--
-- Chỉ mục cho bảng `quyenhan`
--
ALTER TABLE `quyenhan`
  ADD PRIMARY KEY (`IDQH`),
  ADD KEY `IDChucNang` (`IDChucNang`,`MaLoaiTK`),
  ADD KEY `MaLoaiTK` (`MaLoaiTK`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaNCC` (`MaNCC`,`MaLoaiSP`),
  ADD KEY `MaLoaiSP` (`MaLoaiSP`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`IDTK`),
  ADD KEY `MaLoaiTK` (`MaLoaiTK`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11236;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `quyenhan`
--
ALTER TABLE `quyenhan`
  ADD CONSTRAINT `quyenhan_ibfk_1` FOREIGN KEY (`MaLoaiTK`) REFERENCES `loaitaikhoan` (`MaLoaiTK`),
  ADD CONSTRAINT `quyenhan_ibfk_2` FOREIGN KEY (`IDChucNang`) REFERENCES `chucnang` (`IDChucNang`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaLoaiSP`) REFERENCES `loaisanpham` (`MaLoaiSP`),
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaLoaiTK`) REFERENCES `loaitaikhoan` (`MaLoaiTK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
