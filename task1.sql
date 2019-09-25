/* Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять).

в выбор медиа добавить год для привязку к user для просмотра медиа истории пользователя.
select * from media;
SELECT COUNT(id) AS news, YEAR(created_at) as year,MONTHNAME(created_at) AS month 
  FROM media
  WHERE user_id = 1
  GROUP BY year,month
  ORDER BY year, MONTH(created_at) DESC;