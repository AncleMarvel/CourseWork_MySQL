DROP TABLE IF EXISTS instagram.`user`;
CREATE TABLE instagram.`user` (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	login varchar(100) NOT NULL,
	password_hash VARCHAR(100) NOT NULL,
	profile_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
) COMMENT='таблица пользователей';

