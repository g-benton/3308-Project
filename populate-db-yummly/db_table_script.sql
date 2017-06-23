create table recipes(
  id int not null auto_increment,
  name varchar(1000) not null,
  yummly_id varchar(1000),
  primary key (id));

create table ingredients(
  id int not null auto_increment,
  name varchar(1000) not null,
  primary key (id));

create table recipe_ingredients(
  recipe_id INT references recipes(id),
  ingredient_id INT references ingredients(id));
