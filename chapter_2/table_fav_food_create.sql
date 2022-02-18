CREATE TABLE favorite_food (
person_id SMALLINT,
food VARCHAR(20),
CONSTRAINT pk_fav_food PRIMARY KEY (person_id, food),
CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id)
 REFERENCES person (person_id)
);