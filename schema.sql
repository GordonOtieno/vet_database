/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    Weight_kg DECIMAL,
    species_id INTEGER,
    owner_id INTEGER,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id),
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(20),
    age INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20),
    PRIMARY KEY(id)
);
