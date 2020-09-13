DROP TABLE IF EXISTS instagram.media_types;
CREATE TABLE instagram.media_types (
	id TINYINT auto_increment NOT NULL,
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	
	type_name VARCHAR(10) COMMENT 'Название типа'
) COMMENT='Таблица типов медиа файлов';
