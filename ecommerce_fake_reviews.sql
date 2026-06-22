-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 26, 2022 at 03:13 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_fake_reviews`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add customer model', 7, 'add_customermodel'),
(26, 'Can change customer model', 7, 'change_customermodel'),
(27, 'Can delete customer model', 7, 'delete_customermodel'),
(28, 'Can view customer model', 7, 'view_customermodel'),
(29, 'Can add seller model', 8, 'add_sellermodel'),
(30, 'Can change seller model', 8, 'change_sellermodel'),
(31, 'Can delete seller model', 8, 'delete_sellermodel'),
(32, 'Can view seller model', 8, 'view_sellermodel'),
(33, 'Can add product model', 9, 'add_productmodel'),
(34, 'Can change product model', 9, 'change_productmodel'),
(35, 'Can delete product model', 9, 'delete_productmodel'),
(36, 'Can view product model', 9, 'view_productmodel'),
(37, 'Can add cart model', 10, 'add_cartmodel'),
(38, 'Can change cart model', 10, 'change_cartmodel'),
(39, 'Can delete cart model', 10, 'delete_cartmodel'),
(40, 'Can view cart model', 10, 'view_cartmodel'),
(41, 'Can add order models', 11, 'add_ordermodels'),
(42, 'Can change order models', 11, 'change_ordermodels'),
(43, 'Can delete order models', 11, 'delete_ordermodels'),
(44, 'Can view order models', 11, 'view_ordermodels'),
(45, 'Can add feedback model', 12, 'add_feedbackmodel'),
(46, 'Can change feedback model', 12, 'change_feedbackmodel'),
(47, 'Can delete feedback model', 12, 'delete_feedbackmodel'),
(48, 'Can view feedback model', 12, 'view_feedbackmodel'),
(49, 'Can add proceed to final payment model', 13, 'add_proceedtofinalpaymentmodel'),
(50, 'Can change proceed to final payment model', 13, 'change_proceedtofinalpaymentmodel'),
(51, 'Can delete proceed to final payment model', 13, 'delete_proceedtofinalpaymentmodel'),
(52, 'Can view proceed to final payment model', 13, 'view_proceedtofinalpaymentmodel'),
(53, 'Can add order based feedback model', 14, 'add_orderbasedfeedbackmodel'),
(54, 'Can change order based feedback model', 14, 'change_orderbasedfeedbackmodel'),
(55, 'Can delete order based feedback model', 14, 'delete_orderbasedfeedbackmodel'),
(56, 'Can view order based feedback model', 14, 'view_orderbasedfeedbackmodel'),
(57, 'Can add order review models', 15, 'add_orderreviewmodels'),
(58, 'Can change order review models', 15, 'change_orderreviewmodels'),
(59, 'Can delete order review models', 15, 'delete_orderreviewmodels'),
(60, 'Can view order review models', 15, 'view_orderreviewmodels'),
(61, 'Can add wishlist model', 16, 'add_wishlistmodel'),
(62, 'Can change wishlist model', 16, 'change_wishlistmodel'),
(63, 'Can delete wishlist model', 16, 'delete_wishlistmodel'),
(64, 'Can view wishlist model', 16, 'view_wishlistmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers_details`
--

DROP TABLE IF EXISTS `customers_details`;
CREATE TABLE IF NOT EXISTS `customers_details` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_fullname` varchar(50) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_password` varchar(50) NOT NULL,
  `customer_address` varchar(200) DEFAULT NULL,
  `customer_street` varchar(50) NOT NULL,
  `customer_city` varchar(50) NOT NULL,
  `customer_state` varchar(50) NOT NULL,
  `customer_pincode` varchar(10) DEFAULT NULL,
  `customer_photo` varchar(100) DEFAULT NULL,
  `customer_status` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_details`
--

INSERT INTO `customers_details` (`customer_id`, `customer_fullname`, `customer_contact`, `customer_email`, `customer_password`, `customer_address`, `customer_street`, `customer_city`, `customer_state`, `customer_pincode`, `customer_photo`, `customer_status`) VALUES
(1, 'Satya', '9603445444', 'satya@gmail.com', '123456', 'golnaka road, plot no 25, nithesh nagar', 'Golnaka Road, GM Colony', 'Bengal', 'Kolkata', '700012', 'images/woman9.jpg', 'pending'),
(2, 'Anand', '9603467565', 'anand@gmail.com', '123456', 'Palakollu Road, Dmart Lane, Plot no 345,', 'Palakollu Road, Bapatla Colony', 'Amaravathi', 'Karnataka', '500078', 'images/men1.jpg', 'pending'),
(3, 'Surya', '8032457733', 'surya@gmail.com', '123456', 'Mansoorabad Road, Plot no 211, Mansoorabad, LB Nagar', 'Pathrikeya Nagar Road, LB Nagar', 'Pune', 'Mumbai', '500068', 'images/men10.jpg', 'pending'),
(4, 'Kittu', '7200032111', 'kittu@gmail.com', '123456', 'Mythri Road, Plot no 105, Gayatri nagar', 'Mythri Road, Bhopal Colony', 'Bhopal', 'Maharastra', '500068', 'images/men11.jpg', 'pending'),
(5, 'Rekha', '7500098327', 'rekha@gmail.com', '123456', 'Sri Kala Road, Plot No 322, BanjaraHills Nagar', 'Sri Kala Road, Maharaj Colony', 'Jaipur', 'Rajasthan', '500018', 'images/woman8_2RZSiAW.jpg', 'pending'),
(6, 'RatnaKumari', '8988854445', 'ratnakumari@gmail.com', '123456', 'Bharath Nagar, Meerpet, Saidabad', 'Meerpet Road, Saidabad', 'Hyderabad', 'Telangana', '500068', 'images/woman2_ZN2hh9J.jpg', 'pending'),
(7, 'Latha', '8999954221', 'latha@gmail.com', '123456', 'Maruthi Nilayam, Brahmakumari Samajam, Uppal Road', 'Street No 3', 'Hyderabad', 'Telangana', '500073', 'images/women1.jpg', 'pending'),
(8, 'Mayuri', '9934700222', 'mayuri@gmail.com', '123456', 'Sai Ram Residency, Brigade Metropolis, Shatha Vahana Road', 'Street No 5', 'Bengaluru', 'Chennai', '600023', 'images/woman4_GkVveRp.jpg', 'pending'),
(9, 'Shyam', '9898845554', 'shyam@gmail.com', '123456', 'Srivani Apartments, Sundari Colony, Mayor Kabalamurthy Road,', 'Street No 2', 'Chitrangipet', 'Chennai', '600045', 'images/men2.jpg', 'pending'),
(10, 'Harsha', '6630054544', 'harsha@gmail.com', '123456', 'YSR Colony, Manjira Road,', ' Manjira Road, Machilipatnum', 'Annavarum', 'Andhra Pradesh', '700090', 'images/men1_C1ExDW7.jpg', 'pending'),
(11, 'Rani', '9603467799', 'rani@gmail.com', '123456', 'H: No 8-9-998/3, Dhanaya Colony', 'Bhagya Nagar Road, Bharath Street', 'Bangalore', 'Karnataka', '500039', 'images/woman3.jpg', 'pending'),
(12, 'Divya', '9603460057', 'divya@gmail.com', '123456', 'H.NO: 3-7-201/8/3, Suryodaya Colony', 'Mansoorabad, LB Nagar', 'Hyderabad', 'Telangana', '500068', 'images/woman5_Ok4FYgu.jpg', 'pending'),
(13, 'Haritha', '9603499957', 'haritha@gmail.com', '123456', 'Press Colony Road No - 3', 'Mythri Road, Bhopal Colony', 'BhagalPur', 'Kolkata', '500068', 'images/woman7_hezW3ge.jpg', 'pending'),
(14, 'Swetha', '9983467757', 'swetha@gmail.com', '123456', 'H: No 8-9-1118/2', 'harinath Colony, Vishal Street', 'Mumbai', 'Maharastra', '500032', 'images/woman10_6xV4Fq0.jpg', 'pending'),
(15, 'harsha vardhan', '9618294480', 'harshavardhan.hv12@gmail.com', '000000', 'tarnaka', 'sree keerthi towers,D-502,', 'hyderabad', 'Telangana', '500017', 'images/genuine.png', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'customerapp', 'customermodel'),
(8, 'sellerapp', 'sellermodel'),
(9, 'sellerapp', 'productmodel'),
(10, 'customerapp', 'cartmodel'),
(11, 'customerapp', 'ordermodels'),
(12, 'customerapp', 'feedbackmodel'),
(13, 'customerapp', 'proceedtofinalpaymentmodel'),
(14, 'customerapp', 'orderbasedfeedbackmodel'),
(15, 'customerapp', 'orderreviewmodels'),
(16, 'customerapp', 'wishlistmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-10-13 06:31:13.918885'),
(2, 'auth', '0001_initial', '2022-10-13 06:31:16.031963'),
(3, 'admin', '0001_initial', '2022-10-13 06:31:16.504298'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-10-13 06:31:16.530278'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-13 06:31:16.569271'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-10-13 06:31:16.777915'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-10-13 06:31:16.891939'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-10-13 06:31:16.992929'),
(9, 'auth', '0004_alter_user_username_opts', '2022-10-13 06:31:17.013938'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-10-13 06:31:17.109916'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-10-13 06:31:17.116917'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-10-13 06:31:17.144918'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-10-13 06:31:17.243914'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-10-13 06:31:17.354918'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-10-13 06:31:17.457934'),
(16, 'auth', '0011_update_proxy_permissions', '2022-10-13 06:31:17.487919'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-10-13 06:31:17.600917'),
(18, 'sessions', '0001_initial', '2022-10-13 06:31:17.780173'),
(19, 'customerapp', '0001_initial', '2022-10-13 06:31:44.437242'),
(20, 'sellerapp', '0001_initial', '2022-10-13 06:32:00.804528'),
(21, 'sellerapp', '0002_productmodel', '2022-10-13 06:32:50.003233'),
(22, 'customerapp', '0002_cartmodel', '2022-10-13 06:33:55.204448'),
(23, 'customerapp', '0003_ordermodels', '2022-10-13 06:34:33.552157'),
(24, 'customerapp', '0004_feedbackmodel', '2022-10-13 06:35:36.849665'),
(25, 'customerapp', '0005_proceedtofinalpaymentmodel', '2022-10-13 06:35:56.184360'),
(26, 'customerapp', '0006_feedbackmodel_productwise_feedback', '2022-10-13 09:24:20.833349'),
(27, 'customerapp', '0007_remove_feedbackmodel_ord_prod_comments_date_and_more', '2022-10-13 09:29:38.299046'),
(28, 'customerapp', '0008_remove_feedbackmodel_ordwise_comments_and_more', '2022-10-13 19:56:18.712016'),
(29, 'customerapp', '0009_remove_feedbackmodel_ord_prodwise_comments', '2022-10-13 19:57:43.169521'),
(30, 'customerapp', '0010_rename_comment_id_feedbackmodel_productwise_feedback_id', '2022-10-13 19:58:51.358767'),
(31, 'customerapp', '0011_orderbasedfeedbackmodel', '2022-10-13 20:02:34.705511'),
(32, 'customerapp', '0012_rename_orderwise_feedback_id_orderbasedfeedbackmodel_order_feedback_id', '2022-10-13 20:06:10.938616'),
(33, 'customerapp', '0013_orderreviewmodels_delete_orderbasedfeedbackmodel', '2022-10-13 20:10:56.772529'),
(34, 'customerapp', '0014_alter_orderreviewmodels_table', '2022-10-13 20:12:32.791726'),
(35, 'customerapp', '0015_alter_orderreviewmodels_order_sentiment', '2022-10-14 09:24:36.813285'),
(36, 'customerapp', '0016_alter_orderreviewmodels_order_rating', '2022-10-16 16:48:44.888109'),
(37, 'customerapp', '0017_alter_orderreviewmodels_order_expression', '2022-10-16 16:50:39.375798'),
(38, 'customerapp', '0018_rename_prodwise_sentiment_feedbackmodel_psentiment_and_more', '2022-10-16 17:10:17.490647'),
(39, 'customerapp', '0019_alter_feedbackmodel_custwise_comments_and_more', '2022-10-16 18:31:46.850372'),
(40, 'customerapp', '0020_alter_feedbackmodel_prodwise_rating_and_more', '2022-10-17 06:22:16.984371'),
(41, 'customerapp', '0021_feedbackmodel_productreview_date', '2022-10-22 07:14:36.246207'),
(42, 'customerapp', '0022_alter_feedbackmodel_productwise_feedback_and_more', '2022-10-22 12:01:25.927533'),
(43, 'customerapp', '0023_feedbackmodel_feedback_order_id', '2022-10-24 06:21:12.943913'),
(44, 'customerapp', '0024_feedbackmodel_after_order_placed_revire', '2022-10-26 08:49:15.276294'),
(45, 'customerapp', '0025_wishlistmodel', '2022-10-26 13:01:19.023115'),
(46, 'sellerapp', '0003_rename_product_wishlist_productmodel_product_wishlist_action', '2022-10-27 05:48:51.222590'),
(47, 'customerapp', '0026_remove_feedbackmodel_prodwise_rating', '2022-12-20 10:18:18.582146'),
(48, 'customerapp', '0027_feedbackmodel_feedback_block_and_more', '2022-12-20 10:34:37.898611'),
(49, 'customerapp', '0028_ordermodels_order_seller_status', '2022-12-24 12:00:30.036326'),
(50, 'customerapp', '0029_ordermodels_ofeedback_block_and_more', '2022-12-26 09:14:14.484485'),
(51, 'customerapp', '0030_ordermodels_qr_photo', '2022-12-26 09:16:50.641084');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('uhs4bp4n6xl30bshoqrez4zxs7xef5uu', 'eyJzZWxsZXJfaWQiOjEsImN1c3RvbWVyX2lkIjo1fQ:1olZPQ:lLwcLiTlNUloe1Wsn0COx8qLbqMMddEOk6PkKncMc80', '2022-11-03 17:32:44.267117'),
('rar75s8tur5hlc6stbc8ucqu0fhnkgar', 'eyJzZWxsZXJfaWQiOjEsImN1c3RvbWVyX2lkIjoyfQ:1omeyX:DFqhRGOhS23ooN58fCw8Otcwkyq3_3oypGjl5A2_o-E', '2022-11-06 17:41:29.831735'),
('2n2uayhs5shpvnbawq8hkpa1sp4vjy36', 'eyJjdXN0b21lcl9pZCI6NH0:1omtJs:yC6InKl5uchj6ggCFn9JTWXnPvCX_VpPUIww1F-Rk0E', '2022-11-07 09:00:28.026778'),
('4nrowjcbn6mwahxv1aysnt0e95q5ncpc', 'eyJjdXN0b21lcl9pZCI6NSwic2VsbGVyX2lkIjoxfQ:1onzZG:0ly4OqT3A4P4xvfkQmxlkvEpLmuYmzCIau8yZlD7dHk', '2022-11-10 09:52:54.823789'),
('jtlmjodwt6iktvavfclewfslaf5vp5b0', 'eyJzZWxsZXJfaWQiOjYsImN1c3RvbWVyX2lkIjoxNX0:1p7ufu:D627CRwlD6QbLxJJcOshf-hu9kvgRBwEQGt4FWnYvSY', '2023-01-04 08:42:06.557491'),
('9znyc4ifo844yhr0cmuh3d3knr02qno1', 'eyJzZWxsZXJfaWQiOjEsImN1c3RvbWVyX2lkIjoxNX0:1p7swM:lx08el47w8TZx22LXT0Hzk6Q5AyKs8Ess6RDFaHCrYI', '2023-01-04 06:50:58.155758'),
('hjt9kw16ndxk4n95pcilc8ohe1k7079q', 'eyJjdXN0b21lcl9pZCI6MTUsInNlbGxlcl9pZCI6MX0:1p92eS:bzI9h3rkOkVTma5pNo9Wl9ZsTwkwxj17V5NqmCGxNkc', '2023-01-07 11:25:16.491823'),
('vq4pzrobhrqr3psywp5hewqt4nvjeete', 'eyJzZWxsZXJfaWQiOjEsImN1c3RvbWVyX2lkIjoxNX0:1p9hgC:jXNjX5K1wd4yKYJS5jf0L5CC9caafq7W-DcEOeH0x60', '2023-01-09 07:13:48.946737');

-- --------------------------------------------------------

--
-- Table structure for table `mycart_details`
--

DROP TABLE IF EXISTS `mycart_details`;
CREATE TABLE IF NOT EXISTS `mycart_details` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_product_quantity` int(11) DEFAULT NULL,
  `cart_product_price` int(11) DEFAULT NULL,
  `cart_owner_id` int(11) DEFAULT NULL,
  `cart_product_id` int(11) DEFAULT NULL,
  `cart_seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `mycart_details_cart_owner_id_6cc5bb15` (`cart_owner_id`),
  KEY `mycart_details_cart_product_id_5f012321` (`cart_product_id`),
  KEY `mycart_details_cart_seller_id_25fae03b` (`cart_seller_id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mycart_details`
--

INSERT INTO `mycart_details` (`cart_id`, `cart_product_quantity`, `cart_product_price`, `cart_owner_id`, `cart_product_id`, `cart_seller_id`) VALUES
(90, 1, 2200, 3, 5, NULL),
(89, 1, 899, 3, 4, NULL),
(54, 1, 299, 2, 1, NULL),
(73, 1, 349, 7, 18, NULL),
(44, 1, 899, 8, 4, NULL),
(107, 1, 2200, 1, 5, NULL),
(106, 1, 299, 1, 1, NULL),
(108, 1, 2199, 1, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products_feedbacks`
--

DROP TABLE IF EXISTS `ordered_products_feedbacks`;
CREATE TABLE IF NOT EXISTS `ordered_products_feedbacks` (
  `order_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderproduct_review` varchar(1000) NOT NULL,
  `order_rating` varchar(100) DEFAULT NULL,
  `order_expression` varchar(100) DEFAULT NULL,
  `osentiment` varchar(100) DEFAULT NULL,
  `customer_comments_id` int(11) DEFAULT NULL,
  `order_produt_comments_id` int(11) DEFAULT NULL,
  `product_comments_id` int(11) DEFAULT NULL,
  `seller_comments_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_review_id`),
  KEY `customerapp_orderreviewmodels_customer_comments_id_2949f52a` (`customer_comments_id`),
  KEY `customerapp_orderreviewmodels_order_produt_comments_id_ecd59da4` (`order_produt_comments_id`),
  KEY `customerapp_orderreviewmodels_product_comments_id_cea621d6` (`product_comments_id`),
  KEY `customerapp_orderreviewmodels_seller_comments_id_fc0964f6` (`seller_comments_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordered_products_feedbacks`
--

INSERT INTO `ordered_products_feedbacks` (`order_review_id`, `orderproduct_review`, `order_rating`, `order_expression`, `osentiment`, `customer_comments_id`, `order_produt_comments_id`, `product_comments_id`, `seller_comments_id`) VALUES
(50, 'The Product quality and service both are good.', NULL, NULL, 'Very Positive', 5, NULL, 18, 1),
(49, 'Undoubtedly the best product in this price range.\r\nDefinitely a great buy.\r\nBuilt quality is nice and study. The product design gives a premium look and the product service is also awesome.', NULL, NULL, 'Very Positive', 7, NULL, 18, 1),
(47, 'Good Look and the product quality also nice but the display lighting was some what poor.', NULL, NULL, 'Positive', 10, NULL, 14, 5),
(46, 'ok', NULL, NULL, 'Very Positive', 10, NULL, 15, 5),
(45, 'Average Quality and the product camera was not so good. Not Satisfied with the Quality.', NULL, NULL, 'Positive', 10, NULL, 8, 1),
(44, 'Good phone for the price\r\nDisplay is average\r\nCamera is good back\r\nFront average\r\nBattery ok\r\nBack plastic frame average feel\r\nPerformance is good for the price\r\nOnly buy this as a daily driver and don\'t expect heavy gaming overall a good phone for good price. final verdict: good phone for its price', NULL, NULL, 'Positive', 10, NULL, 9, 4),
(58, 'nice', NULL, NULL, 'Very Positive', 1, 72, 3, 1),
(59, 'lllllllllllllllllll', NULL, NULL, 'Neutral', 1, 73, 5, 1),
(60, 'nicee', NULL, NULL, 'Neutral', 1, 74, 3, 1),
(61, 'so bad', NULL, NULL, 'Very Negative', 1, 75, 1, 1),
(62, 'pokkkkkk', NULL, NULL, 'Neutral', 1, 76, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_price` int(11) DEFAULT NULL,
  `order_product_quantity` int(11) DEFAULT NULL,
  `order_product_amount` int(11) DEFAULT NULL,
  `order_date` datetime(6) NOT NULL,
  `order_status` varchar(300) NOT NULL,
  `order_address` varchar(300) DEFAULT NULL,
  `order_customer_id` int(11) NOT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `order_product_seller_id` int(11) DEFAULT NULL,
  `order_seller_status` varchar(300) NOT NULL,
  `ofeedback_block` varchar(200) DEFAULT NULL,
  `osentiment_block` varchar(200) DEFAULT NULL,
  `ouser_block` varchar(200) DEFAULT NULL,
  `qr_photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_details_order_customer_id_9993905f` (`order_customer_id`),
  KEY `order_details_order_product_id_fd0274ff` (`order_product_id`),
  KEY `order_details_order_product_seller_id_5780ff45` (`order_product_seller_id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `order_product_price`, `order_product_quantity`, `order_product_amount`, `order_date`, `order_status`, `order_address`, `order_customer_id`, `order_product_id`, `order_product_seller_id`, `order_seller_status`, `ofeedback_block`, `osentiment_block`, `ouser_block`, `qr_photo`) VALUES
(80, 249, 1, 249, '2022-12-24 12:30:26.746242', 'order placed', '(\'Mansoorabad Road, Plot no 211, Mansoorabad, LB Nagar\',)', 3, 3, 1, 'order rejected', NULL, NULL, NULL, NULL),
(81, 249, 1, 249, '2022-12-24 13:11:09.836722', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 3, 1, 'order accepted', NULL, NULL, NULL, NULL),
(85, 16999, 1, 16999, '2022-12-24 12:37:58.368590', 'order placed', '(\'Sri Kala Road, Plot No 322, BanjaraHills Nagar\',)', 5, 8, 1, 'order rejected', NULL, NULL, NULL, NULL),
(83, 399, 1, 399, '2022-10-27 09:10:11.409950', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 11, 4, 'placed', NULL, NULL, NULL, NULL),
(84, 399, 1, 399, '2022-10-27 09:10:11.418951', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 10, 4, 'placed', NULL, NULL, NULL, NULL),
(86, 399, 1, 399, '2022-10-27 10:02:45.567589', 'order placed', '(\'Sri Kala Road, Plot No 322, BanjaraHills Nagar\',)', 5, 10, 4, 'placed', NULL, NULL, NULL, NULL),
(87, 249, 1, 249, '2022-12-24 13:11:12.374766', 'order placed', '(\'Sri Kala Road, Plot No 322, BanjaraHills Nagar\',)', 5, 3, 1, 'order accepted', NULL, NULL, NULL, NULL),
(88, 249, 1, 249, '2022-10-27 10:02:45.585574', 'order placed', '(\'Sri Kala Road, Plot No 322, BanjaraHills Nagar\',)', 5, 3, 1, 'placed', NULL, NULL, NULL, NULL),
(76, 349, 1, 349, '2022-10-26 11:51:18.936727', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 18, 1, 'placed', NULL, NULL, NULL, NULL),
(74, 249, 1, 249, '2022-10-26 11:14:29.892653', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 3, 1, 'placed', NULL, NULL, NULL, NULL),
(75, 299, 1, 299, '2022-10-26 11:16:36.711570', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 1, 1, 'placed', NULL, NULL, NULL, NULL),
(78, 2199, 1, 2199, '2022-12-24 12:38:17.581578', 'order placed', '(\'Mansoorabad Road, Plot no 211, Mansoorabad, LB Nagar\',)', 3, 19, 1, 'order accepted', NULL, NULL, NULL, NULL),
(79, 399, 1, 399, '2022-10-26 17:04:44.991967', 'order placed', '(\'Mansoorabad Road, Plot no 211, Mansoorabad, LB Nagar\',)', 3, 10, 4, 'placed', NULL, NULL, NULL, NULL),
(68, 349, 1, 349, '2022-10-26 09:55:32.759698', 'order placed', '(\'Sri Kala Road, Plot No 322, BanjaraHills Nagar\',)', 5, 18, 1, 'placed', NULL, NULL, NULL, NULL),
(67, 349, 1, 349, '2022-10-26 09:48:56.830994', 'order placed', '(\'Maruthi Nilayam, Brahmakumari Samajam, Uppal Road\',)', 7, 18, 1, 'placed', NULL, NULL, NULL, NULL),
(65, 2200, 1, 2200, '2022-12-24 12:38:25.144122', 'order placed', '(\'H: No 8-9-998/3, Dhanaya Colony\',)', 11, 5, 1, 'order accepted', NULL, NULL, NULL, NULL),
(64, 2999, 1, 2999, '2022-10-26 09:20:34.595975', 'order placed', '(\'YSR Colony, Manjira Road,\',)', 10, 14, 5, 'placed', NULL, NULL, NULL, NULL),
(63, 1800, 1, 1800, '2022-10-26 08:58:32.154314', 'order placed', '(\'YSR Colony, Manjira Road,\',)', 10, 15, 5, 'placed', NULL, NULL, NULL, NULL),
(62, 16999, 1, 16999, '2022-10-26 08:52:38.324319', 'order placed', '(\'YSR Colony, Manjira Road,\',)', 10, 8, 1, 'placed', NULL, NULL, NULL, NULL),
(61, 32799, 1, 32799, '2022-10-26 08:36:51.470474', 'order placed', '(\'YSR Colony, Manjira Road,\',)', 10, 9, 4, 'placed', NULL, NULL, NULL, NULL),
(89, 2200, 1, 2200, '2022-12-19 07:44:04.031644', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 5, NULL, 'placed', NULL, NULL, NULL, NULL),
(90, 399, 1, 399, '2022-12-19 07:44:04.033738', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 10, NULL, 'placed', NULL, NULL, NULL, NULL),
(91, 299, 1, 299, '2022-12-19 09:44:03.714193', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 1, NULL, 'placed', NULL, NULL, NULL, NULL),
(92, 2200, 1, 2200, '2022-12-19 09:44:03.716201', 'order placed', '(\'golnaka road, plot no 25, nithesh nagar\',)', 1, 5, NULL, 'placed', NULL, NULL, NULL, NULL),
(93, 24, 1, 24, '2022-12-19 10:26:01.262393', 'order placed', '(\'tarnaka\',)', 15, 3, 5, 'placed', NULL, NULL, NULL, NULL),
(94, 67996, 4, 67996, '2022-12-20 05:33:43.163286', 'order placed', '(\'tarnaka\',)', 15, 8, NULL, 'placed', NULL, NULL, NULL, NULL),
(95, 299, 1, 299, '2022-12-20 05:33:43.166231', 'order placed', '(\'tarnaka\',)', 15, 1, NULL, 'placed', NULL, NULL, NULL, NULL),
(96, 24, 1, 24, '2022-12-20 05:33:43.169228', 'order placed', '(\'tarnaka\',)', 15, 3, NULL, 'placed', NULL, NULL, NULL, NULL),
(97, 299, 1, 299, '2022-12-20 05:36:03.463179', 'order placed', '(\'tarnaka\',)', 15, 1, NULL, 'placed', NULL, NULL, NULL, NULL),
(98, 32799, 1, 32799, '2022-12-20 05:45:26.029512', 'order placed', '(\'tarnaka\',)', 15, 9, NULL, 'placed', NULL, NULL, NULL, NULL),
(99, 24, 1, 24, '2022-12-20 05:48:46.435901', 'order placed', '(\'tarnaka\',)', 15, 3, NULL, 'placed', NULL, NULL, NULL, NULL),
(100, 16999, 1, 16999, '2022-12-21 08:40:51.785871', 'order placed', '(\'tarnaka\',)', 15, 8, NULL, 'placed', NULL, NULL, NULL, NULL),
(101, 299, 1, 299, '2022-12-21 08:40:51.793871', 'order placed', '(\'tarnaka\',)', 15, 1, NULL, 'placed', NULL, NULL, NULL, NULL),
(102, 200, 1, 200, '2022-12-24 11:43:51.302117', 'order placed', '(\'tarnaka\',)', 15, 21, NULL, 'placed', NULL, NULL, NULL, NULL),
(103, 24, 1, 24, '2022-12-24 11:43:51.302117', 'order placed', '(\'tarnaka\',)', 15, 3, NULL, 'placed', NULL, NULL, NULL, NULL),
(104, 2199, 1, 2199, '2022-12-24 12:42:39.820289', 'order placed', '(\'tarnaka\',)', 15, 19, NULL, 'placed', NULL, NULL, NULL, NULL),
(105, 2199, 1, 2199, '2022-12-24 12:51:22.478799', 'order placed', '(\'tarnaka\',)', 15, 19, NULL, 'placed', NULL, NULL, NULL, NULL),
(106, 4800, 1, 4800, '2022-12-24 12:52:23.612322', 'order placed', '(\'tarnaka\',)', 15, 16, NULL, 'placed', NULL, NULL, NULL, NULL),
(108, 85, 1, 85, '2022-12-24 13:01:31.517336', 'order placed', '(\'tarnaka\',)', 15, 22, NULL, 'placed', NULL, NULL, NULL, NULL),
(111, 85, 1, 85, '2022-12-26 10:31:47.081391', 'order placed', '(\'tarnaka\',)', 15, 22, NULL, 'order accepted', '350b3e4433c05efaca5166711e5448a9af742ef880e5a32f79278d2736bb31c6', 'b2a8dd89c731c9ad493505660896d295c0beb75204dd3af7667c43b3d0e69dc2', 'bf6f40564ac9e91db3fb3a253657d1c8132cc382ce54a4189f7779013da57ad5', 'images/image111_R5fZSxp.png'),
(112, 349, 2, 349, '2022-12-26 10:40:17.606871', 'order placed', '(\'tarnaka\',)', 15, 18, NULL, 'order accepted', '337ed493d47486d38378acd41f02f6f079f45c7196309b9fef03019ecba6796d', '42cca98f1a8d7670eaae1eece3f77a13e6aeea7044ecbbf767314cf013c61329', 'ba2f32e41ae82e4615d916f4b7a05f30544aac226045e200a432ac2b4845c70a', 'images/image4186.png'),
(113, 349, 1, 349, '2022-12-26 11:04:27.694848', 'order placed', '(\'tarnaka\',)', 15, 18, NULL, 'order accepted', '2668be6fcf5306cd25fd5a878dd0448a4d215e1eba18e6873d32cbeab4729898', 'a213d3872f970d8a9076e94a938b52434ba3eac82c337f064b138d878e4960d8', '6f72f4121629211e2d838671840ae6f116a6f2329553c1241b6dcf2cd8d5dc01', 'images/image113.png'),
(114, 85, 8, 85, '2022-12-26 11:04:24.449040', 'order placed', '(\'tarnaka\',)', 15, 22, NULL, 'order accepted', '607eea976d1253a5ac64fa0511e34f5b0e22aa30befbe14bcf2b63300831af0c', '617fe89be64c2684c03667af3fa3515b846347f2b9ed4fead0664ae9a736ae64', '836fae752af9e357dc917ea738b54356fc5078a22b2bd2148209d0e3df262f17', 'images/image281.png'),
(115, 2199, 1, 2199, '2022-12-26 12:34:17.494019', 'order placed', '(\'tarnaka\',)', 15, 19, NULL, 'order accepted', '9ee385f64b02d2a668f411923f0e78fb8106d2fd6ad359737ec7ad6d95b1b3e2', '3af61403f1bb24847582743a8a5e25976aa32704802ded62f7cc390d76e53ce2', '33a81698861496a4820093cf4259d5047c259a1926c65ec6f584661fb0c2a88f', 'images/image115_4aOTRTV.png'),
(116, 85, 10, 85, '2022-12-26 12:35:32.264529', 'order placed', '(\'tarnaka\',)', 15, 22, NULL, 'order accepted', 'b2159c4f52673b3e7df634874788319fdfd01ee26e0027517b9c8ec7800068ac', '08a019c93135d7b133d20ac6f895e3c9418f6b3c29a1d3cfc2944e0a9feaf119', '26e737bcfc3647b84903c02cb35a0695008d39c399bf49684a2fd71b1c16789a', 'images/image9888.png'),
(117, 4800, 1, 4800, '2022-12-26 12:26:58.550574', 'order placed', '(\'tarnaka\',)', 15, 16, NULL, 'placed', 'd4f65adb07906378035b37509bd76cbea7e398cf695dd7794de305b648d1ff0c', 'ea1d3fe2481883bcd9f2101d8f8709e5b5c393c1ba20abb4914808e68add1650', '85b65e46dcd3057032f3145c476fbb6a9e7d2f83836027cb0cac0d045c3309d2', '');

-- --------------------------------------------------------

--
-- Table structure for table `proceed_to_final_order`
--

DROP TABLE IF EXISTS `proceed_to_final_order`;
CREATE TABLE IF NOT EXISTS `proceed_to_final_order` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_product_photo` varchar(300) DEFAULT NULL,
  `payment_product_name` varchar(300) DEFAULT NULL,
  `payment_product_quantity` varchar(300) DEFAULT NULL,
  `payment_product_price` varchar(300) DEFAULT NULL,
  `cust_id_id` int(11) DEFAULT NULL,
  `prod_id_id` int(11) DEFAULT NULL,
  `sell_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `proceed_to_final_order_cust_id_id_48b0b56e` (`cust_id_id`),
  KEY `proceed_to_final_order_prod_id_id_ba388ce6` (`prod_id_id`),
  KEY `proceed_to_final_order_sell_id_id_039d7f8e` (`sell_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products_details`
--

DROP TABLE IF EXISTS `products_details`;
CREATE TABLE IF NOT EXISTS `products_details` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `product_model` varchar(200) NOT NULL,
  `product_brand` varchar(200) NOT NULL,
  `product_category` varchar(200) NOT NULL,
  `product_original_price` int(11) DEFAULT NULL,
  `product_discount_price` int(11) DEFAULT NULL,
  `product_discount_percentage` varchar(50) DEFAULT NULL,
  `product_photo1` varchar(100) DEFAULT NULL,
  `product_photo2` varchar(100) DEFAULT NULL,
  `product_photo3` varchar(100) DEFAULT NULL,
  `product_photo4` varchar(100) DEFAULT NULL,
  `product_photo5` varchar(100) DEFAULT NULL,
  `product_review` longtext,
  `product_about` varchar(5000) DEFAULT NULL,
  `product_creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `products_details_product_creator_id_47889052` (`product_creator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_details`
--

INSERT INTO `products_details` (`product_id`, `product_name`, `product_model`, `product_brand`, `product_category`, `product_original_price`, `product_discount_price`, `product_discount_percentage`, `product_photo1`, `product_photo2`, `product_photo3`, `product_photo4`, `product_photo5`, `product_review`, `product_about`, `product_creator_id`) VALUES
(1, 'LOXXO® Clear Designed for iPhone 14', 'iPhone 14', 'APPLE', 'PHONE COVER', 899, 299, '-67', 'images/phonecoverA1.jpg', 'images/phonecoverA2.jpg', 'images/phonecoverA3.jpg', 'images/phonecoverA4.jpg', 'images/phonecoverA5.jpg', NULL, '[Crystal Clear]Using high-grade TPU and PC materials,Anti- Scratch& Anti-yellow layer ensuring you can always enjoy your new Phone’s stunning look without barrier.Compatible with iphone 13 case.\r\n[Made to Fit]it fits perfectly around your phone, leaving space for buttons and protects against dust. Maximum keep it away from scratches and minor drops.it\'s allows your new phone sleek design to speak for itself.Compatible with clear iphone 13 case\r\n[Excellent Grip] Compatible with iphone 13 clear case minimalist design adds no bulk for daily grip, easy to hold and pocket friendly.100% support wireless share.\r\n[Stronger Protection] 1.0mm lips lift screen and camera designed to raise just enough to protect the parts of your phone that matter most.adopt 4 corners upgrade the shockproof, provides the biggest protection for daily wear and tear.', 1),
(3, 'Newlike Samsung Galaxy Z Flip 4 5G Case Premium', 'Samsung Galaxy Z Flip 4 5G', 'SAMSUNG', 'PHONE COVER', 599, 24, '-96', 'images/Screenshot_2.png', 'images/Screenshot_3.png', 'images/Screenshot_7.png', 'images/Screenshot_5.png', 'images/Screenshot_1.png', NULL, '[Compatibles Phone ]: Special design for Samsung Galaxy Z Flip 4 5G 2021, not compatible with other smartphone.\r\n[Material & Protnst any scratch, bump, finger marks, and dirt while shows off your the original beauty of your Samsung Galaxy Z Fold 4.\r\n[Precise Cut-outs]: The precise cutouts give you full access to charging port and function keys, fit for your mobile phone. easy access to ports and buttons.\r\n[Design Inspiration]: The luxurious Samsung Galaxy Z fold 4 smartphone must be equipped with an excellent protector. This phone uses high-end materials and superb craftsmanship to give the phone a safe protection and give you Excellent hand feeling', 1),
(4, 'Spigen Thin Fit Ring Back Cover Case for Samsung Galaxy Z Flip 4', 'Samsung Galaxy Z Flip 4', 'SAMSUNG', 'PHONE COVER', 1750, 899, '-49', 'images/S11.webp', 'images/S12.jpg', 'images/S13.jpg', 'images/S14.jpg', 'images/S15.jpg', NULL, 'Licensed Product : Licensed under Samsung Mobile Accessory Partnership Program\r\nComponents : Clear Case + Ring + Strap + PC palette + Sticker\r\nCustomize your style : Clear PC pallette can be customized with graphic plates or stickers\r\nCompatibility : Spigen Genuine Case Compatible with Samsung Galaxy Z Flip 4', 1),
(5, 'SUANPOT for LG Wing 5G with RFID Blocking Leather Wallet case', 'LG Wing 5G', 'LG', 'PHONE COVER', 3100, 2200, '-29', 'images/S21.webp', 'images/S22.jpg', 'images/S23.jpg', 'images/S24.jpg', 'images/S25.jpg', NULL, '[The wallet case only designed for LG Wing 5G]---If you need another model leather wallet case, click on the one next to the title [Visit the SUANPOT Store]\r\n[Credit card anti-theft swipe function]---This leather wallet case for LG Wing is designed to protect your cards information from stealing with blocking material of RFID shielding technology,Most Credit Cards, Debit Cards, ID Cards are set-in the RFID chip, the RFID reader can easily read the cards information within 10 feet(about 3m) without touching them.\r\n[Ten Colors To Choose And Real Shoot]---All images of LG Wing leather wallet cases are in-kind real shoot ,Please rest assured that information to buy!\r\n[ Selected PU Leather ]---- This wallet cases for LG Wing made from selected PU leather for quality, Shockproof,strength and durability.', 1),
(19, 'JBL T460BT by Harman, Wireless On Ear Headphones', 'JBL T460BT by Harman', 'VIVO', 'EAR PHONES', 3690, 2199, '-40', 'images/jbl1.jpg', 'images/jbl2.jpg', 'images/jbl3.jpg', 'images/jbl4.jpg', 'images/jbl5.jpg', NULL, 'Superior listening experience with JBL Pure Bass sound. Inline Remote :Yes\r\nWireless Bluetooth Streaming\r\n11 hours of playtime under optimum audio settings\r\nCall and music controls on earcup\r\nFlat-foldable, lightweight and comfortable', 1),
(8, 'iQOO Z6 Lite 5G (Stellar Green, 6GB RAM, 128GB Storage', 'Samsung Galaxy M13', 'SAMSUNG', 'MOBILE', 18999, 16999, '-11', 'images/p11.jpg', 'images/p12.jpg', 'images/p13.jpg', 'images/p14.jpg', 'images/p15.jpg', NULL, 'World\'s First Snapdragon 4 Gen 1 Processor, that allows you to level up your performance with confidence through its efficient 6nm Process.\r\nBest In-Segment 120Hz Screen Refresh Rate: Which comes with lagfree & nimble scrolling. The FHD+ display lets you enjoy to the fullest with every game you play and every content you watch with its crisp detailing of colours.\r\n5000mAh Battery: Keeps iQOO Z6 Lite 5G to a longer usage, for a more enjoyable gaming and video experience, which offers Music Playback Time of 127 Hours, Social Media of 21.6 hours, OTT Streaming of 14.5 hours and Gaming of 8.3 hours.', 1),
(9, 'OnePlus Nord 2T 5G (Jade Fog, 12GB RAM, 256GB Storage', 'Oppo OnePlus Nord 2T 5G ', 'OPPO', 'MOBILE', 37889, 32799, '-13', 'images/g1.jpg', 'images/g2.jpg', 'images/g3.jpg', 'images/g4.jpg', 'images/g5.jpg', NULL, 'Camera: 50MP Main Camera with Sony IMX766 and OIS, 8MP Ultrawide Camera with 120 degree FOV and 2MP mono lens with Dual LED Flash; 32MP Front (Selfie) Camera with Sony IMX615\r\nCamera Features: AI Scene Enhancement, AI Highlight Video, Slow-motion captures, Dual-view Video, HDR, Nightscape, Portrait mode, Pano, Retouching and exciting filters\r\nDisplay: 6.43 Inches; 90 Hz AMOLED Display with Corning Gorilla Glass 5; Resolution: 2400 X 1080 pixels; HDR 10+ Certified\r\nDisplay Features: Ambient Display, AI colour enhancement and Dark mode\r\nOperating System: OxygenOS based on Android 12', 4),
(10, 'AmazonBasics Micro USB Charging Cable', ' Micro USB', 'SAMSUNG', 'USB CABLE', 999, 399, '-60', 'images/k1.jpg', 'images/k2.jpg', 'images/k3.jpg', 'images/k4.jpg', 'images/k5.jpg', NULL, 'Micro usb charging cable for android phones\r\nSupports up to 480 mbps data transmission speed\r\nIdeal for charging android phones and tablets or connecting pc peripherals such as hard drives, printers, and more\r\nGold-plated connectors resist corrosion for signal purity\r\nSmaller connector designed to fit smaller spaces\r\nCompact connector head works with nearly all cases', 4),
(11, 'Tukzer Micro USB Cable for Android Devices, 2.4 Amp Charge', 'Micro USB Cable', 'OPPO', 'USB CABLE', 800, 399, '-50', 'images/k11.jpg', 'images/k12.jpg', 'images/k13.jpg', 'images/k14.jpg', 'images/k15.jpg', NULL, 'Faster Charging & Sync: Thick gauge wiring and reduced cable resistance provides the fastest speed possible to charge via any USB charger up to 2.4 Amp. Transfers data up to 480 Mbits through wide diameter 28/21 AWG data and power wires.\r\nGold-plated connectors resist corrosion for signal purity; smaller connector designed to fit smaller spaces. USB-IF compliant chip compatible with Android Phones, Tabs, PC and more. Compact connector head works with nearly all cases.\r\n2X Longer: 6.5FT length is optimized for using with hard to reach USB ports and out-of-sight wall chargers. You can use them in office, car, home, and hotel or anywhere you require cables.\r\nUniversal Compatibility - Android smartphones and tablets, e-readers, cameras, MP3 players, hard drives, portable chargers, handheld game consoles and all other Micro USB devices from brands including Samsung, HTC, Motorola, Nexus, Nokia, LG, HP, Sony, Blackberry and many more. and other Micro-USB.', 4),
(18, 'boAt Bassheads 100 in Ear Wired Earphones with Mic(Taffy Pink)', 'boAt Bassheads ', 'ONE PLUS', 'EAR PHONES', 700, 349, '-50', 'images/z1.jpg', 'images/z2.jpg', 'images/z3.jpg', 'images/z4.jpg', 'images/z5.jpg', NULL, 'The perfect way to add some style and stand out from the crowd with the boAt BassHeads 100 \"Hawk\" inspired earphones\r\nThe stylish BassHeads 100 superior coated wired earphones are a definite fashion statement - wear your attitude with its wide variety of collection', 1),
(12, 'X88 Pro® Fast Charging LED Adapter Compatible with Fast Charger', 'Vivo V5 Charger', 'VIVO', 'ADAPTER', 799, 500, '-37', 'images/k21_iK8zCLi.jpg', 'images/k22_pX3IAJ4.jpg', 'images/k23_Gnzvsmm.jpg', 'images/k24_3ERuNRo.jpg', 'images/k25_N1cF5gf.jpg', NULL, 'Safe and Durable - 24 awg wire, built-in identification resistor(56 resistor for safety) and premium PVC coated make it dependable and sturdy enough for everyday use, save your money', 4),
(13, 'Noise Pulse Go Buzz Smart Watch', 'Noise Pulse Go', 'APPLE', 'WATCHES', 7999, 3999, '-50', 'images/w11.jpg', 'images/w12.jpg', 'images/w13.jpg', 'images/w14.jpg', 'images/w15.jpg', NULL, 'Get a 1-year assured warranty from NOISE', 5),
(14, 'Amazfit GTS2 Mini (New Version) Smart Watch', 'Vivo GTS2 Mini ', 'VIVO', 'WATCHES', 4999, 2999, '-40', 'images/w21.jpg', 'images/w22.jpg', 'images/w23.jpg', 'images/w24.jpg', 'images/w25.jpg', NULL, '1.55 Always-on AMOLED Display with high 314 PPI Resolution for a crystal clear image and sharp details.;Super-Light weight body with only 19.5 grams, 8.95 MM Thin body, comfortable to wear day & night and during sports activities.\r\nMonitoring your blood oxygen levels by intelligently monitoring your (SpO2) blood oxygen levels. Basic Usage Battery Life: 21 days;68 built-in sports modes, 5 ATM water-resistance and Alexa Built-in.', 5),
(15, 'WeCool Moonwalk Mini Earbuds with Magnetic Charging Case', 'Sony 15 max', 'SONY', 'EAR PHONES', 3799, 1800, '-53', 'images/wecool1_JIfAIwB.jpg', 'images/wecool2_baFHtQe.jpg', 'images/wecool3_nnqjZKP.jpg', 'images/wecool4_PBiGUaa.jpg', 'images/wecool5_CRggBXd.jpg', NULL, 'WIRELESS EARPHONES WITH MAGNETIC CHARGING CASE : These Earpods are powered with a charging case that can recharge the Earbuds up to 6 times\r\nLatest Bluetooth Wireless Earphones with BT v 5.2 that provides Stable and Secured Connection for uninterrupted Music Experience\r\nBluetooth earbuds with AI-Powered Environmental Noise Cancellation (ENC) for Noise-free and Handsfree Calling Experience', 5),
(16, 'boAt Rockerz 550 Bluetooth', 'boAt Rockerz 550 ', 'OPPO', 'EAR PHONES', 6988, 4800, '-31', 'images/h1_UgSE5od.webp', 'images/h2_FcGntCi.jpg', 'images/h3_TXVkV4C.jpg', 'images/h4_7cuiH6I.jpg', 'images/h5_H2jb9QU.jpg', NULL, 'Tap into instant wireless connectivity with the latest Bluetooth V5.0. Yes, Rockerz 550 on-ear headphones have IPX5 dust and water resistance making it perfect for sports and adventures.\r\nIts 50mm dynamic drivers help pump out immersive audio all day long\r\nThe mighty 500mAh battery capacity offers a superior playback time of up to 20 Hours\r\nIt has been ergonomically designed and structured as an over-ear headphone to provide the best user experience', 5),
(20, 'testing', 'test', 'MICROMAX', 'CHARGER', 599, 20, '-97', 'images/Screenshot_1_Uk1FlNr.png', 'images/Screenshot_3_xTbbLmq.png', 'images/Screenshot_3_Bxl8yIS.png', 'images/Screenshot_4.png', 'images/Screenshot_4_4MzQffo.png', NULL, 'lorem', 6),
(21, 'product no:1', 'product', 'VIVO', 'ADAPTER', 9999, 200, '-98', 'images/Screenshot_1_yxhU81f.png', 'images/Screenshot_8.png', 'images/Screenshot_7_frmvR6q.png', 'images/Screenshot_4_FVKFQFo.png', 'images/Screenshot_2_Z7e8VVq.png', NULL, 'adkfbakdbfakdf', 1),
(22, 'aravind', 'product', 'ONE PLUS', 'PHONE COVER', 999, 85, '-91', 'images/android-icon-192x192.png', 'images/android-icon-96x96.png', 'images/android-icon-72x72.png', 'images/apple-icon-72x72.png', 'images/ms-icon-310x310.png', NULL, 'logo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_details_product_wishlist_action`
--

DROP TABLE IF EXISTS `products_details_product_wishlist_action`;
CREATE TABLE IF NOT EXISTS `products_details_product_wishlist_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productmodel_id` int(11) NOT NULL,
  `customermodel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_details_product_productmodel_id_customer_00432de4_uniq` (`productmodel_id`,`customermodel_id`),
  KEY `products_details_product_wishlist_productmodel_id_4557df53` (`productmodel_id`),
  KEY `products_details_product_wishlist_customermodel_id_18069959` (`customermodel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_details_product_wishlist_action`
--

INSERT INTO `products_details_product_wishlist_action` (`id`, `productmodel_id`, `customermodel_id`) VALUES
(16, 3, 3),
(4, 1, 8),
(5, 2, 8),
(6, 3, 2),
(8, 2, 1),
(23, 14, 5),
(17, 11, 3),
(15, 4, 3),
(27, 3, 1),
(19, 11, 1),
(21, 4, 5),
(30, 19, 1),
(28, 4, 1),
(36, 9, 15),
(37, 1, 15),
(38, 3, 15),
(45, 19, 15);

-- --------------------------------------------------------

--
-- Table structure for table `products_feedbacks`
--

DROP TABLE IF EXISTS `products_feedbacks`;
CREATE TABLE IF NOT EXISTS `products_feedbacks` (
  `productwise_feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `prodwise_expression` varchar(100) NOT NULL,
  `psentiment` varchar(100) DEFAULT NULL,
  `custwise_comments_id` int(11) DEFAULT NULL,
  `prodwise_comments_id` int(11) DEFAULT NULL,
  `sellwise_comments_id` int(11) DEFAULT NULL,
  `productwise_feedback` varchar(1000) DEFAULT NULL,
  `productreview_date` datetime(6) NOT NULL,
  `feedback_order_id_id` int(11) DEFAULT NULL,
  `after_order_placed_revire_id` int(11) DEFAULT NULL,
  `feedback_block` varchar(200) DEFAULT NULL,
  `sentiment_block` varchar(200) DEFAULT NULL,
  `user_block` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`productwise_feedback_id`),
  KEY `feedback_details_custwise_comments_id_de0d5cfa` (`custwise_comments_id`),
  KEY `feedback_details_prodwise_comments_id_bb6d2415` (`prodwise_comments_id`),
  KEY `feedback_details_sellwise_comments_id_9932fa87` (`sellwise_comments_id`),
  KEY `products_feedbacks_feedback_order_id_id_f5b569fc` (`feedback_order_id_id`),
  KEY `products_feedbacks_after_order_placed_revire_id_bf009d72` (`after_order_placed_revire_id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_feedbacks`
--

INSERT INTO `products_feedbacks` (`productwise_feedback_id`, `prodwise_expression`, `psentiment`, `custwise_comments_id`, `prodwise_comments_id`, `sellwise_comments_id`, `productwise_feedback`, `productreview_date`, `feedback_order_id_id`, `after_order_placed_revire_id`, `feedback_block`, `sentiment_block`, `user_block`) VALUES
(101, '', 'Very Positive', 15, 1, 1, 'excellent product', '2022-12-24 11:24:26.168299', NULL, NULL, '38429c26d2ad8ab57e7544f5e036cdd6aff66010e412753fa4cac2aada8f3f41', 'ad3d98c59be783f771a23b6fa0e1c33fea677553f40dfcc6bd7f8b1ac49e2872', '88a932f6aacb19b7d8df531d3285f42d40183b91ff9d26fb937f48a0b1adb0c2'),
(100, '', 'Positive', 15, 1, 1, 'very positive', '2022-12-24 11:23:54.400212', NULL, NULL, '279e8dbb284e890e44dd9d84f592c7b03257e0eb376b96ae45947052394b00dc', 'cd4f5a9a0445db57354b0c3b81afc18dc17be1e8cb31c9545067af5c4ef33bb8', 'dbc09617eed493fdd9806ae67ddde774a4f0fbc953bb3de0145034fd8da05bf9'),
(99, '', 'Very Negative', 15, 1, 1, 'worst product ever', '2022-12-24 11:20:00.359853', NULL, NULL, '42d230749cb64bc5faff88c674ae5cfb2befb17a63ac8f9f2846756c0d29ea32', '97a3f085ac56e482513dcce9c3b86c68a16abd64ca14b922270692a28222e850', '68a0fcb0384ba1f2ea2e80011ec4d432557a074ddad2b4b2fae8b96794fa34db'),
(96, '', 'Positive', 15, 1, 1, 'some what positiv', '2022-12-20 10:41:34.099287', NULL, NULL, 'b698415d1c34061c27cca6c3ddbd9e3b6a01f518d138e0eb26576561d4721032', '5488ac82469ba036880ea5713a366a651f989ef1511c118e5ed86cb2432e80e3', 'f30d39a48f6a4408b0b3b25f3e45bc4c8860f9731cad6df879535b8c25e766f6'),
(97, '', 'Negative', 15, 1, 1, 'negative', '2022-12-20 10:41:50.005671', NULL, NULL, '88b06d525f6558f7a1b9a69ba9b9282db98b9694bcc4a5da4324329d4daa92c1', '96b0ea113b318f175e76e0ffbab813921b789fe3fd4c59cdd43c9f0357d033b2', '040d2f3e02729340b829820b6fc2a3432f6e88ff5d853322f9b3bde7177e5c3a'),
(98, '', 'Neutral', 15, 1, 1, 'neutral\n', '2022-12-20 10:43:46.737894', NULL, NULL, '8f1adb4c4a206348dd2baa3f47d397f432539ff4b8a401cabc88bf9ef4dcdc78', '36d9c611f21a7ad7ae3fec9362ccac58a5abe7f25f389fc0d3120ac252773532', '0de176844f5702210404b4f4dd25ba856b4209ed7c7fd59917db14fcdfbfcfcb');

-- --------------------------------------------------------

--
-- Table structure for table `sellers_details`
--

DROP TABLE IF EXISTS `sellers_details`;
CREATE TABLE IF NOT EXISTS `sellers_details` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_fullname` varchar(100) NOT NULL,
  `seller_email` varchar(100) NOT NULL,
  `seller_password` varchar(200) NOT NULL,
  `seller_contact` varchar(10) NOT NULL,
  `seller_photo` varchar(100) DEFAULT NULL,
  `seller_aadhar_photo` varchar(100) DEFAULT NULL,
  `seller_gst_photo` varchar(100) DEFAULT NULL,
  `seller_status` varchar(10) NOT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sellers_details`
--

INSERT INTO `sellers_details` (`seller_id`, `seller_fullname`, `seller_email`, `seller_password`, `seller_contact`, `seller_photo`, `seller_aadhar_photo`, `seller_gst_photo`, `seller_status`) VALUES
(1, 'Aravind', 'aravind@gmail.com', '123456', '8880036991', 'sellerprofilephoto/men9.jpg', 'aadharphoto/aadhar-m1_DTEzShi.jpg', 'gstphoto/gst1_ax8IJ1n.jpg', 'accepted'),
(2, 'Swetha', 'swetha@gmail.com', '123456', '7300722121', 'sellerprofilephoto/woman10_QGJSlts.jpg', 'aadharphoto/aadhar-w1_O2pqRwC.jpg', 'gstphoto/gst1_zphcC8h.jpg', 'declined'),
(3, 'Yash', 'yash@gmail.com', '123456', '8989856565', 'sellerprofilephoto/men8.jpg', 'aadharphoto/aadhar-m2_leGQ8Te.webp', 'gstphoto/gst1_1I8q6lK.jpg', 'pending'),
(4, 'Krishna', 'krishna@gmail.com', '123456', '9608584444', 'sellerprofilephoto/men6.jpg', 'aadharphoto/aadhar-m1_w16uKPw.jpg', 'gstphoto/gst1_cmVlExt.jpg', 'accepted'),
(5, 'Dolly', 'dolly@gmail.com', '123456', '8800099898', 'sellerprofilephoto/woman12_MsunPV3.jpg', 'aadharphoto/aadhar-w3_XQz6FLP.jpg', 'gstphoto/gst1_DoYjGqB.jpg', 'accepted'),
(6, 'Malathi', 'malathi@mail.com', '123456', '9603422222', 'sellerprofilephoto/woman4.jpg', 'aadharphoto/aadhar-w3_gaoW9uD.jpg', 'gstphoto/gst1_6UST4WC.jpg', 'accepted'),
(7, 'Hema', 'hema@gmail.com', '123456', '9955574747', 'sellerprofilephoto/woman8.jpg', 'aadharphoto/aadhar-w3_D2TBYz5.jpg', 'gstphoto/gst1_aFQjefN.jpg', 'declined'),
(8, 'Swarnalatha', 'swarnalatha@gmail.com', '123456', '7871133322', 'sellerprofilephoto/woman3_yfefoDE.jpg', 'aadharphoto/aadhar-w1_1rDszCX.jpg', 'gstphoto/gst1_fYK7BZR.jpg', 'declined'),
(9, 'Tanya', 'tanya@gmail.com', '123456', '8347056544', 'sellerprofilephoto/women1.jpg', 'aadharphoto/aadhar-w2_jI3cM1e.jpg', 'gstphoto/gst1_53zQzgf.jpg', 'declined');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_details`
--

DROP TABLE IF EXISTS `wishlist_details`;
CREATE TABLE IF NOT EXISTS `wishlist_details` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_wishlist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `wishlist_details_product_wishlist_id_dcde411b` (`product_wishlist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
