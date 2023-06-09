
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


 


