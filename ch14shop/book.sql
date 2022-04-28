-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 21-11-15 16:26
-- 서버 버전: 8.0.27
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
-- 테이블 구조 `book`
--

CREATE TABLE `book` (
  `book_id` int NOT NULL,
  `book_kind` varchar(3) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_price` int NOT NULL,
  `book_count` smallint NOT NULL,
  `author` varchar(40) NOT NULL,
  `publishing_com` varchar(30) NOT NULL,
  `publishing_date` varchar(15) NOT NULL,
  `book_image` varchar(16) DEFAULT 'nothing.jsp',
  `book_content` text NOT NULL,
  `discount_rate` tinyint DEFAULT '10',
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
