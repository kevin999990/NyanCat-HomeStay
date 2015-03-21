CREATE TABLE task (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name VARCHAR(20) NOT NULL,
	DESCRIPTION VARCHAR(50), 
	PRIMARY KEY (id)
	);

CREATE TABLE staff(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name VARCHAR(24) NOT NULL,
	IC VARCHAR(14) NOT NULL UNIQUE,
	PHONE_NUMBER VARCHAR(11), 
	address VARCHAR(200),
	task INTEGER,
	USERNAME VARCHAR(20) NOT NULL, 
	PASSWORD VARCHAR(20) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(task) REFERENCES task(id)
) ;

CREATE TABLE comment(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	comment VARCHAR(200),
	commentDate date,
	PRIMARY KEY(id) 
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
	/*availability boolean, //is this needed?*/
	PRIMARY KEY (id),
	FOREIGN KEY (roomtype) REFERENCES roomtype (id) 
);

CREATE TABLE Customer(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name VARCHAR(50) NOT NULL,
	address VARCHAR(200),
	email VARCHAR(50),
	PHONE_NUMBER VARCHAR(11),
	PRIMARY KEY (id)
);

CREATE TABLE booking (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	Customer_id INTEGER NOT NULL,
	room_id INTEGER NOT NULL,
	dateFrom VARCHAR(50) NOT NULL,
	dateTo VARCHAR(50) NOT NULL,
	payment BOOLEAN,
	needToPay INTEGER,
	status INTEGER NOT NULL, /*1=Reserve 2=CheckedIn 3=complete 4=Cancel*/
	PRIMARY KEY (id),
	FOREIGN KEY(Customer_id) REFERENCES Customer (id),
	FOREIGN KEY(room_id) REFERENCES Room(id)
);
/*
CREATE TABLE checkin (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	Customer_id INTEGER,
	room_id INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY(Customer_id) REFERENCES Customer (id),
	FOREIGN KEY(room_id) REFERENCES Room(id)

);*/