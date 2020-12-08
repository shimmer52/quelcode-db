SELECT c.chatroom_name AS 'チャットルーム名',COUNT(p.chatroom_id) AS '投稿数' 
FROM chatrooms c, posts p,users u 
WHERE u.is_deleted=0 AND p.is_deleted=0 AND c.id=p.chatroom_id AND u.id=p.created_by 
GROUP BY p.chatroom_id 
ORDER BY COUNT(p.chatroom_id) DESC
