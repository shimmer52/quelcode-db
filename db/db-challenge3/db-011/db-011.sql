BEGIN;

UPDATE tasks SET is_compleated=1,updated_by=1,updated_at=NOW()
WHERE is_deleted=0 AND created_at BETWEEN '2020-04-26 09:00:00' AND '2020-04-26 11:30:00';

COMMIT;