--library_seq&del.sql
--author name: Peter Wotherspoon Bustamante




/* 
First, inserting a book into the database, then placing 3 copies of it,
in three different libraries (branches).

Then, creating two sequences, to support the databases ability to 
keep track of people borrowing book copies, and placing reservations on book copies.

Then finally, adding a loan to the database, (as Ada Lovelace has just borrowed
a book that came in), and deleting the reservation that they had placed on the book
while it was out.
*/






-- Inserting new unique book into BOOK_DETAIL:
INSERT INTO BOOK_DETAIL VALUES
(
    '005.74 C824C',
    'Database Systems: Design, Implementation, and Management',
    'R',
    793,
    TO_DATE('2019', 'YYYY'),
    '13'
);


-- Placing a copy of the new book, in Clayton Library:
INSERT INTO BOOK_COPY VALUES
(
    (SELECT branch_code from BRANCH where branch_name = 'Clayton Library'),
    (SELECT COUNT(*)
        FROM BOOK_COPY
        WHERE branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library'))+1,
    120,
    'N',
    '005.74 C824C'
);


-- Placing a copy of the new book, in Glen Waverley Library:
INSERT INTO BOOK_COPY VALUES
(
    (SELECT branch_code from BRANCH where branch_name = 'Glen Waverley Library'),
    (SELECT COUNT(*)
        FROM BOOK_COPY
        WHERE branch_code = (SELECT branch_code from BRANCH where branch_name = 'Glen Waverley Library'))+1,
    120,
    'N',
    '005.74 C824C'
);


-- placing a copy of the new book, in Mulgrave Library:
INSERT INTO BOOK_COPY VALUES
(
    (SELECT branch_code from BRANCH where branch_name = 'Mulgrave Library'),
    (SELECT COUNT(*)
        FROM BOOK_COPY
        WHERE branch_code = (SELECT branch_code from BRANCH where branch_name = 'Mulgrave Library'))+1,
    120,
    'N',
    '005.74 C824C'
);

COMMIT;







-- Creating a sequence for borrowing, and reserving:
DROP SEQUENCE borr_seq;
DROP SEQUENCE reserve_seq;

CREATE SEQUENCE borr_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE reserve_seq START WITH 100 INCREMENT BY 1;


-- Using the newly created sequence for borrowing:
INSERT INTO BORROWER VALUES
(
    borr_seq.NEXTVAL,
    'Ada',
    'LOVELACE',
    '25 Bomb Avenue',
    'Bombsville',
    '5000',
    10
);

-- Using the newly created sequence for reserving:
-- Note: I decided to do a query instead of use borrow_seq.currval, for Ada's bor_no, due to possible rollbacks.
INSERT INTO RESERVE VALUES
(
    reserve_seq.NEXTVAL,
    10,
    (SELECT bc_id FROM BOOK_COPY WHERE 
        branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library') 
        AND book_call_no = '005.74 C824C'),
    TO_DATE('14-Sep-2021', 'DD-MON-YYYY'),
    (SELECT bor_no FROM BORROWER WHERE bor_fname = 'Ada' AND bor_lname = 'LOVELACE') 
);

COMMIT;






-- Creating a loan for Ada, as she just borrowed a book copy:
INSERT INTO LOAN VALUES
(
    (SELECT branch_code from BRANCH WHERE branch_name = 'Clayton Library'),
    (SELECT bc_id FROM BOOK_COPY WHERE 
        branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library') 
        AND book_call_no = '005.74 C824C'),
    TO_DATE('21-Sep-2021', 'DD-MON-YYYY'),
    TO_DATE('05-Oct-2021', 'DD-MON-YYYY'),
    NULL,
    (SELECT bor_no FROM BORROWER WHERE bor_fname = 'Ada' AND bor_lname = 'LOVELACE')
);

-- Deleting the reservation Ada had made in the past, for the book copy she is now borrowing:
DELETE FROM RESERVE
WHERE branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library')
AND bc_id = (SELECT bc_id FROM BOOK_COPY WHERE 
            branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library') 
            AND book_call_no = '005.74 C824C');


COMMIT;

