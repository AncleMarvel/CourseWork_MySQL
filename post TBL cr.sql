DROP TABLE IF EXISTS instagram.post;
CREATE TABLE instagram.post (
	id SERIAL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	media_links json NOT NULL
	owner_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT FK_onwer_id FOREIGN KEY (owner_id) REFERENCES instagram.`user`(id) 
	ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='таблица постов пользователей';
