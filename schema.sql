/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id INT,
    name varchar(100),
    date_of_birth DATE NOT NULL,
    escape_attempts INTEGER NOT NULL,
    neutered BOOLEAN NOT NULL,
    Weight_kg DECIMAL
);
