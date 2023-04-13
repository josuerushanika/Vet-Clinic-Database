

CREATE TABLE animals (
    id integer primary key NOT NULL,
    name varchar(50),
    date_of_birth date,
    escape_attempts  integer,
    neutered  boolean,
    weight_kg decimal
);
ALTER TABLE animals ADD species VARCHAR(250);

--Create table owners--

CREATE TABLE owners (
  id integer PRIMARY KEY,
  full_name VARCHAR (80) NOT NULL,
  age integer NOT NULL
);

--Create a table named species--

CREATE TABLE species (
  id integer PRIMARY KEY NOT NULL,
  name VARCHAR(70)
);

--MODIFIER TABLE--
ALTER TABLE animals DROP COLUMN species;

--Add column species_id which is a foreign key referencing species table--
ALTER TABLE animals ADD COLUMN species_id INT;
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species(id);

--Add column owner_id which is a foreign key referencing the owners table--

ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

