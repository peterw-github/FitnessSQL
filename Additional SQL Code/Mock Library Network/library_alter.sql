--library_alter.sql
--author name: Peter Wotherspoon Bustamante



/*
First, adding in a new attribute to book copies: "bc_condition",
which is just a general summary of its condition, either "G"
for Good, "D" for damaged, or "L" for lost. Appropriate constraint applied.
Then, updating the status of a book copy from the Glen Waverley library, 
that was lost.

Second, adding another attribute to book copies: "loan_return_branch",
which just tracks WHICH branch (library), the book copy was returned to.
Then updating all loans from June 1st, to now (October 5th, 2021), to 
show that all book copies in this period, were returned to their respective
branches.

Finally, relationship between BRANCH and MANAGER entity, has changed. Cardinality
is now MANY TO MANY, thus new intermediate table is required. Intermediate table 
implemented, constraints added, and table populated.
*/






-- Adding new book attribute (book condition):
ALTER TABLE BOOK_COPY ADD
(
    bc_condition    CHAR(1)     DEFAULT 'G'     NOT NULL
);

COMMENT ON COLUMN BOOK_COPY.bc_condition IS
'The condition of the book, default is G (Good), otherwise can be D (damaged), 
or L (Lost), only loanable if condition is G';

ALTER TABLE BOOK_COPY ADD CONSTRAINT bc_cond_check CHECK (bc_condition IN ('G', 'D', 'L'));



-- Then updating the Glen Waverley book copy that was lost:
UPDATE BOOK_COPY
SET bc_condition = 'L'
WHERE branch_code = (SELECT branch_code FROM BRANCH WHERE branch_name = 'Glen Waverley Library')
    AND book_call_no = '005.74 C824C';

COMMIT;







-- Adding in attribute to keep track of return branch
ALTER TABLE LOAN ADD
(
    loan_return_branch      NUMERIC(2)
);

COMMENT ON COLUMN LOAN.loan_return_branch IS
    'The branch that the book copy was returned to';
    
ALTER TABLE LOAN ADD CONSTRAINT loan_branchcode_fk FOREIGN KEY (loan_return_branch) REFERENCES BRANCH (branch_code);



-- Update all completed loans, from June 1st, to "Now" (Oct 5th), return branch is same as where they borrowed it from.
UPDATE LOAN
set LOAN.loan_return_branch = LOAN.branch_code
WHERE loan_actual_return_date >= TO_DATE('01-Jun-2021', 'DD-MON-YYYY') 
    AND loan_actual_return_date <= TO_DATE('05-Oct-2021', 'DD-MON-YYYY');

COMMIT;








-- Many to Many relationship between BRANCH and MANAGER, thus new table required.
-- Note: Client stated 90% of branches will have managers that manage BOTH (B), thus B is default.
DROP TABLE BRANCH_MANAGER;
CREATE TABLE BRANCH_MANAGER
(
    branch_code         NUMERIC(2)      NOT NULL,
    man_id              NUMERIC(2)      NOT NULL,
    man_collection      CHAR(1)         DEFAULT 'B'     NOT NULL
);

COMMENT ON COLUMN BRANCH_MANAGER.branch_code IS
    'ID number of this branch';

COMMENT ON COLUMN BRANCH_MANAGER.man_id IS
    'ID number of this manager';

COMMENT ON COLUMN BRANCH_MANAGER.man_collection IS
    'The collection that this manager manages, at this branch, can be R (reference), F (fiction) or B (both)';

ALTER TABLE BRANCH_MANAGER ADD
(
    CONSTRAINT branch_manager_pk PRIMARY KEY (branch_code, man_id),
    CONSTRAINT branch_manager_fk1 FOREIGN KEY (man_id) REFERENCES MANAGER (man_id),
    CONSTRAINT branch_manager_fk2 FOREIGN KEY (branch_code) REFERENCES BRANCH (branch_code),
    CONSTRAINT man_collection_chk CHECK (man_collection IN ('F', 'R', 'B'))
);



-- Now must populate the new table (BRANCH_MANAGER), using BRANCH data:
-- Clayton Library
INSERT INTO BRANCH_MANAGER VALUES
(
    (SELECT branch_code FROM BRANCH where branch_name = 'Clayton Library'),
    10,
    'R'
);

INSERT INTO BRANCH_MANAGER VALUES
(
    (SELECT branch_code FROM BRANCH where branch_name = 'Clayton Library'),
    12,
    'F'
);


-- Glen Waverley Library
INSERT INTO BRANCH_MANAGER VALUES
(
    (SELECT branch_code FROM BRANCH where branch_name = 'Glen Waverley Library'),
    (SELECT man_id FROM BRANCH where branch_name = 'Glen Waverley Library'),
    'B'
);


-- Mount Waverley Library
INSERT INTO BRANCH_MANAGER VALUES
(
    (SELECT branch_code FROM BRANCH where branch_name = 'Mount Waverley Library'),
    (SELECT man_id FROM BRANCH where branch_name = 'Mount Waverley Library'),
    'B'
);


-- Mulgrave Library
INSERT INTO BRANCH_MANAGER VALUES
(
    (SELECT branch_code FROM BRANCH where branch_name = 'Mulgrave Library'),
    (SELECT man_id FROM BRANCH where branch_name = 'Mulgrave Library'),
    'B'
);


-- Delete man_id attribute from BRANCH table, now that we have BRANCH_MANAGER table.
ALTER TABLE BRANCH DROP COLUMN man_id;

COMMIT;



