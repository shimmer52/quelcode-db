SELECT id,chatroom_name,description,
CASE file_transmission WHEN 0 THEN '許可' WHEN 1 THEN '禁止' END AS 'ファイル送信',
direct_chat,is_deleted,created_at,created_by,updated_at,updated_by 
FROM chatrooms 
WHERE is_deleted=0 AND description LIKE '%ダイレクトチャット' 
ORDER BY id
