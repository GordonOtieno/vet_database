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
SELECT * FROM ANIMALS;

-- tasks2 query 2
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT species FROM animals;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT species FROM animals;
-- take screenshort 1

-- tasks2 query 3
BEGIN;
DELETE FROM animals;
SELECT * FROM ANIMALS;
ROLLBACK;
SELECT * FROM ANIMALS;
-- take screenshort 2

-- tasks2 query 4
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = (weight_kg*-1);
SELECT * FROM ANIMALS;
ROLLBACK TO SP1;
SELECT * FROM ANIMALS;
UPDATE animals SET weight_kg = (weight_kg*-1) WHERE weight_kg <0;
COMMIT;
SELECT * FROM ANIMALS;
-- take screenshort 3

-- tasks3 query 1
SELECT COUNT(*) AS number_of_animals FROM animals;
SELECT COUNT(*) AS never_tried_escape FROM animals WHERE escape_attempts=0;
SELECT avg(weight_kg) AS average_weight from animals;
--Who escapes the most, neutered or not neutered animals?
SELECT name,neutered, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

--What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth>='1990-1-1' AND date_of_birth <='2000-12-31' GROUP BY species;

--Queries using JOIN Day 3

-- What animals belong to Melody Pond?
SELECT animals.name FROM animals 
JOIN owners on animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.*, species.name as species_name from animals 
JOIN species on animals.species_id = species.id WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name as animal_name, owners.fulL_name as owner_name from owners 
LEFT JOIN animals on owners.id = animals.owner_id;

-- How many animals are there per species?

SELECT species.name, COUNT(*) from animals 
JOIN species ON species.id = animals.species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name as animal_name, owners.full_name as owner_name, species.name as species_name from animals
JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) as num_animals from owners
LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY num_animals DESC;