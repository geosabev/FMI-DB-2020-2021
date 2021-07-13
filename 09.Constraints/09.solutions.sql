---- 09. Constraints ----

CREATE DATABASE ex10_Flights

USE ex10_Flights

CREATE TABLE Airline(
	code CHAR(2) PRIMARY KEY,
	name VARCHAR(30),
	country VARCHAR(30)
);

CREATE TABLE Airplane(
	code INT PRIMARY KEY,
	type VARCHAR(50),
	seats INT NOT NULL,
	year DATETIME
);

CREATE TABLE Booking(
	code CHAR(6),
	agency VARCHAR(50),
	airline_code CHAR(2),
	flight_number CHAR(6) PRIMARY KEY,
	customer_id INT NOT NULL,
	booking_date DATETIME,
	flight_date DATETIME,
	price INT NOT NULL,
	status INT NOT NULL
);

CREATE TABLE Flight(
fnumber CHAR(6) PRIMARY KEY,
airline_operator CHAR(2),
dep_airport CHAR(3),
arr_airport CHAR(3),
flight_time TIME,
flight_duration INT NOT NULL,
airplane INT NOT NULL
);

CREATE TABLE Agency(
	name VARCHAR(50) PRIMARY KEY,
	country VARCHAR(50),
	city VARCHAR(50),
	phone INT
);

CREATE TABLE Customer(
	id INT PRIMARY KEY,
	fname VARCHAR(15),
	lname VARCHAR(15),
	email VARCHAR(50)
);

CREATE TABLE Airport(
	code CHAR(3) PRIMARY KEY,
	name VARCHAR(50),
	country VARCHAR(50),
	city VARCHAR(50)
);
