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
-- 테이블 구조 `t_member_add`
--

CREATE TABLE `t_member_add` (
  `id` varchar(50) NOT NULL COMMENT '아이디',
  `postcode` varchar(20) NOT NULL COMMENT '우편번호',
  `address` varchar(100) NOT NULL COMMENT '주소',
  `detail` varchar(30) NOT NULL COMMENT '상세주소'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='t_member 테이블의 주소정보';

--
-- 테이블의 덤프 데이터 `t_member_add`
--

INSERT INTO `t_member_add` (`id`, `postcode`, `address`, `detail`) VALUES
('kim', '47201', '부산 부산진구 경마장로 1', ''),
('root', 'root', 'root', 'root');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `t_member_add`
--
ALTER TABLE `t_member_add`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `t_member_add`
--
ALTER TABLE `t_member_add`
  ADD CONSTRAINT `t_member_add_ibfk_1` FOREIGN KEY (`id`) REFERENCES `t_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
