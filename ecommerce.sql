-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-06-10 16:38:04
-- 伺服器版本： 10.4.14-MariaDB
-- PHP 版本： 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ecommerce`
--

-- --------------------------------------------------------

--
-- 資料表結構 `address`
--

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `address`
--

INSERT INTO `address` (`id`, `city`, `country`, `state`, `street`, `zip_code`) VALUES
(1, 'sfdsf', 'Brazil', 'Acre', 'fsfsf', '19111'),
(2, 'afasa', 'Canada', 'Alberta', 'afasa', 'afasa'),
(3, 'sfdsf', 'Brazil', 'Acre', 'fsfsf', '19111'),
(4, 'afasa', 'Canada', 'Alberta', 'afasa', 'afasa'),
(5, 'sfdsf', 'Brazil', 'Acre', 'fsfsf', '19111'),
(6, 'afasa', 'Canada', 'Alberta', 'afasa', 'afasa');

-- --------------------------------------------------------

--
-- 資料表結構 `country`
--

CREATE TABLE `country` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `country`
--

INSERT INTO `country` (`id`, `code`, `name`) VALUES
(1, 'BR', 'Brazil'),
(2, 'CA', 'Canada'),
(3, 'DE', 'Germany'),
(4, 'IN', 'India'),
(5, 'TR', 'Turkey'),
(6, 'US', 'United States');

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'afasa', 'afasa', 'afasa@test.com'),
(2, 'afasa2', 'afasa2', 'afasa2@test.com');

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `billing_address_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `shipping_address_id` bigint(20) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`id`, `order_tracking_number`, `total_price`, `total_quantity`, `billing_address_id`, `customer_id`, `shipping_address_id`, `status`, `date_created`, `last_updated`) VALUES
(1, '4ae8bd1e-300d-4863-924d-332a5f42ff92', '36.98', 2, 1, 1, 2, NULL, '2021-06-09 07:34:45.000000', '2021-06-09 07:34:45.000000'),
(2, '87488e74-238d-4194-a597-77096ec2910a', '36.98', 2, 3, 1, 4, NULL, '2021-06-09 07:35:16.000000', '2021-06-09 07:35:16.000000'),
(3, 'd39e0912-6a2b-4917-9e09-9023fa7c4b9c', '36.98', 2, 5, 2, 6, NULL, '2021-06-09 07:38:28.000000', '2021-06-09 07:38:28.000000');

-- --------------------------------------------------------

--
-- 資料表結構 `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order_item`
--

INSERT INTO `order_item` (`id`, `image_url`, `quantity`, `unit_price`, `order_id`, `product_id`) VALUES
(1, 'assets/images/products/mousepads/mousepad-luv2code-1000.png', 1, '17.99', 1, 51),
(2, 'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', 1, '18.99', 1, 26),
(3, 'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', 1, '18.99', 2, 26),
(4, 'assets/images/products/mousepads/mousepad-luv2code-1000.png', 1, '17.99', 2, 51),
(5, 'assets/images/products/mousepads/mousepad-luv2code-1000.png', 1, '17.99', 3, 51),
(6, 'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', 1, '18.99', 3, 26);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(13,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `units_in_stock` int(11) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`id`, `sku`, `name`, `description`, `unit_price`, `image_url`, `active`, `units_in_stock`, `date_created`, `last_updated`, `category_id`) VALUES
(1, 'BOOK-TECH-1000', 'Crash Course in Python', 'Learn Python at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '14.99', 'assets/images/products/books/book-luv2code-1000.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(2, 'BOOK-TECH-1001', 'Become a Guru in JavaScript', 'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '20.99', 'assets/images/products/books/book-luv2code-1001.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(3, 'BOOK-TECH-1002', 'Exploring Vue.js', 'Learn Vue.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '14.99', 'assets/images/products/books/book-luv2code-1002.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(4, 'BOOK-TECH-1003', 'Advanced Techniques in Big Data', 'Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '13.99', 'assets/images/products/books/book-luv2code-1003.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(5, 'BOOK-TECH-1004', 'Crash Course in Big Data', 'Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '18.99', 'assets/images/products/books/book-luv2code-1004.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(6, 'BOOK-TECH-1005', 'JavaScript Cookbook', 'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '23.99', 'assets/images/products/books/book-luv2code-1005.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(7, 'BOOK-TECH-1006', 'Beginners Guide to SQL', 'Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '14.99', 'assets/images/products/books/book-luv2code-1006.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(8, 'BOOK-TECH-1007', 'Advanced Techniques in JavaScript', 'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '16.99', 'assets/images/products/books/book-luv2code-1007.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(9, 'BOOK-TECH-1008', 'Introduction to Spring Boot', 'Learn Spring Boot at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '25.99', 'assets/images/products/books/book-luv2code-1008.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(10, 'BOOK-TECH-1009', 'Become a Guru in React.js', 'Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '23.99', 'assets/images/products/books/book-luv2code-1009.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(11, 'BOOK-TECH-1010', 'Beginners Guide to Data Science', 'Learn Data Science at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '24.99', 'assets/images/products/books/book-luv2code-1010.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(12, 'BOOK-TECH-1011', 'Advanced Techniques in Java', 'Learn Java at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '19.99', 'assets/images/products/books/book-luv2code-1011.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(13, 'BOOK-TECH-1012', 'Exploring DevOps', 'Learn DevOps at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '24.99', 'assets/images/products/books/book-luv2code-1012.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(14, 'BOOK-TECH-1013', 'The Expert Guide to SQL', 'Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '19.99', 'assets/images/products/books/book-luv2code-1013.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(15, 'BOOK-TECH-1014', 'Introduction to SQL', 'Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '22.99', 'assets/images/products/books/book-luv2code-1014.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(16, 'BOOK-TECH-1015', 'The Expert Guide to JavaScript', 'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '22.99', 'assets/images/products/books/book-luv2code-1015.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(17, 'BOOK-TECH-1016', 'Exploring React.js', 'Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '27.99', 'assets/images/products/books/book-luv2code-1016.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(18, 'BOOK-TECH-1017', 'Advanced Techniques in React.js', 'Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '13.99', 'assets/images/products/books/book-luv2code-1017.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(19, 'BOOK-TECH-1018', 'Introduction to C#', 'Learn C# at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '26.99', 'assets/images/products/books/book-luv2code-1018.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(20, 'BOOK-TECH-1019', 'Crash Course in JavaScript', 'Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '13.99', 'assets/images/products/books/book-luv2code-1019.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(21, 'BOOK-TECH-1020', 'Introduction to Machine Learning', 'Learn Machine Learning at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '19.99', 'assets/images/products/books/book-luv2code-1020.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(22, 'BOOK-TECH-1021', 'Become a Guru in Java', 'Learn Java at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '18.99', 'assets/images/products/books/book-luv2code-1021.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(23, 'BOOK-TECH-1022', 'Introduction to Python', 'Learn Python at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '26.99', 'assets/images/products/books/book-luv2code-1022.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(24, 'BOOK-TECH-1023', 'Advanced Techniques in C#', 'Learn C# at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '22.99', 'assets/images/products/books/book-luv2code-1023.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(25, 'BOOK-TECH-1024', 'The Expert Guide to Machine Learning', 'Learn Machine Learning at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!', '16.99', 'assets/images/products/books/book-luv2code-1024.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 1),
(26, 'COFFEEMUG-1000', 'Coffee Mug - Express', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(27, 'COFFEEMUG-1001', 'Coffee Mug - Cherokee', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1001.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(28, 'COFFEEMUG-1002', 'Coffee Mug - Sweeper', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1002.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(29, 'COFFEEMUG-1003', 'Coffee Mug - Aspire', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1003.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(30, 'COFFEEMUG-1004', 'Coffee Mug - Dorian', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1004.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(31, 'COFFEEMUG-1005', 'Coffee Mug - Columbia', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1005.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(32, 'COFFEEMUG-1006', 'Coffee Mug - Worthing', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1006.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(33, 'COFFEEMUG-1007', 'Coffee Mug - Oak Cliff', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1007.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(34, 'COFFEEMUG-1008', 'Coffee Mug - Tachyon', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1008.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(35, 'COFFEEMUG-1009', 'Coffee Mug - Pan', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1009.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(36, 'COFFEEMUG-1010', 'Coffee Mug - Phase', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1010.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(37, 'COFFEEMUG-1011', 'Coffee Mug - Falling', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1011.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(38, 'COFFEEMUG-1012', 'Coffee Mug - Wispy', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1012.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(39, 'COFFEEMUG-1013', 'Coffee Mug - Arlington', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1013.png', b'1', 100, '2021-06-09 15:15:49.000000', NULL, 2),
(40, 'COFFEEMUG-1014', 'Coffee Mug - Gazing', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1014.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(41, 'COFFEEMUG-1015', 'Coffee Mug - Azura', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1015.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(42, 'COFFEEMUG-1016', 'Coffee Mug - Quantum Leap', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1016.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(43, 'COFFEEMUG-1017', 'Coffee Mug - Light Years', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1017.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(44, 'COFFEEMUG-1018', 'Coffee Mug - Taylor', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1018.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(45, 'COFFEEMUG-1019', 'Coffee Mug - Gracia', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1019.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(46, 'COFFEEMUG-1020', 'Coffee Mug - Relax', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1020.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(47, 'COFFEEMUG-1021', 'Coffee Mug - Windermere', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1021.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(48, 'COFFEEMUG-1022', 'Coffee Mug - Prancer', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1022.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(49, 'COFFEEMUG-1023', 'Coffee Mug - Recursion', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1023.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(50, 'COFFEEMUG-1024', 'Coffee Mug - Treasure', 'Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!', '18.99', 'assets/images/products/coffeemugs/coffeemug-luv2code-1024.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 2),
(51, 'MOUSEPAD-1000', 'Mouse Pad - Express', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1000.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(52, 'MOUSEPAD-1001', 'Mouse Pad - Cherokee', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1001.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(53, 'MOUSEPAD-1002', 'Mouse Pad - Sweeper', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1002.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(54, 'MOUSEPAD-1003', 'Mouse Pad - Aspire', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1003.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(55, 'MOUSEPAD-1004', 'Mouse Pad - Dorian', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1004.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(56, 'MOUSEPAD-1005', 'Mouse Pad - Columbia', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1005.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(57, 'MOUSEPAD-1006', 'Mouse Pad - Worthing', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1006.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(58, 'MOUSEPAD-1007', 'Mouse Pad - Oak Cliff', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1007.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(59, 'MOUSEPAD-1008', 'Mouse Pad - Tachyon', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1008.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(60, 'MOUSEPAD-1009', 'Mouse Pad - Pan', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1009.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(61, 'MOUSEPAD-1010', 'Mouse Pad - Phase', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1010.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(62, 'MOUSEPAD-1011', 'Mouse Pad - Falling', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1011.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(63, 'MOUSEPAD-1012', 'Mouse Pad - Wispy', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1012.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(64, 'MOUSEPAD-1013', 'Mouse Pad - Arlington', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1013.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(65, 'MOUSEPAD-1014', 'Mouse Pad - Gazing', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1014.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(66, 'MOUSEPAD-1015', 'Mouse Pad - Azura', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1015.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(67, 'MOUSEPAD-1016', 'Mouse Pad - Quantum Leap', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1016.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(68, 'MOUSEPAD-1017', 'Mouse Pad - Light Years', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1017.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(69, 'MOUSEPAD-1018', 'Mouse Pad - Taylor', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1018.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(70, 'MOUSEPAD-1019', 'Mouse Pad - Gracia', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1019.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(71, 'MOUSEPAD-1020', 'Mouse Pad - Relax', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1020.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(72, 'MOUSEPAD-1021', 'Mouse Pad - Windermere', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1021.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(73, 'MOUSEPAD-1022', 'Mouse Pad - Prancer', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1022.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(74, 'MOUSEPAD-1023', 'Mouse Pad - Recursion', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1023.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(75, 'MOUSEPAD-1024', 'Mouse Pad - Treasure', 'Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!', '17.99', 'assets/images/products/mousepads/mousepad-luv2code-1024.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 3),
(76, 'LUGGAGETAG-1000', 'Luggage Tag - Cherish', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1000.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(77, 'LUGGAGETAG-1001', 'Luggage Tag - Adventure', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1001.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(78, 'LUGGAGETAG-1002', 'Luggage Tag - Skyline', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1002.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(79, 'LUGGAGETAG-1003', 'Luggage Tag - River', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1003.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(80, 'LUGGAGETAG-1004', 'Luggage Tag - Trail Steps', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1004.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(81, 'LUGGAGETAG-1005', 'Luggage Tag - Blooming', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1005.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(82, 'LUGGAGETAG-1006', 'Luggage Tag - Park', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1006.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(83, 'LUGGAGETAG-1007', 'Luggage Tag - Beauty', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1007.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(84, 'LUGGAGETAG-1008', 'Luggage Tag - Water Fall', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1008.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(85, 'LUGGAGETAG-1009', 'Luggage Tag - Trail', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1009.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(86, 'LUGGAGETAG-1010', 'Luggage Tag - Skyscraper', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1010.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(87, 'LUGGAGETAG-1011', 'Luggage Tag - Leaf', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1011.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(88, 'LUGGAGETAG-1012', 'Luggage Tag - Jungle', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1012.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(89, 'LUGGAGETAG-1013', 'Luggage Tag - Shoreline', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1013.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(90, 'LUGGAGETAG-1014', 'Luggage Tag - Blossom', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1014.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(91, 'LUGGAGETAG-1015', 'Luggage Tag - Lock', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1015.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(92, 'LUGGAGETAG-1016', 'Luggage Tag - Cafe', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1016.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(93, 'LUGGAGETAG-1017', 'Luggage Tag - Darling', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1017.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(94, 'LUGGAGETAG-1018', 'Luggage Tag - Full Stack', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1018.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(95, 'LUGGAGETAG-1019', 'Luggage Tag - Courtyard', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1019.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(96, 'LUGGAGETAG-1020', 'Luggage Tag - Coaster', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1020.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(97, 'LUGGAGETAG-1021', 'Luggage Tag - Bridge', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1021.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(98, 'LUGGAGETAG-1022', 'Luggage Tag - Sunset', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1022.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(99, 'LUGGAGETAG-1023', 'Luggage Tag - Flames', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1023.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4),
(100, 'LUGGAGETAG-1024', 'Luggage Tag - Countryside', 'This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!', '16.99', 'assets/images/products/luggagetags/luggagetag-luv2code-1024.png', b'1', 100, '2021-06-09 15:15:50.000000', NULL, 4);

-- --------------------------------------------------------

--
-- 資料表結構 `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_category`
--

INSERT INTO `product_category` (`id`, `category_name`) VALUES
(1, 'Books'),
(2, 'Coffee Mugs'),
(3, 'Mouse Pads'),
(4, 'Luggage Tags');

-- --------------------------------------------------------

--
-- 資料表結構 `state`
--

CREATE TABLE `state` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `state`
--

INSERT INTO `state` (`id`, `name`, `country_id`) VALUES
(1, 'Acre', 1),
(2, 'Alagoas', 1),
(3, 'Amapá', 1),
(4, 'Amazonas', 1),
(5, 'Bahia', 1),
(6, 'Ceará', 1),
(7, 'Distrito Federal', 1),
(8, 'Espírito Santo', 1),
(9, 'Goiás', 1),
(10, 'Maranhão', 1),
(11, 'Mato Grosso do Sul', 1),
(12, 'Mato Grosso', 1),
(13, 'Minas Gerais', 1),
(14, 'Paraná', 1),
(15, 'Paraíba', 1),
(16, 'Pará', 1),
(17, 'Pernambuco', 1),
(18, 'Piaui', 1),
(19, 'Rio de Janeiro', 1),
(20, 'Rio Grande do Norte', 1),
(21, 'Rio Grande do Sul', 1),
(22, 'Rondônia', 1),
(23, 'Roraima', 1),
(24, 'Santa Catarina', 1),
(25, 'Sergipe', 1),
(26, 'São Paulo', 1),
(27, 'Tocantins', 1),
(28, 'Alberta', 2),
(29, 'British Columbia', 2),
(30, 'Manitoba', 2),
(31, 'New Brunswick', 2),
(32, 'Newfoundland and Labrador', 2),
(33, 'Northwest Territories', 2),
(34, 'Nova Scotia', 2),
(35, 'Nunavut', 2),
(36, 'Ontario', 2),
(37, 'Prince Edward Island', 2),
(38, 'Quebec', 2),
(39, 'Saskatchewan', 2),
(40, 'Yukon', 2),
(41, 'Baden-Württemberg', 3),
(42, 'Bavaria', 3),
(43, 'Berlin', 3),
(44, 'Brandenburg', 3),
(45, 'Bremen', 3),
(46, 'Hamburg', 3),
(47, 'Hesse', 3),
(48, 'Lower Saxony', 3),
(49, 'Mecklenburg-Vorpommern', 3),
(50, 'North Rhine-Westphalia', 3),
(51, 'Rhineland-Palatinate', 3),
(52, 'Saarland', 3),
(53, 'Saxony', 3),
(54, 'Saxony-Anhalt', 3),
(55, 'Schleswig-Holstein', 3),
(56, 'Thuringia', 3),
(57, 'Andhra Pradesh', 4),
(58, 'Arunachal Pradesh', 4),
(59, 'Assam', 4),
(60, 'Bihar', 4),
(61, 'Chhattisgarh', 4),
(62, 'Goa', 4),
(63, 'Gujarat', 4),
(64, 'Haryana', 4),
(65, 'Himachal Pradesh', 4),
(66, 'Jammu & Kashmir', 4),
(67, 'Jharkhand', 4),
(68, 'Karnataka', 4),
(69, 'Kerala', 4),
(70, 'Madhya Pradesh', 4),
(71, 'Maharashtra', 4),
(72, 'Manipur', 4),
(73, 'Meghalaya', 4),
(74, 'Mizoram', 4),
(75, 'Nagaland', 4),
(76, 'Odisha', 4),
(77, 'Punjab', 4),
(78, 'Rajasthan', 4),
(79, 'Sikkim', 4),
(80, 'Tamil Nadu', 4),
(81, 'Telangana', 4),
(82, 'Tripura', 4),
(83, 'Uttar Pradesh', 4),
(84, 'Uttarakhand', 4),
(85, 'West Bengal', 4),
(86, 'Andaman and Nicobar Islands', 4),
(87, 'Chandigarh', 4),
(88, 'Dadra and Nagar Haveli', 4),
(89, 'Daman & Diu', 4),
(90, 'Lakshadweep', 4),
(91, 'Puducherry', 4),
(92, 'The Government of NCT of Delhi', 4),
(93, 'Alabama', 6),
(94, 'Alaska', 6),
(95, 'Arizona', 6),
(96, 'Arkansas', 6),
(97, 'California', 6),
(98, 'Colorado', 6),
(99, 'Connecticut', 6),
(100, 'Delaware', 6),
(101, 'District Of Columbia', 6),
(102, 'Florida', 6),
(103, 'Georgia', 6),
(104, 'Hawaii', 6),
(105, 'Idaho', 6),
(106, 'Illinois', 6),
(107, 'Indiana', 6),
(108, 'Iowa', 6),
(109, 'Kansas', 6),
(110, 'Kentucky', 6),
(111, 'Louisiana', 6),
(112, 'Maine', 6),
(113, 'Maryland', 6),
(114, 'Massachusetts', 6),
(115, 'Michigan', 6),
(116, 'Minnesota', 6),
(117, 'Mississippi', 6),
(118, 'Missouri', 6),
(119, 'Montana', 6),
(120, 'Nebraska', 6),
(121, 'Nevada', 6),
(122, 'New Hampshire', 6),
(123, 'New Jersey', 6),
(124, 'New Mexico', 6),
(125, 'New York', 6),
(126, 'North Carolina', 6),
(127, 'North Dakota', 6),
(128, 'Ohio', 6),
(129, 'Oklahoma', 6),
(130, 'Oregon', 6),
(131, 'Pennsylvania', 6),
(132, 'Rhode Island', 6),
(133, 'South Carolina', 6),
(134, 'South Dakota', 6),
(135, 'Tennessee', 6),
(136, 'Texas', 6),
(137, 'Utah', 6),
(138, 'Vermont', 6),
(139, 'Virginia', 6),
(140, 'Washington', 6),
(141, 'West Virginia', 6),
(142, 'Wisconsin', 6),
(143, 'Wyoming', 6),
(144, 'Adıyaman', 5),
(145, 'Afyonkarahisar', 5),
(146, 'Ağrı', 5),
(147, 'Aksaray', 5),
(148, 'Amasya', 5),
(149, 'Ankara', 5),
(150, 'Antalya', 5),
(151, 'Ardahan', 5),
(152, 'Artvin', 5),
(153, 'Aydın', 5),
(154, 'Balıkesir', 5),
(155, 'Bartın', 5),
(156, 'Batman', 5),
(157, 'Bayburt', 5),
(158, 'Bilecik', 5),
(159, 'Bingöl', 5),
(160, 'Bitlis', 5),
(161, 'Bolu', 5),
(162, 'Burdur', 5),
(163, 'Bursa', 5),
(164, 'Çanakkale', 5),
(165, 'Çankırı', 5),
(166, 'Çorum', 5),
(167, 'Denizli', 5),
(168, 'Diyarbakır', 5),
(169, 'Düzce', 5),
(170, 'Edirne', 5),
(171, 'Elazığ', 5),
(172, 'Erzincan', 5),
(173, 'Erzurum', 5),
(174, 'Eskişehir', 5),
(175, 'Gaziantep', 5),
(176, 'Giresun', 5),
(177, 'Gümüşhane', 5),
(178, 'Hakkâri', 5),
(179, 'Hatay', 5),
(180, 'Iğdır', 5),
(181, 'Isparta', 5),
(182, 'İstanbul', 5),
(183, 'İzmir', 5),
(184, 'Kahramanmaraş', 5),
(185, 'Karabük', 5),
(186, 'Karaman', 5),
(187, 'Kars', 5),
(188, 'Kastamonu', 5),
(189, 'Kayseri', 5),
(190, 'Kırıkkale', 5),
(191, 'Kırklareli', 5),
(192, 'Kırşehir', 5),
(193, 'Kilis', 5),
(194, 'Kocaeli', 5),
(195, 'Konya', 5),
(196, 'Kütahya', 5),
(197, 'Malatya', 5),
(198, 'Manisa', 5),
(199, 'Mardin', 5),
(200, 'Mersin', 5),
(201, 'Muğla', 5),
(202, 'Muş', 5),
(203, 'Nevşehir', 5),
(204, 'Niğde', 5),
(205, 'Ordu', 5),
(206, 'Osmaniye', 5),
(207, 'Rize', 5),
(208, 'Sakarya', 5),
(209, 'Samsun', 5),
(210, 'Siirt', 5),
(211, 'Sinop', 5),
(212, 'Sivas', 5),
(213, 'Şanlıurfa', 5),
(214, 'Şırnak', 5),
(215, 'Tekirdağ', 5),
(216, 'Tokat', 5),
(217, 'Trabzon', 5),
(218, 'Tunceli', 5),
(219, 'Uşak', 5),
(220, 'Van', 5),
(221, 'Yalova', 5),
(222, 'Yozgat', 5),
(223, 'Zonguldak', 5);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  ADD UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  ADD KEY `K_customer_id` (`customer_id`);

--
-- 資料表索引 `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `K_order_id` (`order_id`),
  ADD KEY `FK_product_id` (`product_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category_id`);

--
-- 資料表索引 `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_country` (`country_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `state`
--
ALTER TABLE `state`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`);

--
-- 資料表的限制式 `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- 資料表的限制式 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`);

--
-- 資料表的限制式 `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
