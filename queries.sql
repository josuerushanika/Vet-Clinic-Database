/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name !='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3; 

-- Start Transaction --

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
--ROLLBACK Transaction--
ROLLBACK;
SELECT * FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon--

UPDATE animals SET species = 'digimon' WHERE name like '%mon';

--Update the animals table by setting the species column to pokemon for all animals that don't have species already set.--

UPDATE animals SET species = 'pokemon' WHERE species is NULL;

--Commit the transaction--

COMMIT;

-- Verify the change after the commit --

SELECT * FROM animals;

--Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.--

--Start a Transction

BEGIN;

--delete all record in animal table.
DELETE FROM animals;
-- verify if record are deleted.
SELECT * FROM animals;

--ROLLBACK Transaction

ROLLBACK;

--Verify that record are reset back to default

SELECT * FROM animals;


--Begin transaction 2

BEGIN;

-- Delete all animals born after Jan 1st, 2022

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.

SAVEPOINT save;

-- -- Update all animals' weight to be their weight multiplied by -1.

UPDATE animals SET weight_kg = (weight_kg * -1);

--rollback to savepoint save

ROLLBACK TO save;

--Update all animals' weights that are negative to be their weight multiplied by -1.

UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;

--commit the transaction

COMMIT;

--Write queries

--1 query to count how many animals are there
SELECT COUNT(*) FROM animals;

--query to count how many animals have never tried to escape

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

--query to calculate the average of weights for animals

SELECT AVG(weight_kg) FROM animals;

--Query to show Who escapes the most, neutered or not neutered animals?

SELECT neutered, AVG(escape_attempts) AS escapes FROM animals GROUP BY neutered;

--query that shows the minimum and maximum weight of each type of animal.

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;

-- query that shows the average number of escape attempts per animal type of those born between 1990 and 2000

SELECT species, AVG(escape_attempts) AS escapes FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- INNER JOIN --
-- The animals  belong to Melody Pond --

 UPDATE owners SET full_name ='Melody Pond' WHERE id = 4;
 -- SELECT--
SELECT animals.name 
FROM animals 
INNER JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name = 'Melody Pond';	

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
INNER JOIN species ON animals.species_id = species_id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT owners.full_name,animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.id;

---- How many animals are in species?
SELECT species.name, COUNT(animals.id) AS count 
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species_id;

---List all Digimon owned by Jennifer Orwell.--
SELECT animals.name
FROM animals
INNER JOIN species ON animals.species_id = species_id
INNER JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

---List all animals owned by Dean Winchester that haven't tried to escape.

SELECT animals.name
FROM animals
INNER JOIN owners ON animals.owner_id = owner_id
WHERE owners.full_name = 'Dean Winchester'  AND escape_attempts = 0;

--Who owns the most animals?

SELECT owners.full_name, COUNT(animals.id) AS count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id
ORDER BY count DESC
LIMIT 1;


--Last query--

SELECT visits.animal_id, visits.date_of_visit , animals.name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals.id = visits.animal_id WHERE visits.vets_id = vets.id AND vets.name  = 'William Tatcher' ORDER BY  animal_id DESC LIMIT 1;
SELECT animals.name, visits.date_of_visit FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals.id = visits.animal_id WHERE visits.vets_id = 3 AND vets.name ='Stephanie Mendez';
SELECT vets.name, species.name AS specialty FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = specializations.vets_id;
SELECT animals.name, visits.date_of_visit FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals.id = visits.animal_id WHERE visits.vets_id and vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-08-03';
SELECT animal_name, COUNT(animal_name) AS total_visit_count FROM (SELECT vets.name AS vets_name,animal.name AS animal_name FROM visits FULL JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animal_id ) AS subby GROUP BY animal_name ORDER BY total_visit_count DESC LIMIT 1;
SELECT date_of_visit,animals.name FROM visits JOIN vets ON visits.vets_id = vets.id JOIN animals ON animals.id = visits.animal_id WHERE vets.id = visits.vets_id AND vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;
SELECT count(*) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id LEFT JOIN vets ON vets.id = visits.vets_id WHERE animals.species_id NOT IN (SELECT species_id FROM specializations WHERE vets_id = vets.id);
