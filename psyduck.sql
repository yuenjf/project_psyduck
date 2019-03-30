/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : psyduck

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 30/03/2019 18:10:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categoryId`(`id`) USING BTREE,
  INDEX `categoryId_2`(`id`) USING BTREE,
  INDEX `categoryId_3`(`id`) USING BTREE,
  INDEX `categoryId_4`(`id`) USING BTREE,
  INDEX `categoryId_5`(`id`) USING BTREE,
  INDEX `categoryId_6`(`id`) USING BTREE,
  INDEX `categoryId_7`(`id`) USING BTREE,
  INDEX `categoryId_8`(`id`) USING BTREE,
  INDEX `categoryId_9`(`id`) USING BTREE,
  INDEX `categoryId_10`(`id`) USING BTREE,
  INDEX `categoryId_11`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '家常菜');
INSERT INTO `category` VALUES (2, '快手菜');
INSERT INTO `category` VALUES (3, '下饭菜');
INSERT INTO `category` VALUES (4, '早餐');
INSERT INTO `category` VALUES (5, '午餐');
INSERT INTO `category` VALUES (6, '肉');
INSERT INTO `category` VALUES (7, '鱼');
INSERT INTO `category` VALUES (8, '蔬菜');
INSERT INTO `category` VALUES (9, '汤羹');
INSERT INTO `category` VALUES (10, '烘焙');
INSERT INTO `category` VALUES (11, '凉菜');
INSERT INTO `category` VALUES (12, '主食');
INSERT INTO `category` VALUES (13, '面食');
INSERT INTO `category` VALUES (14, '素食');

-- ----------------------------
-- Table structure for recipe
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜谱ID',
  `createDate` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `coverPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面（图）',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `material` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '食材',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe
-- ----------------------------
INSERT INTO `recipe` VALUES (82, '2019-03-05 10:56:03', '健身菜单の香菇西兰花炒鸡胸肉', '/upload/cover/b3d6f7f1bd3d4930b6afad6e2ddc3198.png', '作为一个超级嘴馋的吃货，吃不够饱真是很悲伤的事情。所以在减脂期我首选的蔬菜是西兰花，低热量且饱腹感强，吃得饱饱又没有罪恶感', '西兰花	半朵\r\n鲜冬菇	3朵\r\n西芹	3根\r\n蒜	1瓣\r\n鸡胸肉	切粒七八块');
INSERT INTO `recipe` VALUES (86, '2019-03-12 11:05:22', '会吐舌头的大牙怪三明治', '/upload/cover/689ddc5544804c43b205c10c2b677e9a.jpg', '好早之前就在Pinterest上看到过这个三明治，但是一直没有买火腿于是就慢慢搁浅了。\r\n最近突然想起来于是想吃到百爪挠心，赶紧火急火燎的跑到超市特地买了火腿片回来做，这种心情你们一定懂我的对不对', '面包片	\r\n芝士片	\r\n火腿片	\r\n黄瓜	\r\n蓝莓');
INSERT INTO `recipe` VALUES (87, '2019-03-12 11:09:06', '虾仁炒面', '/upload/cover/44621e9491a94437ae77dabbc9cc6c5b.png', '时间：约5-10分钟\r\n难度：简单', '\r\n主料	\r\n面条	150g\r\n虾仁	120g\r\n小油菜	1颗\r\n蒜末	15g');
INSERT INTO `recipe` VALUES (89, '2019-03-12 11:21:10', '腐竹烧香菇', '/upload/cover/7d56a08a67f24b9cbdd6da3472bc2cef.jpg', '今天做好了发现很多朋友都喜欢吃腐竹\r\n临时写了这个菜谱\r\n除了提前泡发以外操作过程很简单\r\n当然你也可以去超市买泡发好的腐竹和新鲜香菇\r\n调料也简单\r\n你也可以根据口味自由发挥加入喜欢的肉或菜\r\n主要它真的很下饭', '\r\n腐竹	随意\r\n香菇	随意\r\n青红椒	点缀\r\n蚝油	适量\r\n老抽	少量增色\r\n食用油	适量\r\n水淀粉	少量');
INSERT INTO `recipe` VALUES (90, '2019-03-12 11:24:02', '黄金炸薯条', '/upload/cover/6ea30832b489404abbc001d804451532.jpg', '自己动手炸薯条，更酥脆健康哦。而且做法超级简单。大家都来试试吧。新手请务必仔细看小贴士！', '土豆	两个\r\n油	适量（至少能没过薯条1公分）\r\n盐	少许');
INSERT INTO `recipe` VALUES (93, '2019-03-12 03:17:42', '凉拌皮蛋豆腐', '/upload/cover/1e24c353958648b997745ee5db22965e.jfif', '好吃', '内脂豆腐 	300g\r\n皮蛋 	50g\r\n酱油 	适量\r\n老醋 	适量\r\n香油 	适量\r\n芝麻 	适量\r\n葱花 	适量 ');
INSERT INTO `recipe` VALUES (94, '2019-03-13 11:54:27', '一只番茄饭 番茄拌饭 ', '/upload/cover/085e3eb216eb498eb09734bb38867da8.png', '好吃番茄饭', '番茄 	\r\n胡萝卜 	\r\n玉米粒 	\r\n豆角 	\r\n火腿肠 	\r\n大米 	\r\n食用油 	\r\n盐 	\r\n黑胡椒');
INSERT INTO `recipe` VALUES (96, '2019-03-14 08:59:34', '菠萝炒饭', '/upload/cover/a0ac07a254f640cdb9688ff07fbcef32.jfif', '菠萝炒饭用菠萝做容器，造型可爱，酸甜可口，营养均衡。小朋友大朋友都喜欢。趁着菠萝大量上市的季节赶紧做起来吧^_^ ', '菠萝 	\r\n新鲜米饭 	\r\n鸡蛋 	\r\n胡萝卜 	\r\n黄瓜 	\r\n豌豆 	\r\n火腿肠 	\r\n花生油 	\r\n盐 	\r\n糖');
INSERT INTO `recipe` VALUES (97, '2019-03-14 09:01:40', '奶油面包卷【黄油】', '/upload/cover/763ef643493f40b4b3ae3a8013a98ec1.png', '这个奶油餐包卷蓬松柔软带一点弹性，属于基础软面包的面团，出来可以制作餐包卷，用来做包馅料的软面包也很合适。\r\n对于有些朋友家里没有配备厨师机的话，自己揉面也很简单，只是手法上要注意，还有温度的控制，不要听着这些就被吓到。\r\n碍于下厨房上传不了动图，还有上传不了视频，要不然看视频就更简单些\r\n也可以加我的微信跟我要视频，\"Shining2yazi\"不过一定要备注下厨房。不然我不会通过 的。\r\n好了，还有一些小细节我会在小贴士补充，还有什么不明白的跟我提问也行 ', '高筋面粉 	500g\r\n细砂糖 	60g\r\n奶粉 	15g\r\n蛋黄 	1颗\r\n盐 	10g\r\n冰水 	300g\r\n酵母 	6g\r\n无盐黄油 	70g ');
INSERT INTO `recipe` VALUES (98, '2019-03-14 09:04:55', '原味蛋糕卷(后蛋法)', '/upload/cover/9896f915f5fe4d72a54532f6e823304c.jfif', '里面有我的一点点小技巧。\r\n\r\n关于掉皮，火力不够！\r\n\r\n硅胶垫，油布上拿厨房纸巾薄薄抹一层油，可以防粘！\r\n\r\n中速打发蛋白！蛋白糊更细腻稳定，也不容易消泡\r\n\r\n也不会写菜谱，我再想起什么随时补充！ ', '鸡蛋 	5个\r\n牛奶 	50克\r\n玉米油 	50克\r\n白砂糖 	50克\r\n低筋面粉 	60克\r\n柠檬汁或白醋 	几滴 ');
INSERT INTO `recipe` VALUES (99, '2019-03-14 03:55:00', '西兰花鸡胸肉', '/upload/cover/b2623c8a08cc419f94e19533b94d33a9.jpg', '很清淡很好吃很好学会的一道菜 ', '西兰花 	1颗\r\n鸡胸肉 	\r\n蒜 	2瓣\r\n淀粉 	\r\n生抽 	\r\n胡椒粉 	\r\n盐');
INSERT INTO `recipe` VALUES (100, '2019-03-14 04:32:27', '葡式蛋挞', '/upload/cover/8f54dbfec82843e7a47fc76d2fb1ebd2.jfif', '我的冰箱里，经常都藏着这样的成品蛋挞皮，想吃的时候，花几分钟，自个调上这样一款懒人版蛋挞水，不一会儿，就能吃上无敌简单好吃的葡式蛋挞了。\r\n这要是再配上杯热红茶什么的，这小日子，一下就美啦美啦～～～ ', '淡奶油 	100g\r\n低粉 	15g\r\n蛋黄 	3个\r\n白糖 	18g\r\n牛奶 	110g ');

-- ----------------------------
-- Table structure for recipe_category
-- ----------------------------
DROP TABLE IF EXISTS `recipe_category`;
CREATE TABLE `recipe_category`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `recipeId` int(255) NULL DEFAULT NULL COMMENT '菜谱Id（外键）',
  `category` int(255) NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recipeId`(`recipeId`) USING BTREE,
  CONSTRAINT `recipe_category_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe_category
-- ----------------------------
INSERT INTO `recipe_category` VALUES (54, 82, 2);
INSERT INTO `recipe_category` VALUES (55, 82, 5);
INSERT INTO `recipe_category` VALUES (56, 82, 8);
INSERT INTO `recipe_category` VALUES (60, 86, 1);
INSERT INTO `recipe_category` VALUES (61, 86, 4);
INSERT INTO `recipe_category` VALUES (62, 86, 8);
INSERT INTO `recipe_category` VALUES (63, 87, 1);
INSERT INTO `recipe_category` VALUES (64, 87, 2);
INSERT INTO `recipe_category` VALUES (65, 87, 14);
INSERT INTO `recipe_category` VALUES (69, 89, 1);
INSERT INTO `recipe_category` VALUES (70, 89, 6);
INSERT INTO `recipe_category` VALUES (71, 89, 8);
INSERT INTO `recipe_category` VALUES (72, 90, 2);
INSERT INTO `recipe_category` VALUES (73, 90, 8);
INSERT INTO `recipe_category` VALUES (74, 90, 15);
INSERT INTO `recipe_category` VALUES (79, 93, 1);
INSERT INTO `recipe_category` VALUES (80, 94, 1);
INSERT INTO `recipe_category` VALUES (81, 94, 2);
INSERT INTO `recipe_category` VALUES (82, 94, 3);
INSERT INTO `recipe_category` VALUES (86, 96, 1);
INSERT INTO `recipe_category` VALUES (87, 96, 2);
INSERT INTO `recipe_category` VALUES (88, 96, 3);
INSERT INTO `recipe_category` VALUES (89, 97, 1);
INSERT INTO `recipe_category` VALUES (90, 97, 4);
INSERT INTO `recipe_category` VALUES (91, 97, 10);
INSERT INTO `recipe_category` VALUES (92, 98, 1);
INSERT INTO `recipe_category` VALUES (93, 98, 4);
INSERT INTO `recipe_category` VALUES (94, 98, 10);
INSERT INTO `recipe_category` VALUES (95, 99, 1);
INSERT INTO `recipe_category` VALUES (96, 99, 2);
INSERT INTO `recipe_category` VALUES (97, 99, 3);
INSERT INTO `recipe_category` VALUES (98, 100, 1);
INSERT INTO `recipe_category` VALUES (99, 100, 4);
INSERT INTO `recipe_category` VALUES (100, 100, 10);

-- ----------------------------
-- Table structure for recipe_step
-- ----------------------------
DROP TABLE IF EXISTS `recipe_step`;
CREATE TABLE `recipe_step`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `recipeId` int(11) NULL DEFAULT NULL COMMENT '菜谱ID（外键）',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细步骤',
  `filePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '步骤图地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recipeId`(`recipeId`) USING BTREE,
  CONSTRAINT `recipe_step_ibfk_1` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe_step
-- ----------------------------
INSERT INTO `recipe_step` VALUES (23, 82, '鸡胸肉洗净切粒，用盐、酱油、少许黑胡椒腌制可以腌多一点，备着下次煮（图中是我两餐的量了）', '/upload/stepFile/1983c1c5e3444facb959f2afe16c1143.jpg');
INSERT INTO `recipe_step` VALUES (24, 82, '食材洗净，西兰花切开，冬菇切丝，西芹切粒，蒜剁碎（我想吃蒜蓉味浓点，用了一大掰）', '/upload/stepFile/64ff7d11db7e4b75a1698dea254d07d5.jpg');
INSERT INTO `recipe_step` VALUES (25, 82, '西兰花先灼熟，捞起备用', '/upload/stepFile/8357d7630f7c47fa86bcea4c447c467b.jpg');
INSERT INTO `recipe_step` VALUES (26, 82, '热锅下油，倒入蒜末，翻炒一下放入冬菇', '/upload/stepFile/48ed6bb9c7d947b783ee6f75dbcc8c67.jpg');
INSERT INTO `recipe_step` VALUES (27, 82, '冬菇翻炒几秒，倒入鸡胸肉', '/upload/stepFile/d171556c3e774f9d9278a5e252b2077f.jpg');
INSERT INTO `recipe_step` VALUES (28, 82, '鸡胸肉炒至变色后放西兰花翻炒', '/upload/stepFile/dad8aa0569bc456ab35e393077a6b968.jpg');
INSERT INTO `recipe_step` VALUES (29, 82, '最后放入西芹，放盐，我呢再下了少许黑胡椒（按个人口味）', '/upload/stepFile/d76093d756fe47e984a0457dd223b04e.jpg');
INSERT INTO `recipe_step` VALUES (30, 82, '试下味，ok没问题，出锅', '/upload/stepFile/d2eea42766464cb2a5136b833e0a8695.jpg');
INSERT INTO `recipe_step` VALUES (34, 86, '先把吐司对半切开，用吐司机或者烤箱175摄氏度把面包片烤到微焦。\r\n如果都没有或者嫌麻烦的话也可以用平底锅中小火慢慢烘烤，反正只要两面都是焦黄就好啦。\r\n如如自己吃三明治的时候比较喜欢烤过的吐司的口感，如果更喜欢软软的吐司的话这一部可以省略哦。', '/upload/stepFile/616cc79fabf742098d5579168cc77309.jpg');
INSERT INTO `recipe_step` VALUES (35, 86, '芝士片切/剪成宽度相等的四条。\r\n黄瓜切成薄片。\r\n蓝莓对半切开。', '');
INSERT INTO `recipe_step` VALUES (36, 86, '之后就是组装啦。\r\n在半片吐司上放上露出半截的火腿片，在上面等距放上切/剪好的芝士条。\r\n盖上另外半片吐司之后放上黄瓜片和蓝莓做成眼睛就好啦。\r\n这么萌萌哒是不是就不忍心吃了呀。', '');
INSERT INTO `recipe_step` VALUES (37, 87, '面煮至八成熟，中间略有一点生，放入冷水中过一下。', '/upload/stepFile/b26b6eb896804f5296526df44d8d14cb.jpg');
INSERT INTO `recipe_step` VALUES (38, 87, '热锅凉油，倒入蒜末爆香锅，加入虾仁和生抽，炒至虾仁变色入味。', '/upload/stepFile/7be1bb38897c4d0eb987dd6421227b0e.jpg');
INSERT INTO `recipe_step` VALUES (39, 87, '锅中加入青菜、面、老抽、糖、盐、孜然，翻炒均匀。', '/upload/stepFile/e27fdca683df45fa89e61a4d7a830e52.jpg');
INSERT INTO `recipe_step` VALUES (43, 89, '腐竹和香菇泡发', '/upload/stepFile/9acc17a80fee4697ad3de28438a8dccd.jpg');
INSERT INTO `recipe_step` VALUES (44, 89, '泡发好的腐竹切寸段', '/upload/stepFile/d722352fdd63463ea1771754e05d6dfc.jpg');
INSERT INTO `recipe_step` VALUES (45, 89, '香菇切片（我今天用的新鲜香菇，味道没有干香菇浓郁）\r\n胡萝卜切片 配菜改刀', '/upload/stepFile/f0874ec627dd4056b98063e27badd4c4.jpg');
INSERT INTO `recipe_step` VALUES (46, 89, '热锅倒入食用油烧热 放入香菇炒香\r\n加入泡发好的腐竹和配菜翻匀\r\n倒入适量蚝油和一点老抽炒匀\r\n加入适量水（喜欢汤汁多拌饭吃的就稍微多一点点水）\r\n闷烧几分钟汤汁变浓稠或者勾水淀粉烧开就可以出锅了\r\n', '/upload/stepFile/2fb57ba20cf74259a13b456c348f159c.jpg');
INSERT INTO `recipe_step` VALUES (47, 90, '土豆两个洗干净，去皮。', '/upload/stepFile/27d0066c0f16420ea1580b240a17494c.jpg');
INSERT INTO `recipe_step` VALUES (48, 90, '切成0.7cm左右的条状，泡淡盐水10分钟', '/upload/stepFile/bf24212df2e14b2f89080e228b79ae8c.jpg');
INSERT INTO `recipe_step` VALUES (49, 90, '放入开水中煮三分钟', '/upload/stepFile/709baab2e3fc48ef9ef16cdd3abe4dff.jpg');
INSERT INTO `recipe_step` VALUES (50, 90, '捞出后沥干水份，放入冰箱冷冻（做多点冷冻方便下次食用，也可以不冻，但是必须完全沥干水分）', '/upload/stepFile/8df494c0c2724cadabf15401c69cf079.jpg');
INSERT INTO `recipe_step` VALUES (51, 90, '油锅烧到7分热（注意油的量要能充分盖过薯条，让薯条有浮起来离开锅底的空间），放入薯条（无需解冻），中火炸到淡黄色再转大火炸到金黄色（最后转大火一是为了上色，二是为了逼出含在薯条里的油分）', '/upload/stepFile/144905ee786f4d92af8f0beddade3d31.jpg');
INSERT INTO `recipe_step` VALUES (52, 90, '起锅撒上少许盐', '/upload/stepFile/dc6287342b8f46c0926b496fd5746b90.jpg');
INSERT INTO `recipe_step` VALUES (60, 93, '内脂豆腐去掉包装，不用切，成盒条状放在碟子上', '');
INSERT INTO `recipe_step` VALUES (61, 93, '皮蛋去壳，切成小粒然后铺在豆腐上', '');
INSERT INTO `recipe_step` VALUES (62, 93, '在豆腐和皮蛋粒上撒上葱花，把酱油、老醋、香油调匀淋上，再撒上点香芝麻即可', '');
INSERT INTO `recipe_step` VALUES (63, 94, '大米、蔬菜洗净。\r\n胡萝卜、火腿肠、豆角切丁。\r\n番茄去蒂，顶端画十字。\r\n将大米放入电饭煲，加水~（水比平时煮白米饭少一些）\r\n蔬菜放进去~\r\n放调料，食用油、盐、黑胡椒~\r\n按下“煮饭”键~', '/upload/stepFile/aa0b5140ca6a4a6fb023bd9e08963f27.jfif');
INSERT INTO `recipe_step` VALUES (64, 94, '出锅~\r\n拿勺子拌拌拌~', '/upload/stepFile/d3700c0e155e40b786368c3031c29c23.jfif');
INSERT INTO `recipe_step` VALUES (65, 94, '拌完~\r\n开吃', '/upload/stepFile/665866ad48564fc6baf608c852282a82.jfif');
INSERT INTO `recipe_step` VALUES (69, 96, '取一个菠萝对半切开。已经熟透了哦。', '/upload/stepFile/eb1da08f6445411884873bb7c45652fa.jfif');
INSERT INTO `recipe_step` VALUES (70, 96, '用刀在菠萝上划上印子，注意不要划通了o(>﹏<)o', '/upload/stepFile/cc12decf836a4f75a2a79374013fbc82.jfif');
INSERT INTO `recipe_step` VALUES (71, 96, '用勺子把菠萝肉挖出来，倒出底部的菠萝汁。', '/upload/stepFile/36d61866d7e14e11b80f39c744e659ba.jfif');
INSERT INTO `recipe_step` VALUES (72, 97, '将事先准备好的材料放入搅拌盆中除了黄油以外。\r\n这里解释一下为什么要放冰水，因为在搅拌过程中面团摩擦容易产生热量，会导致最后做出来的面包，口感会偏干', '/upload/stepFile/254fc53472b64927b1c2832886f26e37.jfif');
INSERT INTO `recipe_step` VALUES (73, 97, '搅拌的时候，调慢速（如果没有厨师机的话，用刮刀搅拌也是可以的）', '/upload/stepFile/c04f3b6673b2474f8c71ac5033e3b852.png');
INSERT INTO `recipe_step` VALUES (74, 97, '搅拌至有点起筋就可以放入黄油', '/upload/stepFile/fe4589f7787c4ddfb89dfb9efe7ef7b4.jfif');
INSERT INTO `recipe_step` VALUES (77, 98, '牛奶和玉米油混合，用蛋抽搅拌均匀，筛入低粉，用蛋抽划Z字粗略拌匀，分离蛋清和蛋黄', '/upload/stepFile/543d5c40c2244e82b9ae18eff67ab8bf.jfif');
INSERT INTO `recipe_step` VALUES (78, 98, '将加入的蛋黄的面糊用手抽划一字拌匀，面糊很细腻，而且很快就可以拌匀，这就是后蛋法', '/upload/stepFile/6398f57532d34b47b1971e12bb11df02.jfif');
INSERT INTO `recipe_step` VALUES (79, 98, '重要的一步，过筛蛋黄糊！借用刮刀，过筛后的蛋黄糊特别细腻', '/upload/stepFile/81ad29cd51e943498ad62242f2867496.jfif');
INSERT INTO `recipe_step` VALUES (80, 98, '蛋白加几滴柠檬汁中速打至变白并有丰富的大气泡时加入三分之一的白砂糖，蛋白打至细腻时再加入三分之一的白砂糖，蛋白打至有纹路出现时加入最后的三分之一白砂糖。打发至湿性发泡，提起打蛋头有大弯钩出现即可', '/upload/stepFile/924d504ead9a415dab2acd09ec51e601.jfif');
INSERT INTO `recipe_step` VALUES (81, 98, '将三分之一的蛋白舀入蛋黄糊中翻拌均匀，然后将面糊全部倒入蛋白盆里，翻拌加切拌均匀，并适当转动打蛋盆。\r\n拌好的面糊从15厘米高处倒入垫了油纸或是油布或是硅胶垫的28*28的金盘中，借用刮板轻轻刮平表面。轻轻震几下，震破表面的大气泡', '/upload/stepFile/245b60cf60ed4dbf9446ed65f4cb3725.jfif');
INSERT INTO `recipe_step` VALUES (82, 98, '放入预热好的烤箱中层，160度25分钟，或是175度20分钟都可以，看自己烤箱的脾气吧，后五分钟开热风循环烤，可以将表皮烤硬，出炉后使劲震下烤盘，让热气散出，连同油布或油纸一起拽出放烤架上稍晾几分钟，撕开包裹着蛋糕卷的油布或油纸散热。做正卷就在蛋糕卷上铺一层油纸，翻过来，借助擀面杖将蛋糕卷卷起来，定型几分钟再打开，再将蛋糕卷适当卷紧就好啦', '/upload/stepFile/b295172987794ccebfd58718820d7faa.jfif');
INSERT INTO `recipe_step` VALUES (83, 99, '鸡胸肉切小块，加生粉、生抽、胡椒粉、盐腌制20分钟。', '/upload/stepFile/3c57c7a4b6e74953b3e72384efd67e92.jfif');
INSERT INTO `recipe_step` VALUES (84, 99, '西兰花切小朵，放入锅内用水煮至有点熟时，起锅', '/upload/stepFile/b78dd958cb80498bbcd4117f82c3beee.jfif');
INSERT INTO `recipe_step` VALUES (85, 99, '热锅放油，放蒜爆香，放入鸡胸肉，翻炒至变色变熟', '/upload/stepFile/eeeb00740ca3485593e4d96ce804cb15.jfif');
INSERT INTO `recipe_step` VALUES (86, 99, '加入西兰花，放盐、生抽调味，一起翻炒，味道合适时起锅', '/upload/stepFile/57114301fb0f4d50866f2cff63f5be4e.jfif');
INSERT INTO `recipe_step` VALUES (87, 100, '把淡奶油装入稍大点的容器里，加入牛奶拌匀', '/upload/stepFile/d6daddcc0cbe45d0b4fc654604c04c1f.jfif');
INSERT INTO `recipe_step` VALUES (88, 100, '加入白糖，隔水加热，搅拌至白糖全部溶化', '/upload/stepFile/459696772d4e4982bf06d26554ca6d4b.jfif');
INSERT INTO `recipe_step` VALUES (89, 100, '待放冷后，再分多次加入低粉，彻底搅拌均匀', '/upload/stepFile/7f1f3992333a43e49d063d420e14aa03.jfif');
INSERT INTO `recipe_step` VALUES (90, 100, '蛋黄打散成蛋液，混合到奶液里拌匀做成挞水', '/upload/stepFile/ca6cdf2c3e684c399ddf52560fb42c97.jfif');
INSERT INTO `recipe_step` VALUES (91, 100, '把做好的挞水倒入挞皮里，装到7分满', '/upload/stepFile/b2f41beb4e984b0b81185f3892412363.jfif');
INSERT INTO `recipe_step` VALUES (92, 100, '烤箱预热220度，烤25分钟左右即可', '/upload/stepFile/dd0ce8699556437e82a949b5363f79a0.jfif');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `createDate` date NOT NULL COMMENT '创建时间',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `protrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2019-02-28', 'admin', 'admin', NULL, NULL);
INSERT INTO `user` VALUES (22, '2019-03-04', 'yjf291488593', '111111', NULL, NULL);
INSERT INTO `user` VALUES (45, '2019-03-12', 'AmyTuy', '111111', NULL, NULL);
INSERT INTO `user` VALUES (46, '2019-03-12', 'TheOne', '111111', NULL, NULL);
INSERT INTO `user` VALUES (47, '2019-03-12', 'codxd666', '111111', NULL, NULL);

-- ----------------------------
-- Table structure for user_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(255) NULL DEFAULT NULL COMMENT '用户id（外键）',
  `collection` int(255) NULL DEFAULT NULL COMMENT '用户收藏的菜谱id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_collection_ibfk_1`(`userId`) USING BTREE,
  CONSTRAINT `user_collection_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_collection
-- ----------------------------
INSERT INTO `user_collection` VALUES (4, 22, 91);
INSERT INTO `user_collection` VALUES (5, 22, 93);
INSERT INTO `user_collection` VALUES (64, 22, 94);
INSERT INTO `user_collection` VALUES (65, 22, 90);
INSERT INTO `user_collection` VALUES (66, 22, 87);
INSERT INTO `user_collection` VALUES (69, 47, 98);
INSERT INTO `user_collection` VALUES (76, 47, 87);
INSERT INTO `user_collection` VALUES (77, 22, 100);
INSERT INTO `user_collection` VALUES (78, 22, 101);
INSERT INTO `user_collection` VALUES (79, 22, 99);
INSERT INTO `user_collection` VALUES (80, 22, 96);
INSERT INTO `user_collection` VALUES (81, 22, 98);

-- ----------------------------
-- Table structure for user_createrecipe
-- ----------------------------
DROP TABLE IF EXISTS `user_createrecipe`;
CREATE TABLE `user_createrecipe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(255) NULL DEFAULT NULL COMMENT '用户Id（外键）',
  `createRecipe` int(255) NULL DEFAULT NULL COMMENT '用户创建的菜谱',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建菜谱的用户名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `user_createrecipe_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_createrecipe
-- ----------------------------
INSERT INTO `user_createrecipe` VALUES (16, 22, 82, 'yjf291488593');
INSERT INTO `user_createrecipe` VALUES (20, 45, 86, 'AmyTuy');
INSERT INTO `user_createrecipe` VALUES (21, 45, 87, 'AmyTuy');
INSERT INTO `user_createrecipe` VALUES (23, 46, 89, 'TheOne');
INSERT INTO `user_createrecipe` VALUES (24, 46, 90, 'TheOne');
INSERT INTO `user_createrecipe` VALUES (27, 22, 93, 'yjf291488593');
INSERT INTO `user_createrecipe` VALUES (28, 22, 94, 'yjf291488593');
INSERT INTO `user_createrecipe` VALUES (30, 22, 96, 'yjf291488593');
INSERT INTO `user_createrecipe` VALUES (31, 22, 97, 'yjf291488593');
INSERT INTO `user_createrecipe` VALUES (32, 22, 98, 'yjf291488593');
INSERT INTO `user_createrecipe` VALUES (33, 47, 99, 'codxd666');
INSERT INTO `user_createrecipe` VALUES (34, 46, 100, 'TheOne');

SET FOREIGN_KEY_CHECKS = 1;
