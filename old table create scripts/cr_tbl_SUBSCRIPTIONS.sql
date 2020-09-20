DROP TABLE IF EXISTS instagram.subscriptions;
CREATE TABLE instagram.`subscriptions` (
  `follower_id` bigint UNSIGNED NOT NULL COMMENT 'Фоловер',
  `follower_target_id` bigint UNSIGNED NOT NULL COMMENT 'Таргет фоловера',
  CONSTRAINT `PRIMARY` PRIMARY KEY (follower_id),
  CONSTRAINT `FK_follower` FOREIGN KEY (`follower_id`) REFERENCES instagram.`user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_follower_target_id` FOREIGN KEY (`follower_target_id`) REFERENCES instagram.`user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Подписки пользователя';