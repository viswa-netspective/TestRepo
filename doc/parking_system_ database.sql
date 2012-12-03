create database parksys;

use parksys;

create table vehicle_type (

	type_id BIGINT not null AUTO_INCREMENT PRIMARY KEY,
	type varchar(20),
	parktime BIGINT,
	parkcost double, 
	minimumcost BIGINT);

create table vehicle_brand(

	brand_id BIGINT not null AUTO_INCREMENT PRIMARY KEY, 
	brandname varchar(20));

create table vechicle_model(

	model_id BIGINT not null AUTO_INCREMENT PRIMARY KEY,
	type_id BIGINT,
	brand_id BIGINT,
	model varchar(20),
	FOREIGN KEY (type_id) REFERENCES vehicle_type(type_id) ON DELETE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES vehicle_brand(brand_id) ON DELETE CASCADE);

create table userdetails(

	user_id BIGINT not null AUTO_INCREMENT PRIMARY KEY, 
	username varchar(20), 
	password varchar(50),
	firstname varchar(20),
	lastname varchar(20),
	address varchar(50),
	phonenumber varchar(15),
	role_id BIGINT);

create table usertiming(

	user_id BIGINT,
	timein timestamp, 
	timeout timestamp, 
	nvehicle BIGINT,
	FOREIGN KEY (user_id) REFERENCES userdetails(user_id) ON DELETE CASCADE);


create table vehicaldetails(
	vehicle_id varchar(20) not null,
	type_id BIGINT, 
	brand_id BIGINT, 
	model_id BIGINT, 
	color varchar(20), 
	custident varchar(20),
	custphone varchar(15), 
	custaddress varchar(30), 
	FOREIGN KEY (model_id) REFERENCES vechicle_model(model_id) ON DELETE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES vehicle_brand(brand_id) ON DELETE CASCADE,
	FOREIGN KEY (type_id) REFERENCES vehicle_type(type_id) ON DELETE CASCADE );

create table parkingdetails(
	vehicle_id varchar(20),
	userinentry_id BIGINT, 
	useroutentry_id BIGINT, 
	vehicle_in timestamp, 
	vehicle_out timestamp, 
	FOREIGN KEY (vehicle_id) REFERENCES vehicaldetails(vehicle_id) ON DELETE CASCADE,
	FOREIGN KEY (userinentry_id) REFERENCES userdetails(user_id) ON DELETE CASCADE,
	FOREIGN KEY (useroutentry_id) REFERENCES userdetails(user_id) ON DELETE CASCADE
	);


CREATE USER 'parksys'@'localhost' IDENTIFIED BY 'parksys';

GRANT ALL PRIVILEGES ON *.* TO 'parksys'@'localhost' WITH GRANT OPTION;

 insert into userdetails(username,password,firstname,lastname,address,phonenumber,role_id) values ('viswa','viswa','Viswanathan','Sekar','Salem','9677673363',0);
