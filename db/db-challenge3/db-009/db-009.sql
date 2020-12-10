SELECT c.chatroom_name AS 'チャットルーム名',COUNT(p.chatroom_id) AS '投稿数'
FROM chatrooms AS c
JOIN posts AS p ON c.id=p.chatroom_id
JOIN users AS u ON u.id=p.created_by
WHERE u.is_deleted=0 AND p.is_deleted=0
GROUP BY p.chatroom_id
ORDER BY COUNT(p.chatroom_id) DESC
