--  FRANKLIN SAFARI
--  YOUR ID HERE
-- ------------------------------------------------------------------------------------------------------------------
--  lab5.sql
-- --------------------------------------------------------------------------------------------------------------------
-- The purpose of these labs is to gain experience normalizing a poorly
-- structured database from a single 1NF relation into many well structured
-- 3NF relations. You started with an 1NF table and have been provided a set
-- of 3NF relations. Your task is to create the 3NF database relations using
-- SQL DDL statements and to populate the relations with sample data from
-- the table using SQL DML statements.
--
-- To execute your script:
--  $> mysql --login-path=Lab5 Lab5 < lab5.sql





DROP TABLE IF EXISTS `Volume`, `Authorship`, `Book`, `Author`,`Publisher`;
-- ------------------------------------------------------------------------------------------------------------------
-- TABLE PUBLISHER 
-- -----------------------------------------------------------------------------------------------------------------

  CREATE TABLE `Publisher`(
    `ID`           NUMERIC(4,0)            NOT NULL, 
    `Nane`          VARCHAR(25)             NOT NULL,
    CONSTRAINT PUBLISHER_PK PRIMARY KEY (`ID`));

-- -----------------------------------------------------------------------------------------------------------------







-- -----------------------------------------------------------------------------------------------------------------
-- AUTHOR TABLE 
-- ------------------------------------------------------------------------------------------------------------------

  CREATE TABLE `Author`(
    `ID`        NUMERIC(4,0)            NOT NULL,
    `Name`      VARCHAR(25)             NOT NULL,
    CONSTRAINT AUTHOR_PK PRIMARY KEY (`ID`));






-- ----------------------------------------------------------------------------------------------------------------
-- BOOKS TABLE
-- ----------------------------------------------------------------------------------------------------------------

  CREATE TABLE `Book`(
    `ISBN`              NUMERIC(13,0)           NOT NULL,
    `Title`             VARCHAR(25)             NOT NULL, 
    `Publisher_Date`    DATE       NOT NULL,
    `Publisher_ID`      NUMERIC(4,0)            NOT NULL,
    CONSTRAINT BOOKS_PK PRIMARY KEY (`ISBN`),
    CONSTRAINT BOOKS_FK FOREIGN KEY (`Publisher_ID`) REFERENCES `Publisher` (`ID`));








-- -----------------------------------------------------------------------------------------------------------------
-- AUTHORSHIP TABLE
-- ---------------------------------------------------------------------------------------------------------------------- 


  CREATE TABLE `Authorship`(
    `Book_ISBN`         NUMERIC(13,0)           NOT NULL,
    `Author_ID`         NUMERIC(4,0)            NOT NULL,
    `RoyaltyPercent`    DECIMAL(3,2)            NOT NULL,
    `LeadAuthor`        VARCHAR(25)             NOT NULL,
    `Position`          INT                     NOT NULL,
    CONSTRAINT AUTHORSHIP_PK PRIMARY KEY (`Book_ISBN`, `Author_ID`),
    CONSTRAINT AUTHORSHIP_FK FOREIGN KEY (`Book_ISBN`) REFERENCES `Book` (`ISBN`),
    CONSTRAINT AUTHORSHIP_FK2 FOREIGN KEY (`Author_ID`) REFERENCES `Author` (`ID`));








-- ------------------------------------------------------------------------------------------------------------------
-- TABLE VOLUME 
-- --------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE `Volume`(
    `Series_Book_ISBN`          NUMERIC(13,0)       NOT NULL,
    `Volume_Book_ISBN`          NUMERIC(13,0)       NOT NULL,
    `Position`                  NUMERIC(2,0)        NULL,
    CONSTRAINT VOLUME_PK PRIMARY KEY (`Series_Book_ISBN`, `Volume_Book_ISBN`),
    CONSTRAINT VOLUME_FK FOREIGN KEY (`Series_Book_ISBN`) REFERENCES `Book` (`ISBN`));

-- ------------------------------------------------------------------------------------------------------------------




