DROP TABLE IF EXISTS "referee";
CREATE TABLE referee (
	id int NOT NULL PRIMARY KEY,
	red_card int DEFAULT 0,
	yellow_card int DEFAULT 0,
	free_kicks int DEFAULT 0,
	penalty_kicks int DEFAULT 0
);

