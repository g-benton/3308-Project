-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: local-recipe-db
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add django migrations',7,'add_djangomigrations'),(20,'Can change django migrations',7,'change_djangomigrations'),(21,'Can delete django migrations',7,'delete_djangomigrations'),(22,'Can add ingredients',8,'add_ingredients'),(23,'Can change ingredients',8,'change_ingredients'),(24,'Can delete ingredients',8,'delete_ingredients'),(25,'Can add recipes',9,'add_recipes'),(26,'Can change recipes',9,'change_recipes'),(27,'Can delete recipes',9,'delete_recipes'),(28,'Can add recipe ingredients',10,'add_recipeingredients'),(29,'Can change recipe ingredients',10,'change_recipeingredients'),(30,'Can delete recipe ingredients',10,'delete_recipeingredients'),(31,'Can add auth group',11,'add_authgroup'),(32,'Can change auth group',11,'change_authgroup'),(33,'Can delete auth group',11,'delete_authgroup'),(34,'Can add auth group permissions',12,'add_authgrouppermissions'),(35,'Can change auth group permissions',12,'change_authgrouppermissions'),(36,'Can delete auth group permissions',12,'delete_authgrouppermissions'),(37,'Can add auth permission',13,'add_authpermission'),(38,'Can change auth permission',13,'change_authpermission'),(39,'Can delete auth permission',13,'delete_authpermission'),(40,'Can add auth user',14,'add_authuser'),(41,'Can change auth user',14,'change_authuser'),(42,'Can delete auth user',14,'delete_authuser'),(43,'Can add auth user groups',15,'add_authusergroups'),(44,'Can change auth user groups',15,'change_authusergroups'),(45,'Can delete auth user groups',15,'delete_authusergroups'),(46,'Can add auth user user permissions',16,'add_authuseruserpermissions'),(47,'Can change auth user user permissions',16,'change_authuseruserpermissions'),(48,'Can delete auth user user permissions',16,'delete_authuseruserpermissions'),(49,'Can add django admin log',17,'add_djangoadminlog'),(50,'Can change django admin log',17,'change_djangoadminlog'),(51,'Can delete django admin log',17,'delete_djangoadminlog'),(52,'Can add django content type',18,'add_djangocontenttype'),(53,'Can change django content type',18,'change_djangocontenttype'),(54,'Can delete django content type',18,'delete_djangocontenttype'),(55,'Can add django session',19,'add_djangosession'),(56,'Can change django session',19,'change_djangosession'),(57,'Can delete django session',19,'delete_djangosession');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'recipe_finder','authgroup'),(12,'recipe_finder','authgrouppermissions'),(13,'recipe_finder','authpermission'),(14,'recipe_finder','authuser'),(15,'recipe_finder','authusergroups'),(16,'recipe_finder','authuseruserpermissions'),(17,'recipe_finder','djangoadminlog'),(18,'recipe_finder','djangocontenttype'),(7,'recipe_finder','djangomigrations'),(19,'recipe_finder','djangosession'),(8,'recipe_finder','ingredients'),(10,'recipe_finder','recipeingredients'),(9,'recipe_finder','recipes'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-22 15:32:38.602292'),(2,'auth','0001_initial','2017-06-22 15:32:39.176483'),(3,'admin','0001_initial','2017-06-22 15:32:39.303798'),(4,'admin','0002_logentry_remove_auto_add','2017-06-22 15:32:39.323451'),(5,'contenttypes','0002_remove_content_type_name','2017-06-22 15:32:39.419126'),(6,'auth','0002_alter_permission_name_max_length','2017-06-22 15:32:39.434969'),(7,'auth','0003_alter_user_email_max_length','2017-06-22 15:32:39.451778'),(8,'auth','0004_alter_user_username_opts','2017-06-22 15:32:39.462545'),(9,'auth','0005_alter_user_last_login_null','2017-06-22 15:32:39.794284'),(10,'auth','0006_require_contenttypes_0002','2017-06-22 15:32:39.799117'),(11,'auth','0007_alter_validators_add_error_messages','2017-06-22 15:32:39.810550'),(12,'sessions','0001_initial','2017-06-22 15:32:39.852767'),(13,'recipe_finder','0001_initial','2017-06-22 15:34:54.304914'),(14,'recipe_finder','0002_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_django','2017-06-22 16:26:09.142287');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `name` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES ('sour cream',1),('ranch',2),('ground beef',3),('potatoes',4),('peanut butter',5),('honey',6),('cereal',7),('pasta',8),('tomatoes',9),('lettuce',10),('chicken',11),('rice',12),('broccoli',13),('cauliflower',14),('brussel sprouts',15),('spinach',16),('aritchoke',17),('eggs',18),('beef',19),('pork',20),('strawberries',21),('olives',22),('marshmallows',23),('cocoa powder',24),('tomato paste',25),('breadcrumbs',26),('cheddar',27),('parmesan',28),('mozzarella',29),('tortillas',30),('pickeled herring',31),('salmon',32),('shrimp',33),('halibut',34),('lentils',35),('milk',36),('lemon',37),('bacon',38),('mushrooms',39),('bell pepper',40),('onions',41),('corn',42),('peas',43),('carrots',44),('lime',45),('okra',46),('kale',47),('apples',48),('coconut',49),('cashews',50),('peanuts',51),('sunflower seeds',52),('asparagus',53),('green beans',54),('broth',55),('jalapeno',56),('avocado',57),('squash',58);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,5),(1,6),(1,7),(2,56),(2,41),(2,57),(2,45),(3,57),(3,28),(3,26),(4,37),(4,6),(4,44),(5,11),(6,53),(6,26),(6,28),(6,18);
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `yummly_id` text,
  `name` text,
  `text` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES ('','3 Ingredient Peanut  Butter & Honey Cereal Bars','Line an 8 x 8 inch square pan with parchment.\n\nCombine peanut butter & honey in a large saucepan and set over medium heat. Heat until mixture just starts to simmer, about 2-3 minutes, stirring. Remove from heat and stir until mixture is well-combined.\n\nStir in cereal until evenly coated. Pour mixture into prepared pan, cover with parchment, and press firmly. (Edited to add: A pastry roller will help to firmly and evenly pack down the mixture so the bars hold their shape). Chill in the refrigerator for 1 hour. Cut into bars. Store individually wrapped in the refrigerator.',1),('NULL','Easy Guacamole','Mix the onion and jalapeño together with the salt and the juice of 1 lime. Let sit for a few minutes.\nMeanwhile, roughly mash the avocados.\nMix the onion and jalapeño into the avocados and garnish with cilantro, to your taste.\nServe with tortilla chips or on top of your favorite taco or other Mexican dish.',2),('NULL','Baked Summer Squash','Preheat the oven to 350°F. Remove the stem ends and slice the squash cross-wise in 1/4-inch-thick rounds. Toss with the olive oil.\n\nIn a small bowl, combine the bread crumbs, Parmesan, salt, and pepper. Arrange the squash rounds in a 9x12-inch rectangular baking dish, or 10-inch pie plate. Sprinkle the bread crumb mixture over.\n\nCover the baking dish with foil and bake in the oven for 30 minutes. Remove foil and bake another five minutes until the top is bubbling and crispy.',3),('NULL','Lemon-Honey Glazed Carrots','Heat the olive oil in a pan over medium heat. Add the carrots, herbs and salt. Stir the carrots around to coat them evenly in the oil and herbs. Cover the pan and let them cook, stirring occasionally, for 10-15 minutes, or until fork tender.\nWhisk the honey and lemon juice in a small bowl. Once the carrots are fork tender, add the lemon honey to the pan and stir to coat the carrots. Transfer to a bowl and serve.',4),('','Best Grilled Chicken','In a large bowl drizzle the chicken with some of the olive oil and make sure to coat it nicely.\nSprinkle the spice mix generously all over the chicken tenders.\nUsing your hands make sure to rub it all over. Allow it to sit at room temperature for 20 minutes to take off the chill. That will assure your chicken won\'t stick to the pan and it will cook through quickly.\nMeanwhile heat up a cast iron grill pan over medium high flame.\nAdd the chicken tenderloin and grill 1-2 minutes per side until nice golden brown grill marks form and the chicken is cooked through.\nTransfer to a plate and squeeze some lemon juice over the top if desired.\nServe drizzled with the best chimichurri sauce on top.',5),('NULL','Baked Parmesan Asparagus Fries','Preheat oven to 400°F. Line a baking pan with parchment paper.\nPlace flour on one large plate. On a second plate combine Panko crumbs, cheese, onion powder, parsley flakes, salt and black pepper.\nScramble eggs and water in a large bowl.\nDip each asparagus spear in the flour, then the egg and then coat with Panko crumb cheese mixture.\nPlace asparagus on baking pan and bake for 20 minutes.',6);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-22 10:37:27
