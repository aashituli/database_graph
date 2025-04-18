-- 1. Add the author (if not exists)
INSERT INTO author (name)
SELECT 'J.K. Rowling'
WHERE NOT EXISTS (
    SELECT 1 FROM author WHERE name = 'J.K. Rowling'
);

-- 2. Add the publisher (if not exists)
INSERT INTO publisher (name)
SELECT 'Thorndike Press'
WHERE NOT EXISTS (
    SELECT 1 FROM publisher WHERE name = 'Thorndike Press'
);

-- 3. Add the work
INSERT INTO work (title, copyright, author_id)
VALUES (
    'Harry Potter and the Sorcerer''s Stone',
    1999,
    (SELECT author_id FROM author WHERE name = 'J.K. Rowling')
);

-- 4. Add the book
INSERT INTO book (ISBN, publisher_id, work_id, binding, price)
VALUES (
    '978-0-78622-272-8',
    (SELECT publisher_id FROM publisher WHERE name = 'Thorndike Press'),
    (SELECT work_id FROM work WHERE title = 'Harry Potter and the Sorcerer''s Stone'),
    'leather',
    100.00
);

-- 5. Add the book to volume (rare inventory)
INSERT INTO volume (ISBN, acquisition_date, condition)
VALUES (
    '978-0-78622-272-8',
    '2018-03-01',
    'excellent'
);
