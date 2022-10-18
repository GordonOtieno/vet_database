/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >='2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name from animals WHERE neutered = 'true' AND escape_attempts <3;
SELECT date_of_birth FROM animals WHERE name ='Agumon' OR name ='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg >=10.4 AND weight_kg <= 17.3;

-- day 2 tasks2 query 1
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM ANIMALS;
ROLLBACK;

-- tasks2 query 2
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM ANIMALS;
-- take screenshort 1

-- tasks2 query 3
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM ANIMALS;
-- take screenshort 2

-- tasks2 query 4
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = (weight_kg*-1);
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = (weight_kg*-1) WHERE weight_kg <0;
COMMIT;
-- take screenshort 3

-- tasks3 query 1
SELECT COUNT(*) AS number_of_animals FROM animals;
SELECT COUNT(*) AS never_tried_escape FROM animals WHERE escape_attempts=0;
SELECT avg(weight_kg) AS average_weight from animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;
-- take screenshort 4