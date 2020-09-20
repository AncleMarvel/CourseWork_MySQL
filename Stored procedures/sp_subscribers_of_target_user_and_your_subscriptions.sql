-- Возвращает пользователей, которых my_user_id фоловит, и, при этом, они являются фолловерами target_user_id
DROP PROCEDURE IF EXISTS sp_subscribers_of_target_user_and_your_subscriptions; 
DELIMITER // 
CREATE PROCEDURE sp_subscribers_of_target_user_and_your_subscriptions(IN my_user_id BIGINT, IN target_user_id BIGINT)
BEGIN
	SELECT p1.user_id 
		FROM subscribers_and_subscriptions p1 WHERE p1.follower_id = my_user_id 
	AND p1.user_id IN (SELECT p2.follower_id FROM subscribers_and_subscriptions p2 WHERE p2.user_id = target_user_id);	
END//

DELIMITER ;

CALL sp_general_subscriptions(4, 34); -- result: 40



