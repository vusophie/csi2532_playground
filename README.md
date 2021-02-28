## Partie A
## A1 
## Question A 
A student can be supervised by any number of professors, and a professor cansupervise any number of students. A student has a student number, name and enrolled in aspecific program. A professor has an employee number, name and area of expertise.

![A1a](https://github.com/vusophie/csi2532_playground/blob/devoir1/1a.png)

## Question B
All course sections must be assigned to a course. A course has a department code(e.g. CSI or SEG) and a course number (e.g. 2532 or 4105). A course section is uniquelydefined by section name (e.g. A or B or C), semester (e.g. Winter), a year and the course itself.A course section depends on its course.

![A1b](https://github.com/vusophie/csi2532_playground/blob/devoir1/1b.png)

## Question C
A company has a name and headquarters (country). A board of directors has aCSI 2532 - Homework 1 [120 points]Part A [60 points]: E-R ModelsA1 [15 points]: Relations, Cardinality and Participation president, a vice-president, and a secretary. A company can have at most one board of directors(but it does not require one). All board of directions must have one and only one associatedcompany to manage.

![A1c](https://github.com/vusophie/csi2532_playground/blob/devoir1/1c.png)

## A2
You have been asked to implement a database (using a Relational Diagram) for CorporateBnB,a company that allows anyone with a home office to provide meeting spaces to others. Any usercan sign up for this service by providing their name, email and phone number. A user canmanage office space, or a user can rent office space. An office property has a name, anaddress, and square footage. Each property has availability for when it can be rented.Availability tracks the date, and the daily rate for use, the check-in and check-out times and ifthat date is still available. When a user rents a property the database will track the arrival dateand departure date.Model the system above using an Entity-Relation diagram. You must include entities, relations,cardinality, participation and attributes. You do not need to specify attribute types (i.e. thedomain).

![A2](https://github.com/vusophie/csi2532_playground/blob/devoir1/2.png)

## A3
## Question A
Find all office spaces in Ottawa that are available March 2, 2020.

```sh
σ property.address LIKE '%Ottawa%' ∧ lease.date >= '2020-03-02' (property X lease)
 ```
## Question B
Find all users (name and email) and the property details (name, and city) and therental information (date, and daily rate) of all rentals during the month of January 2020.

```sh
π user.name, user.email, property.name, property.address, lease.date, lease.daily_rate σ lease.date LIKE '%January 2020%' (user X property X lease)
```
## Partie B
## B1 
## Question A
Add appropriate spacing. 

![B1a](https://github.com/vusophie/csi2532_playground/blob/devoir1/B1a.png)

## Question B
Add appropriate spacing. 

![B1b](https://github.com/vusophie/csi2532_playground/blob/devoir1/B1b.png)

## Question C
Add 'users_2019.id' in the GROUP BY clause.

 ![B1c](https://github.com/vusophie/csi2532_playground/blob/devoir1/B1c.png)
 
## B2
## Question A
Find the names of all users that joined before Jan 1, 2020.

```sh
SELECT name FROM userse WHERE join_date < '2020-01-01';
```
![B2a](https://github.com/vusophie/csi2532_playground/blob/devoir1/B2a.png)

## Question B
Show the number of software licenses of each user (even those without anylicenses). Sort the results by the number of licenses (most to least) and then by name (A - Z).

```sh
SELECT users.name AS user_name, COUNT(licenses.user_id) AS number_of_licenses FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name; 
```
![B2b](https://github.com/vusophie/csi2532_playground/blob/devoir1/B2b.png)

Ordered by ID
```sh
SELECT users.name AS user_name, COUNT(licenses.user_id) AS count_license_user_id FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name ORDER BY licenses.user_id DESC;
```
![B2bi](https://github.com/vusophie/csi2532_playground/blob/devoir1/B2b%20-%20order%20by%20id.png)

Ordered by name
```sh
SELECT users.name AS user_name, COUNT(licenses.user_id) AS count_license_user_id FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name ORDER BYusers.name
```
![B2bii](https://github.com/vusophie/csi2532_playground/blob/devoir1/B2b%20-%20order%20by%20name.png)

## Question C
Insert additional data into the database to demonstrate the proper sorting of (b).

```sh
INSERT INTO users(id, name, join_date) VALUES (47, 'sophie', '2020-02-27');
SELECT users.name AS user_name, COUNT(licenses.user_id) AS count_license_user_id FROM users LEFT JOIN licenses.user_id GROUP BY licenses.user_id, users.name ORDER BY users.name;
```
![B2c](https://github.com/vusophie/csi2532_playground/blob/devoir1/B2c.png)
```sh
SELECT users.name AS user_name, COUNT(licenses, user_id) AS count_license_user_id FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name ORDER BY licenses.user_id DESC;
```
![B2d](https://github.com/vusophie/csi2532_playground/blob/devoir1/B2d.png)

## Question D
Update the sketch version to be version "51" (released Jan 1, 2020).

```sh
UPDATE softwares SET version = '51', released_date = '2020-01-01' WHERE name = 'Sketch';
```
## B3
## Question A
Add the software version to the licenses table.

```sh
ALTER TABLE softwares
ADD CONSTRAINT constraint_sw_vers (version);
BEGIN;
ALTER TABLE licenses
ADD COLUMN software_version VARCHAR(100);
ALTER TABLE licenses
ADD CONSTRAINT fk_sw_vers FOREIGN KEY (software_version) REFERENCES (version);
END TRANSACTION;
```
## Question B
Update the softwares table to include the name AND version as the primary key.

```sh
BEGIN;
ALTER TABLE DROP CONSTRAINT softwares_pkey;
ALTER TABLE ADD PRIMARY KEY (name, version);
```
## Question C
Update the licenses table to allow users to have multiple versions of the samesoftware. To demonstrate this works, add Sketch 52 to "andrew" user with access code"xxxyyy111". Do not hard code the user id, it should work for any database with an "andrew"user.

```sh
ALTER TABLE licenses ALTER COLUMN user_id SET DEFAULT 48;
INSERT INTO licenses VALUES (DEFAULT, 'Sketch', 'xxxyyy111', '52') ON CONFLICT(user_id, software_name) DO UPDATE SET user_id = DEFAULT, software_name = 'Ms Word';
```
## Question D
Sketch is providing a promotion (access code "1monthfree") for version 52. Givethat license to anyone that does not yet it, allowing them to keep any older version they mighthave. Do not hard code the user list, it should work for any database.

