-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-07-08 15:53:07
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
  `parent_id` int(11) DEFAULT NULL COMMENT '上级部门编号',
  `birth_date` date NOT NULL COMMENT '成立日期',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `parent_id` (`parent_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='部门' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`id`, `name`, `type_id`, `phone`, `fax`, `desc`, `parent_id`, `birth_date`) VALUES
(1, '网络部', 38, '123456', '654321', '该部门不存在计算机~~~', NULL, '2016-06-30');

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
  `probation_status` int(11) NOT NULL DEFAULT '0' COMMENT '试用状态',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `employee`
--

INSERT INTO `employee` (`id`, `name`, `sex_id`, `birth_date`, `id_card`, `department_id`, `job_id`, `hire_date`, `join_date`, `hire_type_id`, `hr_type_id`, `politics_status_id`, `nationality_id`, `native_place`, `phone`, `email`, `height_cm`, `blood_type_id`, `marital_status_id`, `birth_place`, `domicile_place`, `education_status_id`, `degree_id`, `graduate_school`, `major_name`, `graduate_date`, `probation_status`) VALUES
(1, '老虎会游泳', 2, '2016-07-11', '123', 1, 1, '2016-07-12', '2016-07-19', 5, 7, 8, 32, '11', '111', '1111', 111, 12, 19, '111111', '111111', 23, 30, '1111111', '11111111', '2016-07-27', 5),
(2, '000', 1, '2016-07-05', '000', 1, 1, '2016-07-13', '2016-07-13', 4, 7, 8, 32, '', '', '0', 111, 12, 19, '', '', 23, 30, '', '', '2016-07-21', 4),
(3, '000', 1, '2016-07-05', '000', 1, 1, '2016-07-13', '2016-07-13', 5, 7, 8, 32, '000', '000', '0', 111, 12, 19, '000', '000', 23, 30, '000', '000', '2016-07-21', 5);

-- --------------------------------------------------------

--
-- 表的结构 `employee_leave_record`
--

CREATE TABLE IF NOT EXISTS `employee_leave_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `leave_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '离职时间',
  `leave_reason_id` int(11) NOT NULL COMMENT '离职类型',
  `destination` varchar(255) NOT NULL COMMENT '离职去向',
  `join_hr_pool` bit(1) DEFAULT NULL COMMENT '是否进入人才库',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='岗位' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `job`
--

INSERT INTO `job` (`id`, `name`, `type_id`, `size`) VALUES
(1, '清洁工', 34, 5),
(2, '秒', 36, 10),
(3, '老虎会游泳', 36, 1);

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

-- --------------------------------------------------------

--
-- 表的结构 `type_group`
--

CREATE TABLE IF NOT EXISTS `type_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='类型组' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `type_group`
--

INSERT INTO `type_group` (`id`, `name`) VALUES
(3, '人员来源'),
(7, '婚姻状况'),
(9, '学位'),
(8, '学历'),
(10, '岗位类型'),
(1, '性别'),
(4, '政治面貌'),
(5, '民族'),
(2, '用工形式'),
(12, '离职类型'),
(6, '血型'),
(11, '部门类型');

-- --------------------------------------------------------

--
-- 表的结构 `type_item`
--

CREATE TABLE IF NOT EXISTS `type_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group_id`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `type_item`
--

INSERT INTO `type_item` (`id`, `group_id`, `name`) VALUES
(2, 1, '女'),
(1, 1, '男'),
(4, 2, '临时员工'),
(3, 2, '正式员工'),
(7, 3, '其它'),
(5, 3, '校园招聘'),
(6, 3, '社会招聘'),
(8, 4, '党员'),
(11, 4, '其他'),
(10, 4, '团员'),
(9, 4, '预备党员'),
(32, 5, '汉族'),
(12, 6, 'A 型'),
(14, 6, 'AB 型'),
(13, 6, 'B 型'),
(15, 6, 'O 型'),
(16, 6, '其他血型'),
(19, 7, '丧偶'),
(21, 7, '其他'),
(18, 7, '已婚'),
(17, 7, '未婚'),
(20, 7, '离婚'),
(23, 8, '大专'),
(24, 8, '本科'),
(25, 8, '研究生'),
(22, 8, '高中及以下'),
(30, 9, '博士'),
(31, 9, '博士后'),
(28, 9, '双学士'),
(27, 9, '学士'),
(26, 9, '无学位'),
(29, 9, '硕士'),
(36, 10, '市场'),
(34, 10, '技术'),
(33, 10, '管理'),
(35, 10, '营销'),
(37, 11, '公司'),
(38, 11, '部门'),
(39, 12, '主动辞职'),
(42, 12, '开除'),
(43, 12, '试用期未通过'),
(40, 12, '辞退'),
(41, 12, '退休');

--
-- 限制导出的表
--

--
-- 限制表 `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_type` FOREIGN KEY (`type_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE;

--
-- 限制表 `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `blood_type` FOREIGN KEY (`blood_type_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `degree` FOREIGN KEY (`degree_id`) REFERENCES `type_item` (`id`) ON UPDATE CASCADE,
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

--
-- 限制表 `type_item`
--
ALTER TABLE `type_item`
  ADD CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `type_group` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
