-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2014 at 10:51 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tokoonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Pakaian', 'pakaian kerenz'),
(2, 'elektronik', 'elektronik'),
(4, 'Jaket', 'Jaket keren');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isConfirmed` tinyint(1) DEFAULT NULL,
  `isComplete` tinyint(4) DEFAULT NULL,
  `tanggalOrder` date DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idUserr_idx` (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `isConfirmed`, `isComplete`, `tanggalOrder`, `idUser`) VALUES
(2, NULL, NULL, '2014-04-25', 1),
(3, NULL, NULL, '2014-04-26', 1),
(4, NULL, NULL, '2014-05-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE IF NOT EXISTS `orderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) DEFAULT NULL,
  `idOrder` int(11) NOT NULL,
  `kuantitas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`idOrder`),
  KEY `idProduct_idx` (`idProduct`),
  KEY `idOrderr_idx` (`idOrder`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `orderlist`
--

INSERT INTO `orderlist` (`id`, `idProduct`, `idOrder`, `kuantitas`) VALUES
(1, 1, 3, 3),
(2, 4, 3, 1),
(3, 3, 4, 1),
(4, 2, 4, 2),
(5, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `isFeatured` tinyint(4) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `detail` text,
  `file_picture` varchar(255) DEFAULT NULL,
  `idcategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_idx` (`idcategory`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `isFeatured`, `price`, `stock`, `detail`, `file_picture`, `idcategory`) VALUES
(1, 'Baju keren', 1, 120000, 5, 'Baju ini keren banget', 'assets/images/products/a.jpg', 1),
(2, 'Baju gengsi', 1, 240000, 5, 'Mahal dan gengsi', 'assets/images/products/b.jpg', 1),
(3, 'Baju rumah', 1, 100000, 3, 'Baju sehari - hari', 'assets/images/products/c.jpg', 1),
(4, 'Ini Baju', 1, 150000, 2, 'Ini baju', 'assets/images/products/d.jpg', 1),
(5, 'tes', 0, 19000, 12, ' celana ini ', 'null', 1),
(6, 'celana basah', 1, 100000, 3, 'ini celana habis kebajiran', 'null', 1),
(12, 'jaket usang', 0, 20000, 3, 'ini adalah jaket jelek', 'null', 4),
(13, 'flashsik', 1, 80000, 9, 'flashdisk 8 GB', 'null', 2),
(14, 'jaket hoodie', 1, 160000, 1, 'jaket hoodie fasilkom', 'keyra.png', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `telepon` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `alamat` text,
  `email` varchar(45) DEFAULT NULL,
  `isAdmin` tinyint(4) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nama` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `telepon`, `password`, `alamat`, `email`, `isAdmin`, `foto`, `nama`) VALUES
(1, 'hanif', '0000000', 'hanif', 'Depok', NULL, 1, NULL, 'Muhammad Hanif Naufall'),
(2, 'guspra', '12345', 'guspra', 'denpasar', 'guspraa@gmail.com', 0, 'guspra.jpg', 'guspra');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `idUserr` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD CONSTRAINT `idOrderr` FOREIGN KEY (`idOrder`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idProductt` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category` FOREIGN KEY (`idcategory`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
