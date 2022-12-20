CREATE DATABASE bank;
\c bank;

CREATE TYPE type_phones AS ENUM ('landline','mobile');
CREATE TYPE type_transactions AS ENUM ('deposit','withdraw');

CREATE TABLE states (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  "fullName" VARCHAR(200) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password TEXT NOT NULL
);

CREATE TABLE "customerAdresses"(
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL,
  "cityId" INTEGER NOT NULL,
  FOREIGN KEY ("customerId") REFERENCES customers(id),
  FOREIGN KEY ("cityId") REFERENCES cities("id"),
  street VARCHAR(100) NOT NULL,
  number INTEGER NOT NULL,
  complement VARCHAR(50),
  "postalCode" INTEGER NOT NULL
);

CREATE TABLE "customersPhones"(
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL,
  FOREIGN KEY ("customerId") REFERENCES customers(id),
  number VARCHAR(14) NOT NULL,
  type type_phones NOT NULL
);

CREATE TABLE "bankAccount"(
  id SERIAL PRIMARY KEY,
  "customerId" INTEGER NOT NULL,
  FOREIGN KEY ("customerId") REFERENCES customers(id),
  "accountNumber" VARCHAR(20) NOT NULL UNIQUE,
  agency VARCHAR(25) NOT NULL,
  "openDate" DATE NOT NULL,
  "closeDate" DATE NOT NULL	
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL,
  FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id),
  amount INTEGER NOT NULL,
  type type_transactions NOT NULL,
  time TIMESTAMP NOT NULL,
  description VARCHAR(25) NOT NULL,
  cancelled BOOLEAN NOT NULL
);

CREATE TABLE "creditCards" (
  id SERIAL PRIMARY KEY,
  "bankAccountId" INTEGER NOT NULL,
  FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id),
  name VARCHAR(50) NOT NULL,
  number VARCHAR(50) NOT NULL UNIQUE,
  "securityCode" VARCHAR(5) NOT NULL,
  "expirationMonth" DATE NOT NULL,
  "expirationYear" DATE NOT NULL,
  password VARCHAR(100) NOT NULL,
  "cardLimit" INTEGER NOT NULL
);
