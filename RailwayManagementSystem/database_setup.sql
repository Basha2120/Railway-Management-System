-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS railway_management_system;
USE railway_management_system;

-- Create trips table
CREATE TABLE IF NOT EXISTS trips (
    ID INT PRIMARY KEY,
    Start VARCHAR(100) NOT NULL,
    Destination VARCHAR(100) NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrTime TIME NOT NULL,
    Date DATE NOT NULL,
    BookedSeats INT DEFAULT 0,
    Price DOUBLE NOT NULL,
    Driver INT NOT NULL,
    Train INT NOT NULL
);

-- Create employees table (for drivers and other staff)
CREATE TABLE IF NOT EXISTS employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Tel VARCHAR(20),
    Salary DOUBLE,
    Position VARCHAR(50)
);

-- Create trains table
CREATE TABLE IF NOT EXISTS trains (
    ID INT PRIMARY KEY,
    Capacity INT NOT NULL,
    Description VARCHAR(255) NOT NULL
);

-- Create passengers table
CREATE TABLE IF NOT EXISTS passengers (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);

-- Create a generic template for trip passengers tables
-- Note: Actual trip passenger tables will be created dynamically by the application
-- Example of how a trip passengers table structure looks:
/*
CREATE TABLE IF NOT EXISTS `Trip X Passengers` (
    Passenger INT,
    Tickets INT,
    FOREIGN KEY (Passenger) REFERENCES passengers(ID)
);
*/

-- Add foreign key constraints to trips table
ALTER TABLE trips
ADD CONSTRAINT fk_driver FOREIGN KEY (Driver) REFERENCES employees(ID),
ADD CONSTRAINT fk_train FOREIGN KEY (Train) REFERENCES trains(ID); 