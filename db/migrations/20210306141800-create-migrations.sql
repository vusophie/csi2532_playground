
CREATE TABLE schema_migrations (
	migration varchar(255),
	migrated_at TIME,
	PRIMARY KEY (migration)
);