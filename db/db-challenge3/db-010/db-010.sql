SELECT c.chatroom_name AS 'チャットルーム名',u.name AS 'ユーザー名',p.created_at AS '投稿日時'
FROM posts AS p
JOIN chatrooms AS c ON c.id=p.chatroom_id
JOIN users AS u ON u.id=p.created_by
WHERE u.is_deleted=0
AND p.created_at=(SELECT MAX(tmp.created_at)
    FROM posts tmp
    WHERE p.chatroom_id=tmp.chatroom_id AND tmp.is_deleted=0
    GROUP BY tmp.chatroom_id)
ORDER BY c.id;
