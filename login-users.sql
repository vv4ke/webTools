# Host: localhost  (Version: 5.7.26)
# Date: 2022-01-12 10:00:34
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "auth_group"
#

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_group"
#


#
# Structure for table "auth_group_permissions"
#

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_group_permissions"
#


#
# Structure for table "auth_permission"
#

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

#
# Data for table "auth_permission"
#

INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 用户',7,'add_user'),(26,'Can change 用户',7,'change_user'),(27,'Can delete 用户',7,'delete_user'),(28,'Can view 用户',7,'view_user'),(29,'Can add captcha store',8,'add_captchastore'),(30,'Can change captcha store',8,'change_captchastore'),(31,'Can delete captcha store',8,'delete_captchastore'),(32,'Can view captcha store',8,'view_captchastore');

#
# Structure for table "auth_user"
#

CREATE TABLE `auth_user` (
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "auth_user"
#

INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$uHcWHBLt01W4$CpYHluCxpIHC3FcIXkXIN/yAI1llaZXsHfiEIqxm7rg=','2022-01-10 23:13:40.544114',1,'zjh','','','2577284412@qq.com',1,1,'2021-12-29 10:26:54.924622'),(2,'pbkdf2_sha256$320000$agf4TMfrO5DZkT6n4TIdr6$q4L0DkKt0HdARJq/uvGcHGCz/PAWx6Qy8OFR8+e3x+A=','2021-12-29 10:30:00.000000',0,'test01','test01','test01','test01@qq.com',0,1,'2021-12-29 10:29:00.000000');

#
# Structure for table "auth_user_groups"
#

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_groups"
#


#
# Structure for table "auth_user_user_permissions"
#

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_user_permissions"
#


#
# Structure for table "captcha_captchastore"
#

CREATE TABLE `captcha_captchastore` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

#
# Data for table "captcha_captchastore"
#

INSERT INTO `captcha_captchastore` VALUES (123,'ZFFH','zffh','5218099d0653c3fcfaab89564a29525b3bdaa456','2022-01-12 10:00:20.051410'),(124,'ULFN','ulfn','01cbb2656bb4ba06c2799acddf9dcd1e47bfd333','2022-01-12 10:01:25.101148'),(125,'QGIT','qgit','e00d053e96b6a088c1abeed8577940f529de2d92','2022-01-12 10:01:26.077059'),(126,'MSBQ','msbq','4e7e22fe7f996e95947d216c320ccf5c8b93cfb4','2022-01-12 10:01:26.344197'),(127,'RFXV','rfxv','52d4d9fd30e4e8fdaf7f61f726b03e2c8258c1e7','2022-01-12 10:01:26.560734');

#
# Structure for table "django_admin_log"
#

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "django_admin_log"
#

INSERT INTO `django_admin_log` VALUES (1,'2021-12-29 10:29:10.363253','2','test01',1,'[{\"added\": {}}]',4,1),(2,'2021-12-29 10:30:26.337304','2','test01',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Last login\"]}}]',4,1),(3,'2022-01-10 23:14:13.306718','1','zjhtest',3,'',7,1),(4,'2022-01-10 23:14:19.788620','2','zjh',3,'',7,1),(5,'2022-01-10 23:16:01.056807','3','zjh',1,'[{\"added\": {}}]',7,1),(6,'2022-01-10 23:16:32.805323','3','zjh',3,'',7,1);

#
# Structure for table "django_content_type"
#

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "django_content_type"
#

INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'login','user'),(8,'captcha','captchastore');

#
# Structure for table "django_migrations"
#

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "django_migrations"
#

INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-12-29 10:23:14.918256'),(2,'auth','0001_initial','2021-12-29 10:23:16.096834'),(3,'admin','0001_initial','2021-12-29 10:23:16.404893'),(4,'admin','0002_logentry_remove_auto_add','2021-12-29 10:23:16.422849'),(5,'admin','0003_logentry_add_action_flag_choices','2021-12-29 10:23:16.436841'),(6,'contenttypes','0002_remove_content_type_name','2021-12-29 10:23:16.592428'),(7,'auth','0002_alter_permission_name_max_length','2021-12-29 10:23:16.680156'),(8,'auth','0003_alter_user_email_max_length','2021-12-29 10:23:16.772970'),(9,'auth','0004_alter_user_username_opts','2021-12-29 10:23:16.798841'),(10,'auth','0005_alter_user_last_login_null','2021-12-29 10:23:16.866658'),(11,'auth','0006_require_contenttypes_0002','2021-12-29 10:23:16.871696'),(12,'auth','0007_alter_validators_add_error_messages','2021-12-29 10:23:16.890599'),(13,'auth','0008_alter_user_username_max_length','2021-12-29 10:23:16.956420'),(14,'auth','0009_alter_user_last_name_max_length','2021-12-29 10:23:17.008279'),(15,'auth','0010_alter_group_name_max_length','2021-12-29 10:23:17.062134'),(16,'auth','0011_update_proxy_permissions','2021-12-29 10:23:17.069116'),(17,'auth','0012_alter_user_first_name_max_length','2021-12-29 10:23:17.110007'),(18,'login','0001_initial','2021-12-29 10:23:17.140957'),(19,'sessions','0001_initial','2021-12-29 10:23:17.225732'),(20,'captcha','0001_initial','2021-12-29 19:23:16.631290'),(21,'captcha','0002_alter_captchastore_id','2022-01-12 09:10:10.034512'),(22,'login','0002_rename_name_user_zjh_name','2022-01-12 09:10:10.071936'),(23,'login','0003_alter_user_table','2022-01-12 09:31:09.956112');

#
# Structure for table "django_session"
#

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "django_session"
#

INSERT INTO `django_session` VALUES ('4ncxcs8ssfj4z2qgmlq4hseowy8w4tt2','ZjgwNWQwYTVjODNkZTdlYmQ5NWFiOTI4MWY2YjA1OGU5OTFjYmJjZTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjo0LCJ1c2VyX25hbWUiOiJ6amgifQ==','2022-01-25 14:45:36.192079'),('6bvv2jc05dehhi8dku5nlodlpi5piaf5','eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiempoIn0:1n36Do:9uovOi5hMtXLXvQg6Sgp0t-nT9TU1XEv-xcDLYug45o','2022-01-14 08:56:40.995199'),('fpwh6h8gu52321zs71mcf12ollxepm0i','eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6NywidXNlcl9uYW1lIjoiempoMiJ9:1n7SuD:TBYMCkfp-K2zlrtD0iejW4I8Xe0uPAlBNud16imzTxw','2022-01-26 09:58:29.825561'),('vu8tn414edtqb8d3fbkgms0qw35cpt9x','eyJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiempodGVzdCJ9:1n3Cxf:WFPvC85aYEa_Lc5961yxPPwOZ7OsL4Sv3mQak5lMEIQ','2022-01-14 16:08:27.276166');

#
# Structure for table "zjh_login_user"
#

CREATE TABLE `zjh_login_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zjh_name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`zjh_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "zjh_login_user"
#

INSERT INTO `zjh_login_user` VALUES (5,'zjh','33fefe3ddc92e5c71911f7e049b1d25473527c344f908b84170057e98492ab11','zjh@qq.com','male','2022-01-12 09:05:41.312991'),(6,'zjh1','e3ad157ce70fa097f73cc48e462eeb14e76c0eeb3240fdb8ed7c92539244b0a7','zjh1@qq.com','male','2022-01-12 09:32:23.126468'),(7,'zjh2','3133f8a13daa0396599beede016f75cb04772ad0f277e9adb453ec44634ce8ae','zjh2@qq.com','male','2022-01-12 09:57:34.516888');
