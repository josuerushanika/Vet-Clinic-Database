
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(1, 'Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(2, 'Gabumon','2018-11-15', 2, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(3, 'Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(4, 'Devimon', '2017-05-12', 5, true, 11);



INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(5, 'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(7, 'Squirte', '1993-04-2', 3, false, -12.13);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
(11, 'Ditto', '2022-05-14', 4, true, 22);


--Insert into owners--
INSERT INTO owners ( full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell',19),
       ('Bob',45),
       ('Meloy Pon', 77),
       ('Dean Winchester',14),
       ('Jodie Whittaker',38);

--Insert into species--
       INSERT INTO species ( name)
VALUES ('Pokemon'),
       ('Digimon');
	   SELECT * FROM species;


-- Modify inserted animals so it includes the species_id value --
UPDATE animals SET species_id = 2 WHERE name like '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modify inserted animals to include owner information (owner_id) --

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name =  'Plantmon';
UPDATE animals SET name ='Squirtle' WHERE id = 7;
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

--Insert into  vets--

INSERT INTO  vets ( name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties--

INSERT INTO specializations(species_id, vets_id) VALUES(1,1);
INSERT INTO specializations(species_id, vets_id) VALUES(2,3);
INSERT INTO specializations(species_id, vets_id) VALUES(1, 3);
INSERT INTO specializations(species_id, vets_id) VALUES(2, 4);

--Insert data for visits --

INSERT INTO visits (animal_id, vets_id, date_of_visit)
VALUES (1, 1, '2020-05-24'),
       (1, 3, '2020-07-22'),
       (2, 4, '2021-02-02'),
       (3, 2, '2020-01-05'),
       (3, 2, '2020-03-08'),
       (3, 2, '2020-05-14'),
       (4, 3, '2021-05-04'),
       (5, 4, '2021-02-24'),
       (6, 2, '2019-12-21'),
       (6, 1, '2020-08-10'),
       (6, 2, '2021-04-07'),
       (6, 2, '2021-04-07'),
       (8, 4, '2020-10-03'),
       (8, 4, '2020-11-04'),
       (9, 2, '2019-01-24'),
       (9, 2, '2019-05-15'),
       (9, 2, '2020-02-27'),
       (9, 2, '2020-08-03'),
       (10, 3, '2020-05-24'),
       (10, 1, '2021-01-11');


