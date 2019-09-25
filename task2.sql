# Пусть задан некоторый пользователь.
# Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим
# пользоваетелем.
USE vk;

SET @select_user =10; 
# пользователь id = 10.
 
SELECT 
		(SELECT concat(first_name,' ', last_name) FROM USERS WHERE id=from_user_id) AS select_user,
        (SELECT concat(first_name,' ', last_name) FROM USERS WHERE id=to_user_id) AS to_user,
        sum(count) count_message
FROM
(SELECT count(*) AS count, from_user_id, to_user_id FROM Messages 
				WHERE from_user_id IN (
                SELECT user_id FROM Friendship WHERE user_id=@select_user
                UNION
                SELECT friend_id FROM Friendship WHERE friend_id=@select_user) 
				GROUP BY from_user_id, to_user_id
UNION All
SELECT count(*) AS count,  to_user_id, from_user_id FROM Messages WHERE (to_user_id in (
                SELECT user_id FROM Friendship WHERE user_id=@select_user
                UNION
                SELECT friend_id FROM Friendship WHERE friend_id=@select_user))    
				GROUP BY from_user_id,to_user_id ) tab GROUP BY from_user_id, to_user_id ORDER BY count_message DESC LIMIT 1;
 
