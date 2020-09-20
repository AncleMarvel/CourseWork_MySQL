DROP PROCEDURE IF EXISTS sp_from_one_city;
DELIMITER //
CREATE PROCEDURE sp_from_one_city(IN for_user_id BIGINT)
BEGIN
	SELECT p2.user_id
	FROM profiles p1
	JOIN profiles p2 ON p1.city = p2.city
	WHERE p1.user_id = for_user_id
		AND  p2.user_id != for_user_id;
END//

DELIMITER ;

CALL sp_from_one_city(1);