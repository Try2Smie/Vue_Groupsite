/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : groupsite

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2020-01-27 00:37:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', null, '我学Python都看了哪些书  修改修改', '修改修改\n2017年11月29日，自己曾在公众号内写过一篇《聊聊我的R语言学习路径和感受》的文章，受到了很多朋友的关注和赞扬，同时，也有其他公众号在帮忙转载。当然，也有很多朋友也给我留言，能不能聊聊关于Python的学习建议，时隔一个多月，今天抽空再来谈谈自己学习Python的路程吧。\n准确的说自己是从2014年的9月份开始接触Python的，那会由于工作需要，硬着头皮开始学习Python，不怕各位笑话，我的第一本Python启蒙书籍是《与孩子一起学编程》。这本书真的非常通俗易懂，从什么是变量、基本的数学运算、数据类型到复杂一点的控制流语法和应用，再到Python的几种数据结构讲解等等，同时也会将这些基础知识拼起来写一个和小孩一起玩的游戏（尽管自己对游戏没有什么兴趣，但还是照书抄代码了）。————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n\n', '12345678', '12345678', '2020-01-26 23:35:43', '2020-01-27 00:23:55');
INSERT INTO `project` VALUES ('2', null, 'Python基础储备', '不管你学习什么新东西，都必须牢记一条，基础必须夯实牢，因为基础能够决定你能走多远。所以，学习Python也需要你静下心来好好的掌握一下它的基础知识，如基本的数据结构（列表、元组、字典）及对应的方法、字符串处理方法、控制流和自定义函数、正则表达式、文件处理、异常处理、类的创建等等。关于这部分的学习，有很多参考书可供选择，如：\\n\\n《Python简明教程》：这是一本只有100页左右的小册子，你可以迅速的浏览并敲一遍代码，或多或少都会提升你的Python基础能力；\\n\\n《笨方法学Python》：这本书同样非常的短小精悍，全书是以习题的形式让读者掌握有关Python的基础知识，里面的代码建议读者能够敲一遍；\\n\\n《Python基础教程》：这本书的内容非常的详实，几乎覆盖了Python的所有基础知识点，当然有些章节你也并不需要都去看，读者可以根据自己的情况，有针对性的挑着看；', '11111111', 'g8YTvJ', '2020-01-26 23:55:52', '2020-01-26 23:55:51');
INSERT INTO `project` VALUES ('3', null, 'Python数据分析ggggg', '当你掌握了有关Python的基础知识后，你就可以尝试着去学习Python在数据分析和挖掘中的应用了。众所周知，随着大数据时代的到来，数据分析显得尤其重要和火热，那么相应的关于Python做数据分析的第三方模块也越来越多，例如numpy用于数值计算、随机数生成等功能、pandas用于数据的清洗和整理等功能、statsmodels和scipy用于统计建模和各种假设检验等功能、matplotlib用于数据数据可视化、sklearn用于常见的数据挖掘算法的落地等。目前市面上也有很多关于Python数据分析的书本，例如：\\n\\n《利用Python进行数据分析》：太经典了，作者就是创建pandas模块的大牛，书中详细讲解了有关numpy、pandas、matplotlib等模块的常用函数技巧，同时也结合了一些案例加以说明，书末也简单介绍了Python在时间序列问题上的处理和金融与经济方面的应用；\\n\\n《Python金融大数据分析》：如果你对金融比较感兴趣的话，这本书是一个不错的选择。不仅讲了有关金融方面的理论知识和应用案例，也同样讲解了很多基础知识，如常见的数据结构、数据可视化操作、数据操作、数学基础、统计学基础等；\\n\\n《Python数据分析与挖掘实战》：这是一本很棒的实战书籍，结合Python这个工具讲解了有关数据分析过程中的数据探索和数据预处理，同时，也介绍了很多数据分析和挖掘的案例，一步步带着读者完成每一个实战项目的操作。例如，窃电行为识别、家电用户行为分析、电商用户行为分析等；\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521', '99999999', 'jiuge', '2020-01-27 00:14:26', '2020-01-27 00:14:26');
INSERT INTO `project` VALUES ('4', null, 'Python数据可视化', '数据可视化的目的就是让读数据的人留下直观而深刻的记忆，这也是数据分析过程中必备的技能，一方面方便自己和读者发现数据的规律和关系，另一方面也是数据的一种展现方式。关于专门讲Python可视化的书,在市面上并不多，这里就跟大家分享一本我认为非常棒的书吧：\\n\\n《Python数据可视化编程实战》：本书涵盖了基本的统计图形，如条形图、饼图、直方图、箱线图、面积图、散点图等，还讲解了有关作图的细节，如坐标轴、刻度值、图例的处理等，除此，还单独将3D图作为一个章节进行讲解。如果你想了解关于地图的绘制，书中也有案例，只不过没有提到中国地图的绘制。\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521\n', '13579110', 'd0ABvm', '2020-01-27 00:18:38', '2020-01-27 00:18:37');
INSERT INTO `project` VALUES ('5', null, 'Python数据挖掘', '    数据挖掘部分相对而言要难一些，光实现数据挖掘的操作还不够，还需要一定的数学功底，正如吴恩达所说，数学只是机器学习的基础。对于一般常用的预测模型、分类模型和聚类模型都可以通过Python的sklearn模块实现，所以实操不难。重要的是理论知识的掌握，这里介绍几本理论方面的书：\\n\\n《数据挖掘导论》：非常适合数据挖掘入门，内容详实，讲解的条理也很清晰；\\n\\n《数据挖掘概念与技术》：同样是一本不可多得的好书，首先介绍挖掘方法的概念和理论知识，然后通过某些数据集来完成手工计算的过程，对于读者来说，具有代入感，学习起来也会比较有劲；\\n\\n《统计学习方法》：是一本完全偏理论的书籍，包含了很多算法的推理过程，如knn算法、贝叶斯算法、决策树算法、支持向量机算法等，这些推理对读者的数学知识要求比较高；\n————————————————\n版权声明：本文为CSDN博主「Sim1480」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/lsxxx2011/article/details/78987521', '24681012', 'S1PGVD', '2020-01-27 00:21:14', '2020-01-27 00:21:14');
INSERT INTO `project` VALUES ('6', null, '计算与推断思维 六、可视化', '表格是一种组织和可视化数据的强大方式。然而，无论数据如何组织，数字的大型表格可能难以解释。 有时解释图片比数字容易得多。\n\n在本章中，我们将开发一些数据分析的基本图形方法。 我们的数据源是互联网电影数据库（IMDB），这是一个在线数据库，包含电影，电视节目，和视频游戏等信息。Box Office Mojo 网站提供了许多 IMDB 数据摘要，我们已经采用了其中一些。 我们也使用了 The Numbers 的数据摘要，这个网站的口号是“数据和电影业务的相遇之处”。\n\n作者：ApacheCN_飞龙\n链接：https://www.jianshu.com/p/b6220e99df2d\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n', '20202020', '2020', '2020-01-27 00:29:53', '2020-01-27 00:29:53');
INSERT INTO `project` VALUES ('7', null, '计算与推断思维 六、可视化', '表格是一种组织和可视化数据的强大方式。然而，无论数据如何组织，数字的大型表格可能难以解释。 有时解释图片比数字容易得多。\n\n在本章中，我们将开发一些数据分析的基本图形方法。 我们的数据源是互联网电影数据库（IMDB），这是一个在线数据库，包含电影，电视节目，和视频游戏等信息。Box Office Mojo 网站提供了许多 IMDB 数据摘要，我们已经采用了其中一些。 我们也使用了 The Numbers 的数据摘要，这个网站的口号是“数据和电影业务的相遇之处”。\n\n作者：ApacheCN_飞龙\n链接：https://www.jianshu.com/p/b6220e99df2d\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\n', '20202020', '2020', '2020-01-27 00:29:53', '2020-01-27 00:29:53');

-- ----------------------------
-- Table structure for project_1
-- ----------------------------
DROP TABLE IF EXISTS `project_1`;
CREATE TABLE `project_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_1_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_1
-- ----------------------------
INSERT INTO `project_1` VALUES ('1', '12345678', '施小姐', '1');
INSERT INTO `project_1` VALUES ('2', '33333333', '三三', null);
INSERT INTO `project_1` VALUES ('3', '66666666', '666', '2');

-- ----------------------------
-- Table structure for project_2
-- ----------------------------
DROP TABLE IF EXISTS `project_2`;
CREATE TABLE `project_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_2_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_2
-- ----------------------------
INSERT INTO `project_2` VALUES ('1', '11111111', '依依', '3');
INSERT INTO `project_2` VALUES ('2', '77777777', '齐小姐', null);
INSERT INTO `project_2` VALUES ('3', '88888888', '发发发', null);

-- ----------------------------
-- Table structure for project_3
-- ----------------------------
DROP TABLE IF EXISTS `project_3`;
CREATE TABLE `project_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_3_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_3
-- ----------------------------
INSERT INTO `project_3` VALUES ('1', '99999999', '九歌', '1');

-- ----------------------------
-- Table structure for project_4
-- ----------------------------
DROP TABLE IF EXISTS `project_4`;
CREATE TABLE `project_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_4_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_4
-- ----------------------------
INSERT INTO `project_4` VALUES ('1', '13579110', '张三', '1');

-- ----------------------------
-- Table structure for project_5
-- ----------------------------
DROP TABLE IF EXISTS `project_5`;
CREATE TABLE `project_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_5_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_5
-- ----------------------------
INSERT INTO `project_5` VALUES ('1', '24681012', '李四', '1');

-- ----------------------------
-- Table structure for project_6
-- ----------------------------
DROP TABLE IF EXISTS `project_6`;
CREATE TABLE `project_6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_6_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_6
-- ----------------------------
INSERT INTO `project_6` VALUES ('1', '20202020', '2020', '1');

-- ----------------------------
-- Table structure for project_7
-- ----------------------------
DROP TABLE IF EXISTS `project_7`;
CREATE TABLE `project_7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `project_7_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_7
-- ----------------------------
INSERT INTO `project_7` VALUES ('1', '20202020', '2020', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345678', '施小姐', 'aaccce06f248578638919547f4a2a323', 'shixiaojie@mail.com', '1');
INSERT INTO `user` VALUES ('2', '11111111', '依依', '7f0f25af5368797351bc560512c733a4', '1111@mail.com', '2');
INSERT INTO `user` VALUES ('3', '22222222', '二傻子', '590d3d6d922eeea33491939d87b18f3c', '2222@mail.com', null);
INSERT INTO `user` VALUES ('4', '33333333', '三三', '5dca07a3a6fb4c9988724e6cd5dd3a92', '3333@mail.com', '1');
INSERT INTO `user` VALUES ('5', '44444444', '思思', '59e049a19e453b21b6ff362095a0ec6e', '4444@mail.com', null);
INSERT INTO `user` VALUES ('6', '55555555', '吴先生', '55dcb9d5b3a60787a2e04e3e024a4c2e', '5555@mail.com', null);
INSERT INTO `user` VALUES ('7', '66666666', '666', '0ecff2c82b391d8d19db0b049d7c9cf5', '6666@mail.com', '1');
INSERT INTO `user` VALUES ('8', '77777777', '齐小姐', '3505ce09ec91c80ae51c74160f63331f', '7777@mail.com', '2');
INSERT INTO `user` VALUES ('9', '88888888', '发发发', '386cae594ab387d069a5b345b1a8a6c8', '8888@mail.com', '2');
INSERT INTO `user` VALUES ('10', '99999999', '九歌', '161b4d2d45a6bca185befd4ef514f8b7', '9999@mail.com', '3');
INSERT INTO `user` VALUES ('11', '13579110', '张三', '83449cb8767c7cabfc9c50b2dfdb1f1e', '13579110@mail.com', '4');
INSERT INTO `user` VALUES ('12', '24681012', '李四', '49acf69977bfe7c3a9e113fae1af6323', '24681012@mail.com', '5');
INSERT INTO `user` VALUES ('13', '20202020', '2020', 'c4f4c2d198de894ee02b7962515d73a7', '2020@mail.com', '7');
