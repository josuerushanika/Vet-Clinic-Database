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

START TRANSACTION;
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




