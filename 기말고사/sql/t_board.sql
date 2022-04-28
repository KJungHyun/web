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
-- 테이블 구조 `t_board`
--

CREATE TABLE `t_board` (
  `num` int NOT NULL,
  `id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subject` varchar(50) NOT NULL,
  `reg_date` datetime NOT NULL,
  `readcount` int DEFAULT '0',
  `ref` int NOT NULL,
  `re_step` smallint NOT NULL,
  `re_level` smallint NOT NULL,
  `content` text NOT NULL,
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 테이블의 덤프 데이터 `t_board`
--

INSERT INTO `t_board` (`num`, `id`, `subject`, `reg_date`, `readcount`, `ref`, `re_step`, `re_level`, `content`, `ip`) VALUES
(85, 'kim', '웹서버구축2', '2021-12-12 22:16:53', 2, 1, 0, 0, '기말고사', '172.30.1.5'),
(86, 'root', '확인용 글', '2021-12-12 22:17:48', 1, 86, 0, 0, 'ㅁㄴㅇ', '172.30.1.5'),
(88, 'root', '공지사항입니다.', '2021-12-12 22:19:34', 0, 87, 0, 0, '공지사항', '172.30.1.5'),
(89, 'kim', '공지만 작성 가능한 등급', '2021-12-12 22:21:28', 0, 89, 0, 0, '공지사항', '172.30.1.5'),
(90, 'root', 'asd', '2021-12-12 23:54:52', 0, 90, 0, 0, 'asd', '172.30.1.5');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `t_board`
--
ALTER TABLE `t_board`
  ADD PRIMARY KEY (`num`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `t_board`
--
ALTER TABLE `t_board`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
