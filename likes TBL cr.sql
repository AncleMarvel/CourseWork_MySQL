DROP TABLE IF EXISTS instagram.likes;
CREATE TABLE instagram.likes (
	user_id BIGINT UNSIGNED NOT NULL,
	post_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id,post_id),
	
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES instagram.`user`(id) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	
	CONSTRAINT FK_post_id FOREIGN KEY (post_id) REFERENCES instagram.post(id) 
	ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Таблица типа какой пользователь что лайкнул';


