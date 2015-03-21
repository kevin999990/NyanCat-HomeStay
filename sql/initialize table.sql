INSERT INTO task (taskname,DESCRIPTION) VALUES('Manager','The owner of the homestay');
INSERT INTO task (taskname,DESCRIPTION) VALUES('Receptionist','The receptionist for');
INSERT INTO task (taskname,DESCRIPTION) VALUES('Staff','Normal staff member');

INSERT INTO staff(staffname,address,ic,phoneNumber,task,username,password) VALUES 
	('Kevin Lu Thin Fue','Indah Permai','940905-12-5327','0168117960',1,'kevin999990','kevin0');
INSERT INTO staff(staffname,address,ic,phoneNumber,task,username,password) VALUES
	('Stellyn Muk','Tamparuli','000000-00-0000','0169876240',2,'stellyn','stellyn');


INSERT INTO ROOMTYPE VALUES (1,'Premier Suite',150);
INSERT INTO ROOMTYPE VALUES (2,'Deluxe Suite',250);
INSERT INTO ROOMTYPE VALUES (3,'Luxury Suite',350);

INSERT INTO ROOM VALUES (101,1,true);
INSERT INTO ROOM VALUES (102,1,true);
INSERT INTO ROOM VALUES (103,1,true);
INSERT INTO ROOM VALUES (104,1,true);
INSERT INTO ROOM VALUES (105,1,true);
INSERT INTO ROOM VALUES (201,2,true);
INSERT INTO ROOM VALUES (202,2,true);
INSERT INTO ROOM VALUES (203,2,true);
INSERT INTO ROOM VALUES (204,2,true);
INSERT INTO ROOM VALUES (205,2,true);
INSERT INTO ROOM VALUES (301,3,true);
INSERT INTO ROOM VALUES (302,3,true);
INSERT INTO ROOM VALUES (303,3,true);
INSERT INTO ROOM VALUES (304,3,true);
INSERT INTO ROOM VALUES (305,3,true);

INSERT into customer(customerName,address,email,phoneNumber) VALUES
	('Bobo Tan','Taman Rainfield','bobotan@bobomail.com','01126236672');

INSERT into customer(customerName,address,email,phoneNumber) VALUES
	('Bobo Atlas Kek','Taman Bobo','boboAtlas@bobomail.com','0146593678');

	INSERT into customer(customerName,address,email,phoneNumber) VALUES
	('Bobo Dareen','Taman Penampang','dareenBobo@bobomail.com','0146578900');


INSERT into bookingstatus VALUES(1,'Reserve');
INSERT into bookingstatus VALUES(2,'Checked-in');
INSERT into bookingstatus VALUES(3,'Complete');
INSERT into bookingstatus VALUES(4,'Cancel');