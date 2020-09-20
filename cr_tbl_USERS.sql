DROP TABLE IF EXISTS instagram.`user`;
CREATE TABLE instagram.`user` (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	login varchar(100) NOT NULL,
	password_hash VARCHAR(100) NOT NULL,
	profile_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	CONSTRAINT FK_profile_id FOREIGN KEY (profile_id) REFERENCES instagram.profiles(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='таблица пользователей';


-- Решил потом убрать эту связь, ведь профиль и так ссылается на пользователя
ALTER TABLE instagram.`user` DROP COLUMN profile_id;
ALTER TABLE instagram.`user` DROP FOREIGN KEY FK_profile_id;


