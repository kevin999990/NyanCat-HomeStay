CREATE TABLE staff(
id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name VARCHAR(24) NOT NULL,
	address VARCHAR(1024),
	IC VARCHAR(14) NOT NULL UNIQUE,
	PHONE_NUMBER VARCHAR(11), 
	USERNAME VARCHAR(20) NOT NULL, 
	PASSWORD VARCHAR(20) NOT NULL,
	CONSTRAINT staff_pk PRIMARY KEY (id)
) ;

CREATE TABLE TASK (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name VARCHAR(3) NOT NULL,
	DESCRIPTION VARCHAR(50), 
	CONSTRAINT task_pk PRIMARY KEY (id)
	);

CREATE TABLE roomtype(
	id INTEGER NOT NULL,
	description VARCHAR(50),
	price INTEGER,
	PRIMARY KEY (id)
);
CREATE TABLE Room (
	id INTEGER NOT NULL,
	roomtype INTEGER ,
	availability boolean,
	PRIMARY KEY (id),
	FOREIGN KEY (roomtype) REFERENCES roomtype (id) 
);

CREATE TABLE Customer(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name VARCHAR(50) NOT NULL,
	ic VARCHAR(14) NOT NULL UNIQUE,
	address VARCHAR(50),
)

CREATE TABLE reserve (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),

)