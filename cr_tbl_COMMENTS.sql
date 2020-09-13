DROP TABLE IF EXISTS instagram.comments;
CREATE TABLE instagram.comments (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL COMMENT 'Кто оставил комментарий',
	post_id BIGINT UNSIGNED NOT NULL COMMENT 'Ид поста, который прокомментирован',
	answer_comment_id BIGINT UNSIGNED COMMENT 'Ид комментария, на который отвечаешь, может быть - нал',
	text_comment TEXT COMMENT 'Текст комментария',
	date_comment TIMESTAMP COMMENT 'Дата комментария',
	-- Лайки под комментами реализованы в отдельной таблице лайков, где есть ид коммента и кто лайкнул
	CONSTRAINT `PRIMARY` PRIMARY KEY (id),
	CONSTRAINT FK_commentator_id FOREIGN KEY (user_id) REFERENCES instagram.`user`(id) ON UPDATE CASCADE,
	CONSTRAINT FK_target_post_id FOREIGN KEY (post_id) REFERENCES instagram.`posts`(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FK_answer_comment_id FOREIGN KEY (answer_comment_id) REFERENCES instagram.`comments`(id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT='Таблица комментариев типа кто, что и когда прокомментировал';
