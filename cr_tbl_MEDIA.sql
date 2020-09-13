DROP TABLE IF EXISTS instagram.media;
CREATE TABLE instagram.media (
	id BIGINT UNSIGNED auto_increment NOT NULL,
	src varchar(255) NOT NULL COMMENT 'Расположение файла',
	`type` TINYINT NOT NULL COMMENT 'Тип медиа, где 1 - фото, 2 - видео',
	CONSTRAINT `PRIMARY` PRIMARY KEY (id)
) COMMENT='Таблица медиа файлов';

-- Добавил связь с таблицей медиа типа
ALTER TABLE instagram.media ADD CONSTRAINT FK_media_type_id FOREIGN KEY (`type`) REFERENCES instagram.media_types(id) ON UPDATE CASCADE;

-- Добавил дату загрузки
ALTER TABLE instagram.media ADD upload_date TIMESTAMP NOT NULL COMMENT 'Дата загрузки';

