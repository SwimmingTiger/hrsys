-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-06-28 21:50:27
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrsys`
--

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `type_id` int(11) NOT NULL COMMENT '类型编号',
  `phone` varchar(40) NOT NULL COMMENT '电话',
  `fax` varchar(40) NOT NULL COMMENT '传真',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `parent_id` int(11) NOT NULL COMMENT '上级部门编号',
  `birth_date` date NOT NULL COMMENT '成立日期',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `parent_id` (`parent_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '姓名',
  `sex_id` int(11) NOT NULL COMMENT '性别',
  `birth_date` date NOT NULL COMMENT '生日',
  `id_card` varchar(40) NOT NULL COMMENT '身份证号',
  `department_id` int(11) NOT NULL COMMENT '部门编号',
  `job_id` int(11) NOT NULL COMMENT '岗位编号',
  `hire_date` date NOT NULL COMMENT '入职日期',
  `join_date` date NOT NULL COMMENT '参加工作日期',
  `hire_type_id` int(11) NOT NULL COMMENT '用工形式',
  `hr_type_id` int(11) NOT NULL COMMENT '人员来源',
  `politics_status_id` int(11) NOT NULL COMMENT '政治面貌',
  `nationality_id` int(11) NOT NULL COMMENT '民族',
  `native_place` varchar(255) NOT NULL COMMENT '籍贯',
  `phone` varchar(40) NOT NULL COMMENT '电话',
  `email` varchar(255) NOT NULL COMMENT '电子邮件',
  `height_cm` int(11) NOT NULL COMMENT '身高（厘米）',
  `blood_type_id` int(11) NOT NULL COMMENT '血型',
  `marital_status_id` int(11) NOT NULL COMMENT '婚姻状况',
  `birth_place` varchar(255) NOT NULL COMMENT '出生地',
  `domicile_place` varchar(255) NOT NULL COMMENT '户口所在地',
  `education_status_id` int(11) NOT NULL COMMENT '最高学历',
  `degree_id` int(11) NOT NULL COMMENT '最高学位',
  `graduate_school` varchar(255) NOT NULL COMMENT '毕业院校',
  `major_name` varchar(255) NOT NULL COMMENT '所学专业',
  `graduate_date` date NOT NULL COMMENT '毕业日期',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sex_id` (`sex_id`),
  KEY `department_id` (`department_id`),
  KEY `job_id` (`job_id`),
  KEY `hire_type_id` (`hire_type_id`),
  KEY `hr_type_id` (`hr_type_id`),
  KEY `politics_status_id` (`politics_status_id`),
  KEY `nationality_id` (`nationality_id`),
  KEY `blood_type_id` (`blood_type_id`),
  KEY `marital_status_id` (`marital_status_id`),
  KEY `education_status_id` (`education_status_id`),
  KEY `degree_id` (`degree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `employee_leave_record`
--

CREATE TABLE IF NOT EXISTS `employee_leave_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `leave_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '离职时间',
  `leave_reason_id` int(11) NOT NULL COMMENT '离职类型',
  `destination` varchar(255) NOT NULL COMMENT '离职去向',
  `join_hr_pool` bit(1) NOT NULL COMMENT '是否进入人才库',
  `comment` varchar(255) NOT NULL COMMENT '备注',
  `employee_id` int(11) NOT NULL COMMENT '员工编号',
  `name` varchar(40) NOT NULL COMMENT '姓名',
  `sex` varchar(40) NOT NULL COMMENT '性别',
  `birth_date` date NOT NULL COMMENT '生日',
  `id_card` varchar(40) NOT NULL COMMENT '身份证号',
  `department` varchar(40) NOT NULL COMMENT '部门名称',
  `job` varchar(40) NOT NULL COMMENT '岗位名称',
  `hire_date` date NOT NULL COMMENT '入职日期',
  `join_date` date NOT NULL COMMENT '参加工作日期',
  `hire_type` varchar(40) NOT NULL COMMENT '用工形式',
  `hr_type` varchar(40) NOT NULL COMMENT '人员来源',
  `politics_status` varchar(40) NOT NULL COMMENT '政治面貌',
  `nationality` varchar(40) NOT NULL COMMENT '民族',
  `native_place` varchar(255) NOT NULL COMMENT '籍贯',
  `phone` varchar(40) NOT NULL COMMENT '电话',
  `email` varchar(255) NOT NULL COMMENT '电子邮件',
  `height_cm` int(11) NOT NULL COMMENT '身高（厘米）',
  `blood_type` varchar(40) NOT NULL COMMENT '血型',
  `marital_status` varchar(40) NOT NULL COMMENT '婚姻状况',
  `birth_place` varchar(255) NOT NULL COMMENT '出生地',
  `domicile_place` varchar(255) NOT NULL COMMENT '户口所在地',
  `education_status` varchar(40) NOT NULL COMMENT '最高学历',
  `degree` varchar(40) NOT NULL COMMENT '最高学位',
  `graduate_school` varchar(255) NOT NULL COMMENT '毕业院校',
  `major_name` varchar(255) NOT NULL COMMENT '所学专业',
  `graduate_date` date NOT NULL COMMENT '毕业日期',
  PRIMARY KEY (`id`),
  KEY `leave_reason_id` (`leave_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `type_id` int(11) NOT NULL COMMENT '类型编号',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '编制',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `size` (`size`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `type_group`
--

CREATE TABLE IF NOT EXISTS `type_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型组' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `type_item`
--

CREATE TABLE IF NOT EXISTS `type_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `group` int(11) NOT NULL COMMENT '组编号',
  `name` varchar(40) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `group` (`group`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型条目' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` int(11) NOT NULL COMMENT '用户类型',
  `employee_id` int(11) DEFAULT NULL COMMENT '员工号',
  `username` varchar(40) DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `permission` int(11) NOT NULL COMMENT '权限BitSet',
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户' AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `department_type` FOREIGN KEY (`type_id`) REFERENCES `type_item` (`id`);

--
-- 限制表 `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `degree` FOREIGN KEY (`degree_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_type` FOREIGN KEY (`blood_type_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `education_status` FOREIGN KEY (`education_status_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hire_type` FOREIGN KEY (`hire_type_id`) REFERENCES `type_item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hr_type` FOREIGN KEY (`hr_type_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `marital_status` FOREIGN KEY (`marital_status_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `nationality` FOREIGN KEY (`nationality_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `politics_status` FOREIGN KEY (`politics_status_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sex` FOREIGN KEY (`sex_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE;

--
-- 限制表 `employee_leave_record`
--
ALTER TABLE `employee_leave_record`
  ADD CONSTRAINT `leave_reason` FOREIGN KEY (`leave_reason_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE;

--
-- 限制表 `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_type` FOREIGN KEY (`type_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE;

--
-- 限制表 `sys_user`
--
ALTER TABLE `sys_user`
  ADD CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
