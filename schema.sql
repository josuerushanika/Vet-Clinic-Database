CREATE TABLE animals (
    id integer primary key NOT NULL,
    name varchar(50),
    date_of_birth date,
    escape_attempts  integer,
    neutered  boolean,
    weight_kg decimal
)

ALTER TABLE animals ADD species VARCHAR(250);