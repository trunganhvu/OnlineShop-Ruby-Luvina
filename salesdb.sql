-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 19, 2020 lúc 04:33 AM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `salesdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Customer`
--

CREATE TABLE `Customer` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Customer`
--

INSERT INTO `Customer` (`id`, `name`, `email`, `address`) VALUES
(1, 'trung anh', 'vutrungnah1@gmail.com', 'hn111'),
(2, 'anh da den', 'anhdadem@gmail.com', 'USA'),
(5, 'trunganhvu', 'admin@admin.com', 'qwq'),
(6, 'hee', 'lieem', 'a');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Productlines`
--

CREATE TABLE `Productlines` (
  `productLineId` int(11) NOT NULL,
  `productLine` text COLLATE utf8_unicode_ci NOT NULL,
  `textDescription` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Productlines`
--

INSERT INTO `Productlines` (`productLineId`, `productLine`, `textDescription`) VALUES
(1, 'Motorcycler', 'this is a  category of product. hello. localhost'),
(2, 'Laptop', 'this is a small computer, i can pick up everywhere'),
(3, 'Mobile', 'In this tutorial we are going to understand default mechanism of passing '),
(5, 'Planes', 'Unique, diecast airplane and helicopter replicas suita'),
(6, 'Vintage Cars', 'ur Vintage Car models realistically portray automobiles produced from '),
(7, 'Trains', 'Model trains are a rewarding hobby for enthusiasts'),
(8, 'Trucks and Buses', 'The Truck and Bus models are realistic replicas o'),
(14, 'Book', 'Book made by paper..');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Products`
--

CREATE TABLE `Products` (
  `productCode` int(11) NOT NULL,
  `productName` text COLLATE utf8_unicode_ci NOT NULL,
  `productLine` text COLLATE utf8_unicode_ci NOT NULL,
  `productDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `quantityInStock` int(11) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `Products`
--

INSERT INTO `Products` (`productCode`, `productName`, `productLine`, `productDescription`, `quantityInStock`, `buyPrice`) VALUES
(1, '1969 Harley Davidson Ultimate Chopper', 'Motorcycler', 'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 1005, '48.84'),
(2, 'Laptop DELL antititasdfad 6534s I5', 'Laptop', 'Trong nh?ng bài h??ng d?n tr??c, chúng tôi ?ã trình bày cách t?o m?t Web application v?i Spring MVC nh?ng ch?a có ph?n x? lý database. Và ?? x? lý database, chúng ta ph?i c?n ??n Hibernate.', 1200, '45.54'),
(3, 'Inphone Xs max', 'Mobile', 'In above example the template variable \'{testPath}\' matches with a model attribute, so it will be automatically substituted. The remaining model attribute \'id\' will be appended as query string.In above example the template variable \'{testPath}\' matches with a model attribute.', 0, '120.10'),
(6, 'Honda xyx 123', 'Motorcycler', 'Nh? v?y thông qua nh?ng ph?n h??ng d?n trên mong r?ng b?n có th? tìm hi?u d? dàng và nhanh chóng h?n v? l?p trình Spring ?? phát tri?n các ?ng d?ng nh? web bán hàng, web th??ng m?i ?i?n t?…', 10, '152.10'),
(7, 'Java Book 2', 'Book', 'lean java back-end', 123, '45.00'),
(8, 'Java Book 3', 'Book', 'lean java back-end + hibernate', 140, '154.00'),
(9, 'Book lean C, C++', 'Book', 'lean java back-end + hibernate', 12, '121.00'),
(10, 'Alirabet123', 'Motorcycler', 'asdf asdf trjg sgjks gsiagdjsd asfgkskg', 78, '111.00'),
(11, 'Java Book 4', 'Book', 'lean java back-end + hibernate googloe', 89, '645.00'),
(12, 'Trains id 124', 'Motorcycler', 'have description to long aaaaaa', 504, '1245.00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `Productlines`
--
ALTER TABLE `Productlines`
  ADD PRIMARY KEY (`productLineId`);

--
-- Chỉ mục cho bảng `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`productCode`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `Productlines`
--
ALTER TABLE `Productlines`
  MODIFY `productLineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `Products`
--
ALTER TABLE `Products`
  MODIFY `productCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
