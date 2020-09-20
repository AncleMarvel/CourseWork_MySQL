-- Выбирает посты конкретного пользователя, в данном случае с ид 1
CREATE OR REPLACE VIEW posts_of_concrete_user
AS
	SELECT p.id AS post_id, p.owner_id, p.media_id, p.description FROM posts p
	JOIN users u ON p.owner_id = u.id WHERE u.id = 1; -- выбираем пользователя, чьи посты ищем
	SELECT * FROM posts_of_concrete_user ;

-- Показывает данные по посту с ид, в данном случае, 1
CREATE OR REPLACE VIEW post_likes_comments
AS
	SELECT p.id AS post_id, p.owner_id, p.media_id, p.description, c.user_id AS commentator_id, c.text_comment, l.user_id AS who_liked_id  
		FROM posts p
	JOIN likes l ON p.owner_id = l.post_id 
	JOIN comments c ON c.post_id = p.id WHERE p.owner_id = 1;

	
	
	
	
	