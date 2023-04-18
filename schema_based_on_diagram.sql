CREATE TABLE patients (
    id serial  PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth date
);

CREATE TABLE invoices (
    id serial  PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    FOREIGN KEY  medical_history_id REFERENCES  medical_histories(id),
);

CREATE TABLE medical_histories (
    id serial  PRIMARY KEY,
    admitted_at  timestamp,
    patient_id int,
    status varchar(100)
);

