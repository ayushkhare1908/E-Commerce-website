-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2018 at 11:33 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `user_id` int(10) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`user_id`, `user_email`, `user_pass`) VALUES
(1, 'shi@gmail.com', 'shi'),
(2, 'lian@gmail.com', 'lian');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Top Wear'),
(2, 'Bottom Wear'),
(3, 'Formals'),
(4, 'Ethnic Wear'),
(5, 'Sports Wear');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 37, '::1', 4, 2),
(2, 57, '::1', 4, 1),
(5, 1, '192.168.43.218', -1, 3),
(13, 3, '::1', 4, 1),
(14, 2, '::1', 4, 1),
(15, 1, '::1', -1, 1),
(16, 2, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Ladies Wear'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Foot Wear'),
(6, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 3, 50, 5, '6EP50923H6785891G', 'Completed'),
(2, 3, 3, 1, '6EP50923H6785891G', 'Completed'),
(3, 3, 6, 1, '688527571C509594D', 'Completed'),
(4, 3, 24, 1, '9A026949AG309203X', 'Completed'),
(5, 3, 3, 1, '2TA40457PN0030100', 'Completed'),
(6, 5, 3, 1, '43D790162A775715P', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 0, 0, 'Multi color T-shirt', 500, 'Mens Tshirt', 'top (2).jpg', 'top'),
(2, 0, 0, 'Black Camouflage T-shirt', 500, 'black and camouflage tshirt', 'top (3).jpg', 'top'),
(3, 0, 0, 'Maroon T-shirt', 500, 'Maroon tshirt for men', 'top (4).jpg', 'top'),
(4, 3, 1, 'Black Camouflage', 500, 'black camouflage t shirt for men', 'top (5).jpg', 'top'),
(5, 0, 0, 'Black Bottomwear', 1499, 'bottomwear', 'bottom (4).jpg', 'trouser'),
(6, 0, 0, 'Camouflage bottomwear', 1499, 'bottomwear', 'bottom (2).jpg', 'bottom'),
(7, 0, 0, 'Checkered Trouser', 1499, 'checker trouser', 'bottom (6).jpg', 'trouser'),
(8, 3, 2, 'Jeans', 1499, 'jeans', 'bottom (5).jpg', 'jeans men '),
(9, 3, 3, 'Formal Suit', 2999, 'formal', 'formal.jpg', 'formal men'),
(10, 3, 3, 'Formal suit blue', 2999, 'formal', 'formal (2).jpg', 'formal men'),
(11, 3, 2, 'white camouflage trouser', 1499, 'white camou', 'bottom.jpg', 'bottom trouser men'),
(12, 3, 2, 'Denim Half pants', 999, 'Denim halfpants', 'bottom (3).jpg', 'half pant men denim'),
(13, 3, 3, 'Navy Formal', 2999, 'formal', 'formal (3).jpg', 'formal blazer men'),
(14, 3, 3, 'Sky blue formal shirt', 1499, 'formal shirt', 'formal_top (3).jpg', 'formal shirt men'),
(15, 3, 3, 'Navy Formal Shirt', 1499, 'formal shirt', 'formal_top (2).jpg', 'formal shirt men'),
(16, 3, 3, 'Formal violet Shirt', 1499, 'formal shirt', 'formal_top.jpg', 'formal shirt men'),
(17, 3, 1, 'Blue T-shirt', 500, 'tshirt', 'top.jpg', 'top men blue tshirt'),
(18, 3, 1, 'Gold Shirt', 1499, 'shirt', 'top (6).jpg', 'formal gold shirt'),
(19, 3, 1, 'Sky blue shirt', 1499, 'shirt', 'top (7).jpg', 'shirt sky blue men'),
(20, 3, 1, 'Dark blue shirt', 1499, 'blue shirt', 'top (8).jpg', 'shirt men dark blue'),
(21, 3, 4, 'Ethnic Men Black', 2999, 'Ethnic', 'Ethnic.jpg', 'ethnic men '),
(22, 3, 4, 'Ethnic Men Blue', 2999, 'ethnic wear', 'ethnic (2).jpg', 'ethnic men'),
(23, 2, 4, 'Ladies Black', 2999, 'ladies wear', 'ladies (3).jpg', 'ladies black'),
(24, 2, 4, 'Ladies Black and Green', 2999, 'ladies wear', 'ladies.jpg', 'ladies black'),
(25, 2, 4, 'Ladies Peach ', 2999, 'ladies wear', 'ladies (2).jpg', 'ladies black'),
(26, 3, 5, 'Ronaldo jersey', 999, 'Football jersey', 'sports.jpeg', 'ronaldo football jersey'),
(27, 3, 5, 'BFC home jersey', 999, 'Football jersey', 'sports.jpg', 'bfc football jersey'),
(28, 3, 5, 'BFC Anthem Jacket', 999, 'Football jersey', 'sports (4).png', 'bfc football jacket'),
(29, 6, 5, 'BFC Cap', 399, 'cap', 'cap.png', 'bfc cap'),
(30, 3, 5, 'Indian Cricket Jersey', 999, 'jersey', 'sports (2).jpg', 'India cricket jersey'),
(31, 3, 5, 'Messi FCB Jersey', 999, 'jersey', 'sports (3).jpeg', 'barca fcb messi jersey'),
(32, 3, 5, 'Messi Arg Jersey', 999, 'jersey', 'sports.png', 'Arg messi jersey'),
(33, 3, 5, 'Mo Salah Jersey', 999, 'jersey', 'sports (2).jpeg', 'Mo Salah jersey'),
(34, 6, 5, 'BFC Muffler', 499, 'Muffler', 'sports (2).png', 'BFC Muffler fan'),
(35, 3, 5, 'BFC Blue On Tshirt', 499, 'fan tshirt', 'sports (3).png', 'BFC tshirt fan'),
(36, 3, 5, 'David Villa jersey', 999, 'Football jersey', 'david_villa.jpg', 'david villa football jersey'),
(37, 4, 0, 'Kids red t shirt and jacket', 1499, 'kids wear', 'kids (2).jpg', 'kids'),
(38, 4, 0, 'Kids blue white stripes', 1499, 'kids wear', 'kids (3).jpg', 'kids'),
(39, 4, 0, 'Kids grey sweater', 1499, 'kids wear', 'kids (4).jpg', 'kids'),
(40, 4, 0, 'Kids black t shirt and jacket', 1499, 'kids wear', 'kids (5).jpg', 'kids'),
(41, 4, 0, 'Kids black blue shirt', 1499, 'kids wear', 'kids.jpg', 'kids'),
(42, 5, 0, 'Black Nike Shoes', 2999, 'nike shoes', 'footwear (3).jpg', 'nike shoes footwear'),
(43, 5, 0, 'Black and white Nike Shoes', 2999, 'nike shoes', 'footwear (5).jpg', 'nike shoes footwear'),
(44, 5, 0, 'white Nike Shoes', 2999, 'nike shoes', 'footwear (4).jpg', 'nike shoes footwear'),
(45, 5, 0, 'white blue Nike Shoes', 2999, 'nike shoes', 'footwear (6).jpg', 'nike shoes footwear'),
(46, 5, 0, 'Beige adidas Shoes', 2999, 'adidas shoes', 'footwear (9).jpg', 'adidas shoes footwear'),
(47, 5, 0, 'Black adidas Shoes', 2999, 'adidas shoes', 'footwear.jpg', 'adidas shoes footwear'),
(48, 5, 0, 'leather slip-on footwear', 999, 'footwear', 'footwear (8).jpg', 'footwear'),
(49, 5, 0, 'leather classic slip-on', 999, 'footwear', 'footwear (2).jpg', 'footwear'),
(50, 6, 0, 'Black Cap', 399, 'cap', 'cap (3).jpg', 'black cap head'),
(51, 6, 0, 'Denim classic Cap', 399, 'cap', 'cap (4).jpg', 'denim classic cap head'),
(52, 6, 0, 'camouflage Cap', 399, 'cap', 'cap.jpg', 'camouflage cap head'),
(53, 6, 0, 'black beanie', 399, 'cap', 'cap (2).jpg', 'black beanie head'),
(54, 6, 0, 'Chrome Black Watch', 1999, 'watch', 'watch (2).jpg', 'watch black chrome'),
(55, 6, 0, 'All Black Watch', 1999, 'watch', 'watch (3).jpg', 'watch black'),
(56, 6, 0, 'G-Shock Military Watch', 1999, 'watch', 'watch (4).jpg', 'watch Gshock black'),
(57, 6, 0, 'Black with beige Watch', 1999, 'watch', 'watch.jpg', 'watch beige black'),
(58, 7, 0, 'Anupam', 9999, 'hhhhh', 'DSCN1179.jpg', 'anupam'),
(59, 3, 3, 'new pro', 500, '445454', 'bottom (3).jpg', '55555');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(5, 'anupam', 'singh', 'anupam@gmail.com', '25f9e794323b453885f5181f1b624d0b', '9754765125', 'bsp', 'cg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
