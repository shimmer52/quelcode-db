BEGIN;

UPDATE chatrooms SET file_transmission=0,updated_by=1,updated_at=NOW()
WHERE is_deleted=0 
AND id NOT IN (SELECT chatroom_id FROM users_chatrooms WHERE user_id=1);

COMMIT;