--library_drop.sql

--author name: Peter Wotherspoon Bustsamante

/* 

Dropping several tables of the library networks relational database.

The order in which tables are dropped, is set so that foreign 
keys aren't removed prematurely,(which would otherwise stop other 
tables from being dropped later on, unless we're using CASCADE
CONSTRAINTS, which we're avoiding in this case).

*/ 


DROP TABLE LOAN PURGE;
DROP TABLE RESERVE PURGE;
DROP TABLE BOOK_COPY PURGE; 
DROP TABLE BORROWER PURGE;
DROP TABLE BOOK_DETAIL PURGE;
DROP TABLE BRANCH PURGE;
DROP TABLE "MANAGER" PURGE;



