CREATE DATABASE dvd_rent;
\c dvd_rent

CREATE TABLE countries (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE states (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL UNIQUE,
  acronym VARCHAR(5) NOT NULL UNIQUE
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY NOT NULL,
  id_state INTEGER NOT NULL,
  id_country INTEGER NOT NULL,
  FOREIGN KEY (id_state) REFERENCES states(id),
  FOREIGN KEY (id_country) REFERENCES countries(id),
  name VARCHAR(50) NOT NULL
);

CREATE TABLE adresses (
  id SERIAL PRIMARY KEY NOT NULL,
  id_city INTEGER NOT NULL,
  FOREIGN KEY (id_city) REFERENCES cities(id),
  street VARCHAR(80) NOT NULL,
  district VARCHAR(50) NOT NULL,
  number INTEGER NOT NULL,
  postal_code VARCHAR(20) NOT NULL,
  complement VARCHAR(30)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(200) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE dwelling (
  id_customer INTEGER NOT NULL,
  id_adress INTEGER NOT NULL,
  PRIMARY KEY (id_customer, id_adress),
  FOREIGN KEY (id_customer) REFERENCES customers(id),
  FOREIGN KEY (id_adress) REFERENCES adresses(id)
);

CREATE TABLE area_codes (
  id SERIAL PRIMARY KEY NOT NULL,
  id_country INTEGER NOT NULL,
  FOREIGN KEY (id_country) REFERENCES countries(id),
  code VARCHAR(5) NOT NULL UNIQUE
);

CREATE TABLE phones (
  id SERIAL PRIMARY KEY NOT NULL,
  id_area_code INTEGER NOT NULL,
  FOREIGN KEY (id_area_code) REFERENCES area_codes(id),
  number VARCHAR(11) NOT NULL
);

CREATE TABLE customers_phones (
  id_customer INTEGER NOT NULL,
  id_phone INTEGER NOT NULL,
  PRIMARY KEY (id_customer, id_phone),
  FOREIGN KEY (id_customer) REFERENCES customers(id),
  FOREIGN KEY (id_phone) REFERENCES phones(id)
);

CREATE TABLE rentals (
  id SERIAL PRIMARY KEY NOT NULL,
  id_customer INTEGER NOT NULL,
  FOREIGN KEY (id_customer) REFERENCES customers(id),
  rent_date TIMESTAMP NOT NULL,
  return_date TIMESTAMP CHECK (return_date > rent_date)
);

CREATE TABLE researches (
  id SERIAL PRIMARY KEY NOT NULL,
  id_customer INTEGER NOT NULL,
  id_rental INTEGER NOT NULL,
  FOREIGN KEY (id_customer) REFERENCES customers(id), 
  FOREIGN KEY(id_rental) REFERENCES rentals(id),
  grade INTEGER NOT NULL
); 

CREATE TABLE actors (
  id SERIAL PRIMARY KEY NOT NULL,
  id_country INTEGER NOT NULL,
  FOREIGN KEY (id_country) REFERENCES countries(id),
  name VARCHAR(200) NOT NULL,
  birth_date DATE NOT NULL
);

CREATE TABLE caterogies (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY NOT NULL,
  id_category INTEGER NOT NULL,
  FOREIGN KEY (id_category) REFERENCES caterogies(id),
  title VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE movies_actors (
  id_movie INTEGER NOT NULL,
  id_actor INTEGER NOT NULL,
  PRIMARY KEY (id_movie, id_actor),
  FOREIGN KEY (id_movie) REFERENCES movies(id),
  FOREIGN KEY (id_actor) REFERENCES actors(id)
);

CREATE TABLE DVDs (
  id SERIAL PRIMARY KEY NOT NULL,
  id_movie INTEGER NOT NULL,
  id_rental INTEGER,
  FOREIGN KEY (id_movie) REFERENCES movies(id),
  FOREIGN KEY (id_rental) REFERENCES rentals(id),
  number INTEGER NOT NULL,
  bar_code VARCHAR(200) NOT NULL
);
