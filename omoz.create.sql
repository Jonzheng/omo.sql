
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE `t_user` (
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `show_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示用',
  `auth_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `auth_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `gender` int(11) NOT NULL DEFAULT '1',
  `c_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册日期',
  `latest_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录日期',
  `coin_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到更新',
  `heart_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '点赞别人更新'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 表的结构 `t_record`
--

CREATE TABLE `t_record` (
  `record_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'file_id+times',
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_record` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'record_id.mp3',
  `master_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uploader',
  `heart` int(11) NOT NULL DEFAULT '0',
  `comm` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `c_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 表的结构 `t_audio`
--

CREATE TABLE `t_audio` (
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_audio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shadow` varchar(2333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cate` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属分类',
  `ski` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '技能',
  `ver` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本',
  `status` int(2) NOT NULL DEFAULT '0',
  `c_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- 表的结构 `t_comment`
--

CREATE TABLE `t_comment` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stars` int(11) NOT NULL DEFAULT '0',
  `re_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `c_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- 表的结构 `t_link_rank`
--

CREATE TABLE `t_link_rank` (
  `openid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(11) NOT NULL COMMENT '最高分',
  `puz` varchar(2550) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '假名拼图',
  `coin` int(11) NOT NULL DEFAULT '0',
  `check_coin` int(11) NOT NULL DEFAULT '0',
  `total_coin` int(11) NOT NULL DEFAULT '0',
  `round` int(11) NOT NULL DEFAULT '0' COMMENT '局数',
  `hira` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no' COMMENT '平假颜色',
  `kata` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no' COMMENT '片假颜色',
  `space` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no' COMMENT '空白颜色',
  `myco` varchar(2550) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no' COMMENT '我的颜色',
  `ran` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `s_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到日期',
  `latest` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近',
  `c_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 表的结构 `t_list`
--

CREATE TABLE `t_list` (
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_size` int(11) NOT NULL COMMENT '文件大小',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serifu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `koner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '空耳',
  `roma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '罗马音',
  `src_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `level` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clicks` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  `cate` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属类型',
  `c_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='主页列表信息';


--
-- Indexes for table `t_audio`
--
ALTER TABLE `t_audio`
  ADD PRIMARY KEY (`c_date`);

--
-- Indexes for table `t_comment`
--
ALTER TABLE `t_comment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `t_link_rank`
--
ALTER TABLE `t_link_rank`
  ADD PRIMARY KEY (`openid`),
  ADD UNIQUE KEY `openid` (`openid`);

--
-- Indexes for table `t_list`
--
ALTER TABLE `t_list`
  ADD PRIMARY KEY (`file_id`),
  ADD UNIQUE KEY `file_id` (`file_id`);

--
-- Indexes for table `t_record`
--
ALTER TABLE `t_record`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `record_id` (`record_id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`openid`);

--
-- Indexes for table `t_zan`
--
ALTER TABLE `t_zan`
  ADD PRIMARY KEY (`comm_id`,`user_id`);
COMMIT;

