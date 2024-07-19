-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 15, 2023 lúc 12:59 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `musicweb_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `bio` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `artists`
--

INSERT INTO `artists` (`id`, `name`, `bio`, `user_id`, `image`) VALUES
(6, 'Sơn Tùng', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 'uploads/MTP.jfif'),
(7, 'Đen Vâu', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 'uploads/den.jpg'),
(9, 'Trung Quân', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, 'uploads/trungquanidol.jfif');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `disable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category`, `disable`) VALUES
(1, 'POP', 0),
(3, 'Rap', 0),
(5, 'LOFI', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artists_id` int(11) NOT NULL,
  `image` varchar(1024) NOT NULL,
  `file` varchar(1024) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `feature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `songs`
--

INSERT INTO `songs` (`id`, `title`, `user_id`, `artists_id`, `image`, `file`, `category_id`, `date`, `views`, `slug`, `feature`) VALUES
(2, 'Mang tiền về cho mẹ', 1, 7, 'uploads/den2.jpg', 'uploads/y2mate.com - Mang Tiền Về Cho Mẹ  Đen ft Nguyên Thảo LyricEngsub Bring Mom money .mp3', 3, '2023-03-15 15:22:34', 7, 'ang-tin-v-cho-m', 0),
(3, 'Chúng ta của hiện tại', 1, 6, 'uploads/MTP.jfif', 'uploads/y2mate.com - SƠN TÙNG MTP  CHÚNG TA CỦA HIỆN TẠI CM1X LOFI VER  NGHIIA COVER.mp3', 5, '2023-03-15 17:28:20', 36, 'hng-ta-ca-hin-ti', 1),
(4, 'Anh tự do nhưng cô đơn', 1, 9, 'uploads/trungquanidol.jfif', 'uploads/y2mate.com - ANH TỰ DO NHƯNG CÔ ĐƠN  Trung Quân x Đạt G  Audio Lyrics Official.mp3', 1, '2023-03-15 17:31:36', 30, 'nh-t-do-nhng-c-n', 1),
(5, 'Nắng ấm xa dần', 1, 6, 'uploads/MTP.jfif', 'uploads/y2mate.com - Nắng Ấm Xa Dần Lofi Ver By ThanhHuy  Sơn Tùng MTP.mp3', 1, '2023-03-15 18:41:21', 2, 'ng-m-xa-dn', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `date`) VALUES
(1, 'Long', 'long@gmail.com', '$2y$10$Mbm7/ijCRaHo6hiLRKyh5u3kRe4gbeEc5uOAtGPZYZm', 'admin', '2023-03-09 16:16:11'),
(9, 'nhan', 'nhan@email.com', '$2y$10$XswvHkFhA30r/KbHZcBNM.b9eMHKDYDbwFGBK48S0zS', 'user', '2023-03-14 15:22:46');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `disable` (`disable`);

--
-- Chỉ mục cho bảng `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `artists_id` (`artists_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `date` (`date`),
  ADD KEY `views` (`views`),
  ADD KEY `title` (`title`),
  ADD KEY `slug` (`slug`),
  ADD KEY `feature` (`feature`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `password` (`password`),
  ADD KEY `role` (`role`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
