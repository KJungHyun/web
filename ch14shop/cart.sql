-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 21-11-15 16:22
-- 서버 버전: 8.0.25
-- PHP 버전: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `ysu`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `cart`
--

CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `book_id` int NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `buy_price` int NOT NULL,
  `buy_count` tinyint NOT NULL,
  `book_image` varchar(16) DEFAULT 'nothing.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
