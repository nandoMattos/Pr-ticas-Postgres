CREATE DATABASE course;
\c course;

CREATE TYPE grade_type AS ENUM ('Abaixo da expectativas', 'Dentro das Expetativas', 'Acima das expectativas'); 

CREATE TABLE students(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(200) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE classes (
  id SERIAL PRIMARY KEY NOT NULL,
  code VARCHAR(10) NOT NULL
);

CREATE TABLE enrolls (
  id SERIAL PRIMARY KEY NOT NULL,
  id_student INTEGER NOT NULL,
  id_class INTEGER NOT NULL,
  FOREIGN KEY (id_student) REFERENCES students(id),
  FOREIGN KEY (id_class) REFERENCES classes(id),
  open_enrollment_date TIMESTAMP NOT NULL,
  close_enrollment_date TIMESTAMP NOT NULL CHECK (close_enrollment_date > open_enrollment_date)
);

CREATE TABLE modules (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(10) NOT NULL
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY NOT NULL,
  id_module INTEGER NOT NULL,
  FOREIGN KEY (id_module) REFERENCES modules(id),
  grade grade_type NOT NULL,
  name VARCHAR(25) NOT NULL
);
