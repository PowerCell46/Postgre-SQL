CREATE TABLE owners(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15) NOT NULL,
	address VARCHAR(50)
);


CREATE TABLE animal_types(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	animal_type VARCHAR(30) NOT NULL
);


CREATE TABLE cages(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	animal_type_id INTEGER NOT NULL,
	
	CONSTRAINT fk_cages_animal_types
	FOREIGN KEY(animal_type_id)
	REFERENCES animal_types(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE 
);


CREATE TABLE animals(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	birthdate DATE NOT NULL,
	owner_id INTEGER,
	animal_type_id INTEGER NOT NULL,
	
	CONSTRAINT fk_animals_owners
	FOREIGN KEY(owner_id)
	REFERENCES owners(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_animals_animal_types
	FOREIGN KEY(animal_type_id)
	REFERENCES animal_types(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);


CREATE TABLE volunteers_departments(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	department_name VARCHAR(30) NOT NULL
);


CREATE TABLE volunteers(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	phone_number varchar(15) NOT NULL,
	address VARCHAR(50),
	animal_id INTEGER,
	department_id INTEGER NOT NULL,
	
	CONSTRAINT fk_volunteers_animals
	FOREIGN KEY(animal_id)
	REFERENCES animals(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_volunteers_volunteers_departments
	FOREIGN KEY(department_id)
	REFERENCES volunteers_departments(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);


CREATE TABLE animals_cages(
	cage_id INTEGER NOT NULL,
	animal_id INTEGER NOT NULL,
	
	CONSTRAINT fk_animals_cages_cages
	FOREIGN KEY(cage_id)
	REFERENCES cages(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	
	CONSTRAINT fk_animals_cages_animals
	FOREIGN KEY(animal_id)
	REFERENCES animals(id)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);
