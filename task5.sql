# Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной
# сети.
USE vk;

SELECT sum(count) AS min_activity, 
(SELECT CONCAT(first_name,' ',last_name) FROM USERS WHERE id=user_id) as user_name
 FROM(
SELECT count(*) as count, user_id FROM likes GROUP BY user_id
UNION
SELECT count(*) as count, user_id FROM media GROUP BY user_id
UNION
SELECT count(*) as count, user_id FROM posts GROUP BY user_id
UNION
SELECT count(*) as count, from_user_id FROM messages GROUP BY from_user_id
UNION
SELECT count(*) as count, to_user_id FROM messages GROUP BY to_user_id) tab
 GROUP BY user_id ORDER BY min_activity LIMIT 10;

