/*
Navicat MySQL Data Transfer

Source Server         : 120.24.2.27
Source Server Version : 50621
Source Host           : 120.24.2.27:3306
Source Database       : duothink.material

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-12-08 09:27:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `think_article`
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `openid` char(64) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '作者',
  `cid` int(11) NOT NULL,
  `catid` int(11) NOT NULL COMMENT '分类',
  `subject` char(200) NOT NULL COMMENT '文章标题',
  `keywords` char(255) DEFAULT NULL COMMENT '关键字',
  `description` char(200) DEFAULT NULL COMMENT '描述',
  `message` longtext,
  `thumb` char(255) DEFAULT NULL COMMENT '缩略图',
  `ip` char(50) DEFAULT NULL COMMENT 'ip',
  `dateline` int(11) DEFAULT NULL COMMENT '发布时间',
  `views` int(11) DEFAULT '0',
  `remend` int(11) DEFAULT '0',
  `reples` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_article_id_openid_uindex` (`id`,`openid`),
  KEY `think_article_uid_catid_subject_keywords_status_index` (`uid`,`catid`,`subject`,`keywords`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('1', '95727b2632a709b4f15e982f99447b87', '1', '18', '201', 'Uzi危急关头喊Mata 辅助Tabe当场心碎！', 'Uzi危急关头喊Mata 辅助Tabe当场心碎！', '昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：“Looper，哦不，Mata给我E，给我E啊。”喊了两遍名字都没喊对', '&lt;p&gt;&lt;img src=&quot;/attach/9a\\337f9c95ae27b1f89f9456f9afe173a354a6aa.jpeg&quot; style=&quot;max-width:100%;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：&ldquo;Looper，哦不，Mata给我E，给我E啊。&rdquo;喊了两遍名字都没喊对Tabe的名字。&lt;/p&gt;&lt;p&gt;可是这会与他双排的人不是别人，正是他的第一任守护者Tabe，而不是他口中喊出的Mata，场面一度有点尴尬。Tabe此时心里不知道作何感想？从你拼命保护的辣个男人口中喊出的名字却不是你。&lt;/p&gt;&lt;p&gt;tabe的内心：如果你给我的爱和其他辅助的一样，那我情愿不要！现在连一样的爱都遥不可及了。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://files.15w.com/image/2016/1027/14775570834395.png&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;微博评论：&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://files.15w.com/image/2016/1027/14775570848322.png&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;有人说Uzi现在的狗妃这么多，好不容易翻到tabe，tabe应该知足了，其他人像zero、小段、PYL等人都还没能上车呢。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', './attach/thumb/aaccff1d7bf8c4c30308b419341e73abfdd85318.jpg', null, '1477620021', '161', '0', '0', '1');
INSERT INTO `think_article` VALUES ('2', 'a28d7b1f6c0bcafc4ed16ef42bff3436', '1', '18', '201', '微信群功能更新了，然并卵......', '微信群功能更新了，然并卵......', '昨天，传说了很久的新版微信群终于在AppStore上线了。前一阵子姑婆的朋友圈里就有很多做微信公众号、做社群的人在讨论这个话题，聊得是天花乱坠，有说重大利好的，', '&lt;p&gt;昨天，传说了很久的新版微信群终于在App Store上线了。&lt;/p&gt;&lt;p&gt;前一阵子姑婆的朋友圈里就有很多做微信公众号、做社群的人在讨论这个话题，聊得是天花乱坠，有说重大利好的，有说微信群更加有得玩的。但姑婆觉着，凡事还得客观分析，所以先带大家看看更新了哪些功能，然后我们再进行剖析。&lt;/p&gt;&lt;p&gt;一、更新了哪些功能？&lt;/p&gt;&lt;p&gt;本次更新了两个功能：&lt;/p&gt;&lt;p&gt;一是&ldquo;群聊邀请确认&rdquo;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2016/1028/6361324357844251989945553.png&quot;&gt;&lt;/p&gt;&lt;p&gt;群主终于能够中央集权了，这个功能解救了不少运营微信群的伙伴，之前是个人就能拉人进群的时代算是过去了，但姑婆觉着，你想要弄一个500人的大群，还是有够麻烦的，得不停地确认确认确认......&lt;/p&gt;&lt;p&gt;二是群收钱&lt;/p&gt;&lt;p&gt;这个功能微信把它好好设计了一番，分为两种：&lt;/p&gt;&lt;p&gt;1、最基本的模式类似于AA收款，单人金额设置到了5000人民币，可真不是个小数。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2016/1028/6361324357856452687972204.png&quot;&gt;&lt;/p&gt;&lt;p&gt;2、每个人单独收取特定金额，有点像搞特例的意思&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2016/1028/6361324357860452915430695.png&quot;&gt;&lt;/p&gt;&lt;p&gt;点击&ldquo;参与人员&rdquo;就可以为每个成员定制收款项。&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://upload.chinaz.com/2016/1028/6361324357870653494929928.png&quot;&gt;&lt;img src=&quot;http://upload.chinaz.com/2016/1028/6361324357870653494929928.png&quot;&gt;&lt;/a&gt;&lt;/p&gt;&lt;p&gt;同样也是5000人民币的上限，上限范围内可以任意设置。&lt;/p&gt;&lt;p&gt;二、这两个功能的更新对微信群运营产生了什么样的影响？&lt;/p&gt;&lt;p&gt;接下来姑婆就分析下在更新了这两个功能后，对社群运营有没有产生利好和其他影响。事先表明观点，姑婆是比较不看好的，原因如下：&lt;/p&gt;&lt;p&gt;1、管理结构依旧没变：微信群依然是一家没有中层干部的公司&lt;/p&gt;&lt;p&gt;咱们从用户运营的角度来说，&ldquo;金字塔模型&rdquo;大家应该非常了解，它是用户运营中的一个工具模型，用来理清运营思路。姑婆就以QQ群和微信群为例说说他们的异同。&lt;/p&gt;&lt;p&gt;我们看下QQ群用户金字塔：&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2016/1028/6361324357882954197658406.png&quot;&gt;&lt;/p&gt;&lt;p&gt;我们再来看下微信群的用户金字塔：&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2016/1028/6361324357886854429415069.png&quot;&gt;&lt;/p&gt;&lt;p&gt;比较之后，很明显，微信群缺了一级，用一个形象的比喻，就好比管理一家公司，你就是CEO。而且你管理的往往还是大公司，不是小公司，因为你面临的用户数量经常会很大，比如版主团队，往往都有数百个之众。500人的微信群，就是500人的大公司啊！&lt;/p&gt;&lt;p&gt;这种情况下，如果你不分级，你这个CEO会累死，你一个人无论再强，也根本不可能同时面对那么多用户，处理那么多问题。就算你不设置CEO-副总裁-总监-经理-普通员工这样的层级，也至少是CEO-总监/经理-普通员工吧，最差最差你也得有个帮手吧。否则这个公司不被你玩死，你自己也得累死。你说你多弄几个人进微信群做管理，但关键是他们都没有权限啊，到头来还是轮到你来处理。&lt;/p&gt;&lt;p&gt;一个复杂的用户型产品，从用户运营角度上，用户金字塔可能有四级、五级，甚至更多级。但无论怎么讲，从有效的角度上讲，至少应该有三级。一个再怎么出色的管理者，在想做好群内互动的情况下，同时对9个人以上，就会因为汇报线太多，导致很难应付不过来了。所以微信群的管理，就算松散一点，在缺少中层管理者的情况下也无法做到有效的管理。&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;从这个角度看，更新的两个功能并没有帮上什么忙。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', null, null, '1477627876', '222', '0', '0', '1');
INSERT INTO `think_article` VALUES ('3', '05d1e58ef67a6e12f13fa6fa8a48c4f9', '1', '18', '201', '锤子科技 CEO 罗永浩昨晚做客淘宝头条问答节目', '在线问答,罗永浩,淘宝,守护者,男人', '锤子科技CEO罗永浩昨晚做客淘宝头条问答节目，进行了2个小时的在线问答，期间收到11000多条提问，观看人数超过30万，创造了淘宝头条问答的新纪录。这是问答内容', '&lt;p&gt;锤子科技 CEO 罗永浩昨晚做客淘宝头条问答节目，进行了 2 个小时的在线问答，期间收到 11000 多条提问，观看人数超过 30 万，创造了淘宝头条问答的新纪录。这是问答内容的精华版。&lt;/p&gt;&lt;p&gt;锤子科技市场部人员：罗老师晚上 19:00 准时出现。&amp;nbsp;&lt;/p&gt;&lt;p&gt;昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：&ldquo;Looper，哦不，Mata给我E，给我E啊。&rdquo;喊了两遍名字都没喊对Tabe的名字。 可是这会与他双排的人不是别人，正是他的第一任守护者Tabe，而不是他口中喊出的Mata，场面一度有点尴尬。Tabe此时心里不知道作何感想？从你拼命保护的辣个男人口中喊出的名字却不是你。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：&ldquo;Looper，哦不，Mata给我E，给我E啊。&rdquo;喊了两遍名字都没喊对Tabe的名字。 可是这会与他双排的人不是别人，正是他的第一任守护者Tabe，而不是他口中喊出的Mata，场面一度有点尴尬。Tabe此时心里不知道作何感想？从你拼命保护的辣个男人口中喊出的名字却不是你。&lt;span style=&quot;font-size: 1.4rem;&quot;&gt;昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：&ldquo;Looper，哦不，Mata给我E，给我E啊。&rdquo;喊了两遍名字都没喊对Tabe的名字。 可是这会与他双排的人不是别人，正是他的第一任守护者Tabe，而不是他口中喊出的Mata，场面一度有点尴尬。Tabe此时心里不知道作何感想？从你拼命保护的辣个男人口中喊出的名字却不是你。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：&ldquo;Looper，哦不，Mata给我E，给我E啊。&rdquo;喊了两遍名字都没喊对Tabe的名字。 可是这会与他双排的人不是别人，正是他的第一任守护者Tabe，而不是他口中喊出的Mata，场面一度有点尴尬。Tabe此时心里不知道作何感想？从你拼命保护的辣个男人口中喊出的名字却不是你。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', null, null, '1478237471', '39', '0', '0', '1');
INSERT INTO `think_article` VALUES ('4', 'e79c630612f9a9c1a2a04a4c5ab9a064', '1', '18', '201', '微信小程序开放公测 企业、政府及媒体可申请', '程序开发,公开课,开发者,公测,内测', '11月3日晚间，微信团队对外宣布，微信小程序开放公测，开发者可登陆微信公众平台申请，开发完成后可以提交审核，公测期间暂不能发布。根据微信团队的介绍，开放注册范围', '&lt;p&gt;&lt;img src=&quot;/attach/c9\\522a89bacb2117ac0295f9531b6fccfa427966.jpeg&quot; style=&quot;max-width:100%;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;11月3日晚间，微信团队对外宣布，微信小程序开放公测，开发者可登陆微信公众平台申请，开发完成后可以提交审核，公测期间暂不能发布。&lt;/p&gt;&lt;p&gt;根据微信团队的介绍，开放注册范围为企业、政府、媒体及其他组织，注册方式为，登陆微信公众平台注册小程序，完成注册后可同步进行信息完善和开发。填写小程序的基本信息包括名称、头像、介绍及服务范围等。&lt;/p&gt;&lt;p&gt;完成小程序开发者绑定、开发信息配置后，开发者可下载开发者工具，参考开发文档进行开发和调试。完成小程序开发后，提交代码至微信团队审核，审核通过后即可发布（公测期间不能发布）。&lt;/p&gt;&lt;p&gt;9月22日凌晨，微信公众平台开始陆续对外发送小程序内测邀请。小程序即被外界广为关注的微信&ldquo;应用号&rdquo;。首批内测名额在200个左右。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;在今年1月11日举行的微信公开课PRO版上，张小龙在演讲中提到：微信的本意并不是要做成一个只是传播内容的平台，而是要做一个提供服务的平台所以微信团队专门拆出了服务号，但服务号以提供服务为主，基于一个诉求，&ldquo;这不是我们想看到的。现在我们将开发一个新的形态，叫做应用号。&rdquo;&lt;/p&gt;&lt;p&gt;根据张小龙的描述，应用号的形态大致为：&ldquo;一种新的公众号形态，这种形态下面用户关注了一个公众号，就像安装了一个APP一样。他要找这个公众号的时候就像找一个APP，在平时这个号不会向用户发东西的，所以APP就会很安静的存在那里，等用户需要的时候找到它就好了，这样的话我们可以尝试做到让更多的APP有一种更轻量的形态，但是又更好使用的一种形态来存在，这是我们在探讨的一种新的公众号形态，叫应用号，这里只是提前剧透一点点东西。&rdquo;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;从内测信息来看，小程序在通过向开发者开放多种服务及支撑能力以实现以上设想，主要面向开发者。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', './attach/thumb/85be9ff51e96d9c1c4d583ba33a4303e3be59642.jpg', null, '1478238521', '32', '0', '0', '1');
INSERT INTO `think_article` VALUES ('5', '5e93642091b98b50b13e327472dbaf2e', '1', '18', '201', '微信小程序开放公测 企业、政府及媒体可申请', '程序开发,公开课,开发者,公测,内测', '11月3日晚间，微信团队对外宣布，微信小程序开放公测，开发者可登陆微信公众平台申请，开发完成后可以提交审核，公测期间暂不能发布。根据微信团队的介绍，开放注册范围', '&lt;p&gt;&lt;img src=&quot;/attach/c9\\522a89bacb2117ac0295f9531b6fccfa427966.jpeg&quot; style=&quot;max-width:100%;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;11月3日晚间，微信团队对外宣布，微信小程序开放公测，开发者可登陆微信公众平台申请，开发完成后可以提交审核，公测期间暂不能发布。&lt;/p&gt;&lt;p&gt;根据微信团队的介绍，开放注册范围为企业、政府、媒体及其他组织，注册方式为，登陆微信公众平台注册小程序，完成注册后可同步进行信息完善和开发。填写小程序的基本信息包括名称、头像、介绍及服务范围等。&lt;/p&gt;&lt;p&gt;完成小程序开发者绑定、开发信息配置后，开发者可下载开发者工具，参考开发文档进行开发和调试。完成小程序开发后，提交代码至微信团队审核，审核通过后即可发布（公测期间不能发布）。&lt;/p&gt;&lt;p&gt;9月22日凌晨，微信公众平台开始陆续对外发送小程序内测邀请。小程序即被外界广为关注的微信&ldquo;应用号&rdquo;。首批内测名额在200个左右。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;在今年1月11日举行的微信公开课PRO版上，张小龙在演讲中提到：微信的本意并不是要做成一个只是传播内容的平台，而是要做一个提供服务的平台所以微信团队专门拆出了服务号，但服务号以提供服务为主，基于一个诉求，&ldquo;这不是我们想看到的。现在我们将开发一个新的形态，叫做应用号。&rdquo;&lt;/p&gt;&lt;p&gt;根据张小龙的描述，应用号的形态大致为：&ldquo;一种新的公众号形态，这种形态下面用户关注了一个公众号，就像安装了一个APP一样。他要找这个公众号的时候就像找一个APP，在平时这个号不会向用户发东西的，所以APP就会很安静的存在那里，等用户需要的时候找到它就好了，这样的话我们可以尝试做到让更多的APP有一种更轻量的形态，但是又更好使用的一种形态来存在，这是我们在探讨的一种新的公众号形态，叫应用号，这里只是提前剧透一点点东西。&rdquo;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;从内测信息来看，小程序在通过向开发者开放多种服务及支撑能力以实现以上设想，主要面向开发者。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', './attach/thumb/85be9ff51e96d9c1c4d583ba33a4303e3be59642.jpg', null, '1478238552', '38', '0', '0', '1');
INSERT INTO `think_article` VALUES ('6', '5635b616168c99ff780073e167c46d33', '1', '18', '201', '微信小程序开放公测 企业、政府及媒体可申请', '程序开发,公开课,开发者,公测,内测', '11月3日晚间，微信团队对外宣布，微信小程序开放公测，开发者可登陆微信公众平台申请，开发完成后可以提交审核，公测期间暂不能发布。根据微信团队的介绍，开放注册范围', '&lt;p&gt;&lt;img src=&quot;/attach/c9\\522a89bacb2117ac0295f9531b6fccfa427966.jpeg&quot; style=&quot;max-width:100%;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;11月3日晚间，微信团队对外宣布，微信小程序开放公测，开发者可登陆微信公众平台申请，开发完成后可以提交审核，公测期间暂不能发布。&lt;/p&gt;&lt;p&gt;根据微信团队的介绍，开放注册范围为企业、政府、媒体及其他组织，注册方式为，登陆微信公众平台注册小程序，完成注册后可同步进行信息完善和开发。填写小程序的基本信息包括名称、头像、介绍及服务范围等。&lt;/p&gt;&lt;p&gt;完成小程序开发者绑定、开发信息配置后，开发者可下载开发者工具，参考开发文档进行开发和调试。完成小程序开发后，提交代码至微信团队审核，审核通过后即可发布（公测期间不能发布）。&lt;/p&gt;&lt;p&gt;9月22日凌晨，微信公众平台开始陆续对外发送小程序内测邀请。小程序即被外界广为关注的微信&ldquo;应用号&rdquo;。首批内测名额在200个左右。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;在今年1月11日举行的微信公开课PRO版上，张小龙在演讲中提到：微信的本意并不是要做成一个只是传播内容的平台，而是要做一个提供服务的平台所以微信团队专门拆出了服务号，但服务号以提供服务为主，基于一个诉求，&ldquo;这不是我们想看到的。现在我们将开发一个新的形态，叫做应用号。&rdquo;&lt;/p&gt;&lt;p&gt;根据张小龙的描述，应用号的形态大致为：&ldquo;一种新的公众号形态，这种形态下面用户关注了一个公众号，就像安装了一个APP一样。他要找这个公众号的时候就像找一个APP，在平时这个号不会向用户发东西的，所以APP就会很安静的存在那里，等用户需要的时候找到它就好了，这样的话我们可以尝试做到让更多的APP有一种更轻量的形态，但是又更好使用的一种形态来存在，这是我们在探讨的一种新的公众号形态，叫应用号，这里只是提前剧透一点点东西。&rdquo;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;从内测信息来看，小程序在通过向开发者开放多种服务及支撑能力以实现以上设想，主要面向开发者。&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', './attach/thumb/85be9ff51e96d9c1c4d583ba33a4303e3be59642.jpg', null, '1478240560', '35', '0', '0', '1');
INSERT INTO `think_article` VALUES ('7', '197d5e37e3ad4f94d07e850bd9eb171a', '1', '18', '201', '如果你需要在控制器中进行验', 'message,require,控制器,result,email', '如果你需要在控制器中进行验证，并且继承了\\think\\Controller的话，可以调用控制器类提供的validate方法进行验证，如下：$result=$th', '&lt;h1&gt;&lt;p&gt;如果你需要在控制器中进行验证，并且继承了\\think\\Controller的话，可以调用控制器类提供的validate方法进行验证，如下：&lt;/p&gt;&lt;pre&gt;&lt;code&gt;$result = $this-&amp;gt;validate(\r\n    [\r\n        \'name\'  =&amp;gt; \'thinkphp\',\r\n        \'email\' =&amp;gt; \'thinkphp@qq.com\',\r\n    ],\r\n    [\r\n        \'name\'  =&amp;gt; \'require|max:25\',\r\n        \'email\'   =&amp;gt; \'email\',\r\n    ]);\r\nif(true !== $result){\r\n    // 验证失败 输出错误信息\r\n    dump($result);\r\n}&lt;/code&gt;&lt;/pre&gt;&lt;pre&gt;&lt;code&gt;namespace app\\index\\validate;\r\n\r\nuse think\\Validate;\r\n\r\nclass User extends Validate\r\n{\r\n    protected $rule = [\r\n        \'name\'  =&amp;gt;  \'require|max:25\',\r\n        \'email\' =&amp;gt;  \'email\',\r\n    ];\r\n\r\n    protected $message = [&lt;/code&gt;&lt;/pre&gt;&lt;/h1&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', null, null, '1478240644', '34', '0', '0', '1');
INSERT INTO `think_article` VALUES ('8', 'b02603253a02d03a9be361be4709649b', '1', '18', '201', '如果你需要在控制器中进行验', '控制器,霜霉病,黄色', '如果你需要在控制器中进行验证，并且继承了\\think\\Controller的话，可以调用控制器类提供的validate方法进行验证，如下：$result=$th', '&lt;h1&gt;&lt;p&gt;如果你需要在控制器中进行验证，并且继承了\\think\\Controller的话，可以调用控制器类提供的validate方法进行验证，如下：&lt;/p&gt;&lt;pre&gt;&lt;code&gt;$result = $this-&amp;gt;validate(\r\n    [\r\n        \'name\'  =&amp;gt; \'thinkphp\',\r\n        \'email\' =&amp;gt; \'thinkphp@qq.com\',\r\n    ],\r\n    [\r\n        \'name\'  =&amp;gt; \'require|max:25\',\r\n        \'email\'   =&amp;gt; \'email\',\r\n    ]);\r\nif(true !== $result){\r\n    // 验证失败 输出错误信息\r\n    dump($result);\r\n}&lt;/code&gt;&lt;/pre&gt;&lt;pre&gt;&lt;code&gt;namespace app\\index\\validate;\r\n\r\nuse think\\Validate;\r\n\r\nclass User extends Validate\r\n{\r\n    protected $rule = [\r\n        \'name\'  =&amp;gt;  \'require|max:25\',\r\n        \'email\' =&amp;gt;  \'email\',\r\n    ];\r\n\r\n    protected $message = [&lt;/code&gt;&lt;/pre&gt;&lt;/h1&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', null, null, '1478240657', '52', '0', '0', '1');
INSERT INTO `think_article` VALUES ('9', '8e4c327f92f5d47a03a896e94e893ea2', '1', '18', '201', '董明珠：格力手机会让你用上就不会放下', '网易直播,投资者,年轻人,企业家,直播间', '为什么市场上看不到格力手机？因为我们要做最完美的东西。曾经称“直播让自己感觉更年轻”的董明珠今日又进行了一场直播。上午10点，董明珠在网易直播间进行了一个小时的', '&lt;h1&gt;&lt;span style=&quot;font-size: 1.4rem; font-weight: 400;&quot;&gt;为什么市场上看不到格力手机？因为我们要做最完美的东西。&lt;/span&gt;&lt;br&gt;&lt;/h1&gt;&lt;section&gt;&lt;img src=&quot;https://pic.36krcnd.com/avatar/201611/04053237/sqzvjjbxwm3sr7l0.png!heading&quot; alt=&quot;董明珠：格力手机会让你用上就不会放下&quot;&gt;&lt;/section&gt;&lt;p&gt;&lt;/p&gt;&lt;section&gt;&lt;p&gt;曾经称&ldquo;直播让自己感觉更年轻&rdquo;的董明珠今日又进行了一场直播。&lt;/p&gt;&lt;p&gt;上午10点，董明珠在网易直播间进行了一个小时的现场直播，期间有113万人观看，人气爆棚。&lt;/p&gt;&lt;p&gt;期间，董明珠就收购珠海银隆及股东会上发飙的事情进行了解释。她认为收购会为股东们带来很好的发展，会用最后的结果来证明谁对谁错。而关于股东会上发飙的事情，她称是媒体的误传。&lt;/p&gt;&lt;p&gt;相比雷军一直感受到的来自网友的浓浓&ldquo;黑意&rdquo;，董明珠称不觉得网友们在黑她，反而感受到了别人的尊重。她相信雷军会找到突破口，但并不担心小米对格力手机构成的威胁。&lt;/p&gt;&lt;p&gt;她认为格力手机会让你用上就不会放下，并对市场关于格力手机的争论进行了解释：一是为什么在市场上看不到格力手机？因为要做最完美的东西，不希望一年就换手机，希望可以用上三、五年，所以会对手机持续进行软件升级，用着老款的手机享受着最新的技术。二是格力手机为什么没有那么大销量？是因为没有外包加工，而是自制，希望从研发、生产到销售领域，这个产品都是完美的。&lt;/p&gt;&lt;p&gt;对于年轻人的发展，她提到，每个不同的岗位都可以把一个人培养出来，只是看你自己是否去努力，是否去挑战，不是某个岗位让你成功，而是你自己的努力决定了自己是否可以成功。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;以下为根据网易直播整理的直播实录：&lt;/strong&gt;&lt;/p&gt;&lt;h3&gt;别人没有黑我，感受到的是他们对我的尊重&lt;/h3&gt;&lt;p&gt;&lt;strong&gt;Q：感觉格力的产品在走多元化的道路。当初收购珠海银隆的初衷是什么？&lt;/strong&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;今天已经进入环保的时代，大家看着北京的雾霾都知道要环保。环保是一个大课题，每个企业家，每个企业都应该围绕环保、智能、节能去做我们的产品开发。&lt;/p&gt;&lt;p&gt;股东大会事件，其实都是媒体的误导。那天的情况是误传，我没有现场发飙，只是我陈述了一个现状。当时有三个持有一百股的人，可能是刚买的一百股，明显是进来捣乱的。花几千块，就可以进来搅合。这个不重要，允许别人发声。关键是你自己做得是不是对，对要获利的投资者带来什么很重要，对社会、对员工带来什么很重要。因为企业的发展，让员工生活提升，福利待遇提高，这个很重要。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：您说收购一个企业是把自己的幸福建立在别人的痛苦之上，但您现在正在这样做。&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;我从来没有讲过这话。我认为收购也好，合作也好，不能把自己的幸福建立在别人的痛苦之上，是这个意思。收购也好，合并也好，不能让对方死，自己活下来，而是通过合作让双方取得更大的发展，这是双赢。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：很多网友认为您是网红，但有时候会招黑，可以说现在有很多企业家，会特别在意自己的形象，比如说我穿得漂不漂亮，对言谈举止发到网上很在意。您在网上会有一些生气、发飙的照片，您会不会介意？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;每个人都有很多瞬间，你抓拍到的瞬间可能不是最漂亮的，你感觉有很多招黑，但我感受到的是别人对我的尊重。比如昨天我在酒店碰到一个小男孩，他跑过来说你是董姐吧？按年龄他应该喊我阿姨，但他喊我董姐，可能从距离上感觉我比较年轻。他说很遗憾，今天跑步没带照相机，真想跟你合影。在火车上我们也经常遇到这样的情况。我想这也是因为格力造就了这样的局面，如果换一个不好的产品可能没有这样的效果。不要为别人改变你的初衷，要记住自己的使命，让中国制造在世界上落地有声。所以今天格力不仅要做世界第一，还要做领跑者，要不断挑战自己，创造别人没有的产品。&lt;/p&gt;&lt;h3&gt;要做完美的格力手机，不担心小米&lt;/h3&gt;&lt;p&gt;&lt;strong&gt;Q：格力空调覆盖很广，格力手机怎么样？因为您曾经摔过手机。&lt;/strong&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;董明珠：开股东会的时候，有股民站起来说冲着空调未必买格力股票，之所以买格力股票是因为有格力手机。他本人已经六次买格力手机，自己用得好，一次、二次买，又买来送朋友。昨天晚上见了一个朋友，他买了四次格力手机，他说最早买3300元，现在买3599，你们涨价了我还买，因为用得好。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;第一为什么市场上看不到格力手机？因为我们要做最完美的东西。&lt;/strong&gt;手机是每个人都必不可少的，我们不愿意一年就换手机，希望可以用上三、五年。所以我们会对手机持续进行软件升级，让你用着老款的手机享受着最新的技术。&lt;strong&gt;第二格力手机为什么没有那么大量？是因为我们没有外包加工，而是自制，希望从研发、生产到销售领域，这个产品都是完美的。&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：格力手机在格力集团起什么作用？地位是什么？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;不是这个产品起什么作用，我们更多的是从消费者的需求思考，而不是因为我的企业需要做这件事。企业需要不重要，市场需要最重要。只要有市场需要，企业的需求自然而然随着市场需要变化。创造是最重要的，好的企业是发掘新的需求。格力有很多产品，所有的产品都可以带来改变。&lt;strong&gt;特别是格力手机，让你用上就不会放下。&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：像小米这样的企业也在跟传统的家电企业合作，对这样的合作形式您会有担心和压力吗？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;我没有担心，每个人都有自己的选择。你可以让雷总来回答你，问问他和美的合作到什么样，这个只有他知道，我不知道。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：您感觉什么让小米出现一些问题？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;雷军原来是在珠海金山，是软件企业出来的，很多制造不是软件可以替代的。现在都注重轻资产，没有重资产。轻资产可以存在吗？我相信雷军即使遇到困难，也可以提早找到突破口。&lt;/p&gt;&lt;h3&gt;格力的成功是因为专注&lt;br&gt;&lt;/h3&gt;&lt;p&gt;&lt;strong&gt;Q：除了手机和汽车领域，格力还会关注其他的领域吗？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;我觉得格力电器专注是最重要的，不是因为天花板到了，所以我们进入另外的领域，&lt;strong&gt;格力的成功是因为专注。&lt;/strong&gt;这么多年下来，我们的专注已经让我们培养出一个团队，现在有七家研究院，8000多个技术人员。现在我们的人员已经开始被挖，说明你的人能力好，奥克斯也来挖人，几百万的年薪来挖人。有人会因为利益要走，我们不阻挡，格力愿意做培养人才的摇篮。&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：现在有很多电动汽车厂商，像特斯拉，您怎么看待未来可能成为格力新能源竞争对手的公司？&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;其实大家在技术上可以交流，学习、提升、创新，这才是真正有价值的应用。但现在我们一讲竞争，把某某企业和某某企业一比，好像就是你死我活的事，死不死是企业自己说得算，自己不努力，必死无疑，努力就有生存空间，只是看谁给消费者带来最满意的东西。&lt;/p&gt;&lt;p&gt;今年小米的业绩不是很好，网友上说雷军的日子不太好过。雷军好不好过，跟这些人有什么关系？从企业家内心来讲，不会不想把企业做好，各种原因导致他不在前面，但未必活不下去。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Q：对格力近几年的表现怎么看？&lt;/strong&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;董明珠：&lt;/strong&gt;过去空调行业低质低价是很平常&lt;/p&gt;&lt;/section&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', null, null, '1478242259', '44', '0', '0', '1');
INSERT INTO `think_article` VALUES ('10', '6f06e9bed737d1473b3778ff3b5c2ad2', '1', '18', '201', '抽多少支烟会伤肺？', '实验室,吸烟者,图片,国家,健康', '众所周知，吸烟有害健康，最新研究表明，吸烟不仅伤肺，还会引起细胞的DNA突变。根据科学杂志的报道，洛斯阿拉莫斯国家实验室的研究人员比较了来自1,000名非吸烟者', '&lt;h1&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;img src=&quot;https://pic.36krcnd.com/avatar/201611/04041856/cmpe7bq2q2i43b36.jpg!heading&quot; alt=&quot;抽多少支烟会伤肺？&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/span&gt;&lt;/h1&gt;&lt;h1&gt;&lt;section&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;众所周知，吸烟有害健康，最新研究表明，吸烟不仅伤肺，还会引起细胞的 DNA 突变。&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;根据科学杂志的报道，&lt;a href=&quot;https://www.baidu.com/link?url=ABbUxnS2PsfztVBhfkYTXZbiaQToE7sRpqF71UQzqFgqm3HJpqQ8y9Bl3kN2bbYPZwpQVFYyn4p39Ohnk0mJPVGtyiZ28KeMfsoecItf_dvInrdbU28-m12b8bKvtWkTBAYnawCXjELvvlyIA_o5t137Pmil8I98pENlrt6mxrHSlP-donCBbCgCwZp4ImKxj4KgWrrHmj1A0dV6geqYmSM8MruyLRYMEJIWB7YBLze&amp;amp;wd=&amp;amp;eqid=9d68f3a60002292300000003581c0d3e&quot;&gt;洛斯阿拉莫斯国家实验室&lt;/a&gt;的研究人员比较了来自 1,000 名非吸烟者和 2,500 名吸烟者的肿瘤组织 DNA，由此确定了吸烟对身体组织细胞&amp;nbsp;DNA&amp;nbsp;突变带来的影响。&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;&lt;img alt=&quot;抽多少支烟会伤肺？&quot; src=&quot;https://pic.36krcnd.com/avatar/201611/04042601/cio0b55g2q7z58xr.jpg!1200&quot;&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;图片来自洛斯阿拉莫斯国家实验室&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;根据图片内容，如果你每天抽一包烟，抽一年的话，每个肺细胞约经历 150 次突变，每个喉癌细胞突变 97 次，每个咽细胞突变 39 次，每个肝细胞突变 6 次，每个膀胱细胞突变 18 次，每个口腔细胞突变 23 次。对于肺部来说，49支烟就会导致一次 DNA 突变。&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;那么这些数据意味着什么呢？虽然 DNA 突变不一定会导致癌症，不过这的确会加大患上的癌症的风险。&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;《New Scientist》解释道：&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;blockquote&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;理论上讲，每个 DNA 突变都有可能引发一系列的遗传损伤，使细胞有癌变倾向。然而，我们目前还不知道吸烟引起的 DNA 突变转为癌症的概率，或者哪些突变类型可能是恶性较大的。&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;&lt;p&gt;&lt;span style=&quot;font-weight: normal;&quot;&gt;&lt;font size=&quot;3&quot;&gt;该研究团队目前致力于确定吸烟相关突变转癌的概率。不过希望以上这些 DNA 突变数据能够给广大烟民在点燃一支烟之前带来多几秒的思考。&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;/section&gt;&lt;/h1&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', null, null, '1478242702', '62', '0', '0', '1');

-- ----------------------------
-- Table structure for `think_article_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `think_article_attachment`;
CREATE TABLE `think_article_attachment` (
  `id` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) DEFAULT NULL,
  `attachment` char(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_article_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `think_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_access`;
CREATE TABLE `think_auth_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_access
-- ----------------------------
INSERT INTO `think_auth_access` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `think_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(50) DEFAULT NULL,
  `rules` text,
  `min_score` int(11) DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL,
  `icon` char(255) DEFAULT NULL,
  `color` char(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理员', '0', '99999', '999999', 'home', '#f60', '0');

-- ----------------------------
-- Table structure for `think_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(8) DEFAULT '0',
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) DEFAULT '1',
  `icon` varchar(125) DEFAULT NULL,
  `condition` char(100) NOT NULL DEFAULT '',
  `sort` int(5) unsigned DEFAULT '0',
  `nav` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `think_auth_rule_id_name_pid_title_index` (`id`,`name`,`pid`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', '0', 'admin/index/index', '管理首页', '1', 'dashboard', '', '0', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('2', '0', 'admin/content/index', '内容管理', '1', 'file-text-o', '', '2', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('6', '0', 'admin/user/index', '用户管理', '1', 'users', '', '5', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('9', '0', 'admin/config/index', '站点设置', '1', 'cog', '', '7', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('11', '2', 'admin/posts/index', '新增内容', '1', 'plus', '', '1', '0', '1');
INSERT INTO `think_auth_rule` VALUES ('19', '6', 'admin/user/adduser', '添加用户', '1', 'plus', '', '1', null, '0');
INSERT INTO `think_auth_rule` VALUES ('31', '9', 'admin/config/menus', '功能菜单', '1', 'th', '', '1', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('57', '56', 'admin/content/ed_document', '编辑文档模型', '1', 'pencil', '', '1', null, '1');
INSERT INTO `think_auth_rule` VALUES ('64', '0', 'admin/wechat/index', '微信公众号', '1', 'weixin', '', '3', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('68', '31', 'admin/config/ed_auth_rule', '编辑菜单', '1', 'pencil', '', '1', '0', '1');
INSERT INTO `think_auth_rule` VALUES ('69', '31', 'admin/config/add_menus', '添加菜单', '1', 'plus', '', '0', '0', '1');
INSERT INTO `think_auth_rule` VALUES ('77', '6', 'admin/user/groups', '用户组', '1', 'th-large', '', '2', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('79', '64', 'admin/wechat/keywords', '关键字回复', '1', 'tag', '', '3', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('80', '64', 'admin/wechat/media', '素材管理', '1', 'photo', '', '7', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('82', '64', 'admin/wechat/weixin_menus', '自定义菜单', '1', 'bars', '', '5', '1', '1');
INSERT INTO `think_auth_rule` VALUES ('88', '6', 'admin/user/myprofile', '个人设置', '1', 'cog', '', '4', null, '0');
INSERT INTO `think_auth_rule` VALUES ('89', '6', 'admin/user/repass', '修改密码', '1', 'lock', '', '5', null, '0');
INSERT INTO `think_auth_rule` VALUES ('106', '2', 'admin/channel/index', '栏目管理', '1', 'bars', '', '2', null, '1');
INSERT INTO `think_auth_rule` VALUES ('107', '106', 'admin/channel/add_channel', '添加栏目', '1', 'plus', '', '2', null, '1');
INSERT INTO `think_auth_rule` VALUES ('108', '106', 'admin/channel/ed_channel', '编辑栏目', '1', 'pencil', '', '2', null, '0');
INSERT INTO `think_auth_rule` VALUES ('109', '64', 'admin/wechat/api', '接口配置', '1', '', '', '8', null, '1');
INSERT INTO `think_auth_rule` VALUES ('110', '2', 'admin/category/index', '分类列表', '1', 'th', '', '87', null, '1');
INSERT INTO `think_auth_rule` VALUES ('112', '2', 'admin/document/index', '文档模型', '1', 'folder', '', '88', null, '1');
INSERT INTO `think_auth_rule` VALUES ('113', '2', 'admin/recycle/index', '回收站', '1', 'recycle', '', '9999', null, '1');
INSERT INTO `think_auth_rule` VALUES ('114', '0', 'admin/message/index', '消息提示', '1', 'bell-o', '', '6', null, '0');
INSERT INTO `think_auth_rule` VALUES ('117', '2', 'admin/collection/index', '内容采集', '1', 'umbrella', '', '85', null, '1');
INSERT INTO `think_auth_rule` VALUES ('119', '9', 'admin/config/navigation', '网站导航', '1', 'bars', '', '3', null, '1');

-- ----------------------------
-- Table structure for `think_category`
-- ----------------------------
DROP TABLE IF EXISTS `think_category`;
CREATE TABLE `think_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` char(50) DEFAULT NULL,
  `type` int(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `think_category_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_category
-- ----------------------------
INSERT INTO `think_category` VALUES ('18', '0', '网页/UI', '14', '4', '1');
INSERT INTO `think_category` VALUES ('94', '18', '网页素材', '14', '1', '1');
INSERT INTO `think_category` VALUES ('95', '18', '手机APP素材', '14', '2', '1');
INSERT INTO `think_category` VALUES ('96', '18', 'UI设计', '14', '3', '1');
INSERT INTO `think_category` VALUES ('97', '0', '网页特效', '11', '6', '1');
INSERT INTO `think_category` VALUES ('98', '97', '图片代码', '11', '0', '1');
INSERT INTO `think_category` VALUES ('99', '97', '导航菜单', '11', '0', '1');
INSERT INTO `think_category` VALUES ('100', '97', '选项卡/滑动门', '11', '0', '1');
INSERT INTO `think_category` VALUES ('101', '97', '文字特效 表单代码', '11', '0', '1');
INSERT INTO `think_category` VALUES ('102', '97', '悬浮层/弹出层', '11', '0', '1');
INSERT INTO `think_category` VALUES ('103', '97', '日期时间', '11', '0', '1');
INSERT INTO `think_category` VALUES ('104', '97', '统计图', '11', '0', '1');
INSERT INTO `think_category` VALUES ('105', '97', 'html/css', '11', '0', '1');
INSERT INTO `think_category` VALUES ('106', '97', 'html5', '11', '0', '1');
INSERT INTO `think_category` VALUES ('107', '97', 'css3', '11', '0', '1');
INSERT INTO `think_category` VALUES ('108', '97', '抽奖', '11', '0', '1');
INSERT INTO `think_category` VALUES ('109', '97', '游戏', '11', '0', '1');
INSERT INTO `think_category` VALUES ('110', '97', '3D', '11', '0', '1');
INSERT INTO `think_category` VALUES ('111', '97', '手机特效', '11', '0', '1');
INSERT INTO `think_category` VALUES ('112', '97', '其它特效', '11', '0', '1');
INSERT INTO `think_category` VALUES ('113', '0', '网页模板', '10', '7', '1');
INSERT INTO `think_category` VALUES ('115', '113', '行业', '10', '0', '1');
INSERT INTO `think_category` VALUES ('116', '113', '商城', '10', '0', '1');
INSERT INTO `think_category` VALUES ('117', '113', '企业', '10', '0', '1');
INSERT INTO `think_category` VALUES ('118', '113', '专题', '10', '0', '1');
INSERT INTO `think_category` VALUES ('119', '113', '后台', '10', '0', '1');
INSERT INTO `think_category` VALUES ('120', '113', '其他', '10', '0', '1');
INSERT INTO `think_category` VALUES ('121', '115', '订餐外送', '10', '0', '1');
INSERT INTO `think_category` VALUES ('122', '115', '旅游酒店', '10', '0', '1');
INSERT INTO `think_category` VALUES ('123', '115', '网络设计', '10', '0', '1');
INSERT INTO `think_category` VALUES ('124', '115', '婚庆摄影', '10', '0', '1');
INSERT INTO `think_category` VALUES ('125', '115', '家政家教', '10', '0', '1');
INSERT INTO `think_category` VALUES ('126', '115', '教育培训', '10', '0', '1');
INSERT INTO `think_category` VALUES ('127', '115', '办公OA', '10', '0', '1');
INSERT INTO `think_category` VALUES ('128', '115', '求职招聘', '10', '0', '1');
INSERT INTO `think_category` VALUES ('129', '115', '食品', '10', '0', '1');
INSERT INTO `think_category` VALUES ('130', '115', '医疗', '10', '0', '1');
INSERT INTO `think_category` VALUES ('131', '115', '房产租赁', '10', '0', '1');
INSERT INTO `think_category` VALUES ('132', '115', '视频影视', '10', '0', '1');
INSERT INTO `think_category` VALUES ('133', '115', '游戏', '10', '0', '1');
INSERT INTO `think_category` VALUES ('134', '115', '农业养殖', '10', '0', '1');
INSERT INTO `think_category` VALUES ('135', '115', '汽车', '10', '0', '1');
INSERT INTO `think_category` VALUES ('136', '115', '情感交友', '10', '0', '1');
INSERT INTO `think_category` VALUES ('137', '115', '时尚美容', '10', '0', '1');
INSERT INTO `think_category` VALUES ('138', '115', '生活服务', '10', '0', '1');
INSERT INTO `think_category` VALUES ('139', '115', '科技', '10', '0', '1');
INSERT INTO `think_category` VALUES ('140', '116', '团购', '10', '0', '1');
INSERT INTO `think_category` VALUES ('141', '116', '商务平台', '10', '0', '1');
INSERT INTO `think_category` VALUES ('142', '116', '返利', '10', '0', '1');
INSERT INTO `think_category` VALUES ('143', '116', '海淘', '10', '0', '1');
INSERT INTO `think_category` VALUES ('144', '116', '数码电器', '10', '0', '1');
INSERT INTO `think_category` VALUES ('145', '116', '水果蔬菜', '10', '0', '1');
INSERT INTO `think_category` VALUES ('146', '116', '服装鞋帽', '10', '0', '1');
INSERT INTO `think_category` VALUES ('147', '116', '鲜花礼品', '10', '0', '1');
INSERT INTO `think_category` VALUES ('148', '116', '美容化妆', '10', '0', '1');
INSERT INTO `think_category` VALUES ('149', '116', '珠宝配饰', '10', '0', '1');
INSERT INTO `think_category` VALUES ('150', '116', '家居', '10', '0', '1');
INSERT INTO `think_category` VALUES ('151', '117', '网络公司', '10', '0', '1');
INSERT INTO `think_category` VALUES ('152', '117', '设计公司', '10', '0', '1');
INSERT INTO `think_category` VALUES ('153', '117', '婚纱摄影', '10', '0', '1');
INSERT INTO `think_category` VALUES ('154', '117', '装修公司', '10', '0', '1');
INSERT INTO `think_category` VALUES ('155', '117', '咨询公司', '10', '0', '1');
INSERT INTO `think_category` VALUES ('156', '117', '软件科技', '10', '0', '1');
INSERT INTO `think_category` VALUES ('157', '117', '办公家具', '10', '0', '1');
INSERT INTO `think_category` VALUES ('158', '117', '生活旅游', '10', '0', '1');
INSERT INTO `think_category` VALUES ('159', '117', '教育培训', '10', '0', '1');
INSERT INTO `think_category` VALUES ('160', '117', '广告传媒', '10', '0', '1');
INSERT INTO `think_category` VALUES ('161', '117', '设备自动化', '10', '0', '1');
INSERT INTO `think_category` VALUES ('162', '117', '美容化妆', '10', '0', '1');
INSERT INTO `think_category` VALUES ('163', '117', '单页模板', '10', '0', '1');
INSERT INTO `think_category` VALUES ('164', '117', '行业模板', '10', '0', '1');
INSERT INTO `think_category` VALUES ('165', '118', '淘宝', '10', '0', '1');
INSERT INTO `think_category` VALUES ('166', '118', '医院', '10', '0', '1');
INSERT INTO `think_category` VALUES ('167', '118', '节日', '10', '0', '1');
INSERT INTO `think_category` VALUES ('168', '118', '活动', '10', '0', '1');
INSERT INTO `think_category` VALUES ('169', '118', '测试', '10', '0', '1');
INSERT INTO `think_category` VALUES ('170', '118', '企业宣传', '10', '0', '1');
INSERT INTO `think_category` VALUES ('171', '119', '登录界面', '10', '0', '1');
INSERT INTO `think_category` VALUES ('172', '119', 'bootstrap', '10', '0', '1');
INSERT INTO `think_category` VALUES ('173', '119', '国外后台模板', '10', '0', '1');
INSERT INTO `think_category` VALUES ('174', '119', '企业后台模板', '10', '0', '1');
INSERT INTO `think_category` VALUES ('175', '119', 'CMS后台模板', '10', '0', '1');
INSERT INTO `think_category` VALUES ('176', '119', 'OA系统', '10', '0', '1');
INSERT INTO `think_category` VALUES ('177', '119', 'div+css', '10', '0', '1');
INSERT INTO `think_category` VALUES ('178', '119', '常用后台模板', '10', '0', '1');
INSERT INTO `think_category` VALUES ('179', '120', '门户资讯', '10', '0', '1');
INSERT INTO `think_category` VALUES ('180', '120', '404', '10', '0', '1');
INSERT INTO `think_category` VALUES ('181', '120', '个人博客', '10', '0', '1');
INSERT INTO `think_category` VALUES ('182', '120', '笑话', '10', '0', '1');
INSERT INTO `think_category` VALUES ('183', '120', '网址导航', '10', '0', '1');
INSERT INTO `think_category` VALUES ('184', '120', '登录注册', '10', '0', '1');
INSERT INTO `think_category` VALUES ('185', '120', '个人中心', '10', '0', '1');
INSERT INTO `think_category` VALUES ('186', '120', 'app', '10', '0', '1');
INSERT INTO `think_category` VALUES ('187', '0', 'thinkphp', '18', '8', '1');
INSERT INTO `think_category` VALUES ('188', '187', 'Ajax', '12', '0', '1');
INSERT INTO `think_category` VALUES ('189', '187', 'Curl', '12', '0', '1');
INSERT INTO `think_category` VALUES ('190', '187', '上传', '12', '0', '1');
INSERT INTO `think_category` VALUES ('191', '187', '分页', '12', '0', '1');
INSERT INTO `think_category` VALUES ('192', '187', 'JSON', '12', '0', '1');
INSERT INTO `think_category` VALUES ('193', '187', '分类', '12', '0', '1');
INSERT INTO `think_category` VALUES ('194', '187', '函数', '12', '0', '1');
INSERT INTO `think_category` VALUES ('195', '187', '插件', '12', '0', '1');
INSERT INTO `think_category` VALUES ('196', '187', '表单', '12', '0', '1');
INSERT INTO `think_category` VALUES ('197', '187', 'Thinkphp', '12', '0', '1');
INSERT INTO `think_category` VALUES ('198', '187', '支付', '12', '0', '1');
INSERT INTO `think_category` VALUES ('199', '187', '手机', '12', '0', '1');
INSERT INTO `think_category` VALUES ('200', '187', '其他', '12', '0', '1');
INSERT INTO `think_category` VALUES ('201', '187', '微信', '12', '0', '1');

-- ----------------------------
-- Table structure for `think_channel`
-- ----------------------------
DROP TABLE IF EXISTS `think_channel`;
CREATE TABLE `think_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` char(50) DEFAULT NULL,
  `alias` char(50) DEFAULT NULL,
  `openid` char(64) DEFAULT NULL,
  `keywords` char(255) DEFAULT NULL,
  `description` char(200) DEFAULT NULL,
  `document` char(50) DEFAULT NULL,
  `template` char(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `allow` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_channel_id_alias_uindex` (`id`,`openid`),
  KEY `think_channel_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_channel
-- ----------------------------
INSERT INTO `think_channel` VALUES ('10', '0', '模板', 'template', 'b4c6afe2db70f7df3e14f9e7d73d4613', '', '', 'template', null, '6', '0', '1');
INSERT INTO `think_channel` VALUES ('11', '0', 'jQuery', 'jquery', '437425a6ef9cc9266118ef69ec3540ed', '', '', 'code', null, '7', '1', '1');
INSERT INTO `think_channel` VALUES ('12', '0', 'thinkphp', 'thinkphp', '11c6c955e34364d2c5ede8e94e782a21', '', '', 'article', null, '8', '1', '1');
INSERT INTO `think_channel` VALUES ('13', '0', '工具箱', 'gongjuxiang', '77f31eb78fb2f9363e0d666c9cf607e2', '', '', 'code', null, '999', '0', '1');
INSERT INTO `think_channel` VALUES ('17', '0', '问答', 'wenda', '4236ba96c442afefab0d9ef0cd004444', '', '', 'article', null, '9', '1', '1');
INSERT INTO `think_channel` VALUES ('18', '0', '博客', 'blog', 'b90390e5bacf07976cc74da203f9ce2e', '', '', 'article', null, '0', '1', '1');

-- ----------------------------
-- Table structure for `think_config`
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` char(120) DEFAULT NULL,
  `shortname` char(20) DEFAULT NULL,
  `thumb` char(255) DEFAULT NULL,
  `keywords` char(200) DEFAULT NULL,
  `description` char(120) DEFAULT NULL,
  `icp` char(50) DEFAULT NULL,
  `wcp` char(120) DEFAULT NULL,
  `linkman` char(50) DEFAULT '1',
  `mobile` char(50) DEFAULT NULL,
  `tell` char(120) DEFAULT NULL,
  `qq` char(20) DEFAULT NULL,
  `weixin` char(50) DEFAULT NULL,
  `email` char(120) DEFAULT NULL,
  `address` char(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_config_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_config
-- ----------------------------
INSERT INTO `think_config` VALUES ('1', 'DUOTHINK·多想素材站_发掘思维，想象无极限！免费素材_矢量图片_网页特效_网页模板_源码下载', 'Duothink', null, '网页特效,jquery特效,网页模板,素材,图片下载,设计素材,PSD素材,矢量,AI,CDR,EPS,设计素材,免费素材,thinkphp教程', '多想素材网是程序猿，设计猿最喜欢的素材分享下载站，其包括网页特效,jquery特效,网页模板,素材,图片下载,设计素材,PSD素材,矢量,AI素材,CDR素材,EPS素材,设计素材,免费素材,thinkphp教程，php技巧等素材分享网', '滇ICP备13003597号-14', '53080202000233', '', '', '', '', '', '', '', '1');

-- ----------------------------
-- Table structure for `think_document`
-- ----------------------------
DROP TABLE IF EXISTS `think_document`;
CREATE TABLE `think_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(50) DEFAULT NULL,
  `alias` char(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_document_id_uindex` (`id`),
  UNIQUE KEY `id` (`id`,`alias`),
  KEY `think_document_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_document
-- ----------------------------
INSERT INTO `think_document` VALUES ('1', '文章模型', 'article', '1');
INSERT INTO `think_document` VALUES ('2', '单页模型', 'page', '1');
INSERT INTO `think_document` VALUES ('3', '产品模型', 'product', '1');
INSERT INTO `think_document` VALUES ('4', '商品模型', 'shop', '1');
INSERT INTO `think_document` VALUES ('5', '住房租售', 'house', '1');
INSERT INTO `think_document` VALUES ('6', '招聘', 'jobs', '1');
INSERT INTO `think_document` VALUES ('7', '素材', 'material', '1');
INSERT INTO `think_document` VALUES ('8', '模板', 'template', '1');
INSERT INTO `think_document` VALUES ('9', '代码', 'code', '1');
INSERT INTO `think_document` VALUES ('10', '工具', 'tools', '1');

-- ----------------------------
-- Table structure for `think_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `think_navigation`;
CREATE TABLE `think_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `title` char(50) NOT NULL,
  `value` char(255) NOT NULL,
  `order` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '1',
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_navigation_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='站点导航';

-- ----------------------------
-- Records of think_navigation
-- ----------------------------
INSERT INTO `think_navigation` VALUES ('7', '0', '博客', 'blog', '0', '1', '1');
INSERT INTO `think_navigation` VALUES ('8', '0', '模板', 'template', '0', '1', '1');
INSERT INTO `think_navigation` VALUES ('9', '0', 'jQuery', 'jquery', '0', '1', '1');
INSERT INTO `think_navigation` VALUES ('10', '0', 'thinkphp', 'thinkphp', '0', '1', '1');
INSERT INTO `think_navigation` VALUES ('11', '0', '问答', 'wenda', '0', '1', '1');
INSERT INTO `think_navigation` VALUES ('12', '0', '工具箱', 'tools', '0', '1', '1');

-- ----------------------------
-- Table structure for `think_page`
-- ----------------------------
DROP TABLE IF EXISTS `think_page`;
CREATE TABLE `think_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '作者',
  `subject` char(200) DEFAULT NULL COMMENT '分类',
  `keywords` char(200) DEFAULT NULL,
  `description` char(200) DEFAULT NULL,
  `message` text,
  `ip` char(50) DEFAULT NULL COMMENT 'ip',
  `views` int(11) DEFAULT '0',
  `dateline` int(11) DEFAULT NULL COMMENT '发布时间',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_page_id_openid_uindex` (`id`),
  KEY `think_page_catid_uid_index` (`subject`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_page
-- ----------------------------

-- ----------------------------
-- Table structure for `think_reples`
-- ----------------------------
DROP TABLE IF EXISTS `think_reples`;
CREATE TABLE `think_reples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `message` text NOT NULL,
  `zan` int(11) DEFAULT '0',
  `cai` int(11) DEFAULT '0',
  `dateline` int(11) NOT NULL,
  `ip` char(50) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_reples
-- ----------------------------
INSERT INTO `think_reples` VALUES ('1', '0', '2', '1', '从这个角度看，更新的两个功能并没有帮上什么忙。\r\n\r\n', '0', '0', '1477962407', '127.0.0.1', '1');
INSERT INTO `think_reples` VALUES ('2', '0', '2', '1', '从这个角度看，更新的两个功能并没有帮上什么忙。\r\n\r\n', '0', '0', '1477962443', '127.0.0.1', '1');
INSERT INTO `think_reples` VALUES ('3', '0', '2', '1', '一个复杂的用户型产品，从用户运营角度上，用户金字塔可能有四级、五级，甚至更多级。但无论怎么讲，从有效的角度上讲，至少应该有三级。', '0', '0', '1477984527', '127.0.0.1', '1');
INSERT INTO `think_reples` VALUES ('4', '0', '1', '1', '昨日Uzi和旧爱辅助Tabe双排打Rank发生了一件趣事，Uzi在情急之下脱口而出喊了声：“Looper，哦不，Mata给我E，给我E啊。”喊了两遍名字都没喊对Tabe的名字。\r\n\r\n可是这会与他双排的人不是别人，正是他的第一任守护者Tabe，而不是他口中喊出的Mata，场面一度有点尴尬。Tabe此时心里不知道作何感想？从你拼命保护的辣个男人口中喊出的名字却不是你。', '0', '0', '1477984961', '127.0.0.1', '1');
INSERT INTO `think_reples` VALUES ('5', '0', '1', '1', 'alert(1111)', '0', '0', '1477986233', '127.0.0.1', '1');
INSERT INTO `think_reples` VALUES ('6', '0', '8', '1', '评论测试没有找到任何评论，沙发还在！', '0', '0', '1478243658', '127.0.0.1', '1');

-- ----------------------------
-- Table structure for `think_user`
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `uid` int(11) NOT NULL,
  `openid` char(64) DEFAULT NULL,
  `username` char(50) NOT NULL,
  `mobile` char(50) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `reg_time` int(11) DEFAULT NULL,
  `reg_ip` char(20) DEFAULT NULL,
  `last_login_time` int(11) DEFAULT NULL,
  `last_login_ip` char(20) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `think_user_uid_openid_uindex` (`uid`,`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', '6440abe399f8cece728ff8f7f8fbba1c', 'admin', '18087990440', '57736c32c18a61e6b7fd80e45b88eb4c42b9584c', '1473672824', '127.0.0.1', '1481103698', '127.0.0.1', '1');

-- ----------------------------
-- Table structure for `think_user_avatar`
-- ----------------------------
DROP TABLE IF EXISTS `think_user_avatar`;
CREATE TABLE `think_user_avatar` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `avatar` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_user_avatar_id_uid_uindex` (`id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user_avatar
-- ----------------------------
INSERT INTO `think_user_avatar` VALUES ('1', '1', '/static/i/avatar.png');

-- ----------------------------
-- Table structure for `think_user_score`
-- ----------------------------
DROP TABLE IF EXISTS `think_user_score`;
CREATE TABLE `think_user_score` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `think_user_score_id_uid_uindex` (`id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user_score
-- ----------------------------
