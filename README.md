# Devoir 1
## Partie A
### A1
a) [![A1a]]()
b)[![A1b]]()
c)[![A1c]]()
### A2
[![A2]]()
### A3
a) σ property.address LIKE '%Ottawa%' ∧ lease.date >= '2020-03-02' (property X lease)
b) π user.name, user.email, property.name, property.address, lease.date, lease.daily_rate σ lease.date LIKE '%January 2020%' (user X property X lease)
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
