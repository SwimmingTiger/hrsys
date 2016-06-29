-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-06-29 14:40:08
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `hrsys`
--

--
-- 转存表中的数据 `type_group`
--

INSERT INTO `type_group` (`id`, `name`) VALUES(3, '人员来源');
INSERT INTO `type_group` (`id`, `name`) VALUES(6, '婚姻状况');
INSERT INTO `type_group` (`id`, `name`) VALUES(8, '学位');
INSERT INTO `type_group` (`id`, `name`) VALUES(7, '学历');
INSERT INTO `type_group` (`id`, `name`) VALUES(1, '性别');
INSERT INTO `type_group` (`id`, `name`) VALUES(4, '政治面貌');
INSERT INTO `type_group` (`id`, `name`) VALUES(2, '用工形式');
INSERT INTO `type_group` (`id`, `name`) VALUES(5, '血型');

--
-- 转存表中的数据 `type_item`
--

INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(2, 1, '女');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(1, 1, '男');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(4, 2, '临时员工');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(3, 2, '正式员工');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(7, 3, '其它');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(5, 3, '校园招聘');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(6, 3, '社会招聘');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(8, 4, '党员');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(11, 4, '其他');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(10, 4, '团员');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(9, 4, '预备党员');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(32, 5, '汉族');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(12, 6, 'A 型');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(14, 6, 'AB 型');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(13, 6, 'B 型');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(15, 6, 'O 型');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(16, 6, '其他血型');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(19, 7, '丧偶');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(21, 7, '其他');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(18, 7, '已婚');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(17, 7, '未婚');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(20, 7, '离婚');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(23, 8, '大专');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(24, 8, '本科');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(25, 8, '研究生');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(22, 8, '高中及以下');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(30, 9, '博士');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(31, 9, '博士后');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(28, 9, '双学士');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(27, 9, '学士');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(26, 9, '无学位');
INSERT INTO `type_item` (`id`, `group`, `name`) VALUES(29, 9, '硕士');
