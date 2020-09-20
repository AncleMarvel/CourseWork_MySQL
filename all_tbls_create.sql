DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `password_hash` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types` (
  `id` INT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `downloader_id` BIGINT UNSIGNED NOT NULL,
  `src_hash` VARCHAR(255) NOT NULL,
  `type_id` INT(1) UNSIGNED NOT NULL,
  `upload_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `FK_media_type_id` FOREIGN KEY (`type_id`) REFERENCES `media_types`(`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_downloader_id` FOREIGN KEY (`downloader_id`) REFERENCES `users`(`id`) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(32) DEFAULT NULL,
  `web_site` VARCHAR(255) DEFAULT NULL,
  `about_myself` TEXT DEFAULT NULL,
  `email` VARCHAR(128) NOT NULL,
  `phone` INT(12) UNSIGNED DEFAULT NULL,
  `gender` ENUM('m', 'f') DEFAULT NULL,
  `main_photo_id` BIGINT UNSIGNED DEFAULT NULL,
  `city` VARCHAR(100) DEFAULT NULL,
  `registration_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  
  KEY `FK_users` (`user_id`),
  KEY `FK_media_id` (`main_photo_id`),
  CONSTRAINT `FK_media_id` FOREIGN KEY (`main_photo_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_id` BIGINT UNSIGNED NOT NULL,
  `owner_id` BIGINT UNSIGNED NOT NULL,
  `description` TEXT DEFAULT NULL,
  `date_post` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  
  UNIQUE KEY `id` (`id`),
  KEY `FK_onwer_id` (`owner_id`),
  KEY `FK_media` (`media_id`),
  CONSTRAINT `FK_media` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_onwer_id` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `post_id` BIGINT UNSIGNED NOT NULL,
  `answer_comment_id` BIGINT UNSIGNED DEFAULT NULL,
  `text_comment` TEXT NOT NULL,
  `date_comment` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  
  UNIQUE KEY `id` (`id`),
  KEY `FK_commentator_id` (`user_id`),
  KEY `FK_target_post_id` (`post_id`),
  KEY `FK_answer_comment_id` (`answer_comment_id`),
  CONSTRAINT `FK_answer_comment_id` FOREIGN KEY (`answer_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_commentator_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_target_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `user_id` BIGINT UNSIGNED NOT NULL,
  `post_id` BIGINT UNSIGNED NOT NULL,
  `comment_id` BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  
  KEY `FK_post_id` (`post_id`),
  KEY `FK_comment_id` (`comment_id`),
  CONSTRAINT `FK_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `initiator_id` BIGINT UNSIGNED NOT NULL,
  `target_id` BIGINT UNSIGNED NOT NULL,
  `text` TEXT NOT NULL,
  `date_submitting` TIMESTAMP NOT NULL,
  `attached_media_id` BIGINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`initiator_id`,`target_id`),
  
  KEY `FK_target_id` (`target_id`),
  KEY `FK_attached_media_id` (`attached_media_id`),
  CONSTRAINT `FK_attached_media_id` FOREIGN KEY (`attached_media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_initiator_user_id` FOREIGN KEY (`initiator_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_target_id` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `subscribers_and_subscriptions`;
CREATE TABLE `subscribers_and_subscriptions` (
  `user_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`follower_id`),
  UNIQUE KEY `UNIQUE` (`user_id`,`follower_id`),
  KEY `FK_follower_id` (`follower_id`),
  CONSTRAINT `FK_follower_id` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_target_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
