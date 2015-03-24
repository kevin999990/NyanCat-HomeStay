CREATE TABLE task (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	taskName VARCHAR(50) NOT NULL,
	DESCRIPTION VARCHAR(50), 
	PRIMARY KEY (id)
	);

CREATE TABLE staff(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	staffName VARCHAR(50) NOT NULL,
	IC VARCHAR(14) NOT NULL UNIQUE,
	phoneNumber VARCHAR(11), 
	address VARCHAR(200),
	task INTEGER NOT NULL,
	USERNAME VARCHAR(20) NOT NULL, 
	PASSWORD VARCHAR(20) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY(task) REFERENCES task(id)
) ;

CREATE TABLE comment(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	commentName VARCHAR(50) not NULL,
	commentDate date,
	phoneNumber VARCHAR(11), 
	email VARCHAR(50),
	comment VARCHAR(200),
	PRIMARY KEY(id) 
);

CREATE TABLE roomtype(
	id INTEGER NOT NULL,
	description VARCHAR(50),
	price INTEGER,
	PRIMARY KEY (id)
);

CREATE TABLE Room (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	roomnumber INTEGER not NULL,
	roomtype INTEGER ,
	available boolean,
	PRIMARY KEY (id),
	FOREIGN KEY (roomtype) REFERENCES roomtype (id) 
);

CREATE TABLE Customer(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	customerName VARCHAR(50) NOT NULL,
	address VARCHAR(200),
	email VARCHAR(50),
	phoneNumber VARCHAR(11),
	PRIMARY KEY (id)
);


create table bookingstatus(
id INTEGER NOT NULL,
DESCRIPTION VARCHAR(10),
PRIMARY KEY (id)
);


CREATE TABLE booking (
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	Customer_id INTEGER NOT NULL,
		dateFrom date NOT NULL,
	dateTo date NOT NULL,
	needToPay INTEGER,/*is the amount clear?*/
	totalPaid INTEGER default 0,/*total paid in this transaction*/
	status INTEGER NOT NULL, /*1=Reserve 2=CheckedIn 3=complete 4=Cancel*/
	PRIMARY KEY (id),
	FOREIGN KEY(Customer_id) REFERENCES Customer (id),
	
	FOREIGN KEY(status) REFERENCES bookingstatus(id)
);

CREATE TABLE bookinglist(
	id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	booking_id INTEGER NOT NULL,
	room_id INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(booking_id) REFERENCES booking(id),
	FOREIGN KEY(room_id) REFERENCES Room(id)
	);