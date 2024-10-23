INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- First, inserting into petPet to ensure the foreign key constraint is satisfied
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

-- Now, inserting events related to Hammy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');
 
UPDATE petEvent SET remark = '5 kittens, 2 male' WHERE petname = 'Fluffy';

UPDATE petEvent SET remark = 'Claws broke rib' WHERE petname = 'Claws' AND eventdate = '1997-08-03';

UPDATE petPet SET death = '2020-09-01' WHERE petname = 'Puffball';

DELETE FROM petPet WHERE petname = 'Buffy' AND owner = 'Harold';
