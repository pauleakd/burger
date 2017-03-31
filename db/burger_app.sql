DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;

CREATE TABLE burgers (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE days (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE eateries (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE menu_items (
  id SERIAL2 PRIMARY KEY,
  burger_id INT2 REFERENCES burgers(id),
  eatery_id INT2 REFERENCES eateries(id),
  price INT2
);
