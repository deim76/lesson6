# Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
USE vk;

SELECT sum(count) as count_like from (
SELECT count(id) as count, user_id,
	(SELECT YEAR(birthday) FROM profiles WHERE user_id=likes.user_id) as y_birthday
 FROM likes GROUP BY user_id 
 ORDER BY y_birthday DESC  LIMIT 10) TAB;

 