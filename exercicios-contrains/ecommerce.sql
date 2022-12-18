CREATE DATABASE ecommerce;
\c ecommerce;

CREATE TYPE status AS ENUM ('created', 'paid', 'delivered', 'canceled'); 

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL 
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  price INTEGER NOT NULL,
  category TEXT NOT NULL,
  stockTotal INTEGER NOT NULL
);

CREATE TABLE purchases (
  id SERIAL PRIMARY KEY,
  "userId" INTEGER NOT NULL REFERENCES "users"("id"),
  "productId" INTEGER NOT NULL REFERENCES "products"("id"),
  product_amount INTEGER NOT NULL
);

CREATE TABLE products_images (
  id SERIAL PRIMARY KEY,
  "productId" INTEGER NOT NULL REFERENCES "products"("id"),
  image_url TEXT NOT NULL,
  main_imagem BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE adresses (
  id SERIAL PRIMARY KEY,
  "userId" INTEGER NOT NULL REFERENCES "users"("id"),
  adress TEXT NOT NULL,
  adress2 TEXT,
  district TEXT NOT NULL,
  city TEXT NOT NULL,
  postal_code TEXT NOT NULL
);

CREATE TABLE deliveries (
  id SERIAL PRIMARY KEY,
  "purchaseId" INTEGER NOT NULL REFERENCES "purchases"("id"),
  "adressId" INTEGER NOT NULL REFERENCES "adresses"("id"),
  current_status status NOT NULL
);
