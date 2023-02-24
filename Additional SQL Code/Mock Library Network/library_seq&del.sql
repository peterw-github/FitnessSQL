--library_mix.sql


--author name: Peter Wotherspoon Bustamante


/* 

First, inserting a book into the database, then placing 3 copies of it,
in three different libraries (branches).

Then, creating two sequences, to support the databases ability to 
keep track of people borrowing books. 

Then finally, adding a loan to the database, (as Ada Lovelace has just borrowed
a book that came in), and deleting the reservation that they had placed on the book
while it was out.

*/



-- 2 (b) (i)
-- The Book Details
INSERT INTO BOOK_DETAIL VALUES
(
    '005.74 C824C',
    'Database Systems: Design, Implementation, and Management',
    'R',
    793,
    TO_DATE('2019', 'YYYY'),
    '13'
);


-- The 3 copies of the book
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







-- 2 (b) (ii)
DROP SEQUENCE borr_seq;
DROP SEQUENCE reserve_seq;

CREATE SEQUENCE borr_seq START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE reserve_seq START WITH 100 INCREMENT BY 1;


-- 2 (b) (iii)
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






-- 2 (b) (iv)
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

-- DELETE RESERVATION
DELETE FROM RESERVE
WHERE branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library')
AND bc_id = (SELECT bc_id FROM BOOK_COPY WHERE 
            branch_code = (SELECT branch_code from BRANCH where branch_name = 'Clayton Library') 
            AND book_call_no = '005.74 C824C');


COMMIT;