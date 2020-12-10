SELECT u.name AS 'ユーザー名',c.chatroom_name AS 'チャットルーム名',DATE_FORMAT(j.joined_at, '%Y-%m-%d') AS '参加日時'
FROM  users_chatrooms AS j
JOIN chatrooms AS c ON j.chatroom_id=c.id
JOIN users AS u ON u.id=j.user_id
WHERE u.is_deleted=0 AND c.is_deleted=0
ORDER BY j.joined_at