# Devoir 1
## Partie A
### A1 
##### A 
A student can be supervised by any number of professors, and a professor cansupervise any number of students. A student has a student number, name and enrolled in aspecific program. A professor has an employee number, name and area of expertise.

![A1a](https://github.com/vusophie/csi2532_playground/blob/devoir1/1a.png)

##### B
All course sections must be assigned to a course. A course has a department code(e.g. CSI or SEG) and a course number (e.g. 2532 or 4105). A course section is uniquelydefined by section name (e.g. A or B or C), semester (e.g. Winter), a year and the course itself.A course section depends on its course.

![A1b](https://github.com/vusophie/csi2532_playground/blob/devoir1/1b.png)

#### C
A company has a name and headquarters (country). A board of directors has aCSI 2532 - Homework 1 [120 points]Part A [60 points]: E-R ModelsA1 [15 points]: Relations, Cardinality and Participation president, a vice-president, and a secretary. A company can have at most one board of directors(but it does not require one). All board of directions must have one and only one associatedcompany to manage.

![A1c](https://github.com/vusophie/csi2532_playground/blob/devoir1/1c.png)

### A2
You have been asked to implement a database (using a Relational Diagram) for CorporateBnB,a company that allows anyone with a home office to provide meeting spaces to others. Any usercan sign up for this service by providing their name, email and phone number. A user canmanage office space, or a user can rent office space. An office property has a name, anaddress, and square footage. Each property has availability for when it can be rented.Availability tracks the date, and the daily rate for use, the check-in and check-out times and ifthat date is still available. When a user rents a property the database will track the arrival dateand departure date.Model the system above using an Entity-Relation diagram. You must include entities, relations,cardinality, participation and attributes. You do not need to specify attribute types (i.e. thedomain).

![A2](https://github.com/vusophie/csi2532_playground/blob/devoir1/2.png)

### A3
#### A
Find all office spaces in Ottawa that are available March 2, 2020.

```sh
σ property.address LIKE '%Ottawa%' ∧ lease.date >= '2020-03-02' (property X lease)
 ```
#### B
Find all users (name and email) and the property details (name, and city) and therental information (date, and daily rate) of all rentals during the month of January 2020.

```sh
π user.name, user.email, property.name, property.address, lease.date, lease.daily_rate σ lease.date LIKE '%January 2020%' (user X property X lease)
```
## Partie B
1. 
a) [![B1a]]()
b) [![B1b]]()
c) [![B1c]]()
2. 
a) 
```sh
SELECT name FROM userse WHERE join_date < '2020-01-01';
```
b) 
```sh
SELECT users.name AS user_name, COUNT(licenses.user_id) AS number_of_licenses FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name; 
```
Ordered by ID
```sh
SELECT users.name AS user_name, COUNT(licenses.user_id) AS count_license_user_id FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name ORDER BY licenses.user_id DESC;
```
Ordered by name
```sh
SELECT users.name AS user_name, COUNT(licenses.user_id) AS count_license_user_id FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name ORDER BYusers.name
```
c) 
```sh
INSERT INTO users(id, name, join_date) VALUES (47, 'sophie', '2020-02-27');
SELECT users.name AS user_name, COUNT(licenses.user_id) AS count_license_user_id FROM users LEFT JOIN licenses.user_id GROUP BY licenses.user_id, users.name ORDER BY users.name;
```
```sh
SELECT users.name AS user_name, COUNT(licenses, user_id) AS count_license_user_id FROM users LEFT JOIN licenses ON users.id = licenses.user_id GROUP BY licenses.user_id, users.name ORDER BY licenses.user_id DESC;
```
d) 
```sh
UPDATE softwares SET version = '51', released_date = '2020-01-01' WHERE name = 'Sketch';
```
3. 
a) 
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
b) 
```sh
BEGIN;
ALTER TABLE DROP CONSTRAINT softwares_pkey;
ALTER TABLE ADD PRIMARY KEY (name, version);
```
c) 
```sh
ALTER TABLE licenses ALTER COLUMN user_id SET DEFAULT 48;
INSERT INTO licenses VALUES (DEFAULT, 'Sketch', 'xxxyyy111', '52') ON CONFLICT(user_id, software_name) DO UPDATE SET user_id = DEFAULT, software_name = 'Ms Word';
```
d) 
