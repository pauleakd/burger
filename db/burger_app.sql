DROP TABLE deals;
DROP TABLE IF EXISTS deals_percent;
DROP TABLE IF EXISTS deals_subtract;
DROP TABLE IF EXISTS deals_x_for_y;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;
DROP TABLE IF EXISTS days;


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
  burger_id INT2 REFERENCES burgers(id) ON DELETE CASCADE,
  eatery_id INT2 REFERENCES eateries(id) ON DELETE CASCADE,
  price INT2
);

CREATE TABlE deals_subtract (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  menu_item_id INT2 REFERENCES menu_items(id) ON DELETE CASCADE,
  day_id INT2 REFERENCES days(id) ON DELETE CASCADE,
  amount INT2
);

CREATE TABlE deals_percent (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  menu_item_id INT2 REFERENCES menu_items(id) ON DELETE CASCADE,
  day_id INT2 REFERENCES days(id) ON DELETE CASCADE,
  amount NUMERIC
);

CREATE TABLE deals_x_for_y (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  menu_item_id INT2 REFERENCES menu_items(id) ON DELETE CASCADE,
  day_id INT2 REFERENCES days(id) ON DELETE CASCADE,
  x INT2,
  Y INT2
);
