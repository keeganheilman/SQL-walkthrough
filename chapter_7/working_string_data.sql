-- CHAR, VARCHAR, TEXT types
CREATE TABLE string_tbl(
    char_fld CHAR(30),
    vchar_fld VARCHAR(30),
    text_fld TEXT
);



-- STRING GENERATION
INSERT INTO string_tbl (
    char_fld,
     vchar_fld,
      text_fld)
VALUES (
    'This is char data',
    'This is varchar data',
    'This is text data');



-- attempt to update with too-large of a string 
 UPDATE string_tbl
 SET vchar_fld = 'This is a piece of extremely long varchar data'; 
-- ERROR:  value too long for type character varying(30)
-- be aware, if in ANSI mode the server will truncate and warn rather than an exception if the string is too long for a particular variable type.



-- using single quote to escape a single quote in string
UPDATE string_tbl
SET text_fld = 'This string didn''t work, but it does now';



