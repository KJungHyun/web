-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 21-12-13 00:10
-- 서버 버전: 8.0.26
-- PHP 버전: 8.0.10

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
-- 테이블 구조 `t_board_notice`
--

CREATE TABLE `t_board_notice` (
  `num` int NOT NULL,
  `id` varchar(30) NOT NULL,
  `notice` varchar(1) NOT NULL DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `t_board_notice`
--

INSERT INTO `t_board_notice` (`num`, `id`, `notice`) VALUES
(86, 'root', 'F'),
(88, 'root', 'T'),
(89, 'kim', 'T'),
(90, 'root', 'T');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `t_board_notice`
--
ALTER TABLE `t_board_notice`
  ADD PRIMARY KEY (`num`),
  ADD KEY `t_board_notice_ibfk_2` (`id`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `t_board_notice`
--
ALTER TABLE `t_board_notice`
  ADD CONSTRAINT `t_board_notice_ibfk_1` FOREIGN KEY (`num`) REFERENCES `t_board` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_board_notice_ibfk_2` FOREIGN KEY (`id`) REFERENCES `t_cafe_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
