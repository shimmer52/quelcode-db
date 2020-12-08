SELECT u.name AS 'ユーザー名',c.chatroom_name AS 'チャットルーム名',DATE_FORMAT(j.joined_at, '%Y-%m-%d')  AS '参加日時'
FROM users u,chatrooms c,users_chatrooms j 
WHERE u.id=j.user_id AND c.id=j.chatroom_id AND u.is_deleted=0 AND c.is_deleted=0 
ORDER BY j.joined_at
