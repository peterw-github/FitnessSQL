--library_populate.sql
--author name: Peter Wotherspoon Bustamante



/*
Putting some copies of books into the database, as well as 
some loans, and reservations, for books that are currently
unavailable.
*/




-- Populate the BOOK_COPY Table:
INSERT INTO BOOK_COPY VALUES
(
    10,
    1,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    10,
    2,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    10,
    3,
    20.00,
    'Y',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    10,
    4,
    30.00,
    'N',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    10, 
    5,
    30.00,
    'Y',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    10,
    6,
    10.00,
    'N',
    '112.6 S874D'
);

INSERT INTO BOOK_COPY VALUES
(
    11,
    1,
    20.00,
    'N',
    '005.74 D691D' 
);

INSERT INTO BOOK_COPY VALUES
(
    11, 
    2,
    20.00,
    'Y',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    11, 
    3, 
    40.00,
    'N',
    '005.432 L761P'
);

INSERT INTO BOOK_COPY VALUES
(
    11, 
    4, 
    40.00,
    'Y',
    '005.432 L761P'
);

INSERT INTO BOOK_COPY VALUES
(
    11, 
    5, 
    35.00,
    'Y',
    '823.914 A211H'
); 

INSERT INTO BOOK_COPY VALUES
(
    11, 
    6, 
    35.00,
    'N',
    '823.914 A211H'
); 

INSERT INTO BOOK_COPY VALUES
(
    11, 
    7, 
    99.00,
    'Y',
    '823.914 H219A'
);

INSERT INTO BOOK_COPY VALUES
(
    12,
    1,
    20.00,
    'N',
    '005.74 D691D' 
);

INSERT INTO BOOK_COPY VALUES
(
    12, 
    2,
    30.00,
    'Y',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    12,
    3,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    12,
    4,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    12,
    5,
    10.00,
    'N',
    '112.6 S874D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    1,
    20.00,
    'Y',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    2,
    30.00,
    'Y',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    3,
    10.00,
    'Y',
    '112.6 S874D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    4,
    40.00,
    'Y',
    '005.432 L761P'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    5,
    35.00,
    'Y',
    '823.914 A211H'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    6,
    99.00,
    'Y',
    '823.914 H219A'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    7,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    8,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    9,
    20.00,
    'N',
    '005.74 D691D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    10,
    30.00,
    'N',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    11,
    30.00,
    'N',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    12,
    30.00,
    'N',
    '005.756 G476F'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    13,
    10.00,
    'N',
    '112.6 S874D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    14,
    10.00,
    'N',
    '112.6 S874D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    15,
    10.00,
    'N',
    '112.6 S874D'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    16,
    40.00,
    'N',
    '005.432 L761P'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    17,
    40.00,
    'N',
    '005.432 L761P'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    18,
    40.00,
    'N',
    '005.432 L761P'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    19,
    35.00,
    'N',
    '823.914 A211H'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    20,
    35.00,
    'N',
    '823.914 A211H'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    21,
    35.00,
    'N',
    '823.914 A211H'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    22,
    99.00,
    'N',
    '823.914 H219A'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    23,
    99.00,
    'N',
    '823.914 H219A'
);

INSERT INTO BOOK_COPY VALUES
(
    13,
    24,
    99.00,
    'N',
    '823.914 H219A'
);









-- Populate the LOAN Table:
INSERT INTO LOAN VALUES
(
    10,
    1,
    TO_DATE('02-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('16-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    1
);

INSERT INTO LOAN VALUES
(
    10,
    4,
    TO_DATE('02-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('16-Jun-2021', 'DD-MON-YYYY'),
    NULL,
    1
);

INSERT INTO LOAN VALUES
(
    10, 
    6,
    TO_DATE('02-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('16-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('15-Jun-2021', 'DD-MON-YYYY'),
    1
);

INSERT INTO LOAN VALUES
(
    11, 
    1,
    TO_DATE('15-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('29-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('28-Jun-2021', 'DD-MON-YYYY'),
    2
);

INSERT INTO LOAN VALUES
(
    11, 
    3,
    TO_DATE('15-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('29-Jul-2021', 'DD-MON-YYYY'),
    TO_DATE('28-Jun-2021', 'DD-MON-YYYY'),
    2
);

INSERT INTO LOAN VALUES
(
    11, 
    6,
    TO_DATE('15-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('29-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('25-Jun-2021', 'DD-MON-YYYY'),
    2
);

INSERT INTO LOAN VALUES
(
    12, 
    3,
    TO_DATE('07-Aug-2021', 'DD-MON-YYYY'),
    TO_DATE('21-Aug-2021', 'DD-MON-YYYY'),
    NULL,
    3
);

INSERT INTO LOAN VALUES
(
    12, 
    1,
    TO_DATE('11-Aug-2021', 'DD-MON-YYYY'),
    TO_DATE('25-Aug-2021', 'DD-MON-YYYY'),
    NULL,
    3
);

INSERT INTO LOAN VALUES
(
    12, 
    5,
    TO_DATE('13-Aug-2021', 'DD-MON-YYYY'),
    TO_DATE('27-Aug-2021', 'DD-MON-YYYY'),
    NULL,
    3
);

INSERT INTO LOAN VALUES
(
    13, 
    7,
    TO_DATE('05-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('18-Jun-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO LOAN VALUES
(
    13, 
    10,
    TO_DATE('05-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('18-Jun-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO LOAN VALUES
(
    13, 
    13,
    TO_DATE('05-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('18-Jun-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO LOAN VALUES
(
    13, 
    16,
    TO_DATE('05-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('18-Jun-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO LOAN VALUES
(
    13, 
    19,
    TO_DATE('05-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('18-Jun-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO LOAN VALUES
(
    13, 
    22,
    TO_DATE('05-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('18-Jun-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO LOAN VALUES
(
    10, 
    2,
    TO_DATE('19-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('03-Jul-2021', 'DD-MON-YYYY'),
    TO_DATE('26-Jun-2021', 'DD-MON-YYYY'),
    5
);

INSERT INTO LOAN VALUES
(
    13, 
    22,
    TO_DATE('20-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('04-Jul-2021', 'DD-MON-YYYY'),
    TO_DATE('27-Jun-2021', 'DD-MON-YYYY'),
    5
);

INSERT INTO LOAN VALUES
(
    11, 
    1,
    TO_DATE('22-Jun-2021', 'DD-MON-YYYY'),
    TO_DATE('06-Jul-2021', 'DD-MON-YYYY'),
    TO_DATE('03-Jul-2021', 'DD-MON-YYYY'),
    5
);

INSERT INTO LOAN VALUES
(
    12, 
    4,
    TO_DATE('03-Jul-2021', 'DD-MON-YYYY'),
    TO_DATE('17-Jul-2021', 'DD-MON-YYYY'),
    TO_DATE('27-Jul-2021', 'DD-MON-YYYY'),
    5
);







-- Populate the RESERVE Table:
INSERT INTO RESERVE VALUES
(
    1,
    12,
    1,
    TO_DATE('17-Aug-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO RESERVE VALUES
(
    2,
    12,
    3,
    TO_DATE('21-Aug-2021', 'DD-MON-YYYY'),
    4
);

INSERT INTO RESERVE VALUES
(
    3,
    12,
    5,
    TO_DATE('25-Aug-2021', 'DD-MON-YYYY'),
    5
);

INSERT INTO RESERVE VALUES
(
    4,
    10,
    4,
    TO_DATE('19-Jul-2021', 'DD-MON-YYYY'),
    2
);

COMMIT;
