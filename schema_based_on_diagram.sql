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
    FOREIGN KEY ( medical_history_id) REFERENCES  medical_histories(id),
);

CREATE TABLE medical_histories (
    id serial  PRIMARY KEY,
    admitted_at  timestamp,
    patient_id int,
    status varchar(100)
     FOREIGN KEY ( patient_id) REFERENCES  patients (id),
);

CREATE TABLE treatments (
    id serial  PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100),
);

CREATE TABLE invoice_items (
    id serial  PRIMARY KEY,
    unit_price  decimal,
    quantity int,
    total_price  decimal,
    invoice_id  int, 
    treatment_id int,
    FOREIGN KEY ( invoice_id) REFERENCES  invoices (id),
    FOREIGN KEY ( treatment_id) REFERENCES treatments (id),
);

CREATE TABLE medical_histories_treatments (
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id) 
);
