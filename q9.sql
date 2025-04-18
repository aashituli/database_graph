-- Step 1: Find publisher_id for 'Thorndike Press'
SELECT publisher_id 
FROM publisher
WHERE publisher_name = 'Thorndike Press';

-- Step 2: Retrieve ISBN for the books associated with publisher_id = 10
SELECT ISBN 
FROM book
WHERE publisher_id = 10;

-- Step 3: Start transaction for safe deletion
START TRANSACTION;

-- Step 4: Delete all volume records that match the ISBNs associated with publisher_id = 10
DELETE FROM volume
WHERE ISBN IN (
  SELECT ISBN FROM book WHERE publisher_id = 10
);

-- Step 5: Delete books associated with publisher_id = 10
DELETE FROM book
WHERE publisher_id = 10;

-- Step 6: Delete the publisher with publisher_id = 10
DELETE FROM publisher
WHERE publisher_id = 10;

-- Step 7: Commit transaction to make changes permanent
COMMIT;
