CREATE TABLE instagram.`user` (
	id SERIAL,
	login varchar(100) NOT NULL,
	password_hash VARCHAR(100) NOT NULL,
	profile_id INT UNSIGNED NOT NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
) COMMENT='таблица пользователей';
