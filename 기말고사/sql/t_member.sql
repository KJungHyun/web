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
-- 테이블 구조 `t_member`
--

CREATE TABLE `t_member` (
  `id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '아이디',
  `passwd` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '비밀번호',
  `name` varchar(20) NOT NULL COMMENT '이름',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입일',
  `up_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '최근 변경일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='중간고사';

--
-- 테이블의 덤프 데이터 `t_member`
--

INSERT INTO `t_member` (`id`, `passwd`, `name`, `reg_date`, `up_date`) VALUES
('kim', '1234', '김정현', '2021-12-12 22:15:54', '2021-12-12 22:15:54'),
('root', '1234', 'root', '2021-10-31 16:57:52', '2021-10-31 16:57:52');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `t_member`
--
ALTER TABLE `t_member`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
