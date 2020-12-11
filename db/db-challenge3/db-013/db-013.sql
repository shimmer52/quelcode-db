BEGIN;

UPDATE users SET is_deleted=1,updated_at=NOW()
WHERE office_phone_number IS NULL AND cell_phone_number IS NULL;

COMMIT;