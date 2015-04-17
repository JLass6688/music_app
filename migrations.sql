
CREATE DATABASE all_the_bands;

\c all_the_bands;

CREATE TABLE genres (id SERIAL PRIMARY KEY, title VARCHAR(255));

CREATE TABLE bands (id SERIAL PRIMARY KEY, name VARCHAR(255), genre_id INTEGER);