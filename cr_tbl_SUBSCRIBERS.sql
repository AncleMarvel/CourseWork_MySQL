DROP TABLE IF EXISTS instagram.subscribers;
CREATE TABLE instagram.`subscribers` (
  `target_user_id` bigint UNSIGNED NOT NULL COMMENT 'Пользователь на кого подписан follower',
  `follower_id` bigint UNSIGNED NOT NULL COMMENT 'Follower',
  CONSTRAINT `PRIMARY` PRIMARY KEY (target_user_id),
  CONSTRAINT `FK_target_user_id` FOREIGN KEY (`target_user_id`) REFERENCES instagram.`user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_follower_id` FOREIGN KEY (`follower_id`) REFERENCES instagram.`user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Подписчики пользователя';