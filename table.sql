DROP TABLE "coaches";
CREATE TABLE coaches (
	id int NOT NULL PRIMARY KEY,
	redCard int DEFAULT 0,
	yellowCard int DEFAULT 0	
);

DROP TABLE "referee";
CREATE TABLE referee (
	id int NOT NULL PRIMARY KEY,
	redCard int DEFAULT 0,
	yellowCard int DEFAULT 0,
	freeKicks int DEFAULT 0,
	penaltyKicks int DEFAULT 0
);

DROP TABLE "team";
CREATE TABLE team (
	id int NOT NULL PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	abbreviation VARCHAR(6) NOT NULL UNIQUE,
	flagURL VARCHAR(100) NOT NULL,
	wins int DEFAULT 0,
	draws int DEFAULT 0,	
	losses int DEFAULT 0,	
	scored int DEFAULT 0,
	concededGoals int DEFAULT 0
);

DROP TABLE "venues";
CREATE TABLE venues (
	id int NOT NULL PRIMARY KEY,
	city VARCHAR(30) NOT NULL UNIQUE,
	name VARCHAR(30) NOT NULL,
	capacity int NOT NULL DEFAULT 0
);

