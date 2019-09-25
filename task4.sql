# Определить кто больше поставил лайков (всего) - мужчины или женщины?
USE vk;

SELECT count(id) as count, 
	(SELECT sex FROM profiles WHERE user_id=likes.user_id) as sex
 FROM likes GROUP BY sex  ORDER BY count DESC LIMIT 1;

 