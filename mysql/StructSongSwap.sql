-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： dex-mysql
-- 生成日期： 2023-02-01 17:10:34
-- 服务器版本： 8.0.32
-- PHP 版本： 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `SongSwap`
--
CREATE DATABASE IF NOT EXISTS `SongSwap` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `SongSwap`;

-- --------------------------------------------------------

--
-- 表的结构 `ss_change_log`
--

DROP TABLE IF EXISTS `ss_change_log`;
CREATE TABLE `ss_change_log` (
  `id` int NOT NULL COMMENT 'ID',
  `account` int NOT NULL DEFAULT '0' COMMENT '账号ID',
  `before_icp_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'icp变动前数量',
  `icp_tag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '变动符号 1 增加 -1 减少',
  `change_icp_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'icp变动数量',
  `after_icp_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'icp变动后数量',
  `before_eth_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'eth变动前数量',
  `eth_tag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '变动符号 1 增加 -1 减少',
  `change_eth_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'eth变动数量',
  `after_eth_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'eth变动后数量',
  `before_usdt_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'usdt变动前数量',
  `usdt_tag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '变动符号 1 增加 -1 减少',
  `change_usdt_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'usdt变动数量',
  `after_usdt_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'usdt变动后数量',
  `before_btc_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'btc变动前数量',
  `btc_tag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '变动符号 1 增加 -1 减少',
  `change_btc_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'btc变动数量',
  `after_btc_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'btc变动后数量',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '变更类型 0 后台变更 1 充值 2 提现 3 兑换'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='coin 变动记录';

-- --------------------------------------------------------

--
-- 表的结构 `ss_placard`
--

DROP TABLE IF EXISTS `ss_placard`;
CREATE TABLE `ss_placard` (
  `id` int NOT NULL COMMENT '公告ID',
  `title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `public_time` int NOT NULL DEFAULT '0' COMMENT '发布时间',
  `content` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0 未发布 1 已发布',
  `is_del` tinyint NOT NULL DEFAULT '0' COMMENT '0 正常 1 已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公告';

-- --------------------------------------------------------

--
-- 表的结构 `ss_recharge`
--

DROP TABLE IF EXISTS `ss_recharge`;
CREATE TABLE `ss_recharge` (
  `id` int NOT NULL COMMENT '充值id',
  `account_id` int NOT NULL DEFAULT '0' COMMENT '充值帐户ID',
  `rechange_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USDT' COMMENT '充值币种',
  `transaction_hash` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0x0000000000000000000000000000000000000000000000000000000000000000' COMMENT '交易hash',
  `recharge_count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '充值数量',
  `recharge_time` int NOT NULL DEFAULT '0' COMMENT '充值时间',
  `from_address` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0x0000000000000000000000000000000000000000' COMMENT '充值地址',
  `to_address` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0x0000000000000000000000000000000000000000' COMMENT '到账地址',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '充值状态 0:已提交申请 1:确认 -1:拒绝',
  `check_account` char(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '确认帐户',
  `check_time` int NOT NULL DEFAULT '0' COMMENT '确认时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='充值申请';

-- --------------------------------------------------------

--
-- 表的结构 `ss_register_code`
--

DROP TABLE IF EXISTS `ss_register_code`;
CREATE TABLE `ss_register_code` (
  `id` int NOT NULL COMMENT 'id',
  `account` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '账号',
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注册码',
  `send_time` int NOT NULL DEFAULT '0' COMMENT '发送时间',
  `expired` int NOT NULL DEFAULT '0' COMMENT '过期时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '是否使用0 未使用 1已使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='注册码';

-- --------------------------------------------------------

--
-- 表的结构 `ss_swap`
--

DROP TABLE IF EXISTS `ss_swap`;
CREATE TABLE `ss_swap` (
  `id` int NOT NULL COMMENT '兑换ID',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `account` int NOT NULL DEFAULT '0' COMMENT '帐户id',
  `from_coin_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ICP' COMMENT '转出币种',
  `from_coin_count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转出币种数量',
  `from_coin_price` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转出币种价格',
  `to_coin_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USDT' COMMENT '兑换币种',
  `to_coin_count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转入币种数量',
  `to_coin_price` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转入币种价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='兑换表';

-- --------------------------------------------------------

--
-- 表的结构 `ss_user`
--

DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE `ss_user` (
  `id` int NOT NULL COMMENT '会员ID',
  `account` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账户名称',
  `parent` int NOT NULL DEFAULT '0' COMMENT '推荐人',
  `prefix_password` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码前缀',
  `password` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登陆密码',
  `recommend` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '推荐码',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推荐路径',
  `icp_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'icp余额',
  `lock_icp_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '锁定ICP数量',
  `usdt_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'usdt余额',
  `lock_usdt_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '锁定USDT数量',
  `eth_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'eth余额',
  `lock_eth_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '锁定ETH数量',
  `btc_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'btc余额',
  `lock_btc_coin` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '锁定BTC数量',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `id_card` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份认证',
  `realname` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实名',
  `id_photo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '证件照',
  `pass_err_time` tinyint NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '禁用说明',
  `lock_time` int NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '禁用状态: 0 正常 1禁用',
  `is_del` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0未删除 1已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `ss_withdraw`
--

DROP TABLE IF EXISTS `ss_withdraw`;
CREATE TABLE `ss_withdraw` (
  `id` int NOT NULL COMMENT '提现ID',
  `account_id` int NOT NULL DEFAULT '0' COMMENT '提现账号',
  `transaction_hash` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0x0000000000000000000000000000000000000000000000000000000000000000' COMMENT '交易hash',
  `withdraw_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USDT' COMMENT '提现币种',
  `withdraw_count` decimal(50,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '提现数量',
  `from_address` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0x0000000000000000000000000000000000000000' COMMENT '转出地址',
  `to_address` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0x0000000000000000000000000000000000000000' COMMENT '转入地址',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  `check_account` char(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '确认帐户',
  `check_time` int NOT NULL DEFAULT '0' COMMENT '确认时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '确认状态0:已提交 1:确认 -1:拒绝'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `ss_change_log`
--
ALTER TABLE `ss_change_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `type` (`type`);

--
-- 表的索引 `ss_placard`
--
ALTER TABLE `ss_placard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- 表的索引 `ss_recharge`
--
ALTER TABLE `ss_recharge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- 表的索引 `ss_register_code`
--
ALTER TABLE `ss_register_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `status` (`status`);

--
-- 表的索引 `ss_swap`
--
ALTER TABLE `ss_swap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`);

--
-- 表的索引 `ss_user`
--
ALTER TABLE `ss_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account` (`account`),
  ADD UNIQUE KEY `recommend` (`recommend`),
  ADD KEY `parent` (`parent`),
  ADD KEY `status` (`status`),
  ADD KEY `is_del` (`is_del`);

--
-- 表的索引 `ss_withdraw`
--
ALTER TABLE `ss_withdraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ss_change_log`
--
ALTER TABLE `ss_change_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `ss_placard`
--
ALTER TABLE `ss_placard`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID';

--
-- 使用表AUTO_INCREMENT `ss_recharge`
--
ALTER TABLE `ss_recharge`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '充值id';

--
-- 使用表AUTO_INCREMENT `ss_register_code`
--
ALTER TABLE `ss_register_code`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `ss_swap`
--
ALTER TABLE `ss_swap`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '兑换ID';

--
-- 使用表AUTO_INCREMENT `ss_user`
--
ALTER TABLE `ss_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '会员ID';

--
-- 使用表AUTO_INCREMENT `ss_withdraw`
--
ALTER TABLE `ss_withdraw`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '提现ID';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
