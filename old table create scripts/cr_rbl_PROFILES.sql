DROP TABLE IF EXISTS instagram.profiles;
CREATE TABLE instagram.profiles (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(32) COMMENT 'Имя',
	-- Имя пользователя (логин) хранится в users
	web_site VARCHAR(255) COMMENT 'Веб-сайт',
	about_myself TEXT COMMENT 'О себе',
	email VARCHAR(128) COMMENT 'Эл. адрес',
	phone INT UNSIGNED COMMENT 'Номер телефона',
	gender VARCHAR(10) COMMENT 'Пол',
	main_photo_id BIGINT UNSIGNED COMMENT 'id аватарки в таблице Медиа' ,
	-- Дальше переменные, которые не отображаются в настройках профиля инсты для пользователей
	
	city VARCHAR(100),
	registration_date TIMESTAMP,
	
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	CONSTRAINT FK_users FOREIGN KEY (user_id) REFERENCES instagram.`user`(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_media_id FOREIGN KEY (main_photo_id) REFERENCES instagram.`media`(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Таблица профилей с личными данными пользователей';



ALTER TABLE instagram.profiles MODIFY COLUMN phone INT UNSIGNED NULL COMMENT 'Номер телефона';
ALTER TABLE instagram.profiles MODIFY COLUMN gender VARCHAR(10) NULL COMMENT 'Пол';
