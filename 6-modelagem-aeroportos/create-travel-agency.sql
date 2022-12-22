CREATE DATABASE travel_agency;
\c travel_agency;

CREATE TABLE companies (
  id SERIAL PRIMARY KEY NOT NULL,
  acronym VARCHAR(10) NOT NULL,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE airports (
  id SERIAL PRIMARY KEY NOT NULL,
  acronym VARCHAR(10) NOT NULL,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY NOT NULL,
  departure_airport_id INTEGER NOT NULL,
  arrival_airport_id INTEGER NOT NULL CHECK (departure_airport_id != arrival_airport_id),
  company_id INTEGER NOT NULL,
  FOREIGN KEY (departure_airport_id) REFERENCES airports(id),
  FOREIGN KEY (arrival_airport_id) REFERENCES airports(id),
  FOREIGN KEY (company_id) REFERENCES companies(id),
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL CHECK (arrival_time >= departure_time),
  acronym VARCHAR(10) NOT NULL
);
