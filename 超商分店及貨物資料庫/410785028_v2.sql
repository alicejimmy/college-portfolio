-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-05-20 09:30:28
-- 伺服器版本： 10.4.19-MariaDB
-- PHP 版本： 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `410785028`
--

-- --------------------------------------------------------

--
-- 資料表結構 `倉庫`
--

CREATE TABLE `倉庫` (
  `名稱` char(20) NOT NULL,
  `開始合作時間` date NOT NULL DEFAULT '2021-01-01',
  `地址` char(30) NOT NULL,
  `合作超商名稱` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `倉庫`
--

INSERT INTO `倉庫` (`名稱`, `開始合作時間`, `地址`, `合作超商名稱`) VALUES
('捷盟行銷股份有限公司', '1979-01-01', '320桃園市中壢區北園路37號', '7-Eleven'),
('日翊文化行銷股份有限公司', '2004-05-01', '335桃園市大溪區新光東路76巷22-2號', '全家便利商店');

-- --------------------------------------------------------

--
-- 資料表結構 `商品`
--

CREATE TABLE `商品` (
  `名稱` char(10) NOT NULL,
  `編號` int(3) DEFAULT 999,
  `價格` int(11) NOT NULL,
  `剩餘數量` int(11) NOT NULL,
  `庫存店面代碼` int(5) NOT NULL DEFAULT 99999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `商品`
--

INSERT INTO `商品` (`名稱`, `編號`, `價格`, `剩餘數量`, `庫存店面代碼`) VALUES
('7_口香糖', 107, 39, 10, 10001),
('7_可口可樂', 103, 30, 10, 10003),
('7_嗨啾軟糖', 106, 12, 10, 10003),
('7_奮起湖便當', 108, 75, 10, 10002),
('7_御茶園特上紅茶', 104, 20, 10, 10002),
('7_拿鐵', 105, 45, 10, 10001),
('7_樂事洋芋片', 109, 65, 10, 10003),
('7_茶葉蛋', 101, 10, 10, 10002),
('7_雀巢雪梨茶', 110, 25, 10, 10001),
('F_口香糖', 107, 39, 10, 20002),
('F_可口可樂', 103, 30, 10, 20001),
('F_嗨啾軟糖', 106, 12, 10, 20002),
('F_御茶園特上紅茶', 104, 20, 10, 20002),
('F_樂事洋芋片', 109, 65, 10, 20001),
('F_茶葉蛋', 101, 10, 10, 20001),
('F_霜淇淋', 102, 39, 10, 20002);

-- --------------------------------------------------------

--
-- 資料表結構 `商品賣出資料`
--

CREATE TABLE `商品賣出資料` (
  `店面代碼` int(5) NOT NULL DEFAULT 99999,
  `商品名稱` char(10) NOT NULL,
  `賣出日期` date NOT NULL DEFAULT '2021-05-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `商品賣出資料`
--

INSERT INTO `商品賣出資料` (`店面代碼`, `商品名稱`, `賣出日期`) VALUES
(10001, '7_拿鐵', '2021-05-03'),
(10001, '7_口香糖', '2021-05-14'),
(10001, '7_雀巢雪梨茶', '2021-05-14'),
(10001, '7_雀巢雪梨茶', '2021-05-19'),
(10001, '7_拿鐵', '2021-05-30'),
(10001, '7_口香糖', '2021-05-30'),
(10001, '7_雀巢雪梨茶', '2021-05-30'),
(10001, '7_口香糖', '2021-05-03'),
(10002, '7_奮起湖便當', '2021-05-10'),
(10002, '7_御茶園特上紅茶', '2021-05-10'),
(10002, '7_茶葉蛋', '2021-05-15'),
(10002, '7_奮起湖便當', '2021-05-21'),
(10002, '7_茶葉蛋', '2021-05-21'),
(10002, '7_茶葉蛋', '2021-05-29'),
(10003, '7_可口可樂', '2021-05-04'),
(10003, '7_嗨啾軟糖', '2021-05-12'),
(10003, '7_可口可樂', '2021-05-12'),
(10003, '7_嗨啾軟糖', '2021-05-17'),
(10003, '7_樂事洋芋片', '2021-05-17'),
(10003, '7_嗨啾軟糖', '2021-05-27'),
(20001, 'F_樂事洋芋片', '2021-05-06'),
(20001, 'F_可口可樂', '2021-05-06'),
(20001, 'F_茶葉蛋', '2021-05-07'),
(20001, 'F_樂事洋芋片', '2021-05-07'),
(20001, 'F_茶葉蛋', '2021-05-20'),
(20001, 'F_樂事洋芋片', '2021-05-20'),
(20001, 'F_可口可樂', '2021-05-25'),
(20002, 'F_口香糖', '2021-05-09'),
(20002, 'F_霜淇淋', '2021-05-09'),
(20002, 'F_御茶園特上紅茶', '2021-05-16'),
(20002, 'F_嗨啾軟糖', '2021-05-16'),
(20002, 'F_口香糖', '2021-05-16'),
(20002, 'F_嗨啾軟糖', '2021-05-22'),
(20002, 'F_霜淇淋', '2021-05-28');

-- --------------------------------------------------------

--
-- 資料表結構 `商品進貨資料`
--

CREATE TABLE `商品進貨資料` (
  `店面代碼` int(5) NOT NULL DEFAULT 99999,
  `倉庫名稱` char(20) NOT NULL,
  `商品名稱` char(10) NOT NULL,
  `進貨日期` date NOT NULL DEFAULT '2021-05-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `商品進貨資料`
--

INSERT INTO `商品進貨資料` (`店面代碼`, `倉庫名稱`, `商品名稱`, `進貨日期`) VALUES
(10001, '捷盟行銷股份有限公司', '7_拿鐵', '2021-05-13'),
(10001, '捷盟行銷股份有限公司', '7_口香糖', '2021-05-13'),
(10001, '捷盟行銷股份有限公司', '7_雀巢雪梨茶', '2021-05-13'),
(10001, '捷盟行銷股份有限公司', '7_雀巢雪梨茶', '2021-05-23'),
(10001, '捷盟行銷股份有限公司', '7_拿鐵', '2021-05-26'),
(10001, '捷盟行銷股份有限公司', '7_雀巢雪梨茶', '2021-05-26'),
(10002, '捷盟行銷股份有限公司', '7_奮起湖便當', '2021-05-02'),
(10002, '捷盟行銷股份有限公司', '7_御茶園特上紅茶', '2021-05-02'),
(10002, '捷盟行銷股份有限公司', '7_茶葉蛋', '2021-05-02'),
(10001, '捷盟行銷股份有限公司', '7_奮起湖便當', '2021-05-18'),
(10002, '捷盟行銷股份有限公司', '7_御茶園特上紅茶', '2021-05-18'),
(10002, '捷盟行銷股份有限公司', '7_茶葉蛋', '2021-05-18'),
(10003, '捷盟行銷股份有限公司', '7_嗨啾軟糖', '2021-05-08'),
(10003, '捷盟行銷股份有限公司', '7_樂事洋芋片', '2021-05-08'),
(10003, '捷盟行銷股份有限公司', '7_可口可樂', '2021-05-08'),
(20001, '日翊文化行銷股份有限公司', 'F_茶葉蛋', '2021-05-05'),
(20001, '日翊文化行銷股份有限公司', 'F_樂事洋芋片', '2021-05-05'),
(20001, '日翊文化行銷股份有限公司', 'F_可口可樂', '2021-05-05'),
(20001, '日翊文化行銷股份有限公司', 'F_茶葉蛋', '2021-05-24'),
(20001, '日翊文化行銷股份有限公司', 'F_樂事洋芋片', '2021-05-24'),
(20001, '日翊文化行銷股份有限公司', 'F_樂事洋芋片', '2021-05-31'),
(20001, '日翊文化行銷股份有限公司', 'F_可口可樂', '2021-05-31'),
(20002, '日翊文化行銷股份有限公司', 'F_御茶園特上紅茶', '2021-05-01'),
(20002, '日翊文化行銷股份有限公司', 'F_嗨啾軟糖', '2021-05-01'),
(20002, '日翊文化行銷股份有限公司', 'F_口香糖', '2021-05-01'),
(20002, '日翊文化行銷股份有限公司', 'F_霜淇淋', '2021-05-01'),
(20002, '日翊文化行銷股份有限公司', 'F_嗨啾軟糖', '2021-05-11'),
(20002, '日翊文化行銷股份有限公司', 'F_口香糖', '2021-05-11'),
(20002, '日翊文化行銷股份有限公司', 'F_霜淇淋', '2021-05-11');

-- --------------------------------------------------------

--
-- 資料表結構 `店面`
--

CREATE TABLE `店面` (
  `代碼` int(5) NOT NULL DEFAULT 99999,
  `店名` char(10) NOT NULL,
  `地址` char(30) NOT NULL,
  `設立時間` date DEFAULT '2021-01-01',
  `員工人數` int(11) DEFAULT 0,
  `總管店面代碼` int(5) NOT NULL DEFAULT 99999,
  `超商名稱` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `店面`
--

INSERT INTO `店面` (`代碼`, `店名`, `地址`, `設立時間`, `員工人數`, `總管店面代碼`, `超商名稱`) VALUES
(10001, '新北大門市', '237新北市三峽區大學路156號', NULL, NULL, 10001, '7-Eleven'),
(10002, '大峽門市', '237新北市三峽區大學路147號', NULL, NULL, 10001, '7-Eleven'),
(10003, '龍恩門市', '237新北市三峽區國學街13號', NULL, NULL, 10001, '7-Eleven'),
(20001, '三峽北苑店', '237新北市三峽區大學路151號商學院', NULL, NULL, 20001, '全家便利商店'),
(20002, '三峽國寧店', '237新北市三峽區國學街31號', NULL, NULL, 20001, '全家便利商店');

-- --------------------------------------------------------

--
-- 資料表結構 `超商`
--

CREATE TABLE `超商` (
  `名稱` char(20) NOT NULL,
  `成立時間` date NOT NULL DEFAULT '2021-01-01',
  `創辦人` char(10) NOT NULL,
  `總部地點` char(30) DEFAULT NULL,
  `店面數量` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `超商`
--

INSERT INTO `超商` (`名稱`, `成立時間`, `創辦人`, `總部地點`, `店面數量`) VALUES
('7-Eleven', '1927-01-01', '喬・湯普森', '日本東京都千代田區二番町8-8號', 3),
('全家便利商店', '1981-09-01', '西友', NULL, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `超商代表人物`
--

CREATE TABLE `超商代表人物` (
  `超商名稱` char(20) NOT NULL,
  `代表人物` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `超商代表人物`
--

INSERT INTO `超商代表人物` (`超商名稱`, `代表人物`) VALUES
('7-Eleven', '喬伊·狄品托, 鈴木敏文, 村田紀敏'),
('全家便利商店', '葉榮廷, 薛東都');

-- --------------------------------------------------------

--
-- 資料表結構 `過往紀錄`
--

CREATE TABLE `過往紀錄` (
  `日期` date NOT NULL DEFAULT '2021-01-01',
  `店面代碼` int(5) NOT NULL DEFAULT 99999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `過往紀錄`
--

INSERT INTO `過往紀錄` (`日期`, `店面代碼`) VALUES
('2021-05-03', 10001),
('2021-05-13', 10001),
('2021-05-14', 10001),
('2021-05-19', 10001),
('2021-05-23', 10001),
('2021-05-26', 10001),
('2021-05-30', 10001),
('2021-05-02', 10002),
('2021-05-10', 10002),
('2021-05-15', 10002),
('2021-05-18', 10002),
('2021-05-21', 10002),
('2021-05-29', 10002),
('2021-05-04', 10003),
('2021-05-08', 10003),
('2021-05-12', 10003),
('2021-05-17', 10003),
('2021-05-27', 10003),
('2021-05-05', 20001),
('2021-05-06', 20001),
('2021-05-07', 20001),
('2021-05-20', 20001),
('2021-05-24', 20001),
('2021-05-25', 20001),
('2021-05-31', 20001),
('2021-05-01', 20002),
('2021-05-09', 20002),
('2021-05-11', 20002),
('2021-05-16', 20002),
('2021-05-22', 20002),
('2021-05-28', 20002);

-- --------------------------------------------------------

--
-- 資料表結構 `過往紀錄的每日賣出金額`
--

CREATE TABLE `過往紀錄的每日賣出金額` (
  `當天日期` date NOT NULL DEFAULT '2021-01-01',
  `賣出金額` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `過往紀錄的每日賣出金額`
--

INSERT INTO `過往紀錄的每日賣出金額` (`當天日期`, `賣出金額`) VALUES
('2021-05-03', 84),
('2021-05-04', 30),
('2021-05-06', 95),
('2021-05-07', 75),
('2021-05-09', 78),
('2021-05-10', 100),
('2021-05-12', 42),
('2021-05-14', 64),
('2021-05-15', 10),
('2021-05-16', 71),
('2021-05-17', 77),
('2021-05-19', 25),
('2021-05-20', 75),
('2021-05-21', 85),
('2021-05-22', 12),
('2021-05-25', 30),
('2021-05-27', 12),
('2021-05-28', 39),
('2021-05-29', 10),
('2021-05-30', 109);

-- --------------------------------------------------------

--
-- 資料表結構 `過往紀錄的每日進貨紀錄`
--

CREATE TABLE `過往紀錄的每日進貨紀錄` (
  `當天日期` date NOT NULL DEFAULT '2021-01-01',
  `進貨紀錄` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `過往紀錄的每日進貨紀錄`
--

INSERT INTO `過往紀錄的每日進貨紀錄` (`當天日期`, `進貨紀錄`) VALUES
('2021-05-01', '御茶園特上紅茶, 嗨啾軟糖, 口香糖, 霜淇淋'),
('2021-05-02', '奮起湖便當, 御茶園特上紅茶, 茶葉蛋'),
('2021-05-05', '茶葉蛋, 樂事洋芋片, 可口可樂'),
('2021-05-08', '嗨啾軟糖, 樂事洋芋片, 可口可樂'),
('2021-05-11', '嗨啾軟糖, 口香糖, 霜淇淋'),
('2021-05-13', '拿鐵, 口香糖, 雀巢雪梨茶'),
('2021-05-18', '奮起湖便當, 御茶園特上紅茶, 茶葉蛋'),
('2021-05-23', '雀巢雪梨茶'),
('2021-05-24', '茶葉蛋, 樂事洋芋片'),
('2021-05-26', '拿鐵, 雀巢雪梨茶'),
('2021-05-31', '樂事洋芋片, 可口可樂');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `倉庫`
--
ALTER TABLE `倉庫`
  ADD PRIMARY KEY (`名稱`),
  ADD KEY `合作超商名稱` (`合作超商名稱`);

--
-- 資料表索引 `商品`
--
ALTER TABLE `商品`
  ADD PRIMARY KEY (`名稱`),
  ADD KEY `庫存店面代碼` (`庫存店面代碼`);

--
-- 資料表索引 `商品賣出資料`
--
ALTER TABLE `商品賣出資料`
  ADD KEY `店面代碼` (`店面代碼`),
  ADD KEY `商品名稱` (`商品名稱`);

--
-- 資料表索引 `商品進貨資料`
--
ALTER TABLE `商品進貨資料`
  ADD KEY `店面代碼` (`店面代碼`),
  ADD KEY `倉庫名稱` (`倉庫名稱`),
  ADD KEY `商品名稱` (`商品名稱`);

--
-- 資料表索引 `店面`
--
ALTER TABLE `店面`
  ADD PRIMARY KEY (`代碼`),
  ADD KEY `總管店面代碼` (`總管店面代碼`),
  ADD KEY `超商名稱` (`超商名稱`);

--
-- 資料表索引 `超商`
--
ALTER TABLE `超商`
  ADD PRIMARY KEY (`名稱`);

--
-- 資料表索引 `超商代表人物`
--
ALTER TABLE `超商代表人物`
  ADD KEY `超商名稱` (`超商名稱`);

--
-- 資料表索引 `過往紀錄`
--
ALTER TABLE `過往紀錄`
  ADD PRIMARY KEY (`日期`),
  ADD KEY `店面代碼` (`店面代碼`);

--
-- 資料表索引 `過往紀錄的每日賣出金額`
--
ALTER TABLE `過往紀錄的每日賣出金額`
  ADD KEY `當天日期` (`當天日期`);

--
-- 資料表索引 `過往紀錄的每日進貨紀錄`
--
ALTER TABLE `過往紀錄的每日進貨紀錄`
  ADD KEY `當天日期` (`當天日期`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `倉庫`
--
ALTER TABLE `倉庫`
  ADD CONSTRAINT `倉庫_ibfk_1` FOREIGN KEY (`合作超商名稱`) REFERENCES `超商` (`名稱`);

--
-- 資料表的限制式 `商品`
--
ALTER TABLE `商品`
  ADD CONSTRAINT `商品_ibfk_1` FOREIGN KEY (`庫存店面代碼`) REFERENCES `店面` (`代碼`);

--
-- 資料表的限制式 `商品賣出資料`
--
ALTER TABLE `商品賣出資料`
  ADD CONSTRAINT `商品賣出資料_ibfk_1` FOREIGN KEY (`店面代碼`) REFERENCES `店面` (`代碼`),
  ADD CONSTRAINT `商品賣出資料_ibfk_2` FOREIGN KEY (`商品名稱`) REFERENCES `商品` (`名稱`);

--
-- 資料表的限制式 `商品進貨資料`
--
ALTER TABLE `商品進貨資料`
  ADD CONSTRAINT `商品進貨資料_ibfk_1` FOREIGN KEY (`店面代碼`) REFERENCES `店面` (`代碼`),
  ADD CONSTRAINT `商品進貨資料_ibfk_2` FOREIGN KEY (`倉庫名稱`) REFERENCES `倉庫` (`名稱`),
  ADD CONSTRAINT `商品進貨資料_ibfk_3` FOREIGN KEY (`商品名稱`) REFERENCES `商品` (`名稱`);

--
-- 資料表的限制式 `店面`
--
ALTER TABLE `店面`
  ADD CONSTRAINT `店面_ibfk_1` FOREIGN KEY (`總管店面代碼`) REFERENCES `店面` (`代碼`),
  ADD CONSTRAINT `店面_ibfk_2` FOREIGN KEY (`超商名稱`) REFERENCES `超商` (`名稱`);

--
-- 資料表的限制式 `超商代表人物`
--
ALTER TABLE `超商代表人物`
  ADD CONSTRAINT `超商代表人物_ibfk_1` FOREIGN KEY (`超商名稱`) REFERENCES `超商` (`名稱`);

--
-- 資料表的限制式 `過往紀錄`
--
ALTER TABLE `過往紀錄`
  ADD CONSTRAINT `過往紀錄_ibfk_1` FOREIGN KEY (`店面代碼`) REFERENCES `店面` (`代碼`);

--
-- 資料表的限制式 `過往紀錄的每日賣出金額`
--
ALTER TABLE `過往紀錄的每日賣出金額`
  ADD CONSTRAINT `過往紀錄的每日賣出金額_ibfk_1` FOREIGN KEY (`當天日期`) REFERENCES `過往紀錄` (`日期`);

--
-- 資料表的限制式 `過往紀錄的每日進貨紀錄`
--
ALTER TABLE `過往紀錄的每日進貨紀錄`
  ADD CONSTRAINT `過往紀錄的每日進貨紀錄_ibfk_1` FOREIGN KEY (`當天日期`) REFERENCES `過往紀錄` (`日期`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
