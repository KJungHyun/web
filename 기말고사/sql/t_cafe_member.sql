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
-- 테이블 구조 `t_cafe_member`
--

CREATE TABLE `t_cafe_member` (
  `id` varchar(30) NOT NULL,
  `grade` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `t_cafe_member`
--

INSERT INTO `t_cafe_member` (`id`, `grade`) VALUES
('kim', 'Manager'),
('root', 'Admin');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `t_cafe_member`
--
ALTER TABLE `t_cafe_member`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `t_cafe_member`
--
ALTER TABLE `t_cafe_member`
  ADD CONSTRAINT `t_cafe_member_ibfk_1` FOREIGN KEY (`id`) REFERENCES `t_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
