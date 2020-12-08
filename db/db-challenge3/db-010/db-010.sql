SELECT c.chatroom_name AS 'チャットルーム名',u.name AS 'ユーザー名',p.created_at AS '投稿日時'
FROM chatrooms c,users u,posts p 
WHERE c.is_deleted=0 
	AND u.is_deleted=0 
    AND c.id=p.chatroom_id 
    AND u.id=p.created_by 
    AND p.created_at=(SELECT MIN(tmp.created_at) 
                    FROM posts tmp 
                    WHERE p.chatroom_id=tmp.chatroom_id 
                    GROUP BY tmp.chatroom_id) 
ORDER BY c.id
