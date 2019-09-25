# Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной
# сети.
SELECT count(id), user_id  from likes group by user_id;
#SELECT CONCAT(first_name,' ',last_name),
select sum(count) as min_activity, user_id FROM(
SELECT count(*) as count, user_id FROM likes group by user_id
UNION
SELECT count(*) as count, user_id FROM media group by user_id
UNION
SELECT count(*) as count, user_id FROM posts group by user_id
UNION
SELECT count(*) as count, from_user_id FROM messages group by from_user_id
UNION
SELECT count(*) as count, to_user_id FROM messages group by to_user_id) tab group by user_id order by min_activity LIMIT 10;






