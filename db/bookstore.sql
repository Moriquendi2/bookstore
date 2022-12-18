/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 17/12/2022 19:07:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart_info
-- ----------------------------
DROP TABLE IF EXISTS `cart_info`;
CREATE TABLE `cart_info`  (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前状态—已结算/未结算',
  PRIMARY KEY (`user_id`, `goods_id`) USING BTREE,
  INDEX `goods_id_goodsinfo`(`goods_id`) USING BTREE,
  CONSTRAINT `cart_info_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `goods_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_info
-- ----------------------------
INSERT INTO `cart_info` VALUES (14, 8, 2, '已结算');
INSERT INTO `cart_info` VALUES (15, 6, 1, '已结算');
INSERT INTO `cart_info` VALUES (15, 29, 1, '已结算');
INSERT INTO `cart_info` VALUES (15, 35, 2, '已结算');
INSERT INTO `cart_info` VALUES (16, 1, 2, '已结算');
INSERT INTO `cart_info` VALUES (16, 7, 1, '已结算');
INSERT INTO `cart_info` VALUES (16, 11, 3, '已结算');
INSERT INTO `cart_info` VALUES (16, 21, 1, '未结算');
INSERT INTO `cart_info` VALUES (16, 27, 1, '已结算');
INSERT INTO `cart_info` VALUES (16, 29, 1, '未结算');
INSERT INTO `cart_info` VALUES (18, 2, 1, '已结算');
INSERT INTO `cart_info` VALUES (18, 20, 1, '已结算');
INSERT INTO `cart_info` VALUES (19, 33, 1, '已结算');
INSERT INTO `cart_info` VALUES (19, 44, 1, '已结算');
INSERT INTO `cart_info` VALUES (20, 33, 1, '已结算');
INSERT INTO `cart_info` VALUES (20, 50, 1, '已结算');
INSERT INTO `cart_info` VALUES (21, 21, 1, '已结算');
INSERT INTO `cart_info` VALUES (22, 4, 1, '已结算');
INSERT INTO `cart_info` VALUES (22, 28, 1, '已结算');
INSERT INTO `cart_info` VALUES (23, 26, 1, '已结算');
INSERT INTO `cart_info` VALUES (24, 1, 2, '已结算');
INSERT INTO `cart_info` VALUES (24, 10, 1, '已结算');
INSERT INTO `cart_info` VALUES (25, 10, 1, '已结算');
INSERT INTO `cart_info` VALUES (25, 18, 1, '已结算');
INSERT INTO `cart_info` VALUES (26, 10, 1, '已结算');
INSERT INTO `cart_info` VALUES (27, 16, 1, '已结算');
INSERT INTO `cart_info` VALUES (28, 33, 1, '已结算');
INSERT INTO `cart_info` VALUES (28, 50, 1, '已结算');
INSERT INTO `cart_info` VALUES (29, 42, 1, '已结算');
INSERT INTO `cart_info` VALUES (30, 22, 2, '已结算');
INSERT INTO `cart_info` VALUES (30, 45, 1, '已结算');
INSERT INTO `cart_info` VALUES (31, 24, 1, '已结算');
INSERT INTO `cart_info` VALUES (32, 47, 1, '已结算');
INSERT INTO `cart_info` VALUES (34, 10, 1, '已结算');
INSERT INTO `cart_info` VALUES (34, 37, 1, '已结算');
INSERT INTO `cart_info` VALUES (37, 34, 1, '已结算');
INSERT INTO `cart_info` VALUES (38, 20, 2, '已结算');
INSERT INTO `cart_info` VALUES (38, 30, 2, '已结算');
INSERT INTO `cart_info` VALUES (38, 45, 2, '已结算');
INSERT INTO `cart_info` VALUES (38, 46, 1, '已结算');
INSERT INTO `cart_info` VALUES (39, 16, 1, '已结算');
INSERT INTO `cart_info` VALUES (40, 5, 1, '已结算');
INSERT INTO `cart_info` VALUES (40, 8, 1, '已结算');
INSERT INTO `cart_info` VALUES (40, 11, 2, '已结算');
INSERT INTO `cart_info` VALUES (40, 26, 1, '已结算');
INSERT INTO `cart_info` VALUES (40, 34, 2, '已结算');
INSERT INTO `cart_info` VALUES (40, 37, 1, '已结算');
INSERT INTO `cart_info` VALUES (40, 49, 1, '已结算');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` decimal(10, 1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `belong` int(11) NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书封面的图片名称',
  PRIMARY KEY (`id`, `name`) USING BTREE,
  INDEX `goods_user`(`belong`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `goods_info_ibfk_1` FOREIGN KEY (`belong`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES (1, '《鲁滨逊漂流记》', '每一个陷入困境、孤立无援的人都该一读，这本书会让你更加强大。“英国小说之父”丹尼尔.笛福的传世之作，以全新面貌呈现，带我们重温经典。这是一个孤独无助的个体如何依靠意志和智慧在荒岛上求生的故事。', 29.88, '[英]丹尼尔·笛福', 8.9, '经典', 2, 'lubinxun1.png');
INSERT INTO `goods_info` VALUES (2, '《海底两万里》', '作者让读者登上“鹦鹉螺号”，以平均十二公里的时速，在将近十个月的海底旅行中，随着尼摩船长和他的“客人们”饱览海底变幻无穷的奇异景观和各类生物；航程中高潮迭起，有海底狩猎，参观海底森林，探访海底亚特兰蒂斯废墟，打捞西班牙沉船的财宝，目睹珊瑚王国的葬礼，与大蜘蛛、鲨鱼、章鱼搏斗， 击退土著人的围攻等等。', 40.98, '[法]儒勒·凡尔纳', 8.7, '科幻', 2, 'haidi.png');
INSERT INTO `goods_info` VALUES (3, '《美丽新世界》', '出版于一九三二年的《美丽新世界》是奥尔德斯•赫胥黎最杰出的代表作，是二十世纪最著名的反乌托邦文学经典之一，与奥威尔的《一九八四》、扎米亚京的《我们》并称为“反乌托邦”三部曲，在国内外文学界和思想界影响深远。这是一部寓言作品，展现了赫胥黎眼中的人类社会的未来图景：通过最有效的科学和心理工程，人类从遗传和基因上就已经被先天设计为各种等级的社会成员，完全沦为驯顺的机器，个性和自由被扼杀，文学艺术濒于毁灭。', 20.08, '[英]奥尔德斯·赫胥黎', 9.3, '经典', 3, 'meilixin1.png');
INSERT INTO `goods_info` VALUES (4, '《三国演义》', '《三国演义》又名《三国志演义》、《三国志通俗演义》，是我国小说史上最著名最杰出的长篇章回体历史小说。 《三国演义》的作者是元末明初人罗贯中，由毛纶，毛宗岗父子批改。在其成书前，“三国故事”已经历了数百年的历史发展过程。在唐代，三国故事已广为流传，连儿童都很熟悉。', 48.87, '罗贯中', 9.5, '经典', 9, 'sanguo2.png');
INSERT INTO `goods_info` VALUES (5, '《明朝那些事儿》', '《明朝那些事儿(增补版)(套装共9册)》主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。', 178.89, '当年明月', 9.5, '历史', 4, 'mingchao1.png');
INSERT INTO `goods_info` VALUES (6, '《我在雨中等你》', '一只名叫恩佐的狗，一点一滴地记录下主人丹尼，一个极富传奇故事的赛车手，在十年当中的悲欢离合。这里记录着恩佐和丹尼相依度过的风雨悲欢：当妻子凄凉死去，当岳父母和他反目成仇，当他镣铐加身被突然逮捕，唯有恩佐知道这一切。', 18.89, '[美]加斯·斯坦', 8.2, '畅销小说', 2, 'wozaiyuzhong.png');
INSERT INTO `goods_info` VALUES (7, '《我们仨》', '《我们仨》是钱钟书夫人杨绛撰写的家庭生活回忆录。1998年，钱钟书逝世，而他和杨绛唯一的女儿钱瑗已于此前（1997年）先他们而去。在人生的伴侣离去四年后，杨绛在92岁高龄的时候用心记述了他们这个特殊家庭63年的风风雨雨、点点滴滴，结成回忆录《我们仨》。', 20.06, '杨绛', 8.9, '纪实', 6, 'womensa.png');
INSERT INTO `goods_info` VALUES (8, '《The Little Prince》', '《小王子》不仅赢得了儿童读者，也为成年人所喜爱，作品凝练的语言渗透了作者对人类及人类文明深邃的思索。它所表现出的讽刺与幻想，真情与哲理，使之成为法国乃至世界上最为著名的一部童话小说。', 25.49, '[法]安托万·德·圣埃克苏佩里', 9.6, '外文原著', 7, 'xiaowangzi.png');
INSERT INTO `goods_info` VALUES (9, '《明朝那些事儿》', '《明朝那些事儿(增补版)(套装共9册)》主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。', 206.89, '当年明月', 9.5, '历史', 2, 'mingchao2.png');
INSERT INTO `goods_info` VALUES (10, '《挪威的森林》', '《挪威的森林》是日本作家村上春树所著的一部长篇爱情小说，影响了几代读者的青春名作。故事讲述主角渡边纠缠在情绪不稳定且患有精神疾病的直子和开朗活泼的小林绿子之间，苦闷彷徨，最终展开了自我救赎和成长的旅程。', 45.69, '[日]村上春树', 9.4, '畅销小说', 4, 'nuowei.png');
INSERT INTO `goods_info` VALUES (11, '《海边的卡夫卡》', '本书是村上春树仅次于《挪威的森林》的重要长篇小说，以其独特风格的两条平行线展开。一条平行线是少年“田村卡夫卡”，为了挣脱“你要亲手杀死父亲，与母亲乱伦”的诅咒，离开家乡投入成人世界。此后父亲在家被杀，他却疑心自己是在睡梦中杀父。', 35.59, '[日]村上春树', 8.0, '畅销小说', 5, 'haibian.png');
INSERT INTO `goods_info` VALUES (12, '《三体全集》', '刘慈欣的作品恢弘大气、想象绚丽，既注意极端空灵与厚重现实的结合，也讲求科学的内涵与人文的美感，具有浓郁的中国特色和鲜明的个人风格，为中国科幻确立了一个新高度。', 69.69, '刘慈欣', 9.4, '科幻', 6, 'santi1.png');
INSERT INTO `goods_info` VALUES (13, '《活着》', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。', 16.68, '余华', 9.4, '经典', 9, 'huozhe1.png');
INSERT INTO `goods_info` VALUES (14, '《悲惨世界》', '《悲惨世界(上中下)(精)》通过冉阿让等人的悲惨遭遇以及冉阿让被卞福汝主教感化后一系列令人感动的事迹，深刻揭露和批判了19世纪法国封建专制社会的腐朽本质及其罪恶现象，对穷苦人民在封建重压下所遭受的剥削欺诈和残酷迫害表示了悲悯和同情。', 35.69, '[法]雨果', 9.6, '经典', 2, 'beican1.png');
INSERT INTO `goods_info` VALUES (15, '《卡拉马佐夫兄弟》', '本书系俄国大作家陀思妥耶夫斯基代表作之一。小说通过一桩真实的弑父案，描写老卡拉马佐夫同三个儿子即两代人之间的尖锐冲突。老卡拉马佐夫贪婪好色，独占妻子留给儿子们的遗产，并与长子德米特里为一个风流女子争风吃醋。', 78.89, '[俄]陀思妥耶夫斯', 9.6, '经典', 5, 'kala1.png');
INSERT INTO `goods_info` VALUES (16, '《切尔诺贝利的祭祷》', '每一页都是奇异而残忍的故事，每一个故事都透视着俄国人的灵魂 。阿列克谢耶维奇探访事故发生地，历时数年，采访了超过500位灾难受害者，真实地记录人们的愤怒、恐惧、勇敢、同情和爱。她拼写出了一个时代的声音和一幅幅不同的人性图像。', 49.89, '[白俄]阿列克谢耶维奇', 9.0, '纪实', 3, 'qieernuo.png');
INSERT INTO `goods_info` VALUES (17, '《红楼梦》', '《红楼梦》是一部百科全书式的长篇小说。以宝黛爱情悲剧为主线，以四大家族的荣辱兴衰为背景，描绘出18世纪中国封建社会的方方面面，以及封建专制下新兴资本主义民主思想的萌动。结构宏大、情节委婉、细节精致，人物形象栩栩如生，声口毕现，堪称中国古代小说中的经 典。', 89.89, '[清]曹雪芹', 9.6, '经典', 8, 'honglou1.png');
INSERT INTO `goods_info` VALUES (18, '《美丽新世界》', '出版于一九三二年的《美丽新世界》是奥尔德斯•赫胥黎最杰出的代表作，是二十世纪最著名的反乌托邦文学经典之一，与奥威尔的《一九八四》、扎米亚京的《我们》并称为“反乌托邦”三部曲，在国内外文学界和思想界影响深远。这是一部寓言作品，展现了赫胥黎眼中的人类社会的未来图景：通过最有效的科学和心理工程，人类从遗传和基因上就已经被先天设计为各种等级的社会成员，完全沦为驯顺的机器，个性和自由被扼杀，文学艺术濒于毁灭。', 25.08, '[英]奥尔德斯·赫胥黎', 9.3, '经典', 5, 'meilixin2.png');
INSERT INTO `goods_info` VALUES (19, '《The Secret Garden\r\n》', '弗朗西丝·霍奇森·伯内特（1849年-1924），一位影响了整个20世纪的英国女作家，是最早使用现代心理描写手法进行少儿文学创作的作家之一。出于曼彻斯特，你亲早逝，家境贫寒。16岁时，弗朗西丝随全家移民美国；18岁时，开始发表作品；28风时，出版了她的第一部畅销书《劳瑞家的闺女》；62岁时，他作了她最著名最成功的作品《秘密花园》，奠定了她在英国文学史上举足轻重的地位。此外还有代表作品《小公主》、《小少爷方特罗伊》等，广爱欧美国家青少年的喜爱，都是世界文学宝库中的经典著作。', 25.36, 'Frances Hodgson Burnett', 8.5, '外文原著', 10, 'secretgarden1.png');
INSERT INTO `goods_info` VALUES (20, '《西游记》', '《西游记》主要描写的是孙悟空保唐僧西天取经，历经九九八十一难的故事。唐僧取经是历史上一件真实的事。大约距今一千三百多年前，即唐太宗贞观元年（627），年仅25岁的青年和尚玄奘离开京城长安，只身到天竺（印度）游学。他从长安出发后，途经中亚、阿富汗、巴基斯坦，历尽艰难险阻，最后到达了印度。他在那里学习了两年多，并在一次大型佛教经学辩论会任主讲，受到了赞誉。贞观十九年（645）玄奘回到了长安，带回佛经657部。', 47.20, '吴承恩', 9.0, '经典', 13, 'xiyou1.png');
INSERT INTO `goods_info` VALUES (21, '《第三帝国的兴亡（上下册）》', '《第三帝国的兴亡(套装上下册)》是全世界最畅销的反映纳粹德国历史的巨著。它精彩绝伦地记述了被希特勒称为“千秋帝国”（即第三帝国）从兴起到覆灭的全部过程。在短短的12年零4个月中，不可一世的第三帝国在人类历史上制造了惨绝人寰的灾难，留下了一段惊心动魄的历史。随着崩溃的迅速到来，人们缴获了大量秘密文件，私人日记、发言记录以及纳粹党领导人的电话录音！', 156.65, '[美]威廉•夏伊勒', 9.1, '历史', 4, 'disan1.png');
INSERT INTO `goods_info` VALUES (22, '《白夜行》', '本格推理小说年度BEST10第2名\r\n\r\n《白夜行》是东野圭吾迄今口碑最好的长篇杰作，具备经典名著的一切要素：\r\n\r\n一宗离奇命案牵出跨度近20年步步惊心的故事：悲凉的爱情、吊诡的命运、令人发指的犯罪、复杂人性的对决与救赎……', 39.50, '[日]东野圭吾', 9.2, '畅销小说', 11, 'baiye1.png');
INSERT INTO `goods_info` VALUES (23, '《房思琪的初恋乐园》', '令人心碎却无能为力的真实故事。\r\n\r\n向死而生的文学绝唱 打动万千读者的年度华语小说。\r\n\r\n李银河 戴锦华 骆以军 张悦然 冯唐 詹宏志 蒋方舟 史航 等多位学者作家社会名人郑重推荐。\r\n\r\n痛苦的际遇是如此难以分享，好险这个世界还有文学。', 45.00, '林奕含', 9.2, '畅销小说', 6, 'fangsiqi1.png');
INSERT INTO `goods_info` VALUES (24, '《神们自己》', '22世纪，地球可以和平行宇宙进行物质交换，从此拥有了源源不绝的能源。但是，只有几个人才知道危险的真相：地球上的一个无人信任的科学家、能源渐渐枯竭的星球上的一个外星人、月球上出生的一个拥有预言能力的人类。只有他们知道，人类即将为看似源源不绝的免费能源付出巨大的代价……', 39.00, '[美]艾萨克·阿西莫夫', 8.5, '科幻', 13, 'shenmen1.png');
INSERT INTO `goods_info` VALUES (25, '《The Wind in the Willows》', '《柳林风声(百年纪念珍藏版)》是一部童话，书中塑造了几个可爱的动物形象：胆小怕事、生性喜欢冒险的鼹鼠，热情好客、充满浪漫情趣的河鼠，侠义十足、具有领袖风范的狗獾，喜欢吹牛、追求时髦的蟾蜍，敦厚老实的水獭。小说生动地刻画了柳林中萦绕的友谊与温情。', 98.00, '[英]肯尼斯·格雷厄姆', 8.9, '外文原著', 8, 'liulin1.png');
INSERT INTO `goods_info` VALUES (26, '《人类简史》', '《人类简史：从动物到上帝》是以色列新锐历史学家尤瓦尔·赫拉利代表作品，书写从十万年前有生命迹象开始到21世纪资本、科技交织的人类发展史，将科学和历史编织在一起，从全新的角度阐述地球上智人的发展历史。', 68.00, '[以色列]尤瓦尔·赫拉利', 9.1, '历史', 11, 'renlei1.png');
INSERT INTO `goods_info` VALUES (27, '《卡拉马佐夫兄弟》', '本书系俄国大作家陀思妥耶夫斯基代表作之一。小说通过一桩真实的弑父案，描写老卡拉马佐夫同三个儿子即两代人之间的尖锐冲突。老卡拉马佐夫贪婪好色，独占妻子留给儿子们的遗产，并与长子德米特里为一个风流女子争风吃醋。', 45.37, '[俄]陀思妥耶夫斯', 9.6, '经典', 3, 'kala2.png');
INSERT INTO `goods_info` VALUES (28, '《水浒传》', '《水浒传》是我国第一部以农民起义为题材的长篇章回小说，是我国文学史上一座巍然屹立的丰碑，也是世界文学宝库中一颗光彩夺目的明珠。数百年来，它一直深受我国人民的喜爱，并被译为多种文字，成为我国流传最为广泛的古代长篇小说之一。', 26.69, '罗贯中/施耐庵', 8.7, '经典', 3, 'shuihu1.png');
INSERT INTO `goods_info` VALUES (29, '《三国演义》', '《三国演义》又名《三国志演义》、《三国志通俗演义》，是我国小说史上最著名最杰出的长篇章回体历史小说。 《三国演义》的作者是元末明初人罗贯中，由毛纶，毛宗岗父子批改。在其成书前，“三国故事”已经历了数百年的历史发展过程。在唐代，三国故事已广为流传，连儿童都很熟悉。', 53.36, '罗贯中', 9.5, '经典', 9, 'sanguo1.png');
INSERT INTO `goods_info` VALUES (30, '《三体全集》', '刘慈欣的作品恢弘大气、想象绚丽，既注意极端空灵与厚重现实的结合，也讲求科学的内涵与人文的美感，具有浓郁的中国特色和鲜明的个人风格，为中国科幻确立了一个新高度。', 69.69, '刘慈欣', 9.4, '科幻', 5, 'santi2.png');
INSERT INTO `goods_info` VALUES (31, '《翻身》', '《翻身》可以说是中国北方农村土地改革的一个缩影。全书共分7部，前2部介绍张庄的历史，后5部介绍工作队进驻张庄后所了解的情况以及领导那里的农民所进行的斗争。作者在书中热情地歌颂了中国共产党、毛主席领导下的伟大的土改和整党运动，生动地记录了张庄人民打碎封建枷锁，获得翻身解放的曲折过程。', 15.55, '[美]韩丁', 9.0, '纪实', 4, 'fanshen1.png');
INSERT INTO `goods_info` VALUES (32, '《Charlotte\'s Web》', 'Beloved by generations, Charlotte\'s Web and Stuart Little are two of the most cherished stories of all time. Now, for the first time ever, these treasured classics are available in lavish new collectors\' editions. ', 17.00, 'E.B. White', 9.0, '外文原著', 13, 'xialuo1.png');
INSERT INTO `goods_info` VALUES (33, '《倚天屠龙记》', '《倚天屠龙记》，金庸武侠小说，著于1961年，是“射雕三部曲”系列第三部，现收录在《金庸作品集》中。该书以元末群雄纷起、江湖动荡为广阔背景，叙述武当弟子张无忌的江湖生涯，表现众武林豪杰质朴自然，形态各异的精神风貌，展现其不可替代的人格力量。', 78.68, '金庸', 8.7, '畅销小说', 9, 'yitian1.png');
INSERT INTO `goods_info` VALUES (34, '《金色梦乡》', '平凡的送貨員──青柳雅春和多年不見的老友森田森吾偶遇，卻突然被告知首相即將被暗殺，而青柳則是兇手！還一頭霧水的青柳，早已成為警方不擇手段要緝捕的對象，更慘的是，馬上成為媒體炒作下十惡不赦的罪人，唯一的對策只有不斷的逃、逃、逃……', 35.00, '[日]伊坂幸太郎', 9.0, '畅销小说', 2, 'jinse1.png');
INSERT INTO `goods_info` VALUES (35, '《悲惨世界》', '《悲惨世界(上中下)(精)》通过冉阿让等人的悲惨遭遇以及冉阿让被卞福汝主教感化后一系列令人感动的事迹，深刻揭露和批判了19世纪法国封建专制社会的腐朽本质及其罪恶现象，对穷苦人民在封建重压下所遭受的剥削欺诈和残酷迫害表示了悲悯和同情。', 35.69, '[法]雨果', 9.6, '经典', 7, 'beican2.png');
INSERT INTO `goods_info` VALUES (36, '《Harry Potter and the Sorcerer\'s Stone》', 'Harry Potter has never played a sport while flying on a broomstick. He\'s never worn a Cloak of Invisibility, befriended a giant, or helped hatch a dragon.', 268.56, 'J.K. Rowling', 9.4, '外文原著', 3, 'hali1.png');
INSERT INTO `goods_info` VALUES (37, '《德意志的另一行泪》', '本书展现了很多鲜为人知的历史知识领域，其中包括德军的新兵生活、德国战俘经历、战地家信和家属寻亲、女性在战争中的命运、国际法对德军战时行为的影响、德军对游击战争的质疑和对策、战争难民的逃亡境遇、德国老兵的反思和反战立场。', 45.00, '朱维毅', 8.7, '纪实', 8, 'deyizhi1.png');
INSERT INTO `goods_info` VALUES (38, '《鲁滨逊漂流记》', '每一个陷入困境、孤立无援的人都该一读，这本书会让你更加强大。“英国小说之父”丹尼尔.笛福的传世之作，以全新面貌呈现，带我们重温经典。这是一个孤独无助的个体如何依靠意志和智慧在荒岛上求生的故事。', 16.88, '[英]丹尼尔·笛福', 8.9, '经典', 10, 'lubinxun2.png');
INSERT INTO `goods_info` VALUES (39, '《活着》', '《活着(新版)》讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病，福贵前去求药，却在途中被国民党抓去当壮丁。经过几番波折回到家里，才知道母亲早已去世，妻子家珍含辛茹苦地养大两个儿女。此后更加悲惨的命运一次又一次降临到福贵身上，他的妻子、儿女和孙子相继死去，最后只剩福贵和一头老牛相依为命，但老人依旧活着，仿佛比往日更加洒脱与坚强。', 20.01, '余华', 9.4, '经典', 12, 'huozhe2.png');
INSERT INTO `goods_info` VALUES (40, '《美丽新世界》', '出版于一九三二年的《美丽新世界》是奥尔德斯•赫胥黎最杰出的代表作，是二十世纪最著名的反乌托邦文学经典之一，与奥威尔的《一九八四》、扎米亚京的《我们》并称为“反乌托邦”三部曲，在国内外文学界和思想界影响深远。这是一部寓言作品，展现了赫胥黎眼中的人类社会的未来图景：通过最有效的科学和心理工程，人类从遗传和基因上就已经被先天设计为各种等级的社会成员，完全沦为驯顺的机器，个性和自由被扼杀，文学艺术濒于毁灭。', 25.08, '[英]奥尔德斯·赫胥黎', 9.3, '经典', 6, 'meilixin3.png');
INSERT INTO `goods_info` VALUES (41, '《国史大纲》', '這是一部中國通史，因用大學教科書體例寫成，不得不力求簡要，僅舉大納，刪其瑣節。內容於學術思想，政治制度，社會風氣，國際形勢，兼有顧及，惟但求其通為一體，明其治亂盛衰之所由，聞其一貫相承之為統，以指陳吾國家民族生命精神之所寄。', 89.87, '钱穆', 9.4, '历史', 12, 'guoshi1.png');
INSERT INTO `goods_info` VALUES (42, '《昨日的世界》', '作者以饱满真挚的感情、平实顺畅的文宇叙述了他所认识的特定时期的各种人物，他亲身经历的社会政治事件，他对那个动荡不安的时代的感受，记录了当时欧洲从一战前夜到二战欧洲危局的社会现实，批露了世界文化名人鲜为人知的生活轶事，同时穿插了作者各种细腻的心迹。', 45.80, '[奥] 斯蒂芬·茨威格', 9.2, '纪实', 4, 'zhuori1.png');
INSERT INTO `goods_info` VALUES (43, '《球状闪电》', '在某个离奇的雨夜，一颗球状闪电闯进了少年的视野。它的啸叫低沉中透着尖利，像是一个鬼魂在太古的荒原上吹着埙。当鬼魂奏完乐曲，球状闪电在一瞬间将少年的父母化为灰烬，而他们身下板凳却是奇迹般的冰凉。', 22.00, '刘慈欣', 8.7, '科幻', 13, 'qiuzhuang1.png');
INSERT INTO `goods_info` VALUES (44, '《安娜·卡列尼娜》', '《安娜·卡列尼娜》是托尔斯泰第二部里程碑式的长篇小说，创作于 1873—1877年。作品由两条既平行又相互联系的线索构成：一条是安娜与卡列宁、伏伦斯基之间的家庭、婚姻和爱情纠葛；一条是列文和吉娣的爱情生活及列文进行的庄园改革。', 58.95, '[俄] 列夫·托尔斯泰 ', 9.2, '经典', 11, 'anna1.png');
INSERT INTO `goods_info` VALUES (45, '《倾城之恋》', '《倾城之恋》是张爱玲的成名作与代表作。白流苏和范柳原这一对现实庸俗的男女，在战争的兵荒马乱之中被命运掷骰子般地掷到了一起，于“一刹那”体会到了“一对平凡的夫妻”之间的“一点真心”。', 30.00, '张爱玲', 9.0, '畅销小说', 10, 'qincheng1.png');
INSERT INTO `goods_info` VALUES (46, '《渴望生活——梵高传》', '渴望生活——梵高传》是欧文·斯通仅二十六岁时的作品。欧文·斯通认为，最能打动读者的不是名人深厚的成就和辉煌，而是他们追求和探索的过程。七十余年来，梵高悲惨而成就辉煌的人生震撼无数读者。这部作品也成为欧文·斯通的成名作，被译成八十余种文字，发行数千万册，感动亿万读者。', 25.64, '[美] 欧文·斯通', 9.2, '纪实', 8, 'kewang1.png');
INSERT INTO `goods_info` VALUES (47, '《枪炮、病菌与钢铁》', '在这部开创性的著作中，演化生物学家贾雷德.戴蒙德揭示了事实上有助于形成历史最广泛模式的环境因素，从而以震撼人心的力量摧毁了以种族主义为基础的人类史理论，因其突出价值和重要性，本书荣获1998年美国普利策奖和英国科普书奖，并为《纽约时报》畅销书排行榜作品。', 45.00, '[美] 贾雷德·戴蒙德', 9.4, '历史', 5, 'qiangpao1.png');
INSERT INTO `goods_info` VALUES (48, '《二手时间》', '本书是白俄罗斯著名作家阿列克谢耶维奇最新作品，通过口述采访的形式，展现身处关键历史时刻的普通人的生活。本书讲述了苏联解体后，1991年到2012年二十年间的痛苦的社会转型中，俄罗斯普通人的生活，为梦想破碎付出的代价。', 55.00, '[白俄] S. A. 阿列克谢耶维奇', 8.9, '纪实', 4, 'ershou1.png');
INSERT INTO `goods_info` VALUES (49, '《史记》', '史记是我国第一部通史。在史记之前，有以年代为次的“编年史”如春秋，有以地域为限的“国别史”如国语、战国策，有以文告档卷形式保存下来的“政治史”如尚书，可是没有上下几千年，包罗各方面，而又融会贯通，�络分明，像史记那样的通史。', 125.00, '司马迁/张守节', 9.5, '历史', 3, 'shiji1.png');
INSERT INTO `goods_info` VALUES (50, '《Animal Farm》', 'Since its publication in 1946, George Orwell\'s fable of a workers\' revolution gone wrong has rivaled Hemingway\'s The Old Man and the Sea as the Shortest Serious Novel It\'s OK to Write a Book Report About. ', 26.68, 'Eric Arthur Blair', 9.3, '外文原著', 7, 'animal1.png');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户类型',
  PRIMARY KEY (`id`, `name`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'root', '123456', 'root@gmail.com', '广东省广州市华南理工大学计算机学院', '18938705547', '管理员');
INSERT INTO `user_info` VALUES (2, '新华书店', 'xinhua', 'xinhua@qq.com', '北京市', '18935645987', '商家');
INSERT INTO `user_info` VALUES (3, '当当网自营', 'dangdang', 'dangdang@qq.com', '浙江省', '13745682626', '商家');
INSERT INTO `user_info` VALUES (4, '文轩网旗舰店', 'wenxuan', 'wenxuan@qq.com', '中国浙江省', '18756445656', '商家');
INSERT INTO `user_info` VALUES (5, '科学技术出版社专营店', 'kexue', 'kexuepub@gmail.com', '中国湖南省', '18964456466', '商家');
INSERT INTO `user_info` VALUES (6, '三联书店', 'sanlian', 'sanlian@qq.com', '中国北京市朝阳区', '18994466565', '商家');
INSERT INTO `user_info` VALUES (7, '上海译文', 'shanghai', 'shanghai@qq.com', '中国上海市', '13964664566', '商家');
INSERT INTO `user_info` VALUES (8, '电子科技出版社自营', 'dianzi', 'dianzi165@126.com', '中国四川省成都市', '19856563666', '商家');
INSERT INTO `user_info` VALUES (9, '译林出版自营', 'yilin', 'yilin16889@163.com', '中国上海市', '13566784498', '商家');
INSERT INTO `user_info` VALUES (10, '人民文学出版社', 'renmin', 'renmin@qq.com', '中国北京市', '18988844656', '商家');
INSERT INTO `user_info` VALUES (11, '读客官方旗舰店', 'duke', 'duke@qq.com', '中国湖南省', '13876465499', '商家');
INSERT INTO `user_info` VALUES (12, '商务印书馆', 'shangwu', 'shagnwu@qq.com', '中国上海市', '13498876566', '商家');
INSERT INTO `user_info` VALUES (13, '凤凰文艺出版社', 'fenghuang', 'fenghuang@qq.com', '中国浙江省', '18933654575', '商家');
INSERT INTO `user_info` VALUES (14, 'Saria', '123456', 'saria@qq.com', '华南理工大学大学城校区C7', '18934524744', '用户');
INSERT INTO `user_info` VALUES (15, 'Kalein', '123456', 'kalein@gmail.com', '中国广东省中山市', '18938705548', '用户');
INSERT INTO `user_info` VALUES (16, 'Gray', '123456', 'gray@126.com', '中国湖北省武汉', '18936548875', '用户');
INSERT INTO `user_info` VALUES (17, '张三', 'zhangsan', 'zhang3@163.com', '华南理工大学大学城校区C7', '13845646546', '用户');
INSERT INTO `user_info` VALUES (18, '赵六', 'zhao6', 'zhao6@qq.com', '华南理工大学大学城校区C0', '18935905581', '用户');
INSERT INTO `user_info` VALUES (19, '诸葛孔明', 'zhugeliang', 'zhugeliang@qq.com', '成都武侯祠165', '18556635546', '用户');
INSERT INTO `user_info` VALUES (20, 'Kaer', '123456', 'kaer@qq.com', '华南理工大学大学城校区C2', '13724524557', '用户');
INSERT INTO `user_info` VALUES (21, 'Tom', '123456', 'yanghaoxxxx@126.com', '中国广东省广州市', '18938705541', '用户');
INSERT INTO `user_info` VALUES (22, 'Poeke', '123456', 'poeke@163.com', '华南理工大学大学城校区C2', '17576788252', '用户');
INSERT INTO `user_info` VALUES (23, 'Molie', '123456', 'molie@qq.com', '广州工业大学大学城校区', '14727272577', '用户');
INSERT INTO `user_info` VALUES (24, '孙二娘', 'sunerliang', 'sunerliang@qq.com', '华南理工大学教学区', '17864826651', '用户');
INSERT INTO `user_info` VALUES (25, 'Geil', '123456', 'geil@163.com', '中国内蒙古呼和浩特', '18936565666', '用户');
INSERT INTO `user_info` VALUES (26, '张复', '123465', 'zhangfu@qq.com', '中国河北省石家庄', '17572247278', '用户');
INSERT INTO `user_info` VALUES (27, '王二', '123456', 'wanger@qq.com', '中国云南西双版纳', '18938706466', '用户');
INSERT INTO `user_info` VALUES (28, 'Amoe', '123456', 'amoe@qq.com', '华南理工大学大学城校区C1', '16546516511', '用户');
INSERT INTO `user_info` VALUES (29, '周文', '123456', 'zhou@qq.com', '广州中医药大学大学城校区', '18946454646', '用户');
INSERT INTO `user_info` VALUES (30, 'Casa', '123456', 'casa@gmail.com', '华南理工大学大学城校区C10', '19865165744', '用户');
INSERT INTO `user_info` VALUES (31, 'Frank', '123456', 'frank@163.com', '华南理工大学大学城校区C2', '15245254772', '用户');
INSERT INTO `user_info` VALUES (32, 'Rrane', '123456', 'rrane@126.com', '中国广东省广州市', '18938705541', '用户');
INSERT INTO `user_info` VALUES (33, 'Tomas', '123456', 'tomas87@163.com', '华南理工大学大学城校区C9', '17768767867', '用户');
INSERT INTO `user_info` VALUES (34, '李广利', '123456', 'liguang@126.com', '中国湖北省武汉', '18964656466', '用户');
INSERT INTO `user_info` VALUES (35, '荀彧', '123456', 'xunyu123@qq.com', '中国浙江省', '13456657966', '用户');
INSERT INTO `user_info` VALUES (36, 'Quel', '123456', 'quel1656@gmail.com', '华南理工大学大学城校区C7', '18966545665', '用户');
INSERT INTO `user_info` VALUES (37, '周登', 'zhoudeng', 'zhoudeng4@qq.com', '中国湖北省武汉市', '18745462233', '用户');
INSERT INTO `user_info` VALUES (38, 'Ben', '123456', 'ben1235@qq.com', '华南理工大学大学城校区C1', '19865464655', '用户');
INSERT INTO `user_info` VALUES (39, '赵量达', 'zhao', 'zhaold45@126.com', '中国湖南省', '18934465466', '用户');
INSERT INTO `user_info` VALUES (40, '王为', 'wangwei', 'wangwei@qq.com', '中国江苏省', '19864656633', '用户');

SET FOREIGN_KEY_CHECKS = 1;
