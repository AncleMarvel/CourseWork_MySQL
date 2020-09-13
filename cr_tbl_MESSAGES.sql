DROP TABLE IF EXISTS instagram.messages;
CREATE TABLE instagram.messages (
	initiator_id BIGINT UNSIGNED NOT NULL,
	target_id BIGINT UNSIGNED NOT NULL,
	`text` TEXT NOT NULL,
	date_submitting TIMESTAMP NOT NULL,
	attached_media_id BIGINT UNSIGNED NULL,
	
	CONSTRAINT `PRIMARY` PRIMARY KEY (initiator_id,target_id),
	CONSTRAINT FK_initiator_user_id FOREIGN KEY (initiator_id) REFERENCES instagram.`user`(id) ON UPDATE CASCADE,
	CONSTRAINT FK_target_id FOREIGN KEY (target_id) REFERENCES instagram.`user`(id) ON UPDATE CASCADE,
	CONSTRAINT FK_attached_media_id FOREIGN KEY (attached_media_id) REFERENCES instagram.media(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Таблица сообщений типа кто и кому';

