--library_3tables.sql
--author name: Peter Wotherspoon Bustamante





/* 
Creating three different tables, then adding appropriate constraints and comments
to each tables individual attributes. Also including foreign key constraints at 
the end.
*/






-- Creating table: BOOK_COPY
CREATE TABLE BOOK_COPY
(
    branch_code         numeric(2)      NOT NULL,
    bc_id               numeric(6)      NOT NULL,
    bc_purchase_price   numeric(7,2)    NOT NULL,
    bc_counter_reserve  char(1)         NOT NULL,
    book_call_no        varchar(20)     NOT NULL
);

ALTER TABLE BOOK_COPY ADD 
(
    CONSTRAINT BOOK_COPY_PK PRIMARY KEY (branch_code, bc_id),
    CONSTRAINT chk_bc_counter_reserve CHECK ( bc_counter_reserve IN ('Y', 'N'))
);

COMMENT ON COLUMN BOOK_COPY.branch_code IS
    'Branch number';

COMMENT ON COLUMN BOOK_COPY.bc_id IS
    'Book copy id, to identify a book copy that the branch owns, unique WITHIN a branch, reused between branches';

COMMENT ON COLUMN BOOK_COPY.bc_purchase_price IS
    'Purchase price for this book copy';

COMMENT ON COLUMN BOOK_COPY.bc_counter_reserve IS
    'Flag, to indicate if on Counter Reserve or not (Y/N)';

COMMENT ON COLUMN BOOK_COPY.book_call_no IS
    'Books call number - identifies a book';








-- Creating table: LOAN
CREATE TABLE LOAN
(
    branch_code             numeric(2)      NOT NULL,
    bc_id                   numeric(6)      NOT NULL,
    loan_date_time          DATE            NOT NULL,
    loan_due_date           DATE            NOT NULL,
    loan_actual_return_date DATE,
    bor_no                  numeric(6)      NOT NULL     
);

ALTER TABLE LOAN ADD
(
    CONSTRAINT LOAN_PK PRIMARY KEY (branch_code, bc_id, loan_date_time)
);

COMMENT ON COLUMN LOAN.branch_code IS
    'Branch number';

COMMENT ON COLUMN LOAN.bc_id IS
    'Used to identify a particular book copy that the branch owns, unique WITHIN a branch, reused between branches';

COMMENT ON COLUMN LOAN.LOAN_DATE_TIME IS
    'Date and time loan was taken out';

COMMENT ON COLUMN LOAN.loan_due_date IS
    'Date loan is due (no specific time of day is assigned, just the overall day month and year)';

COMMENT ON COLUMN LOAN.loan_actual_return_date IS
    'The actual date the loan was returned (specific time of day is not tracked, just overall day month and year)';

COMMENT ON COLUMN LOAN.bor_no IS
    'Borrower identifier';








-- Creating table: RESERVE
CREATE TABLE RESERVE
(
    reserve_id      numeric(6)      NOT NULL,
    branch_code     numeric(2)      NOT NULL,
    bc_id           numeric(6)      NOT NULL,
    reserve_date_time_placed    DATE    NOT NULL,
    bor_no          numeric(6)      NOT NULL         
);

ALTER TABLE RESERVE ADD
(
    CONSTRAINT RESERVE_PK PRIMARY KEY (reserve_id),
    CONSTRAINT branch_code_bc_id_uq UNIQUE (branch_code, bc_id),
    CONSTRAINT reserve_date_time_placed_uq UNIQUE (reserve_date_time_placed)
);

COMMENT ON COLUMN RESERVE.reserve_id IS
    'Reservation number (unique across all branches)';

COMMENT ON COLUMN RESERVE.branch_code IS
    'Branch number';

COMMENT ON COLUMN RESERVE.bc_id IS
    'Used to identify a particular book copy that the branch owns, unique WITHIN a branch, reused between branches';

COMMENT ON COLUMN RESERVE.reserve_date_time_placed IS
    'Date and time reserve was placed';

COMMENT ON COLUMN RESERVE.bor_no IS
    'Borrower identifier';








-- Foreign Keys for BOOK_COPY:
ALTER TABLE BOOK_COPY ADD 
(
    CONSTRAINT BC_BRANCH_FK FOREIGN KEY (branch_code) REFERENCES BRANCH (branch_code),
    CONSTRAINT BC_BD_FK FOREIGN KEY (book_call_no) REFERENCES BOOK_DETAIL (book_call_no)
);

-- Foreign Keys for LOAN:
ALTER TABLE LOAN ADD
(
    CONSTRAINT LOAN_BC_FK FOREIGN KEY (branch_code, bc_id) REFERENCES BOOK_COPY (branch_code, bc_id),
    CONSTRAINT LOAN_BORROWER_FK FOREIGN KEY (bor_no) REFERENCES BORROWER (bor_no)
);

-- Foreign Keys for RESERVE:
ALTER TABLE RESERVE ADD
(
    CONSTRAINT RESERVE_BRANCH_FK FOREIGN KEY (branch_code, bc_id) REFERENCES BOOK_COPY (branch_code, bc_id),
    CONSTRAINT RESERVE_BORR_FK FOREIGN KEY (bor_no) REFERENCES BORROWER (bor_no)
);



