
-- cannot alter existing table column to SERIAL, but instead must create and use sequence
CREATE SEQUENCE person_person_id_seq OWNED BY person.person_id;
ALTER TABLE person ALTER COLUMN person_id SET DEFAULT nextval('person_person_id_seq');
