DROP TABLE IF EXISTS instagram.posts;
CREATE TABLE instagram.posts (
	id SERIAL,
	media_id BIGINT UNSIGNED NOT NULL,
	owner_id BIGINT UNSIGNED NOT NULL,
	description TEXT,
	-- Комментарии реализованны в отдельной таблице, у коммента есть ид поста. С лайками так-же
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	CONSTRAINT FK_onwer_id FOREIGN KEY (owner_id) REFERENCES instagram.`user`(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_media FOREIGN KEY (media_id) REFERENCES instagram.`media`(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Таблица постов пользователей';
