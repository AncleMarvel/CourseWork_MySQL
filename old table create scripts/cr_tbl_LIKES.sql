DROP TABLE IF EXISTS instagram.likes;
CREATE TABLE instagram.likes (
	user_id BIGINT UNSIGNED NOT NULL,
	post_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id,post_id),
	
	comment_id BIGINT UNSIGNED COMMENT 'id комментария, который кто-то лайкнул, может быть - нал',
	
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES instagram.`user`(id) ON UPDATE CASCADE,
	CONSTRAINT FK_post_id FOREIGN KEY (post_id) REFERENCES instagram.posts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_comment_id FOREIGN KEY (comment_id) REFERENCES instagram.comments(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Таблица типа какой пользователь что лайкнул';


