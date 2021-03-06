CREATE TABLE athletes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(70) NOT NULL,
	email VARCHAR(255) NOT NULL,
	dob DATE NOT NULL,
	gender varchar(10)
);

CREATE TABLE competitions (
	name VARCHAR(50) PRIMARY KEY, 
	venue VARCHAR(50), 
	start_date DATE, 
	duration int
);

CREATE TABLE registers (
	athlete_id int,
	competition_name varchar(50),
	PRIMARY KEY (athlete_id, competition_name),
	FOREIGN KEY (athlete_id) REFERENCES athletes(id),
	FOREIGN KEY (competition_name) REFERENCES competitions(name)
);

CREATE TABLE schema_migrations (
	migration varchar(255),
	migrated_at TIME,
	PRIMARY KEY (migration)
);