-- Adminer 4.7.7 PostgreSQL dump

\connect "library";

DROP TABLE IF EXISTS "auth_group";
DROP SEQUENCE IF EXISTS auth_group_id_seq;
CREATE SEQUENCE auth_group_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group" (
    "id" integer DEFAULT nextval('auth_group_id_seq') NOT NULL,
    "name" character varying(150) NOT NULL,
    CONSTRAINT "auth_group_name_key" UNIQUE ("name"),
    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING btree ("name");


DROP TABLE IF EXISTS "auth_group_permissions";
DROP SEQUENCE IF EXISTS auth_group_permissions_id_seq;
CREATE SEQUENCE auth_group_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group_permissions" (
    "id" integer DEFAULT nextval('auth_group_permissions_id_seq') NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id"),
    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING btree ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING btree ("permission_id");


DROP TABLE IF EXISTS "auth_permission";
DROP SEQUENCE IF EXISTS auth_permission_id_seq;
CREATE SEQUENCE auth_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_permission" (
    "id" integer DEFAULT nextval('auth_permission_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename"),
    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING btree ("content_type_id");

INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1,	'Can add log entry',	1,	'add_logentry'),
(2,	'Can change log entry',	1,	'change_logentry'),
(3,	'Can delete log entry',	1,	'delete_logentry'),
(4,	'Can view log entry',	1,	'view_logentry'),
(5,	'Can add permission',	2,	'add_permission'),
(6,	'Can change permission',	2,	'change_permission'),
(7,	'Can delete permission',	2,	'delete_permission'),
(8,	'Can view permission',	2,	'view_permission'),
(9,	'Can add group',	3,	'add_group'),
(10,	'Can change group',	3,	'change_group'),
(11,	'Can delete group',	3,	'delete_group'),
(12,	'Can view group',	3,	'view_group'),
(13,	'Can add user',	4,	'add_user'),
(14,	'Can change user',	4,	'change_user'),
(15,	'Can delete user',	4,	'delete_user'),
(16,	'Can view user',	4,	'view_user'),
(17,	'Can add content type',	5,	'add_contenttype'),
(18,	'Can change content type',	5,	'change_contenttype'),
(19,	'Can delete content type',	5,	'delete_contenttype'),
(20,	'Can view content type',	5,	'view_contenttype'),
(21,	'Can add session',	6,	'add_session'),
(22,	'Can change session',	6,	'change_session'),
(23,	'Can delete session',	6,	'delete_session'),
(24,	'Can view session',	6,	'view_session'),
(25,	'Can add author',	7,	'add_author'),
(26,	'Can change author',	7,	'change_author'),
(27,	'Can delete author',	7,	'delete_author'),
(28,	'Can view author',	7,	'view_author'),
(29,	'Can add book',	8,	'add_book'),
(30,	'Can change book',	8,	'change_book'),
(31,	'Can delete book',	8,	'delete_book'),
(32,	'Can view book',	8,	'view_book'),
(33,	'Can add genre',	9,	'add_genre'),
(34,	'Can change genre',	9,	'change_genre'),
(35,	'Can delete genre',	9,	'delete_genre'),
(36,	'Can view genre',	9,	'view_genre'),
(37,	'Can add book instance',	10,	'add_bookinstance'),
(38,	'Can change book instance',	10,	'change_bookinstance'),
(39,	'Can delete book instance',	10,	'delete_bookinstance'),
(40,	'Can view book instance',	10,	'view_bookinstance');

DROP TABLE IF EXISTS "auth_user";
DROP SEQUENCE IF EXISTS auth_user_id_seq;
CREATE SEQUENCE auth_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user" (
    "id" integer DEFAULT nextval('auth_user_id_seq') NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamptz NOT NULL,
    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_username_key" UNIQUE ("username")
) WITH (oids = false);

CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING btree ("username");

INSERT INTO "auth_user" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "email", "is_staff", "is_active", "date_joined") VALUES
(1,	'pbkdf2_sha256$216000$Zi41gGkLCPvs$GlIwLDOeEm31Vg+R37vKhcKUBMwB2yjEfgvjiUhQT4I=',	'2021-02-17 16:13:00.051535+08',	't',	'admin',	'',	'',	'm0724001@gm.nuu.edu.tw',	't',	't',	'2021-02-17 16:12:36.920275+08');

DROP TABLE IF EXISTS "auth_user_groups";
DROP SEQUENCE IF EXISTS auth_user_groups_id_seq;
CREATE SEQUENCE auth_user_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_groups" (
    "id" integer DEFAULT nextval('auth_user_groups_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL,
    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id"),
    CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING btree ("group_id");

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING btree ("user_id");


DROP TABLE IF EXISTS "auth_user_user_permissions";
DROP SEQUENCE IF EXISTS auth_user_user_permissions_id_seq;
CREATE SEQUENCE auth_user_user_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_user_permissions" (
    "id" integer DEFAULT nextval('auth_user_user_permissions_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id"),
    CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING btree ("permission_id");

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING btree ("user_id");


DROP TABLE IF EXISTS "catalog_author";
DROP SEQUENCE IF EXISTS catalog_author_id_seq;
CREATE SEQUENCE catalog_author_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."catalog_author" (
    "id" integer DEFAULT nextval('catalog_author_id_seq') NOT NULL,
    "first_name" character varying(100) NOT NULL,
    "last_name" character varying(100) NOT NULL,
    "date_of_birth" date,
    "date_of_death" date,
    CONSTRAINT "catalog_author_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "catalog_author" ("id", "first_name", "last_name", "date_of_birth", "date_of_death") VALUES
(1,	'ziyi',	'wang',	'2021-02-17',	NULL),
(2,	'康彬',	'李',	NULL,	NULL),
(3,	'訓練中心',	'醜小鴨咖啡師',	NULL,	NULL),
(4,	'咖啡拉花藝術認證所',	'LAGS.tw',	NULL,	NULL),
(5,	'時代社區',	'DevOps',	NULL,	NULL),
(6,	'書敏',	'胡',	NULL,	NULL);

DROP TABLE IF EXISTS "catalog_book";
DROP SEQUENCE IF EXISTS catalog_book_id_seq;
CREATE SEQUENCE catalog_book_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."catalog_book" (
    "id" integer DEFAULT nextval('catalog_book_id_seq') NOT NULL,
    "title" character varying(200) NOT NULL,
    "summary" text NOT NULL,
    "isbn" character varying(13) NOT NULL,
    "author_id" integer,
    CONSTRAINT "catalog_book_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "catalog_book_author_id_b0849980_fk_catalog_author_id" FOREIGN KEY (author_id) REFERENCES catalog_author(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "catalog_book_author_id_b0849980" ON "public"."catalog_book" USING btree ("author_id");

INSERT INTO "catalog_book" ("id", "title", "summary", "isbn", "author_id") VALUES
(1,	'小咖啡熊熊',	'泰迪熊 咖啡色 掉毛',	'1122334455667',	1),
(2,	'咖啡歐爸的彩繪拉花 (電子書)',	'IG 26萬粉絲狂推轉發，CNN等國外媒體爭相報導！
韓國超人氣歐爸咖啡師的「彩繪拉花(Creamart)」，席捲來台！

　　★不敢相信！突破單一色調、固定圖案，顛覆拉花的視覺饗宴大公開！
　　★讓梵谷〈星夜〉、孟克〈吶喊〉等經典畫作，在咖啡上全彩呈現！

　　看膩了線條簡單的拉花，這次，直接在咖啡上畫一幅畫吧！
　　不論你是每日必來一杯的咖啡愛好者；或是正鑽研於拉花的咖啡從業者，
　　跟著彩繪拉花大師STEP BY STEP，咖啡的「顏值」和「吸睛度」可以完全不一樣。

　　▎韓國人瘋狂朝聖的最強咖啡拉花，各式主題不藏私全收錄—–

　　作者經營的咖啡廳，被網友列為首爾「必訪」景點，
　　因為畫風多元創意、精細度極高的「彩繪拉花」，給人滿滿視覺震撼！
　　本書收錄最具代表性的7大主題，共63款手繪作品教學，
　　從經典「世界名畫」到各地「旅遊景點」；從童趣「卡通動物」到溫暖「手寫字跡」，
　　還有注入巧思，讓畫面「衝出杯緣」或「像是在動」的特別設計，每款都能賦予咖啡新的生命！

　　▎初學者也能仿真大師級作品！在家就可以自己完成—–

　　為了方便上色、延長展示時間，「彩繪拉花」是用「鮮奶油」搭配「冷飲」基底，
　　以「天然食用色漿」為顏料，取「拉花筆」或「湯匙」為工具，
　　不但省去傳統拉花繁複的打奶泡環節，也不用趁高溫急迫完成，
　　只要耐心跟著本書圖解，一步步如畫油畫般堆疊、描繪圖案，
　　第一次嘗試也能有很高的完成度，甚至原汁還原經典畫作！',	'9789861304267',	2),
(3,	'咖啡拉花技術大全 (電子書)',	'顛覆一般拉花思維，抓到訣竅就能拉出達人級拉花！
　　只要擁有這一本，保證您一定能成為拉花達人！

　　醜小鴨咖啡師訓練中心在出版了銷售上萬冊的《咖啡究極講座》、《手沖咖啡大全》、《手沖咖啡大全2——完美萃取》、《醜小鴨咖啡烘焙書》後，將正式出版許多讀者殷殷企盼的的咖啡拉花教學手冊，書籍內容一如既往的以專業教學書的形式呈現，讓想要成為拉花高手的朋友，可以在閱讀本書後，學習到咖啡拉花的正確知識、觀念，就算是在家自學也能輕鬆成為咖啡拉花職人。

　　★咖啡拉花的基底——義式濃縮咖啡
　　義式濃縮咖啡是咖啡拉花的基底，要調製一杯好喝又好看的咖啡拉花，萃取美味的濃縮咖啡是不可或缺的第一步。使用義式濃縮咖啡製作拉花，將咖啡與蒸奶充分融和為一體，讓奶泡能夠上浮在表面恣意的流動，運用拉花技巧將奶泡延展成各式圖形。

　　★關於拉花所使用的器具
　　一般市售的鋼杯基本上都具有不錯的品質，因此挑選的器具的重點應在於合適與否，先瞭解器具的差異，容易挑選出符合自身需求的工具，拉花鋼杯會因為品牌的不同，而在細節處有所差異並各自擁有優缺點。拉花鋼杯杯嘴的型態，在拉花時扮演著很重要的角色，依據杯嘴的型態，大致可分成長嘴、短嘴、尖口與圓口、以及平口和杯嘴外翻。

　　★蒸奶泡沫的質與量
　　用蒸奶泡沫製作的咖啡，最令人嚮往的就是牛奶泡沫帶出的迷人質地，牛奶泡沫的口感，除了來自於氣泡的輕盈感之外，氣泡與牛奶融合所展現的柔滑質地更是奶泡製作的重點，要是做不到這一點，不論濃縮咖啡煮得再好，也不可能成為美味的咖啡牛奶。

　　★蒸奶與咖啡的融合
　　融合是讓咖啡牛奶美味的秘訣，咖啡牛奶的美味不單單是咖啡加上牛奶的甜味，而是由於咖啡和蒸奶充分結合所帶出的甘甜與滑順口感，因為蒸奶的融入讓咖啡的風味得以展現出不同的特色。

　　★咖啡拉花實作
　　白色小圓點是所有拉花的起點，也是控制奶泡浮在表面的基本功，一個小圓點可以慢慢堆成一個大圓形、也能拉長變成線條，光是這樣的點和線搭配上不同技巧的運用，就能創造出許多有趣的圖形。',	'9789864757893',	3),
(4,	'咖啡拉花全技巧：Step by Step新手也能學會的25款創意拉花 (電子書)',	'同樣的步驟，
為什麼有人拉出來的圖案比較好看？
成功的咖啡拉花，
應該先學會煮好Espresso！？
尖嘴、圓嘴，同樣是拉花鋼杯，應該怎麼挑才對！？
從拉花原理、器材挑選，到步驟示範，
解析咖啡拉花關鍵祕訣，
拉花技巧一次學到位！

　　．拉花道具全解析
　　學拉花就要先從了解使用道具開始，解析咖啡機、拉花鋼杯、咖啡杯等，條列出細微卻不可忽略的挑選重點，教你成功跨出拉花第一步。

　　．拉花步驟step by step
　　從最基礎的圓形開始，進階到創意圖形，詳細圖解步驟，不只看得懂，更能輕鬆簡單學會咖啡拉花。

　　隨著台灣咖啡館產業的興起，大家對咖啡要求愈來愈高，不再只是單純滿足於喝咖啡，對於原本只是做為配角的咖啡拉花，也從單純的綿密奶泡，延伸成一種圖像藝術的表現，在國際上除了咖啡師等級認證，亦有咖啡拉花等級認證，由此可見咖啡拉花不僅拘限在台灣，在國際上的地位也越趨重要。

　　本書便從咖啡拉花的原理開始，讓讀者先了解咖啡拉花的原理，接著再對咖啡拉花使用的機器與使用器具進行解析，在有了基礎概念，並知道怎麼挑選工具後，接著便提供25款創意拉花，並藉由每個詳細清楚的步驟圖，讓所有對咖啡拉花有興趣的人，可以step by step一起跟著學會拉花。

本書特色

　　○提供讀者25款從基礎到創意的咖啡拉花步圖案。
　　○解析咖啡拉花原理，並詳解使用器材挑選重點。
　　○步驟全圖解，讀者可以簡單看，輕鬆學得會。',	'9789864755608',	4),
(5,	'DevOps三十六計',	'新型的DevOps涵蓋了從需求提出到軟體發佈的整個軟體生命週期，是產品設計、專案管理、開發、測試和營運效率提升的必經之路，許多大型企業已經做了很多探索，並將相關技能規範化、文件化、工具化、自動化甚至智慧化。遺憾的是，這些寶貴經驗往往僅在團隊或公司內部分享，很多中小公司還在重複走著大公司走過的彎路。

　　本書集結了40位業界專家的經驗分享，從精實、敏捷、開發、測試、維運、架構、安全等各個方面分享他們在實務運作上多年的心得，希望能夠幫助技術人員避免無謂的重複錯誤與摸索，將心力聚焦於工作目標與可以創造收益的產出。

各界好評
 
　　《DevOps 三十六計》凝聚了一大批業內專家多年的實戰經驗，是一本難得的實戰手冊。——何寶宏，中國信息通信研究院雲計算和大數據所所長

　　非常欣喜地看到《DevOps 三十六計》的正式出版發行，從一年多前的小冊子，到彙聚了精益、敏捷、開發、測試、運維及安全領域大咖專家的著作。36篇文章，1000多條計策，其中很多計策都值得我們細細琢磨，相信對相關工作的展開不無裨益。——吳華鵬，iTech Club（互聯網精英俱樂部）理事長

　　無論是網路界還是傳統行業，大家都迫切需要不斷地縮短GTM 時間。DevOps 是目前加快從需求到應用上線的最佳途徑。DevOps 時代社區和高效運維社區在這方面做了大量的工作，將業內多位專家的一線實踐經驗凝聚於《DevOps 三十六計》一書，涵蓋了產品設計、敏捷開發、微服務設計、持續集成和部署、自動化運維等整個DevOps 週期的各個關鍵環節。他山之石可以攻玉，相信大家可以從本書中學到不少DevOps 的最佳實踐。——方國偉，平安科技CTO兼總架構師

　　《DevOps 三十六計》的創作者中有許多我熟悉的名字，他們都是在業界歷練多年的“老司機”，所分享的三十六計可以說是對多年來走過的路、行過的橋、踩過的坑、跨過的坎的集中總結，其中有很多是要付出巨大的代價後才能感悟到的。相信無論你是DevOps新兵還是老將，都能從《DevOps 三十六計》中獲得一些感悟。——劉棲銅，騰訊遊戲助理總經理',	'9789865020330',	5),
(6,	'股票發大財：用Python預測玩轉股市高手精解',	'預測股票之夢，雖遠但非遙不可及。
想成為股市贏家不是會看盤，而是要先會Python！
K線、均線自己畫，資料自己爬，賺錢一大把！

　　全書分為三篇：

　　基礎篇（第1~4章）：說明Python開發環境的架設、基本語法、資料結構、程式的偵錯以及物件導向的程式設計思想。

　　股票指標技術分析篇（第5~10章）：分別說明使用網路爬蟲技術取得股票資料、使用Matplotlib視覺化元件、基於NumPy和Pandas函數庫進行大數據分析、以股票的不同指標分析為範例的開發方法—MACD + Python資料庫程式設計、KDJ + Python圖形化使用者介面程式設計、RSI + Python郵件程式設計。

　　以股票指標為基礎的交易策略之進階應用篇（第11~13章）：以股票的BIAS指標分析為範例說明Django架構、以股票的OBV指標分析為範例說明在Django中匯入記錄檔和資料庫元件、結合股票指標分析說明以線性回歸和SVM（支援向量機）為基礎的機器學習的入門知識。

　　台股上看兩萬點，台積電領軍，看盤成為全民運動！茫茫股海，每天追大盤，玩個股，但心中就是不放心，資料這麼多，到底資訊在哪裏？股市都是數字，而資料及演算法，都必須靠一個程式語言串起來。Python正是你最好的朋友，上手簡單，功能強大，最重要的是，近來最強的機器學習也是Python的核心。這些都是玩轉股市的基本工具，本書針對Python零基礎的使用者，主要說明大量的股票指標技術分析的範例，由淺入深地介紹了使用Python語言程式設計開發的應用「圖譜」。',	'9789865501730',	6);

DROP TABLE IF EXISTS "catalog_book_genre";
DROP SEQUENCE IF EXISTS catalog_book_genre_id_seq;
CREATE SEQUENCE catalog_book_genre_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."catalog_book_genre" (
    "id" integer DEFAULT nextval('catalog_book_genre_id_seq') NOT NULL,
    "book_id" integer NOT NULL,
    "genre_id" integer NOT NULL,
    CONSTRAINT "catalog_book_genre_book_id_genre_id_d15f6922_uniq" UNIQUE ("book_id", "genre_id"),
    CONSTRAINT "catalog_book_genre_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id" FOREIGN KEY (book_id) REFERENCES catalog_book(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id" FOREIGN KEY (genre_id) REFERENCES catalog_genre(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "catalog_book_genre_book_id_e5a77c43" ON "public"."catalog_book_genre" USING btree ("book_id");

CREATE INDEX "catalog_book_genre_genre_id_77d7ffde" ON "public"."catalog_book_genre" USING btree ("genre_id");

INSERT INTO "catalog_book_genre" ("id", "book_id", "genre_id") VALUES
(1,	1,	1),
(2,	2,	1),
(3,	3,	1),
(4,	4,	1),
(5,	5,	1),
(6,	6,	3);

DROP TABLE IF EXISTS "catalog_bookinstance";
CREATE TABLE "public"."catalog_bookinstance" (
    "id" uuid NOT NULL,
    "imprint" character varying(200) NOT NULL,
    "due_back" date,
    "status" character varying(1) NOT NULL,
    "book_id" integer,
    CONSTRAINT "catalog_bookinstance_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "catalog_bookinstance_book_id_69f93415_fk_catalog_book_id" FOREIGN KEY (book_id) REFERENCES catalog_book(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "catalog_bookinstance_book_id_69f93415" ON "public"."catalog_bookinstance" USING btree ("book_id");

INSERT INTO "catalog_bookinstance" ("id", "imprint", "due_back", "status", "book_id") VALUES
('119d766d-3ff3-4f5b-8711-adb33847a9ff',	'adb33847a9ff',	NULL,	'm',	4),
('16f25d83-a87b-4fa1-b93f-59c9bfacb8d8',	'59c9bfacb8d8',	NULL,	'm',	3),
('2434354d-1285-4bc0-85f9-f3cfdd5a3d81',	'f3cfdd5a3d81',	NULL,	'm',	6),
('243c05b9-ea03-41b2-bc88-293087d17bc0',	'293087d17bc0',	NULL,	'm',	3),
('29cec6df-b652-483f-8ca1-1d5c6e8de148',	'1d5c6e8de148',	NULL,	'm',	6),
('410636cf-5013-4fa8-aa48-5003b2ea93d9',	'5003b2ea93d9',	NULL,	'm',	5),
('45e53989-945e-40fd-abee-b84c415f1c68',	'b84c415f1c68',	NULL,	'm',	5),
('4ef3a3b8-663c-47b3-8517-15c22a551b55',	'15c22a551b55',	NULL,	'm',	3),
('6eac949f-0c90-4da7-83ba-28debea938fc',	'28debea938fc',	NULL,	'm',	5),
('74708ac1-a1d1-4314-8c3e-27b158f22483',	'11',	NULL,	'r',	2),
('87fce574-008b-47d9-ab28-05ecfc9708e0',	'05ecfc9708e0',	NULL,	'm',	6),
('a5a33b3e-874d-4f75-b1b3-3642cbd8de49',	'11',	NULL,	'a',	2),
('ab4691b5-7494-4964-aaac-c12ee5c44f67',	'11',	NULL,	'o',	2),
('d066c9b1-0142-4fec-a70d-86c1da08ff8a',	'86c1da08ff8a',	NULL,	'm',	4),
('f6b70f13-48e6-4200-80a3-a86d4734cef3',	'a86d4734cef3',	NULL,	'm',	4);

DROP TABLE IF EXISTS "catalog_genre";
DROP SEQUENCE IF EXISTS catalog_genre_id_seq;
CREATE SEQUENCE catalog_genre_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."catalog_genre" (
    "id" integer DEFAULT nextval('catalog_genre_id_seq') NOT NULL,
    "name" character varying(200) NOT NULL,
    CONSTRAINT "catalog_genre_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "catalog_genre" ("id", "name") VALUES
(1,	'生活'),
(2,	'開發研究'),
(3,	'股票');

DROP TABLE IF EXISTS "django_admin_log";
DROP SEQUENCE IF EXISTS django_admin_log_id_seq;
CREATE SEQUENCE django_admin_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_admin_log" (
    "id" integer DEFAULT nextval('django_admin_log_id_seq') NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" text NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING btree ("content_type_id");

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING btree ("user_id");


DROP TABLE IF EXISTS "django_content_type";
DROP SEQUENCE IF EXISTS django_content_type_id_seq;
CREATE SEQUENCE django_content_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_content_type" (
    "id" integer DEFAULT nextval('django_content_type_id_seq') NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL,
    CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model"),
    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES
(1,	'admin',	'logentry'),
(2,	'auth',	'permission'),
(3,	'auth',	'group'),
(4,	'auth',	'user'),
(5,	'contenttypes',	'contenttype'),
(6,	'sessions',	'session'),
(7,	'catalog',	'author'),
(8,	'catalog',	'book'),
(9,	'catalog',	'genre'),
(10,	'catalog',	'bookinstance');

DROP TABLE IF EXISTS "django_migrations";
DROP SEQUENCE IF EXISTS django_migrations_id_seq;
CREATE SEQUENCE django_migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_migrations" (
    "id" integer DEFAULT nextval('django_migrations_id_seq') NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES
(1,	'contenttypes',	'0001_initial',	'2021-02-17 16:07:39.808167+08'),
(2,	'auth',	'0001_initial',	'2021-02-17 16:07:40.084587+08'),
(3,	'admin',	'0001_initial',	'2021-02-17 16:07:40.523794+08'),
(4,	'admin',	'0002_logentry_remove_auto_add',	'2021-02-17 16:07:40.620364+08'),
(5,	'admin',	'0003_logentry_add_action_flag_choices',	'2021-02-17 16:07:40.671685+08'),
(6,	'contenttypes',	'0002_remove_content_type_name',	'2021-02-17 16:07:40.802992+08'),
(7,	'auth',	'0002_alter_permission_name_max_length',	'2021-02-17 16:07:40.8505+08'),
(8,	'auth',	'0003_alter_user_email_max_length',	'2021-02-17 16:07:40.898622+08'),
(9,	'auth',	'0004_alter_user_username_opts',	'2021-02-17 16:07:40.952109+08'),
(10,	'auth',	'0005_alter_user_last_login_null',	'2021-02-17 16:07:40.997681+08'),
(11,	'auth',	'0006_require_contenttypes_0002',	'2021-02-17 16:07:41.027523+08'),
(12,	'auth',	'0007_alter_validators_add_error_messages',	'2021-02-17 16:07:41.074752+08'),
(13,	'auth',	'0008_alter_user_username_max_length',	'2021-02-17 16:07:41.149968+08'),
(14,	'auth',	'0009_alter_user_last_name_max_length',	'2021-02-17 16:07:41.198224+08'),
(15,	'auth',	'0010_alter_group_name_max_length',	'2021-02-17 16:07:41.249116+08'),
(16,	'auth',	'0011_update_proxy_permissions',	'2021-02-17 16:07:41.299383+08'),
(17,	'auth',	'0012_alter_user_first_name_max_length',	'2021-02-17 16:07:41.340587+08'),
(18,	'catalog',	'0001_initial',	'2021-02-17 16:07:41.538309+08'),
(19,	'sessions',	'0001_initial',	'2021-02-17 16:07:41.717312+08');

DROP TABLE IF EXISTS "django_session";
CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
) WITH (oids = false);

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING btree ("expire_date");

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING btree ("session_key");

INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES
('a9qpwqkfcc8ubtgswhm4fgqcrt4qb1rf',	'.eJxVjEEOwiAQRe_C2hCmTAq4dO8ZyMAMUjUlKe3KeHdt0oVu_3vvv1Skba1x67LEidVZgTr9bonyQ-Yd8J3mW9O5zesyJb0r-qBdXxvL83K4fweVev3WCcEjFgIeBoQiNrMFlwKgE3AciqDPjCPaNA5ewFAIaAKxT8b4kNX7A9dJN3Q:1lCHxE:wW7_rmWnS3sgn5zvFhje09X351KJqJ3tKJ-igYqlliY',	'2021-03-03 16:13:00.075903+08');

-- 2021-02-17 16:13:55.216416+08
