-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 12 月 29 日 10:34
-- 伺服器版本: 10.1.34-MariaDB
-- PHP 版本： 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `takeaway_king`
--

-- --------------------------------------------------------

--
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `areas`
--

CREATE TABLE `areas` (
  `area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `areas`
--

INSERT INTO `areas` (`area`) VALUES
('Hong Kong'),
('Kowloon'),
('New Territories');

-- --------------------------------------------------------

--
-- 資料表結構 `branches`
--

CREATE TABLE `branches` (
  `restaurant_id` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `districts`
--

CREATE TABLE `districts` (
  `district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `districts`
--

INSERT INTO `districts` (`district`) VALUES
('Central and Western'),
('Eastern'),
('Islands'),
('Kowloon City'),
('Kwai Tsing'),
('Kwun Tong'),
('North'),
('Sai Kung'),
('Sha Tin'),
('Sham Shui Po'),
('Southern'),
('Tai Po'),
('Tsuen Wan'),
('Tuen Mun'),
('Wan Chai'),
('Wong Tai Sin'),
('Yau Tsim Mong'),
('Yuen Long');

-- --------------------------------------------------------

--
-- 資料表結構 `location`
--

CREATE TABLE `location` (
  `area` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `sub-district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `location`
--

INSERT INTO `location` (`area`, `district`, `sub-district`) VALUES
('Hong Kong', 'Central and Western', 'Admiralty'),
('Hong Kong', 'Central and Western', 'Central'),
('Hong Kong', 'Central and Western', 'Kennedy Town'),
('Hong Kong', 'Central and Western', 'Mid-levels'),
('Hong Kong', 'Central and Western', 'Peak'),
('Hong Kong', 'Central and Western', 'Sai Ying Pun'),
('Hong Kong', 'Central and Western', 'Shek Tong Tsui'),
('Hong Kong', 'Central and Western', 'Sheung Wan'),
('Hong Kong', 'Eastern', 'Braemar Hill'),
('Hong Kong', 'Eastern', 'Chai Wan'),
('Hong Kong', 'Eastern', 'North Point'),
('Hong Kong', 'Eastern', 'Quarry Bay'),
('Hong Kong', 'Eastern', 'Sai Wan Ho'),
('Hong Kong', 'Eastern', 'Shau Kei Wan'),
('Hong Kong', 'Eastern', 'Siu Sai Wan'),
('Hong Kong', 'Eastern', 'Tin Hau'),
('Hong Kong', 'Southern', 'Aberdeen'),
('Hong Kong', 'Southern', 'Ap Lei Chau'),
('Hong Kong', 'Southern', 'Chung Hom Kok'),
('Hong Kong', 'Southern', 'Pok Fu Lam'),
('Hong Kong', 'Southern', 'Repulse Bay'),
('Hong Kong', 'Southern', 'Shek O'),
('Hong Kong', 'Southern', 'Shouson Hill'),
('Hong Kong', 'Southern', 'Stanley'),
('Hong Kong', 'Southern', 'Tai Tam'),
('Hong Kong', 'Southern', 'Wong Chuk Hang'),
('Hong Kong', 'Wan Chai', 'Causeway Bay'),
('Hong Kong', 'Wan Chai', 'Happy Valley'),
('Hong Kong', 'Wan Chai', 'Jardine\'s Lookout'),
('Hong Kong', 'Wan Chai', 'So Kon Po'),
('Hong Kong', 'Wan Chai', 'Tai Hang'),
('Hong Kong', 'Wan Chai', 'Wan Chai'),
('Kowloon', 'Kowloon City', 'Beacon Hill'),
('Kowloon', 'Kowloon City', 'Ho Man Tin'),
('Kowloon', 'Kowloon City', 'Hung Hom'),
('Kowloon', 'Kowloon City', 'Kai Tak'),
('Kowloon', 'Kowloon City', 'Kowloon City'),
('Kowloon', 'Kowloon City', 'Kowloon Tong'),
('Kowloon', 'Kowloon City', 'Ma Tau Kok'),
('Kowloon', 'Kowloon City', 'Ma Tau Wai'),
('Kowloon', 'Kowloon City', 'To Kwa Wan'),
('Kowloon', 'Kwun Tong', 'Jordan Valley'),
('Kowloon', 'Kwun Tong', 'Kowloon Bay'),
('Kowloon', 'Kwun Tong', 'Kwun Tong'),
('Kowloon', 'Kwun Tong', 'Lam Tin'),
('Kowloon', 'Kwun Tong', 'Lei Yue Mun'),
('Kowloon', 'Kwun Tong', 'Ngau Tau Kok'),
('Kowloon', 'Kwun Tong', 'Ping Shek'),
('Kowloon', 'Kwun Tong', 'Sau Mau Ping'),
('Kowloon', 'Kwun Tong', 'Yau Tong'),
('Kowloon', 'Sham Shui Po', 'Cheung Sha Wan'),
('Kowloon', 'Sham Shui Po', 'Lai Chi Kok'),
('Kowloon', 'Sham Shui Po', 'Mei Foo'),
('Kowloon', 'Sham Shui Po', 'Sham Shui Po'),
('Kowloon', 'Sham Shui Po', 'Shek Kip Mei'),
('Kowloon', 'Sham Shui Po', 'Stonecutters Island'),
('Kowloon', 'Sham Shui Po', 'Tai Wo Ping'),
('Kowloon', 'Sham Shui Po', 'Yau Yat Tsuen'),
('Kowloon', 'Wong Tai Sin', 'Diamond Hill'),
('Kowloon', 'Wong Tai Sin', 'Lok Fu'),
('Kowloon', 'Wong Tai Sin', 'Ngau Chi Wan'),
('Kowloon', 'Wong Tai Sin', 'San Po Kong'),
('Kowloon', 'Wong Tai Sin', 'Tsz Wan Shan'),
('Kowloon', 'Wong Tai Sin', 'Tung Tau'),
('Kowloon', 'Wong Tai Sin', 'Wang Tau Hom'),
('Kowloon', 'Wong Tai Sin', 'Wong Tai Sin'),
('Kowloon', 'Yau Tsim Mong', 'King\'s Park'),
('Kowloon', 'Yau Tsim Mong', 'Mong Kok'),
('Kowloon', 'Yau Tsim Mong', 'Tai Kok Tsui'),
('Kowloon', 'Yau Tsim Mong', 'Tsim Sha Tsui'),
('Kowloon', 'Yau Tsim Mong', 'West Kowloon Reclamation'),
('Kowloon', 'Yau Tsim Mong', 'Yau Ma Tei'),
('New Territories', 'Islands', 'Cheung Chau'),
('New Territories', 'Islands', 'Lamma Island'),
('New Territories', 'Islands', 'Lantau Island (including Tung Chung)'),
('New Territories', 'Islands', 'Peng Chau'),
('New Territories', 'Kwai Tsing', 'Kwai Chung'),
('New Territories', 'Kwai Tsing', 'Tsing Yi'),
('New Territories', 'North', 'Fanling'),
('New Territories', 'North', 'Luen Wo Hui'),
('New Territories', 'North', 'Luk Keng'),
('New Territories', 'North', 'Sha Tau Kok'),
('New Territories', 'North', 'Shek Wu Hui'),
('New Territories', 'North', 'Sheung Shui'),
('New Territories', 'North', 'Wu Kau Tang'),
('New Territories', 'Sai Kung', 'Clear Water Bay'),
('New Territories', 'Sai Kung', 'Hang Hau'),
('New Territories', 'Sai Kung', 'Ma Yau Tong'),
('New Territories', 'Sai Kung', 'Sai Kung'),
('New Territories', 'Sai Kung', 'Tai Mong Tsai'),
('New Territories', 'Sai Kung', 'Tiu Keng Leng'),
('New Territories', 'Sai Kung', 'Tseung Kwan O'),
('New Territories', 'Sha Tin', 'Fo Tan'),
('New Territories', 'Sha Tin', 'Ma Liu Shui'),
('New Territories', 'Sha Tin', 'Ma On Shan'),
('New Territories', 'Sha Tin', 'Sha Tin'),
('New Territories', 'Sha Tin', 'Tai Wai'),
('New Territories', 'Sha Tin', 'Wu Kai Sha'),
('New Territories', 'Tai Po', 'Cheung Muk Tau'),
('New Territories', 'Tai Po', 'Kei Ling Ha'),
('New Territories', 'Tai Po', 'Shuen Wan'),
('New Territories', 'Tai Po', 'Tai Mei Tuk'),
('New Territories', 'Tai Po', 'Tai Po'),
('New Territories', 'Tai Po', 'Tai Po Kau'),
('New Territories', 'Tai Po', 'Tai Po Market'),
('New Territories', 'Tsuen Wan', 'Lei Muk Shue'),
('New Territories', 'Tsuen Wan', 'Ma Wan'),
('New Territories', 'Tsuen Wan', 'Sham Tseng'),
('New Territories', 'Tsuen Wan', 'Sunny Bay'),
('New Territories', 'Tsuen Wan', 'Ting Kau'),
('New Territories', 'Tsuen Wan', 'Tsing Lung Tau'),
('New Territories', 'Tsuen Wan', 'Tsuen Wan'),
('New Territories', 'Tuen Mun', 'Lam Tei'),
('New Territories', 'Tuen Mun', 'So Kwun Wat'),
('New Territories', 'Tuen Mun', 'Tai Lam Chung'),
('New Territories', 'Tuen Mun', 'Tuen Mun'),
('New Territories', 'Yuen Long', 'Ha Tsuen'),
('New Territories', 'Yuen Long', 'Hung Shui Kiu'),
('New Territories', 'Yuen Long', 'Kam Tin'),
('New Territories', 'Yuen Long', 'Lau Fau Shan'),
('New Territories', 'Yuen Long', 'Lok Ma Chau'),
('New Territories', 'Yuen Long', 'Pat Heung'),
('New Territories', 'Yuen Long', 'San Tin'),
('New Territories', 'Yuen Long', 'Shek Kong'),
('New Territories', 'Yuen Long', 'Tin Shui Wai'),
('New Territories', 'Yuen Long', 'Yuen Long');

-- --------------------------------------------------------

--
-- 資料表結構 `menus`
--

CREATE TABLE `menus` (
  `restaurant_id` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `datetime` varchar(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `menu_collections`
--

CREATE TABLE `menu_collections` (
  `user_email` varchar(50) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `menu` varchar(100) NOT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tel` varchar(8) NOT NULL,
  `area` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `sub-district` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `monday` varchar(11) DEFAULT NULL,
  `tuesday` varchar(11) DEFAULT NULL,
  `wednesday` varchar(11) DEFAULT NULL,
  `thursday` varchar(11) DEFAULT NULL,
  `friday` varchar(11) DEFAULT NULL,
  `saturday` varchar(11) DEFAULT NULL,
  `sunday` varchar(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `visitors` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `restaurant`
--

INSERT INTO `restaurant` (`id`, `name`, `category`, `tel`, `area`, `district`, `sub-district`, `address`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `rate`, `visitors`) VALUES
(1, 'abc restaurant', 'chinese', '12345678', 'New Territories', 'Sha Tin', 'Tai Wai', 'New Territories, Sha Tin, Tai Wai, Lung Hang Shopping Centre No.22 abc restaurant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_category`
--

CREATE TABLE `restaurant_category` (
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `restaurant_category`
--

INSERT INTO `restaurant_category` (`category`) VALUES
('beverage'),
('chinese'),
('dessert '),
('fast food'),
('japanese'),
('tea restaurant'),
('western');

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_collections`
--

CREATE TABLE `restaurant_collections` (
  `user_email` varchar(50) NOT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_owner`
--

CREATE TABLE `restaurant_owner` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_owner_connections`
--

CREATE TABLE `restaurant_owner_connections` (
  `owner_email` varchar(50) NOT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `sub-districts`
--

CREATE TABLE `sub-districts` (
  `sub-district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `sub-districts`
--

INSERT INTO `sub-districts` (`sub-district`) VALUES
('Aberdeen'),
('Admiralty'),
('Ap Lei Chau'),
('Beacon Hill'),
('Braemar Hill'),
('Causeway Bay'),
('Central'),
('Chai Wan'),
('Cheung Chau'),
('Cheung Muk Tau'),
('Cheung Sha Wan'),
('Chung Hom Kok'),
('Clear Water Bay'),
('Diamond Hill'),
('Fanling'),
('Fo Tan'),
('Ha Tsuen'),
('Hang Hau'),
('Happy Valley'),
('Ho Man Tin'),
('Hung Hom'),
('Hung Shui Kiu'),
('Jardine\'s Lookout'),
('Jordan Valley'),
('Kai Tak'),
('Kam Tin'),
('Kei Ling Ha'),
('Kennedy Town'),
('King\'s Park'),
('Kowloon Bay'),
('Kowloon City'),
('Kowloon Tong'),
('Kwai Chung'),
('Kwun Tong'),
('Lai Chi Kok'),
('Lam Tei'),
('Lam Tin'),
('Lamma Island'),
('Lantau Island (including Tung Chung)'),
('Lau Fau Shan'),
('Lei Muk Shue'),
('Lei Yue Mun'),
('Lok Fu'),
('Lok Ma Chau'),
('Luen Wo Hui'),
('Luk Keng'),
('Ma Liu Shui'),
('Ma On Shan'),
('Ma Tau Kok'),
('Ma Tau Wai'),
('Ma Wan'),
('Ma Yau Tong'),
('Mei Foo'),
('Mid-levels'),
('Mong Kok'),
('Ngau Chi Wan'),
('Ngau Tau Kok'),
('North Point'),
('Pat Heung'),
('Peak'),
('Peng Chau'),
('Ping Shek'),
('Pok Fu Lam'),
('Quarry Bay'),
('Repulse Bay'),
('Sai Kung'),
('Sai Wan Ho'),
('Sai Ying Pun'),
('San Po Kong'),
('San Tin'),
('Sau Mau Ping'),
('Sha Tau Kok'),
('Sha Tin'),
('Sham Shui Po'),
('Sham Tseng'),
('Shau Kei Wan'),
('Shek Kip Mei'),
('Shek Kong'),
('Shek O'),
('Shek Tong Tsui'),
('Shek Wu Hui'),
('Sheung Shui'),
('Sheung Wan'),
('Shouson Hill'),
('Shuen Wan'),
('Siu Sai Wan'),
('So Kon Po'),
('So Kwun Wat'),
('Stanley'),
('Stonecutters Island'),
('Sunny Bay'),
('Tai Hang'),
('Tai Kok Tsui'),
('Tai Lam Chung'),
('Tai Mei Tuk'),
('Tai Mong Tsai'),
('Tai Po'),
('Tai Po Kau'),
('Tai Po Market'),
('Tai Tam'),
('Tai Wai'),
('Tai Wo Ping'),
('Tin Hau'),
('Tin Shui Wai'),
('Ting Kau'),
('Tiu Keng Leng'),
('To Kwa Wan'),
('Tseung Kwan O'),
('Tsim Sha Tsui'),
('Tsing Lung Tau'),
('Tsing Yi'),
('Tsuen Wan'),
('Tsz Wan Shan'),
('Tuen Mun'),
('Tung Tau'),
('Wan Chai'),
('Wang Tau Hom'),
('West Kowloon Reclamation'),
('Wong Chuk Hang'),
('Wong Tai Sin'),
('Wu Kai Sha'),
('Wu Kau Tang'),
('Yau Ma Tei'),
('Yau Tong'),
('Yau Yat Tsuen'),
('Yuen Long');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`email`);

--
-- 資料表索引 `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`area`);

--
-- 資料表索引 `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`restaurant_id`,`branch`);

--
-- 資料表索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_email_fk` (`user_email`),
  ADD KEY `comments_reid_fk` (`restaurant_id`);

--
-- 資料表索引 `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district`);

--
-- 資料表索引 `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`area`,`district`,`sub-district`),
  ADD KEY `location_district_fk` (`district`),
  ADD KEY `location_sub-district_fk` (`sub-district`);

--
-- 資料表索引 `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`restaurant_id`,`menu`);

--
-- 資料表索引 `menu_collections`
--
ALTER TABLE `menu_collections`
  ADD PRIMARY KEY (`user_email`,`restaurant_id`,`menu`),
  ADD KEY `menu_collections_menus_fk` (`restaurant_id`,`menu`),
  ADD KEY `menu_collections_re_collections_fk` (`restaurant_id`,`user_email`);

--
-- 資料表索引 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_category_fk` (`category`),
  ADD KEY `restaurant_district_fk` (`district`),
  ADD KEY `restaurant_sub-district_fk` (`sub-district`),
  ADD KEY `restaurant_location_fk` (`area`,`district`,`sub-district`);

--
-- 資料表索引 `restaurant_category`
--
ALTER TABLE `restaurant_category`
  ADD PRIMARY KEY (`category`);

--
-- 資料表索引 `restaurant_collections`
--
ALTER TABLE `restaurant_collections`
  ADD PRIMARY KEY (`user_email`,`restaurant_id`),
  ADD KEY `re_collections_reid_fk` (`restaurant_id`);

--
-- 資料表索引 `restaurant_owner`
--
ALTER TABLE `restaurant_owner`
  ADD PRIMARY KEY (`email`);

--
-- 資料表索引 `restaurant_owner_connections`
--
ALTER TABLE `restaurant_owner_connections`
  ADD PRIMARY KEY (`owner_email`,`restaurant_id`),
  ADD KEY `restaurant_owner_reid_fk` (`restaurant_id`);

--
-- 資料表索引 `sub-districts`
--
ALTER TABLE `sub-districts`
  ADD PRIMARY KEY (`sub-district`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_reid_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- 資料表的 Constraints `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_reid_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `comments_user_email_fk` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);

--
-- 資料表的 Constraints `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_area_fk` FOREIGN KEY (`area`) REFERENCES `areas` (`area`),
  ADD CONSTRAINT `location_district_fk` FOREIGN KEY (`district`) REFERENCES `districts` (`district`),
  ADD CONSTRAINT `location_sub-district_fk` FOREIGN KEY (`sub-district`) REFERENCES `sub-districts` (`sub-district`);

--
-- 資料表的 Constraints `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_id_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- 資料表的 Constraints `menu_collections`
--
ALTER TABLE `menu_collections`
  ADD CONSTRAINT `menu_collections_menus_fk` FOREIGN KEY (`restaurant_id`,`menu`) REFERENCES `menus` (`restaurant_id`, `menu`),
  ADD CONSTRAINT `menu_collections_re_collections_fk` FOREIGN KEY (`restaurant_id`,`user_email`) REFERENCES `restaurant_collections` (`restaurant_id`, `user_email`),
  ADD CONSTRAINT `menu_collections_user_email_fk` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);

--
-- 資料表的 Constraints `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_category_fk` FOREIGN KEY (`category`) REFERENCES `restaurant_category` (`category`),
  ADD CONSTRAINT `restaurant_location_fk` FOREIGN KEY (`area`,`district`,`sub-district`) REFERENCES `location` (`area`, `district`, `sub-district`);

--
-- 資料表的 Constraints `restaurant_collections`
--
ALTER TABLE `restaurant_collections`
  ADD CONSTRAINT `re_collections_reid_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `re_collections_user_email_fk` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);

--
-- 資料表的 Constraints `restaurant_owner_connections`
--
ALTER TABLE `restaurant_owner_connections`
  ADD CONSTRAINT `restaurant_owner_owner_email_fk` FOREIGN KEY (`owner_email`) REFERENCES `restaurant_owner` (`email`),
  ADD CONSTRAINT `restaurant_owner_reid_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
