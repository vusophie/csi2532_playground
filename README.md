## Laboratoire 7
Soumission au laboratoire 7.

### E1. Données sur les athlètes
Schéma:
``` 
CREATE TABLE athletes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(70) NOT NULL,
	email VARCHAR(255) NOT NULL,
	dob DATE NOT NULL,
	gender VARCHAR(10)
	); 
``` 
Seed:
``` 
INSERT INTO athletes (name, email, dob, gender) VALUES 
('Serena Williams', 'swilliams@gmail.com', '1981-09-26', 'Female'),
('Simone Biles', 'sbiles@gmail.com', '1997-03-14', 'Female'),
('Zhu Ting', 'zting@gmail.com', '1994-11-29', 'Female'),
('Lauren Lubin', 'llubin@gmail.com', '1985-04-18', 'Non-binary'),
('Marcel Nguyen', 'mnguyen@gmail.com', '1987-09-08', 'Male'),
('Veronica Ivy', 'vivy@gmail.com', '1982-07-18', 'Female'),
('Mia Hamm', 'mhamms@gmail.com', '1972-03-17', 'Female'),
('Matthew Mitcham', 'mmitcham@gmail.com', '1988-03-02', 'Male'),
('Julia Mancuso, 'jmancuso@gmail.com', '1984-03-09', 'Female'),
('Emma Johansson', ‘ejohansson@gmail.com', '1983-08-23', 'Female'),
('Ty Cobb, 'tcobb@gmail.com', '1886-12-18', 'Male'),
('Vanessa Atkinson, 'vatkinson@gmail.com', '1976-03-10', 'Female'),
('Vitali Klitschko, 'vklitschko@gmail.com', '1971-07-19', 'Male'),
('Bruce Lee, 'blee@gmail.com', '1940-11-27', 'Male'),
('Muhammad Ali, 'mali@gmail.com', '1942-01-17', 'Male'),
('Jerry Rice', 'jrice@gmail.com', '1962-10-13', 'Male'),
('Tatyana Ledovskaya, 'tledovskaya@gmail.com', '1966-05-21', 'Female'),
('Boris Becker', 'bbecker@gmail.com', '1967-10-22', 'Male'),
('Nadine Broersen, 'nbroersen@gmail.com', '1990-04-29', 'Female'),
('Mike Tyson, 'mtyson@gmail.com', '1966-06-30', 'Male'); 
```

### E2. Données sur les compétitions
Schéma :
``` 
CREATE TABLE competitions (
	name VARCHAR(50) PRIMARY KEY, 
	venue VARCHAR(50), 
	start_date DATE, 
	duration INT
); 
```
Seed :
``` 
INSERT INTO competitions (name, venue, start_date, duration) VALUES 
('Burpee Challenge', 'Fenway Park', '2021-02-14', 1),
('Handstand Hold', 'Madison Square Garden', '2021-02-14', 3),
('Corn Sack Sprint', 'Fenway Park', '2021-02-15', 1),
('Snatch Speed Triple', 'AT&T Stadium', '2021-02-15', 1),
('Marathon Row', 'Madison Square Garden', '2021-02-16', 2);  
```

### E3. Matrice d'évènements
