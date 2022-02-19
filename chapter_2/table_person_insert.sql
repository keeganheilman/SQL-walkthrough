
-- INSERT a row to `person` table
INSERT INTO person(fname, lname, eye_color, birth_date) VALUES ('William','Turner', 'BR', '1972-05-27');
-- postgres will convert the string to a date given it is provided in the required format.


-- INSERT another row to `person` table
INSERT INTO person(fname, lname, eye_color, birth_date, street, city, state, country, postal_code)
VALUES ('Susan', 'Smith', 'BL', '1975-11-02', '23 Maple St.', 'Arlington', 'VA', 'USA', '20220');
