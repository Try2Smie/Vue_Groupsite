-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: groupsite
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Current Database: `groupsite`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `groupsite` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `groupsite`;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `project_title` varchar(255) NOT NULL,
  `project_body` mediumtext,
  `director_id` int(11) NOT NULL,
  `project_psw` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `director_id` (`director_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,NULL,'我学Python都看了哪些书','       2017年11月29日，自己曾在公众号内写过一篇《聊聊我的R语言学习路径和感受》的文章，受到了很多朋友的关注和赞扬，同时，也有其他公众号在帮忙转载。当然，也有很多朋友也给我留言，能不能聊聊关于Python的学习建议，时隔一个多月，今天抽空再来谈谈自己学习Python的路程吧。\n\n       准确的说自己是从2014年的9月份开始接触Python的，那会由于工作需要，硬着头皮开始学习Python，不怕各位笑话，我的第一本Python启蒙书籍是《与孩子一起学编程》。这本书真的非常通俗易懂，从什么是变量、基本的数学运算、数据类型到复杂一点的控制流语法和应用，再到Python的几种数据结构讲解等等，同时也会将这些基础知识拼起来写一个和小孩一起玩的游戏（尽管自己对游戏没有什么兴趣，但还是照书抄代码了）。\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\nhttps://blog.csdn.net/lsxxx2011/article/details/78987521',11111111,'111111','2019-12-31 21:36:34','2019-12-31 16:37:08'),(2,NULL,'Python基础储备','不管你学习什么新东西，都必须牢记一条，基础必须夯实牢，因为基础能够决定你能走多远。所以，学习Python也需要你静下心来好好的掌握一下它的基础知识，如基本的数据结构（列表、元组、字典）及对应的方法、字符串处理方法、控制流和自定义函数、正则表达式、文件处理、异常处理、类的创建等等。关于这部分的学习，有很多参考书可供选择，如：\n\n《Python简明教程》：这是一本只有100页左右的小册子，你可以迅速的浏览并敲一遍代码，或多或少都会提升你的Python基础能力；\n\n《笨方法学Python》：这本书同样非常的短小精悍，全书是以习题的形式让读者掌握有关Python的基础知识，里面的代码建议读者能够敲一遍；\n\n《Python基础教程》：这本书的内容非常的详实，几乎覆盖了Python的所有基础知识点，当然有些章节你也并不需要都去看，读者可以根据自己的情况，有针对性的挑着看；\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521',22222222,'222222','2019-12-31 21:38:40','2019-12-31 13:38:40'),(3,NULL,'Python数据分析','当你掌握了有关Python的基础知识后，你就可以尝试着去学习Python在数据分析和挖掘中的应用了。众所周知，随着大数据时代的到来，数据分析显得尤其重要和火热，那么相应的关于Python做数据分析的第三方模块也越来越多，例如numpy用于数值计算、随机数生成等功能、pandas用于数据的清洗和整理等功能、statsmodels和scipy用于统计建模和各种假设检验等功能、matplotlib用于数据数据可视化、sklearn用于常见的数据挖掘算法的落地等。目前市面上也有很多关于Python数据分析的书本，例如：\n\n《利用Python进行数据分析》：太经典了，作者就是创建pandas模块的大牛，书中详细讲解了有关numpy、pandas、matplotlib等模块的常用函数技巧，同时也结合了一些案例加以说明，书末也简单介绍了Python在时间序列问题上的处理和金融与经济方面的应用；\n\n《Python金融大数据分析》：如果你对金融比较感兴趣的话，这本书是一个不错的选择。不仅讲了有关金融方面的理论知识和应用案例，也同样讲解了很多基础知识，如常见的数据结构、数据可视化操作、数据操作、数学基础、统计学基础等；\n\n《Python数据分析与挖掘实战》：这是一本很棒的实战书籍，结合Python这个工具讲解了有关数据分析过程中的数据探索和数据预处理，同时，也介绍了很多数据分析和挖掘的案例，一步步带着读者完成每一个实战项目的操作。例如，窃电行为识别、家电用户行为分析、电商用户行为分析等；\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521',33333333,'333333','2019-12-31 21:39:47','2019-12-31 13:39:47'),(4,NULL,'Python数据可视化','数据可视化的目的就是让读数据的人留下直观而深刻的记忆，这也是数据分析过程中必备的技能，一方面方便自己和读者发现数据的规律和关系，另一方面也是数据的一种展现方式。关于专门讲Python可视化的书,在市面上并不多，这里就跟大家分享一本我认为非常棒的书吧：\n\n《Python数据可视化编程实战》：本书涵盖了基本的统计图形，如条形图、饼图、直方图、箱线图、面积图、散点图等，还讲解了有关作图的细节，如坐标轴、刻度值、图例的处理等，除此，还单独将3D图作为一个章节进行讲解。如果你想了解关于地图的绘制，书中也有案例，只不过没有提到中国地图的绘制。\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521',44444444,'444444','2019-12-31 21:41:23','2019-12-31 13:41:23'),(5,NULL,'Python数据挖掘','    数据挖掘部分相对而言要难一些，光实现数据挖掘的操作还不够，还需要一定的数学功底，正如吴恩达所说，数学只是机器学习的基础。对于一般常用的预测模型、分类模型和聚类模型都可以通过Python的sklearn模块实现，所以实操不难。重要的是理论知识的掌握，这里介绍几本理论方面的书：\n\n《数据挖掘导论》：非常适合数据挖掘入门，内容详实，讲解的条理也很清晰；\n\n《数据挖掘概念与技术》：同样是一本不可多得的好书，首先介绍挖掘方法的概念和理论知识，然后通过某些数据集来完成手工计算的过程，对于读者来说，具有代入感，学习起来也会比较有劲；\n\n《统计学习方法》：是一本完全偏理论的书籍，包含了很多算法的推理过程，如knn算法、贝叶斯算法、决策树算法、支持向量机算法等，这些推理对读者的数学知识要求比较高；\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521',55555555,'555555','2019-12-31 21:43:59','2019-12-31 13:43:59'),(6,NULL,'计算与推断思维 六、可视化','表格是一种组织和可视化数据的强大方式。然而，无论数据如何组织，数字的大型表格可能难以解释。 有时解释图片比数字容易得多。\n\n在本章中，我们将开发一些数据分析的基本图形方法。 我们的数据源是互联网电影数据库（IMDB），这是一个在线数据库，包含电影，电视节目，和视频游戏等信息。Box Office Mojo 网站提供了许多 IMDB 数据摘要，我们已经采用了其中一些。 我们也使用了 The Numbers 的数据摘要，这个网站的口号是“数据和电影业务的相遇之处”。\n\n作者：ApacheCN_飞龙\n链接：https://www.jianshu.com/p/b6220e99df2d\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。',66666666,'QA62cH','2020-01-01 00:07:42','2019-12-31 16:07:42'),(7,NULL,'养成良好的储蓄习惯','图片发自简书App\n            “你不理财，财不理你。”\n\n          要想学会理财，首先要养成良好的储蓄习惯。\n\n        多数人心中的烦恼，不是他们手中没有足够的钱，而是不知道怎样合理支配手中的钱。所以清楚怎样支配钱，才是当务之急。\n\n        我们必须为自己设计一个花钱的计划，然后根据计划来花钱，然而我们多数人不是这样，大多数人在处理金钱时会表现得十分盲目。\n\n        有一个公司的会计，在公司时，她对数字十分敏感，账目做得清清楚楚。而她在处理个人账目时，喜欢什么就买什么，根本不考虑还要交房租、电费和其他一些费用。不过这个人倒是很清楚的知道，如果他供职的这家公司像她这样毫无计划的花钱，公司迟早会关门。因此有件事是你必须要考虑的，当涉及你的金钱时，你就是在经营自己的事业，而你在支配自己的金钱时，这也是你自己的家事，外人是无法帮忙的。在预算中必须有这样一项开支，至少把每年收入的1/10存入银行或者拿去投资。这样你可以建立一笔额外的资金，用作特殊用途，比如买房子或买汽车。\n\n        拿破仑.希尔指出对于所有的人来说，存钱是成功的基本条件之一，但是在那些未曾存钱者的心目当中，最迫切的一个问题则是“我要怎样才能存钱。”\n\n        存钱纯粹是一个习惯的问题，人经由习惯的法则塑造了自己的个性，这个说法是极为正确的。任何行为在重复做过几次之后就变成了一种习惯，而人的意志也只不过是从我们日常习惯当中成长出来的一种推动力量。\n\n        一种习惯一旦在脑中固定形成之后，这个习惯就会自动驱使一个人采取行动。比如如果你遵循你每天上班或经常前往某处地点的固定路线，过不了多久，这个习惯就会养成，不用你花脑筋去思考，你的头脑自然会引你走向这条路线。更好玩的是即使你在动身之初是想前往另一方向，但是如果你不提醒自己改变路线的话，那么你将会发现自己不知不觉又走上原来的路线了。\n\n        \n\n作者：梦想917\n链接：https://www.jianshu.com/p/68b526f3e6e3\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。',77777777,'Hil5o2','2020-01-01 00:14:36','2019-12-31 16:14:35'),(8,NULL,'孤独跑者简悟（一） 2个月减了40斤','我是一个从小喜欢踢球的人，但纯粹的跑步确实让曾经的我非常厌烦的。\n\n一是因为光想象就觉得无聊、枯燥；二是我体能天生不太好。总之借口很多。\n\n我曾经以为我是怎么吃也吃不胖的，\n\n直到工作几年后，原来喝水也会胖是真的。\n\n我的体重从大学毕业的120斤涨到巅峰180几斤，\n\n而且这个巅峰估计也是暂时的，上不封顶。\n\n每一俩周踢一俩次球，根本就没有任何减肥的效果。\n\n何况最后连球也不踢了，变成一个看球的。\n\n2016年依靠跑步，两个月就减掉了40斤，体重为140斤，我身高174，这体重很标准，甚至比以前的120还好一些。\n\n我是一个意志力薄弱的普通人，2个月减掉40斤也不是什么惊天壮举，能跑个半马速度还不快也不是值得炫耀的事情。\n\n但是，我自己很满意。\n\n因为我不会像胖的时候走两层楼梯就气喘吁吁，因为被误会为25岁的青年我骄傲，当然我实际年龄不会告诉你的。\n\n后面几篇会说明整个过程，今天先到这里。\n\n作者：自嗨如醉\n链接：https://www.jianshu.com/p/de690407b2a0\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。',20000000,'asn7p4','2020-01-01 10:18:38','2020-01-01 02:18:37'),(9,NULL,'时间管理方法论：高效能人士一日待办清单（附案例拆解）','每个人都期待着自己能够高效生活，在有限时间内做更多有价值的事情。\n\n但是到底怎样的日程安排才是高效的呢？\n\n这个话题仁者见仁智者见智，因为每个人所处的生活环境不同，生活方式不同，对生活的标准和要求不同，因而对于时间的把控程度也会有所不同。\n\n在洛羽看来，有效的时间管理方法论，不过就是“以目标为导向，以人为中心，以效率为原则，以成果为标准”。\n\n只要能够将待办清单上的任务，保质保量完成，就是高效能人士。\n\n\n\n作者：洛神的小羽毛\n链接：https://www.jianshu.com/p/f9795488b2b8\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。',30000000,'hf8fWK','2020-01-01 23:54:10','2020-01-01 15:54:10');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_1`
--

DROP TABLE IF EXISTS `project_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_1_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_1`
--

LOCK TABLES `project_1` WRITE;
/*!40000 ALTER TABLE `project_1` DISABLE KEYS */;
INSERT INTO `project_1` VALUES (1,11111111,'11111111',1),(2,88888888,'88888888',NULL),(3,99999999,'99999999',2),(4,10000000,'10000000',NULL);
/*!40000 ALTER TABLE `project_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_2`
--

DROP TABLE IF EXISTS `project_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_2_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_2`
--

LOCK TABLES `project_2` WRITE;
/*!40000 ALTER TABLE `project_2` DISABLE KEYS */;
INSERT INTO `project_2` VALUES (1,22222222,'22222222',1);
/*!40000 ALTER TABLE `project_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_3`
--

DROP TABLE IF EXISTS `project_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_3_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_3`
--

LOCK TABLES `project_3` WRITE;
/*!40000 ALTER TABLE `project_3` DISABLE KEYS */;
INSERT INTO `project_3` VALUES (1,33333333,'33333333',1);
/*!40000 ALTER TABLE `project_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_4`
--

DROP TABLE IF EXISTS `project_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_4_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_4`
--

LOCK TABLES `project_4` WRITE;
/*!40000 ALTER TABLE `project_4` DISABLE KEYS */;
INSERT INTO `project_4` VALUES (1,44444444,'44444444',1);
/*!40000 ALTER TABLE `project_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_5`
--

DROP TABLE IF EXISTS `project_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_5_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_5`
--

LOCK TABLES `project_5` WRITE;
/*!40000 ALTER TABLE `project_5` DISABLE KEYS */;
INSERT INTO `project_5` VALUES (1,55555555,'55555555',1);
/*!40000 ALTER TABLE `project_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_6`
--

DROP TABLE IF EXISTS `project_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_6_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_6`
--

LOCK TABLES `project_6` WRITE;
/*!40000 ALTER TABLE `project_6` DISABLE KEYS */;
INSERT INTO `project_6` VALUES (1,66666666,'66666666',1);
/*!40000 ALTER TABLE `project_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_7`
--

DROP TABLE IF EXISTS `project_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_7_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_7`
--

LOCK TABLES `project_7` WRITE;
/*!40000 ALTER TABLE `project_7` DISABLE KEYS */;
INSERT INTO `project_7` VALUES (1,77777777,'77777777',1);
/*!40000 ALTER TABLE `project_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_8`
--

DROP TABLE IF EXISTS `project_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_8_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_8`
--

LOCK TABLES `project_8` WRITE;
/*!40000 ALTER TABLE `project_8` DISABLE KEYS */;
INSERT INTO `project_8` VALUES (1,20000000,'20000000',1);
/*!40000 ALTER TABLE `project_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_9`
--

DROP TABLE IF EXISTS `project_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_9` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_9_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_9`
--

LOCK TABLES `project_9` WRITE;
/*!40000 ALTER TABLE `project_9` DISABLE KEYS */;
INSERT INTO `project_9` VALUES (1,30000000,'30000000',1);
/*!40000 ALTER TABLE `project_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,11111111,'11111111','11111111','1111@mail.com',1),(2,22222222,'22222222','22222222','2222@mail.com',2),(3,33333333,'33333333','33333333','3333@mail.com',3),(4,44444444,'44444444','44444444','4444@mail.com',4),(5,55555555,'55555555','55555555','5555@mail.com',5),(6,66666666,'66666666','66666666','6666@mail.com',6),(7,77777777,'77777777','77777777','7777@mail.com',7),(8,88888888,'88888888','88888888','8888@mail.com',1),(9,99999999,'99999999','99999999','9999@mail.com',1),(10,10000000,'10000000','10000000','1000@mail.com',1),(11,20000000,'20000000','20000000','2000@mail.com',8),(12,30000000,'30000000','30000000','3000@mail.com',9),(13,40000000,'40000000','40000000','4000@mail.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 21:02:46
