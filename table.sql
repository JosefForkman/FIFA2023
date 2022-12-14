@@ -2,36 +2,825 @@ DROP TABLE "coaches";
CREATE TABLE coaches (
	id int NOT NULL PRIMARY KEY,
	redCard int DEFAULT 0,
	yellowCard int DEFAULT 0	
	yellowCard int DEFAULT 0,
	teamId INTEGER NOT NULL,
	peopleId INTEGER NOT NULL,
	
	FOREIGN KEY (teamId) REFERENCES teams(id),
	FOREIGN KEY (peopleId) REFERENCES people(id)
);

DROP TABLE "games";
CREATE TABLE games (
	id INTEGER	PRIMARY KEY AUTOINCREMENT,
	date TEXT,
	match VARCHAR(30),
	headRefereeeId INTEGER,
	venuesId INTEGER,
	team1Id INTEGER,
	team2Id INTEGER, extraTime INTEGER);

DROP TABLE "goalkeepers";
CREATE TABLE 'goalkeepers'
('id' INTEGER PRIMARY KEY AUTOINCREMENT,
'shirtNumber' INTEGER,
'minutesPlayed' INTEGER,
'matchesStarted' INTEGER,
'yellowCards' INTEGER,
'redCards' INTEGER,
'cleanSheets' INTEGER,
'saves' INTEGER,
'goals' INTEGER,
'assists' INTEGER,
'teamId' INTEGER,
'peopleId' INTEGER,
FOREIGN KEY ('teamId') REFERENCES teams('id')
FOREIGN KEY ('peopleId') REFERENCES people('id'));

DROP TABLE "goals";
CREATE TABLE goals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gameId INTEGER,
    scoreId INTEGER,
    assistId INTEGER,
    goalMinute INTEGER);

DROP TABLE "groups";
CREATE TABLE 'groups'
('id' INTEGER PRIMARY KEY AUTOINCREMENT,
'groupName' VARCHAR(1),
'teams' VARCHAR(30),
'matchId' INTEGER,
'matchesPlayed' INTEGER,
'wins' INTEGER,
'draws' INTEGER,
'losses' INTEGER,
'scored' INTEGER,
'concededGoals' INTEGER,
'goalDifference' INTEGER,
'points' INTEGER);

DROP TABLE "outfielders";
CREATE TABLE 'outfielders'
('id' INTEGER PRIMARY KEY AUTOINCREMENT,
'shirtNumber' INTEGER,
'minutesPlayed' INTEGER,
'matchesStarted' INTEGER,
'yellowCards' INTEGER,
'redCards' INTEGER,
'goals' INTEGER,
'assists' INTEGER,
'shotsTaken' INTEGER,
'teamId' INTEGER,
'peopleId' INTEGER,
FOREIGN KEY ('teamId') REFERENCES teams('id')
FOREIGN KEY ('peopleId') REFERENCES people('id'));

DROP TABLE "people";
CREATE TABLE 'people' ('id' INTEGER PRIMARY KEY AUTOINCREMENT, 'firstName' VARCHAR(30), 'lastName'VARCHAR(30));

DROP TABLE "referee";
CREATE TABLE referee (
	id int NOT NULL PRIMARY KEY,
	redCard int DEFAULT 0,
	yellowCard int DEFAULT 0,
	freeKicks int DEFAULT 0,
	penaltyKicks int DEFAULT 0
);
	red_card int DEFAULT 0,
	yellow_card int DEFAULT 0,
	free_kicks int DEFAULT 0,
	penalty_kicks int DEFAULT 0
, "personId" INT NOT NULL);

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
DROP TABLE "scores";
CREATE TABLE scores (
	id INTEGER	PRIMARY KEY AUTOINCREMENT,
	matchId INTEGER,
	finalScoreTeam1 INTEGER,
	finalScoreTeam2 INTEGER,	
	"half-timeScoreTeam1" INTEGER,
	"half-timeScoreTeam2" INTEGER,
	"full-timeScoreTeam1" INTEGER,
	"full-timeScoreTeam2" INTEGER);

DROP TABLE "sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

DROP TABLE "teams";
CREATE TABLE 'teams' ('id' INTEGER PRIMARY KEY AUTOINCREMENT, 'name' VARCHAR(30), 'abbreviation' INTEGER, 'flagURL' VARCHAR(255), 'wins' INTEGER, 'draws' INTEGER, 'losses' INTEGER, 'points' INTEGER, 'scored' INTEGER, 'concededGoals' INTEGER, 'goalDifference' INTEGER);

DROP TABLE "venues";
CREATE TABLE venues (
	id int NOT NULL PRIMARY KEY,
	city VARCHAR(30) NOT NULL UNIQUE,
	name VARCHAR(30) NOT NULL,
	capacity int NOT NULL DEFAULT 0
);
CREATE TABLE 'venues' ('id' INTEGER PRIMARY KEY AUTOINCREMENT, 'stadium' VARCHAR(40));


INSERT INTO "games" ("id", "date", "match", "headRefereeeId", "venuesId", "team1Id", "team2Id", "extraTime") VALUES
(49, '20/6', '', NULL, 1, NULL, NULL, NULL),
(50, '21/6', '', NULL, 4, NULL, NULL, NULL),
(51, '22/6', NULL, NULL, 2, NULL, NULL, NULL),
(52, '23/6', NULL, NULL, 4, NULL, NULL, NULL),
(53, '24/6', NULL, NULL, 7, NULL, NULL, NULL),
(54, '25/6', NULL, NULL, 9, NULL, NULL, NULL),
(55, '26/6', NULL, NULL, 4, NULL, NULL, NULL),
(56, '27/6', NULL, NULL, 8, NULL, NULL, NULL),
(58, '28/6', NULL, NULL, 1, NULL, NULL, NULL),
(59, '29/6', NULL, NULL, 5, NULL, NULL, NULL),
(60, '30/6', NULL, NULL, 7, NULL, NULL, NULL),
(61, '31/6', NULL, NULL, 9, NULL, NULL, NULL),
(62, '1/8', NULL, NULL, 1, NULL, NULL, NULL),
(63, '2/8', NULL, NULL, 9, NULL, NULL, NULL),
(64, '3/8', NULL, NULL, 7, NULL, NULL, NULL),
(65, '4/8', NULL, NULL, 9, NULL, NULL, NULL);




INSERT INTO "outfielders" ("id", "shirtNumber", "minutesPlayed", "matchesStarted", "yellowCards", "redCards", "goals", "assists", "shotsTaken", "teamId", "peopleId") VALUES
(1, 30, 53, 0, 0, 0, 0, 0, 10, 1, 1),
(2, 52, 78, 0, 0, 0, 0, 0, 30, 1, 2),
(3, 62, 36, 0, 0, 0, 0, 0, 66, 1, 3),
(4, 54, 21, 1, 0, 0, 0, 0, 24, 1, 4),
(5, 47, 45, 1, 1, 0, 0, 0, 92, 1, 5),
(6, 94, 33, 1, 1, 0, 0, 0, 19, 1, 6),
(7, 11, 62, 3, 1, 0, 0, 0, 2, 1, 7),
(8, 44, 75, 0, 0, 0, 0, 0, 96, 1, 8),
(9, 25, 20, 2, 0, 0, 0, 0, 77, 1, 9),
(10, 9, 98, 0, 0, 0, 0, 0, 68, 1, 10),
(11, 24, 90, 3, 0, 0, 0, 0, 13, 1, 11),
(12, 71, 55, 2, 0, 0, 0, 0, 9, 1, 12),
(13, 52, 78, 2, 0, 1, 0, 0, 97, 1, 13),
(14, 63, 32, 0, 0, 0, 0, 0, 15, 1, 14),
(15, 11, 48, 1, 0, 0, 0, 0, 99, 1, 15),
(16, 57, 49, 1, 0, 0, 0, 0, 18, 1, 16),
(17, 27, 67, 1, 0, 0, 0, 0, 10, 1, 17),
(18, 86, 42, 2, 0, 0, 0, 0, 48, 1, 18),
(19, 34, 54, 4, 0, 0, 0, 0, 0, 1, 19),
(20, 14, 58, 4, 0, 0, 0, 0, 97, 1, 20),
(21, 55, 28, 4, 0, 0, 0, 0, 50, 2, 21),
(22, 22, 72, 0, 0, 0, 0, 0, 95, 2, 22),
(23, 26, 43, 3, 0, 0, 0, 0, 17, 2, 23),
(24, 40, 96, 4, 0, 0, 0, 0, 13, 2, 24),
(25, 41, 41, 0, 2, 0, 0, 0, 71, 2, 25),
(26, 93, 93, 3, 0, 0, 0, 0, 61, 2, 26),
(27, 72, 24, 3, 0, 0, 0, 0, 73, 2, 27),
(28, 72, 16, 2, 0, 0, 0, 0, 67, 2, 28),
(29, 52, 83, 4, 0, 0, 0, 0, 54, 2, 29),
(30, 35, 70, 0, 0, 0, 0, 0, 18, 2, 30),
(31, 36, 40, 4, 1, 0, 0, 0, 39, 2, 31),
(32, 93, 46, 3, 0, 0, 0, 0, 44, 2, 32),
(33, 15, 77, 0, 1, 0, 0, 0, 49, 2, 33),
(34, 6, 24, 3, 0, 0, 0, 0, 99, 2, 34),
(35, 24, 54, 3, 0, 0, 0, 0, 4, 2, 35),
(36, 10, 19, 2, 1, 0, 0, 0, 76, 2, 36),
(37, 40, 58, 4, 0, 2, 0, 0, 62, 2, 37),
(38, 51, 49, 0, 0, 0, 0, 0, 39, 2, 38),
(39, 50, 27, 0, 0, 0, 0, 0, 18, 2, 39),
(40, 58, 88, 3, 0, 0, 0, 0, 9, 2, 40),
(41, 38, 94, 4, 0, 0, 0, 0, 100, 3, 41),
(42, 1337, 18, 2, 1, 0, 0, 0, 76, 3, 42),
(43, 4, 62, 3, 0, 1, 0, 0, 78, 3, 43),
(44, 93, 7, 0, 1, 0, 0, 0, 86, 3, 44),
(45, 63, 2, 1, 0, 0, 0, 0, 0, 3, 45),
(46, 54, 30, 4, 0, 0, 0, 0, 17, 3, 46),
(47, 34, 61, 2, 1, 0, 0, 0, 81, 3, 47),
(48, 57, 55, 0, 1, 0, 0, 0, 1, 3, 48),
(49, 21, 24, 0, 0, 0, 0, 0, 47, 3, 49),
(50, 41, 13, 1, 1, 0, 0, 0, 74, 3, 50),
(51, 13, 59, 2, 1, 0, 0, 0, 73, 3, 51),
(52, 17, 8, 0, 0, 0, 0, 0, 2, 3, 52),
(53, 55, 37, 3, 1, 0, 0, 0, 70, 3, 53),
(54, 87, 5, 0, 1, 0, 0, 0, 96, 3, 54),
(55, 95, 9, 1, 0, 0, 0, 0, 43, 3, 55),
(56, 19, 52, 3, 2, 0, 0, 0, 85, 3, 56),
(57, 31, 74, 1, 1, 0, 0, 0, 7, 3, 57),
(58, 42, 50, 2, 0, 0, 0, 0, 24, 3, 58),
(59, 7, 97, 0, 2, 0, 0, 0, 33, 3, 59),
(60, 66, 77, 4, 0, 0, 0, 0, 58, 3, 60),
(61, 54, 19, 3, 1, 0, 0, 0, 3, 4, 61),
(62, 99, 68, 1, 0, 0, 0, 0, 76, 4, 62),
(63, 76, 95, 0, 1, 0, 0, 0, 89, 4, 63),
(64, 26, 91, 4, 0, 0, 0, 0, 68, 4, 64),
(65, 17, 68, 0, 0, 0, 0, 0, 73, 4, 65),
(66, 49, 77, 4, 2, 2, 0, 0, 31, 4, 66),
(67, 94, 49, 2, 0, 0, 0, 0, 66, 4, 67),
(68, 32, 94, 0, 0, 0, 0, 0, 24, 4, 68),
(69, 12, 0, 0, 2, 1, 0, 0, 18, 4, 69),
(70, 70, 16, 3, 0, 0, 0, 0, 14, 4, 70),
(71, 15, 82, 3, 0, 0, 0, 0, 66, 4, 71),
(72, 83, 43, 4, 0, 0, 0, 0, 24, 4, 72),
(73, 25, 52, 3, 0, 0, 0, 0, 14, 4, 73),
(74, 66, 98, 1, 0, 0, 0, 0, 89, 4, 74),
(75, 46, 100, 0, 0, 0, 0, 0, 14, 4, 75),
(76, 9, 72, 2, 0, 0, 0, 0, 61, 4, 76),
(77, 92, 41, 0, 0, 0, 0, 0, 25, 4, 77),
(78, 44, 99, 1, 0, 0, 0, 0, 65, 4, 78),
(79, 87, 58, 3, 1, 0, 0, 0, 82, 4, 79),
(80, 36, 82, 2, 0, 0, 0, 0, 44, 4, 80),
(81, 32, 86, 2, 0, 2, 0, 0, 41, 5, 81),
(82, 55, 75, 4, 0, 0, 0, 0, 96, 5, 82),
(83, 88, 39, 1, 0, 0, 0, 0, 82, 5, 83),
(84, 82, 49, 2, 0, 0, 0, 0, 68, 5, 84),
(85, 26, 90, 1, 0, 0, 0, 0, 38, 5, 85),
(86, 56, 64, 1, 0, 0, 0, 0, 92, 5, 86),
(87, 55, 98, 1, 1, 0, 0, 0, 78, 5, 87),
(88, 53, 22, 0, 0, 0, 0, 0, 3, 5, 88),
(89, 79, 30, 4, 0, 0, 0, 0, 43, 5, 89),
(90, 65, 98, 1, 0, 0, 0, 0, 5, 5, 90),
(91, 5, 11, 4, 0, 0, 0, 0, 75, 5, 91),
(92, 31, 5, 0, 0, 0, 0, 0, 71, 5, 92),
(93, 23, 23, 0, 0, 0, 0, 0, 47, 5, 93),
(94, 62, 17, 3, 0, 0, 0, 0, 80, 5, 94),
(95, 93, 15, 4, 0, 0, 0, 0, 85, 5, 95),
(96, 99, 22, 1, 0, 1, 0, 0, 99, 5, 96),
(97, 46, 74, 4, 0, 0, 0, 0, 21, 5, 97),
(98, 75, 24, 1, 0, 0, 0, 0, 60, 5, 98),
(99, 53, 42, 2, 0, 0, 0, 0, 51, 5, 99),
(100, 65, 76, 0, 1, 1, 0, 0, 72, 5, 100),
(101, 50, 64, 3, 0, 0, 0, 0, 59, 6, 101),
(102, 92, 17, 1, 0, 0, 0, 0, 86, 6, 102),
(103, 8, 43, 2, 1, 0, 0, 0, 62, 6, 103),
(104, 59, 73, 2, 0, 0, 0, 0, 26, 6, 104),
(105, 43, 92, 1, 0, 0, 0, 0, 27, 6, 105),
(106, 90, 97, 0, 0, 0, 0, 0, 79, 6, 106),
(107, 75, 33, 2, 0, 0, 0, 0, 80, 6, 107),
(108, 40, 4, 3, 0, 0, 0, 0, 2, 6, 108),
(109, 67, 44, 4, 0, 0, 0, 0, 61, 6, 109),
(110, 48, 21, 2, 0, 0, 0, 0, 21, 6, 110),
(111, 24, 44, 2, 0, 0, 0, 0, 84, 6, 111),
(112, 15, 32, 3, 0, 0, 0, 0, 43, 6, 112),
(113, 2, 50, 4, 0, 0, 0, 0, 78, 6, 113),
(114, 67, 19, 0, 2, 0, 0, 0, 59, 6, 114),
(115, 8, 37, 2, 0, 0, 0, 0, 89, 6, 115),
(116, 59, 71, 1, 0, 0, 0, 0, 99, 6, 116),
(117, 51, 60, 2, 0, 0, 0, 0, 85, 6, 117),
(118, 55, 21, 3, 1, 0, 0, 0, 44, 6, 118),
(119, 81, 95, 4, 0, 0, 0, 0, 7, 6, 119),
(120, 76, 78, 2, 2, 0, 0, 0, 68, 6, 120),
(121, 9, 66, 3, 0, 0, 0, 0, 75, 7, 121),
(122, 35, 20, 2, 0, 0, 0, 0, 70, 7, 122),
(123, 75, 73, 1, 0, 0, 0, 0, 87, 7, 123),
(124, 77, 88, 0, 1, 0, 0, 0, 24, 7, 124),
(125, 82, 59, 1, 0, 0, 0, 0, 89, 7, 125),
(126, 82, 61, 3, 1, 0, 0, 0, 52, 7, 126),
(127, 50, 20, 0, 0, 0, 0, 0, 38, 7, 127),
(128, 73, 88, 4, 0, 0, 0, 0, 53, 7, 128),
(129, 8, 71, 4, 0, 0, 0, 0, 92, 7, 129),
(130, 73, 11, 4, 0, 0, 0, 0, 37, 7, 130),
(131, 68, 70, 3, 0, 0, 0, 0, 89, 7, 131),
(132, 75, 93, 4, 1, 0, 0, 0, 86, 7, 132),
(133, 74, 73, 0, 0, 0, 0, 0, 70, 7, 133),
(134, 85, 75, 4, 0, 0, 0, 0, 56, 7, 134),
(135, 54, 5, 0, 0, 0, 0, 0, 18, 7, 135),
(136, 53, 41, 4, 1, 0, 0, 0, 40, 7, 136),
(137, 37, 1, 3, 2, 0, 0, 0, 64, 7, 137),
(138, 21, 92, 3, 0, 0, 0, 0, 71, 7, 138),
(139, 35, 98, 2, 0, 0, 0, 0, 1, 7, 139),
(140, 38, 30, 3, 0, 0, 0, 0, 74, 7, 140),
(141, 4, 49, 0, 0, 0, 0, 0, 33, 8, 141),
(142, 1, 94, 2, 1, 0, 0, 0, 20, 8, 142),
(143, 86, 94, 1, 0, 0, 0, 0, 64, 8, 143),
(144, 12, 0, 0, 0, 0, 0, 0, 53, 8, 144),
(145, 94, 0, 0, 2, 0, 0, 0, 97, 8, 145),
(146, 99, 27, 3, 1, 0, 0, 0, 45, 8, 146),
(147, 63, 17, 1, 0, 0, 0, 0, 30, 8, 147),
(148, 50, 38, 3, 0, 0, 0, 0, 63, 8, 148),
(149, 16, 76, 2, 0, 0, 0, 0, 89, 8, 149),
(150, 97, 95, 0, 0, 0, 0, 0, 52, 8, 150),
(151, 81, 89, 1, 0, 0, 0, 0, 39, 8, 151),
(152, 28, 32, 3, 0, 0, 0, 0, 53, 8, 152),
(153, 62, 85, 2, 0, 0, 0, 0, 21, 8, 153),
(154, 57, 68, 0, 0, 0, 0, 0, 91, 8, 154),
(155, 92, 31, 3, 1, 0, 0, 0, 80, 8, 155),
(156, 59, 75, 0, 0, 0, 0, 0, 68, 8, 156),
(157, 40, 73, 2, 0, 0, 0, 0, 34, 8, 157),
(158, 3, 13, 0, 0, 0, 0, 0, 70, 8, 158),
(159, 83, 72, 4, 2, 0, 0, 0, 39, 8, 159),
(160, 28, 53, 4, 0, 0, 0, 0, 63, 8, 160),
(161, 91, 48, 3, 0, 0, 0, 0, 81, 9, 161),
(162, 35, 83, 2, 0, 0, 0, 0, 27, 9, 162),
(163, 54, 19, 1, 1, 0, 0, 0, 74, 9, 163),
(164, 97, 28, 1, 0, 0, 0, 0, 81, 9, 164),
(165, 36, 41, 0, 0, 0, 0, 0, 28, 9, 165),
(166, 70, 2, 3, 0, 0, 0, 0, 9, 9, 166),
(167, 24, 66, 1, 0, 0, 0, 0, 29, 9, 167),
(168, 35, 4, 2, 0, 0, 0, 0, 17, 9, 168),
(169, 87, 45, 4, 0, 0, 0, 0, 57, 9, 169),
(170, 42, 78, 4, 1, 0, 0, 0, 61, 9, 170),
(171, 69, 64, 3, 0, 0, 0, 0, 78, 9, 171),
(172, 38, 99, 0, 0, 0, 0, 0, 10, 9, 172),
(173, 56, 96, 1, 1, 0, 0, 0, 53, 9, 173),
(174, 46, 84, 1, 0, 0, 0, 0, 75, 9, 174),
(175, 95, 44, 2, 0, 0, 0, 0, 31, 9, 175),
(176, 64, 15, 3, 0, 0, 0, 0, 86, 9, 176),
(177, 62, 2, 2, 0, 0, 0, 0, 99, 9, 177),
(178, 67, 94, 2, 0, 0, 0, 0, 34, 9, 178),
(179, 37, 78, 4, 0, 0, 0, 0, 98, 9, 179),
(180, 71, 34, 4, 0, 0, 0, 0, 67, 9, 180),
(181, 49, 81, 1, 0, 0, 0, 0, 28, 10, 181),
(182, 64, 23, 0, 0, 0, 0, 0, 15, 10, 182),
(183, 70, 27, 0, 0, 0, 0, 0, 86, 10, 183),
(184, 97, 39, 1, 0, 0, 0, 0, 7, 10, 184),
(185, 54, 12, 3, 1, 0, 0, 0, 31, 10, 185),
(186, 16, 64, 4, 0, 0, 0, 0, 95, 10, 186),
(187, 66, 60, 4, 0, 0, 0, 0, 9, 10, 187),
(188, 44, 17, 2, 0, 0, 0, 0, 66, 10, 188),
(189, 83, 82, 1, 0, 0, 0, 0, 37, 10, 189),
(190, 25, 17, 0, 0, 0, 0, 0, 64, 10, 190),
(191, 45, 48, 0, 1, 0, 0, 0, 27, 10, 191),
(192, 66, 22, 3, 0, 0, 0, 0, 49, 10, 192),
(193, 18, 39, 3, 0, 0, 0, 0, 89, 10, 193),
(194, 20, 61, 0, 0, 0, 0, 0, 86, 10, 194),
(195, 31, 74, 1, 0, 0, 0, 0, 100, 10, 195),
(196, 90, 63, 1, 0, 0, 0, 0, 62, 10, 196),
(197, 32, 45, 0, 0, 0, 0, 0, 60, 10, 197),
(198, 95, 91, 3, 0, 0, 0, 0, 87, 10, 198),
(199, 6, 29, 3, 2, 0, 0, 0, 90, 10, 199),
(200, 40, 30, 1, 1, 0, 0, 0, 73, 10, 200),
(201, 62, 8, 0, 1, 0, 0, 0, 82, 11, 201),
(202, 84, 69, 4, 1, 0, 0, 0, 93, 11, 202),
(203, 2, 11, 4, 1, 0, 0, 0, 1, 11, 203),
(204, 42, 71, 0, 1, 0, 0, 0, 30, 11, 204),
(205, 47, 87, 1, 0, 0, 0, 0, 29, 11, 205),
(206, 45, 51, 3, 0, 0, 0, 0, 83, 11, 206),
(207, 15, 86, 1, 0, 0, 0, 0, 2, 11, 207),
(208, 42, 98, 4, 0, 0, 0, 0, 76, 11, 208),
(209, 34, 89, 1, 1, 0, 0, 0, 27, 11, 209),
(210, 41, 29, 2, 1, 0, 0, 0, 22, 11, 210),
(211, 98, 5, 4, 1, 0, 0, 0, 50, 11, 211),
(212, 85, 51, 0, 0, 0, 0, 0, 60, 11, 212),
(213, 13, 94, 1, 0, 0, 0, 0, 70, 11, 213),
(214, 76, 11, 0, 2, 0, 0, 0, 51, 11, 214),
(215, 46, 9, 0, 0, 0, 0, 0, 73, 11, 215),
(216, 54, 98, 1, 0, 0, 0, 0, 92, 11, 216),
(217, 54, 53, 2, 0, 0, 0, 0, 65, 11, 217),
(218, 67, 14, 4, 0, 0, 0, 0, 77, 11, 218),
(219, 77, 84, 2, 0, 0, 0, 0, 19, 11, 219),
(220, 85, 100, 1, 0, 0, 0, 0, 97, 11, 220),
(221, 88, 25, 4, 0, 0, 0, 0, 78, 12, 221),
(222, 93, 89, 1, 0, 0, 0, 0, 49, 12, 222),
(223, 77, 82, 2, 0, 0, 0, 0, 34, 12, 223),
(224, 19, 43, 0, 1, 0, 0, 0, 72, 12, 224),
(225, 78, 7, 0, 0, 0, 0, 0, 22, 12, 225),
(226, 7, 18, 1, 1, 1, 0, 0, 72, 12, 226),
(227, 6, 90, 0, 0, 0, 0, 0, 28, 12, 227),
(228, 40, 54, 3, 0, 0, 0, 0, 100, 12, 228),
(229, 91, 67, 2, 1, 0, 0, 0, 21, 12, 229),
(230, 88, 15, 1, 0, 0, 0, 0, 96, 12, 230),
(231, 62, 26, 2, 1, 0, 0, 0, 19, 12, 231),
(232, 64, 8, 4, 1, 0, 0, 0, 28, 12, 232),
(233, 16, 3, 1, 0, 1, 0, 0, 2, 12, 233),
(234, 60, 14, 0, 0, 0, 0, 0, 55, 12, 234),
(235, 40, 27, 3, 0, 0, 0, 0, 82, 12, 235),
(236, 36, 79, 0, 0, 0, 0, 0, 57, 12, 236),
(237, 14, 51, 3, 0, 0, 0, 0, 3, 12, 237),
(238, 76, 28, 1, 0, 0, 0, 0, 66, 12, 238),
(239, 86, 59, 0, 1, 0, 0, 0, 71, 12, 239),
(240, 92, 11, 4, 0, 0, 0, 0, 29, 12, 240),
(241, 11, 29, 0, 1, 0, 0, 0, 36, 13, 241),
(242, 93, 100, 1, 1, 0, 0, 0, 9, 13, 242),
(243, 66, 7, 0, 0, 0, 0, 0, 48, 13, 243),
(244, 71, 93, 3, 0, 0, 0, 0, 46, 13, 244),
(245, 46, 25, 0, 0, 0, 0, 0, 61, 13, 245),
(246, 16, 97, 3, 0, 0, 0, 0, 57, 13, 246),
(247, 96, 43, 1, 0, 0, 0, 0, 24, 13, 247),
(248, 34, 13, 3, 0, 2, 0, 0, 25, 13, 248),
(249, 38, 47, 1, 0, 0, 0, 0, 16, 13, 249),
(250, 18, 26, 4, 1, 0, 0, 0, 72, 13, 250),
(251, 1, 42, 1, 0, 0, 0, 0, 43, 13, 251),
(252, 38, 58, 0, 1, 0, 0, 0, 35, 13, 252),
(253, 50, 7, 3, 1, 0, 0, 0, 52, 13, 253),
(254, 12, 30, 3, 0, 0, 0, 0, 80, 13, 254),
(255, 67, 18, 4, 0, 0, 0, 0, 15, 13, 255),
(256, 61, 33, 3, 0, 0, 0, 0, 35, 13, 256),
(257, 99, 26, 0, 2, 0, 0, 0, 13, 13, 257),
(258, 22, 90, 4, 0, 0, 0, 0, 58, 13, 258),
(259, 84, 58, 2, 0, 0, 0, 0, 63, 13, 259),
(260, 45, 27, 0, 1, 0, 0, 0, 41, 13, 260),
(261, 40, 92, 2, 0, 0, 0, 0, 12, 14, 261),
(262, 83, 59, 4, 0, 0, 0, 0, 99, 14, 262),
(263, 9, 23, 0, 0, 0, 0, 0, 0, 14, 263),
(264, 95, 67, 4, 1, 0, 0, 0, 48, 14, 264),
(265, 63, 46, 3, 0, 0, 0, 0, 92, 14, 265),
(266, 58, 53, 4, 0, 0, 0, 0, 40, 14, 266),
(267, 70, 21, 1, 0, 0, 0, 0, 93, 14, 267),
(268, 50, 0, 0, 0, 0, 0, 0, 77, 14, 268),
(269, 8, 39, 0, 1, 0, 0, 0, 49, 14, 269),
(270, 65, 66, 4, 0, 0, 0, 0, 46, 14, 270),
(271, 35, 7, 2, 1, 0, 0, 0, 83, 14, 271),
(272, 76, 10, 4, 0, 0, 0, 0, 15, 14, 272),
(273, 57, 38, 0, 1, 0, 0, 0, 43, 14, 273),
(274, 50, 46, 1, 1, 0, 0, 0, 27, 14, 274),
(275, 6, 70, 0, 0, 0, 0, 0, 85, 14, 275),
(276, 26, 68, 3, 0, 0, 0, 0, 36, 14, 276),
(277, 16, 7, 0, 0, 0, 0, 0, 67, 14, 277),
(278, 16, 83, 2, 0, 0, 0, 0, 7, 14, 278),
(279, 61, 40, 1, 1, 1, 0, 0, 100, 14, 279),
(280, 98, 74, 1, 1, 0, 0, 0, 18, 14, 280),
(281, 1, 1, 4, 0, 0, 0, 0, 8, 15, 281),
(282, 55, 36, 3, 0, 0, 0, 0, 10, 15, 282),
(283, 53, 77, 4, 0, 0, 0, 0, 93, 15, 283),
(284, 99, 81, 3, 0, 1, 0, 0, 11, 15, 284),
(285, 47, 65, 0, 0, 0, 0, 0, 56, 15, 285),
(286, 81, 21, 0, 0, 0, 0, 0, 16, 15, 286),
(287, 24, 92, 1, 0, 0, 0, 0, 98, 15, 287),
(288, 80, 99, 3, 0, 0, 0, 0, 44, 15, 288),
(289, 98, 28, 0, 0, 0, 0, 0, 7, 15, 289),
(290, 54, 27, 0, 1, 1, 0, 0, 1, 15, 290),
(291, 19, 91, 2, 0, 0, 0, 0, 41, 15, 291),
(292, 10, 30, 1, 0, 0, 0, 0, 87, 15, 292),
(293, 13, 29, 4, 0, 0, 0, 0, 13, 15, 293),
(294, 95, 31, 0, 1, 0, 0, 0, 39, 15, 294),
(295, 31, 49, 1, 2, 0, 0, 0, 81, 15, 295),
(296, 24, 29, 2, 0, 0, 0, 0, 50, 15, 296),
(297, 91, 83, 2, 0, 0, 0, 0, 99, 15, 297),
(298, 41, 87, 4, 0, 0, 0, 0, 29, 15, 298),
(299, 70, 17, 4, 0, 0, 0, 0, 10, 15, 299),
(300, 62, 51, 4, 0, 0, 0, 0, 14, 15, 300),
(301, 22, 54, 1, 0, 0, 0, 0, 37, 16, 301),
(302, 79, 85, 0, 0, 0, 0, 0, 11, 16, 302),
(303, 4, 29, 4, 0, 0, 0, 0, 5, 16, 303),
(304, 1, 24, 3, 0, 0, 0, 0, 98, 16, 304),
(305, 53, 13, 1, 0, 0, 0, 0, 88, 16, 305),
(306, 58, 61, 4, 0, 0, 0, 0, 50, 16, 306),
(307, 14, 66, 0, 0, 0, 0, 0, 14, 16, 307),
(308, 73, 11, 2, 2, 0, 0, 0, 78, 16, 308),
(309, 53, 2, 4, 2, 0, 0, 0, 4, 16, 309),
(310, 7, 45, 2, 0, 0, 0, 0, 43, 16, 310),
(311, 22, 2, 4, 0, 0, 0, 0, 77, 16, 311),
(312, 96, 6, 2, 0, 0, 0, 0, 4, 16, 312),
(313, 94, 52, 1, 0, 0, 0, 0, 90, 16, 313),
(314, 20, 33, 1, 0, 0, 0, 0, 12, 16, 314),
(315, 52, 23, 1, 0, 0, 0, 0, 51, 16, 315),
(316, 49, 100, 2, 0, 0, 0, 0, 53, 16, 316),
(317, 77, 94, 1, 1, 0, 0, 0, 90, 16, 317),
(318, 14, 52, 1, 0, 0, 0, 0, 23, 16, 318),
(319, 48, 69, 0, 0, 0, 0, 0, 63, 16, 319),
(320, 21, 65, 4, 0, 0, 0, 0, 57, 16, 320),
(321, 24, 29, 1, 0, 0, 0, 0, 44, 17, 321),
(322, 93, 5, 1, 0, 0, 0, 0, 19, 17, 322),
(323, 38, 77, 4, 0, 0, 0, 0, 81, 17, 323),
(324, 81, 84, 0, 0, 0, 0, 0, 84, 17, 324),
(325, 21, 35, 3, 0, 0, 0, 0, 96, 17, 325),
(326, 84, 77, 1, 1, 0, 0, 0, 54, 17, 326),
(327, 69, 76, 3, 0, 0, 0, 0, 48, 17, 327),
(328, 98, 26, 4, 0, 0, 0, 0, 53, 17, 328),
(329, 81, 92, 2, 0, 0, 0, 0, 5, 17, 329),
(330, 82, 74, 2, 0, 0, 0, 0, 50, 17, 330),
(331, 68, 17, 4, 0, 1, 0, 0, 55, 17, 331),
(332, 64, 8, 3, 0, 0, 0, 0, 15, 17, 332),
(333, 22, 90, 4, 0, 0, 0, 0, 78, 17, 333),
(334, 32, 8, 1, 0, 0, 0, 0, 39, 17, 334),
(335, 25, 68, 4, 1, 0, 0, 0, 82, 17, 335),
(336, 67, 10, 2, 0, 0, 0, 0, 32, 17, 336),
(337, 42, 47, 4, 0, 0, 0, 0, 20, 17, 337),
(338, 60, 33, 4, 0, 0, 0, 0, 76, 17, 338),
(339, 92, 63, 4, 0, 0, 0, 0, 77, 17, 339),
(340, 58, 54, 4, 0, 0, 0, 0, 24, 17, 340),
(341, 43, 17, 1, 0, 0, 0, 0, 24, 18, 341),
(342, 75, 10, 4, 1, 0, 0, 0, 31, 18, 342),
(343, 55, 22, 3, 1, 0, 0, 0, 43, 18, 343),
(344, 7, 22, 1, 0, 0, 0, 0, 36, 18, 344),
(345, 2, 0, 1, 0, 0, 0, 0, 51, 18, 345),
(346, 84, 5, 4, 1, 0, 0, 0, 2, 18, 346),
(347, 39, 72, 2, 1, 0, 0, 0, 36, 18, 347),
(348, 30, 45, 1, 0, 0, 0, 0, 23, 18, 348),
(349, 56, 12, 1, 0, 0, 0, 0, 66, 18, 349),
(350, 77, 51, 0, 0, 0, 0, 0, 63, 18, 350),
(351, 21, 34, 0, 0, 1, 0, 0, 11, 18, 351),
(352, 42, 18, 2, 0, 0, 0, 0, 75, 18, 352),
(353, 27, 94, 1, 0, 0, 0, 0, 3, 18, 353),
(354, 67, 30, 3, 0, 0, 0, 0, 100, 18, 354),
(355, 8, 5, 3, 0, 2, 0, 0, 60, 18, 355),
(356, 59, 61, 0, 0, 0, 0, 0, 41, 18, 356),
(357, 31, 90, 4, 0, 0, 0, 0, 46, 18, 357),
(358, 65, 68, 3, 0, 0, 0, 0, 82, 18, 358),
(359, 22, 47, 2, 1, 0, 0, 0, 32, 18, 359),
(360, 27, 78, 0, 0, 2, 0, 0, 57, 18, 360),
(361, 89, 2, 0, 1, 0, 0, 0, 74, 19, 361),
(362, 3, 42, 2, 0, 0, 0, 0, 70, 19, 362),
(363, 17, 63, 3, 0, 0, 0, 0, 83, 19, 363),
(364, 9, 46, 4, 0, 0, 0, 0, 26, 19, 364),
(365, 16, 19, 4, 0, 0, 0, 0, 62, 19, 365),
(366, 25, 45, 0, 0, 0, 0, 0, 18, 19, 366),
(367, 82, 42, 3, 1, 0, 0, 0, 99, 19, 367),
(368, 53, 18, 0, 1, 0, 0, 0, 72, 19, 368),
(369, 85, 90, 0, 0, 0, 0, 0, 61, 19, 369),
(370, 33, 36, 4, 0, 0, 0, 0, 60, 19, 370),
(371, 42, 6, 4, 0, 0, 0, 0, 38, 19, 371),
(372, 64, 58, 1, 1, 0, 0, 0, 63, 19, 372),
(373, 84, 75, 2, 0, 0, 0, 0, 29, 19, 373),
(374, 24, 98, 3, 0, 0, 0, 0, 90, 19, 374),
(375, 44, 46, 2, 0, 0, 0, 0, 95, 19, 375),
(376, 72, 43, 1, 1, 0, 0, 0, 78, 19, 376),
(377, 33, 25, 0, 0, 0, 0, 0, 99, 19, 377),
(378, 76, 94, 1, 1, 0, 0, 0, 49, 19, 378),
(379, 69, 18, 1, 0, 0, 0, 0, 98, 19, 379),
(380, 10, 72, 3, 0, 0, 0, 0, 10, 19, 380),
(381, 56, 10, 4, 0, 0, 0, 0, 55, 20, 381),
(382, 51, 33, 0, 0, 0, 0, 0, 66, 20, 382),
(383, 76, 91, 4, 0, 0, 0, 0, 18, 20, 383),
(384, 2, 32, 1, 0, 0, 0, 0, 64, 20, 384),
(385, 9, 26, 4, 0, 0, 0, 0, 26, 20, 385),
(386, 22, 50, 3, 2, 0, 0, 0, 24, 20, 386),
(387, 93, 87, 3, 0, 0, 0, 0, 77, 20, 387),
(388, 84, 17, 0, 0, 0, 0, 0, 47, 20, 388),
(389, 92, 43, 0, 1, 0, 0, 0, 60, 20, 389),
(390, 89, 55, 0, 0, 0, 0, 0, 21, 20, 390),
(391, 18, 85, 4, 0, 0, 0, 0, 29, 20, 391),
(392, 5, 21, 0, 0, 0, 0, 0, 35, 20, 392),
(393, 51, 67, 2, 1, 0, 0, 0, 53, 20, 393),
(394, 87, 40, 4, 0, 0, 0, 0, 55, 20, 394),
(395, 38, 22, 4, 0, 0, 0, 0, 30, 20, 395),
(396, 25, 0, 0, 0, 0, 0, 0, 46, 20, 396),
(397, 98, 64, 1, 0, 0, 0, 0, 1, 20, 397),
(398, 28, 43, 0, 1, 0, 0, 0, 18, 20, 398),
(399, 86, 31, 2, 0, 0, 0, 0, 19, 20, 399),
(400, 9, 85, 0, 0, 0, 0, 0, 97, 20, 400),
(401, 1, 1, 2, 0, 0, 0, 0, 40, 21, 401),
(402, 25, 81, 0, 0, 0, 0, 0, 81, 21, 402),
(403, 80, 52, 2, 1, 0, 0, 0, 5, 21, 403),
(404, 83, 99, 0, 0, 0, 0, 0, 0, 21, 404),
(405, 28, 53, 1, 1, 0, 0, 0, 30, 21, 405),
(406, 90, 59, 2, 0, 0, 0, 0, 83, 21, 406),
(407, 38, 100, 0, 0, 0, 0, 0, 52, 21, 407),
(408, 70, 43, 3, 0, 0, 0, 0, 22, 21, 408),
(409, 57, 8, 2, 2, 0, 0, 0, 39, 21, 409),
(410, 70, 80, 2, 0, 0, 0, 0, 90, 21, 410),
(411, 80, 92, 1, 0, 0, 0, 0, 43, 21, 411),
(412, 7, 32, 3, 0, 0, 0, 0, 62, 21, 412),
(413, 5, 99, 4, 0, 0, 0, 0, 60, 21, 413),
(414, 26, 54, 3, 0, 0, 0, 0, 35, 21, 414),
(415, 97, 26, 2, 0, 0, 0, 0, 77, 21, 415),
(416, 91, 69, 4, 2, 0, 0, 0, 16, 21, 416),
(417, 17, 70, 1, 1, 0, 0, 0, 78, 21, 417),
(418, 52, 85, 4, 0, 0, 0, 0, 0, 21, 418),
(419, 61, 71, 1, 0, 0, 0, 0, 61, 21, 419),
(420, 40, 14, 0, 0, 0, 0, 0, 0, 21, 420),
(421, 62, 30, 3, 2, 0, 0, 0, 31, 22, 421),
(422, 57, 48, 0, 0, 0, 0, 0, 100, 22, 422),
(423, 14, 84, 3, 0, 0, 0, 0, 13, 22, 423),
(424, 6, 11, 1, 0, 0, 0, 0, 35, 22, 424),
(425, 16, 86, 4, 0, 0, 0, 0, 0, 22, 425),
(426, 28, 98, 4, 0, 0, 0, 0, 20, 22, 426),
(427, 5, 38, 1, 0, 0, 0, 0, 49, 22, 427),
(428, 55, 80, 4, 0, 0, 0, 0, 99, 22, 428),
(429, 22, 75, 3, 0, 0, 0, 0, 89, 22, 429),
(430, 48, 20, 4, 1, 0, 0, 0, 32, 22, 430),
(431, 33, 57, 3, 0, 0, 0, 0, 73, 22, 431),
(432, 5, 16, 3, 0, 0, 0, 0, 59, 22, 432),
(433, 40, 28, 4, 0, 0, 0, 0, 1, 22, 433),
(434, 45, 93, 4, 0, 1, 0, 0, 16, 22, 434),
(435, 34, 55, 3, 0, 0, 0, 0, 38, 22, 435),
(436, 22, 41, 4, 0, 0, 0, 0, 12, 22, 436),
(437, 92, 58, 3, 0, 0, 0, 0, 71, 22, 437),
(438, 99, 7, 2, 0, 0, 0, 0, 36, 22, 438),
(439, 75, 60, 1, 0, 0, 0, 0, 48, 22, 439),
(440, 93, 17, 2, 1, 0, 0, 0, 54, 22, 440),
(441, 29, 65, 2, 0, 0, 0, 0, 93, 23, 441),
(442, 57, 22, 4, 1, 0, 0, 0, 86, 23, 442),
(443, 67, 12, 0, 0, 0, 0, 0, 56, 23, 443),
(444, 47, 94, 1, 1, 0, 0, 0, 53, 23, 444),
(445, 81, 94, 1, 0, 0, 0, 0, 22, 23, 445),
(446, 90, 62, 3, 0, 1, 0, 0, 69, 23, 446),
(447, 19, 49, 0, 0, 0, 0, 0, 96, 23, 447),
(448, 62, 25, 2, 1, 0, 0, 0, 22, 23, 448),
(449, 13, 60, 4, 0, 0, 0, 0, 42, 23, 449),
(450, 27, 66, 4, 0, 0, 0, 0, 7, 23, 450),
(451, 44, 86, 4, 0, 0, 0, 0, 49, 23, 451),
(452, 14, 4, 3, 0, 0, 0, 0, 18, 23, 452),
(453, 64, 53, 1, 1, 0, 0, 0, 62, 23, 453),
(454, 86, 5, 0, 1, 0, 0, 0, 5, 23, 454),
(455, 70, 31, 1, 0, 0, 0, 0, 90, 23, 455),
(456, 47, 4, 2, 1, 0, 0, 0, 22, 23, 456),
(457, 13, 15, 4, 0, 0, 0, 0, 56, 23, 457),
(458, 88, 20, 3, 0, 0, 0, 0, 85, 23, 458),
(459, 37, 12, 3, 0, 0, 0, 0, 53, 23, 459),
(460, 94, 15, 4, 1, 0, 0, 0, 7, 23, 460),
(461, 58, 92, 1, 0, 0, 0, 0, 44, 24, 461),
(462, 12, 39, 3, 0, 0, 0, 0, 70, 24, 462),
(463, 95, 13, 3, 0, 0, 0, 0, 7, 24, 463),
(464, 13, 21, 0, 0, 0, 0, 0, 85, 24, 464),
(465, 25, 3, 4, 0, 1, 0, 0, 9, 24, 465),
(466, 59, 76, 3, 1, 0, 0, 0, 22, 24, 466),
(467, 23, 72, 0, 1, 0, 0, 0, 92, 24, 467),
(468, 65, 50, 2, 0, 0, 0, 0, 22, 24, 468),
(469, 12, 21, 1, 0, 0, 0, 0, 7, 24, 469),
(470, 38, 65, 2, 0, 0, 0, 0, 84, 24, 470),
(471, 58, 12, 0, 1, 0, 0, 0, 1, 24, 471),
(472, 67, 91, 4, 1, 0, 0, 0, 24, 24, 472),
(473, 91, 63, 4, 0, 0, 0, 0, 75, 24, 473),
(474, 18, 54, 3, 1, 0, 0, 0, 79, 24, 474),
(475, 40, 19, 3, 0, 0, 0, 0, 39, 24, 475),
(476, 90, 54, 0, 0, 0, 0, 0, 78, 24, 476),
(477, 55, 63, 3, 0, 0, 0, 0, 3, 24, 477),
(478, 15, 86, 3, 1, 0, 0, 0, 24, 24, 478),
(479, 89, 50, 0, 0, 1, 0, 0, 3, 24, 479),
(480, 96, 9, 2, 0, 0, 0, 0, 46, 24, 480),
(481, 91, 68, 4, 0, 0, 0, 0, 60, 25, 481),
(482, 53, 3, 3, 0, 0, 0, 0, 74, 25, 482),
(483, 7, 34, 4, 0, 0, 0, 0, 56, 25, 483),
(484, 69, 78, 2, 1, 0, 0, 0, 99, 25, 484),
(485, 4, 3, 3, 0, 0, 0, 0, 53, 25, 485),
(486, 66, 37, 1, 0, 0, 0, 0, 85, 25, 486),
(487, 73, 36, 1, 2, 0, 0, 0, 72, 25, 487),
(488, 90, 68, 4, 0, 0, 0, 0, 52, 25, 488),
(489, 4, 19, 4, 0, 0, 0, 0, 73, 25, 489),
(490, 50, 73, 0, 0, 1, 0, 0, 6, 25, 490),
(491, 40, 55, 4, 1, 0, 0, 0, 28, 25, 491),
(492, 95, 84, 2, 0, 0, 0, 0, 24, 25, 492),
(493, 69, 87, 3, 1, 0, 0, 0, 43, 25, 493),
(494, 78, 79, 2, 0, 0, 0, 0, 95, 25, 494),
(495, 1, 58, 2, 0, 0, 0, 0, 3, 25, 495),
(496, 3, 76, 0, 0, 0, 0, 0, 99, 25, 496),
(497, 34, 5, 3, 0, 0, 0, 0, 98, 25, 497),
(498, 36, 4, 1, 1, 1, 0, 0, 19, 25, 498),
(499, 94, 44, 1, 0, 0, 0, 0, 15, 25, 499),
(500, 47, 56, 1, 0, 0, 0, 0, 2, 25, 500),
(501, 2, 63, 2, 0, 0, 0, 0, 58, 26, 501),
(502, 36, 48, 4, 0, 0, 0, 0, 89, 26, 502),
(503, 17, 22, 1, 0, 0, 0, 0, 50, 26, 503),
(504, 98, 78, 3, 0, 0, 0, 0, 17, 26, 504),
(505, 53, 87, 3, 0, 0, 0, 0, 43, 26, 505),
(506, 37, 83, 1, 0, 0, 0, 0, 100, 26, 506),
(507, 82, 71, 3, 0, 0, 0, 0, 80, 26, 507),
(508, 80, 35, 1, 0, 0, 0, 0, 13, 26, 508),
(509, 57, 40, 4, 0, 0, 0, 0, 79, 26, 509),
(510, 75, 23, 0, 0, 0, 0, 0, 64, 26, 510),
(511, 41, 39, 0, 0, 0, 0, 0, 92, 26, 511),
(512, 1, 50, 1, 0, 1, 0, 0, 33, 26, 512),
(513, 68, 93, 0, 0, 0, 0, 0, 4, 26, 513),
(514, 93, 75, 1, 0, 0, 0, 0, 95, 26, 514),
(515, 18, 19, 1, 0, 1, 0, 0, 86, 26, 515),
(516, 41, 3, 3, 1, 1, 0, 0, 54, 26, 516),
(517, 84, 53, 2, 2, 0, 0, 0, 25, 26, 517),
(518, 16, 48, 3, 0, 0, 0, 0, 7, 26, 518),
(519, 94, 44, 3, 0, 0, 0, 0, 57, 26, 519),
(520, 29, 92, 0, 0, 0, 0, 0, 28, 26, 520),
(521, 49, 40, 3, 0, 0, 0, 0, 45, 27, 521),
(522, 28, 70, 0, 1, 0, 0, 0, 96, 27, 522),
(523, 52, 89, 3, 0, 0, 0, 0, 18, 27, 523),
(524, 37, 33, 4, 0, 0, 0, 0, 47, 27, 524),
(525, 56, 2, 0, 0, 0, 0, 0, 9, 27, 525),
(526, 5, 50, 2, 0, 0, 0, 0, 52, 27, 526),
(527, 38, 20, 0, 0, 0, 0, 0, 49, 27, 527),
(528, 22, 88, 4, 0, 0, 0, 0, 77, 27, 528),
(529, 48, 86, 3, 0, 0, 0, 0, 95, 27, 529),
(530, 12, 62, 4, 0, 0, 0, 0, 75, 27, 530),
(531, 40, 62, 2, 0, 0, 0, 0, 81, 27, 531),
(532, 58, 16, 2, 0, 0, 0, 0, 45, 27, 532),
(533, 30, 54, 2, 1, 0, 0, 0, 45, 27, 533),
(534, 4, 27, 4, 0, 1, 0, 0, 69, 27, 534),
(535, 44, 98, 4, 0, 0, 0, 0, 40, 27, 535),
(536, 91, 83, 4, 0, 0, 0, 0, 57, 27, 536),
(537, 89, 49, 3, 1, 0, 0, 0, 61, 27, 537),
(538, 55, 28, 1, 1, 0, 0, 0, 0, 27, 538),
(539, 52, 85, 0, 0, 0, 0, 0, 60, 27, 539),
(540, 97, 10, 2, 1, 0, 0, 0, 1, 27, 540),
(541, 19, 25, 0, 0, 0, 0, 0, 23, 28, 541),
(542, 44, 17, 1, 0, 0, 0, 0, 8, 28, 542),
(543, 32, 61, 0, 0, 0, 0, 0, 33, 28, 543),
(544, 30, 68, 2, 0, 0, 0, 0, 17, 28, 544),
(545, 38, 74, 4, 0, 0, 0, 0, 60, 28, 545),
(546, 66, 86, 1, 0, 0, 0, 0, 54, 28, 546),
(547, 37, 0, 4, 0, 0, 0, 0, 59, 28, 547),
(548, 32, 72, 0, 0, 0, 0, 0, 17, 28, 548),
(549, 4, 80, 3, 1, 0, 0, 0, 98, 28, 549),
(550, 2, 58, 2, 0, 0, 0, 0, 77, 28, 550),
(551, 97, 8, 3, 0, 0, 0, 0, 13, 28, 551),
(552, 57, 26, 4, 0, 0, 0, 0, 7, 28, 552),
(553, 35, 68, 4, 0, 0, 0, 0, 99, 28, 553),
(554, 6, 83, 3, 1, 0, 0, 0, 3, 28, 554),
(555, 88, 66, 2, 0, 0, 0, 0, 37, 28, 555),
(556, 59, 50, 1, 0, 0, 0, 0, 40, 28, 556),
(557, 80, 22, 0, 1, 0, 0, 0, 91, 28, 557),
(558, 87, 76, 3, 0, 0, 0, 0, 25, 28, 558),
(559, 22, 53, 0, 1, 0, 0, 0, 95, 28, 559),
(560, 97, 99, 3, 1, 0, 0, 0, 22, 28, 560),
(561, 49, 9, 4, 0, 0, 0, 0, 82, 29, 561),
(562, 58, 6, 2, 0, 1, 0, 0, 60, 29, 562),
(563, 31, 57, 2, 0, 0, 0, 0, 66, 29, 563),
(564, 92, 18, 2, 0, 0, 0, 0, 81, 29, 564),
(565, 70, 15, 1, 0, 0, 0, 0, 41, 29, 565),
(566, 25, 99, 0, 1, 0, 0, 0, 17, 29, 566),
(567, 60, 45, 3, 1, 0, 0, 0, 81, 29, 567),
(568, 40, 41, 3, 1, 0, 0, 0, 90, 29, 568),
(569, 94, 7, 1, 0, 0, 0, 0, 93, 29, 569),
(570, 41, 95, 3, 0, 0, 0, 0, 15, 29, 570),
(571, 81, 33, 4, 1, 0, 0, 0, 89, 29, 571),
(572, 65, 69, 1, 0, 0, 0, 0, 52, 29, 572),
(573, 89, 7, 1, 0, 0, 0, 0, 83, 29, 573),
(574, 60, 44, 2, 0, 0, 0, 0, 37, 29, 574),
(575, 77, 22, 1, 1, 0, 0, 0, 66, 29, 575),
(576, 14, 45, 0, 0, 0, 0, 0, 51, 29, 576),
(577, 5, 41, 0, 0, 0, 0, 0, 34, 29, 577),
(578, 22, 70, 3, 1, 0, 0, 0, 48, 29, 578),
(579, 39, 88, 0, 0, 1, 0, 0, 88, 29, 579),
(580, 41, 33, 3, 0, 0, 0, 0, 97, 29, 580),
(581, 66, 20, 0, 0, 0, 0, 0, 87, 30, 581),
(582, 87, 26, 4, 0, 0, 0, 0, 19, 30, 582),
(583, 20, 95, 3, 0, 0, 0, 0, 81, 30, 583),
(584, 47, 59, 1, 0, 0, 0, 0, 86, 30, 584),
(585, 97, 34, 1, 0, 0, 0, 0, 73, 30, 585),
(586, 64, 2, 3, 0, 0, 0, 0, 82, 30, 586),
(587, 19, 12, 1, 1, 0, 0, 0, 60, 30, 587),
(588, 75, 49, 4, 0, 0, 0, 0, 81, 30, 588),
(589, 70, 44, 3, 0, 0, 0, 0, 11, 30, 589),
(590, 40, 33, 3, 1, 0, 0, 0, 40, 30, 590),
(591, 38, 15, 1, 0, 0, 0, 0, 62, 30, 591),
(592, 65, 63, 2, 0, 0, 0, 0, 71, 30, 592),
(593, 7, 8, 1, 1, 0, 0, 0, 41, 30, 593),
(594, 12, 28, 1, 0, 0, 0, 0, 53, 30, 594),
(595, 73, 5, 0, 2, 0, 0, 0, 25, 30, 595),
(596, 53, 34, 1, 0, 0, 0, 0, 8, 30, 596),
(597, 47, 62, 2, 0, 0, 0, 0, 10, 30, 597),
(598, 75, 65, 1, 0, 0, 0, 0, 83, 30, 598),
(599, 98, 49, 1, 0, 0, 0, 0, 53, 30, 599),
(600, 53, 26, 3, 0, 0, 0, 0, 31, 30, 600),
(601, 45, 94, 1, 1, 0, 0, 0, 37, 31, 601),
(602, 69, 10, 3, 0, 0, 0, 0, 28, 31, 602),
(603, 99, 20, 2, 0, 0, 0, 0, 65, 31, 603),
(604, 63, 90, 3, 0, 0, 0, 0, 76, 31, 604),
(605, 38, 1, 1, 0, 0, 0, 0, 84, 31, 605),
(606, 17, 10, 2, 0, 0, 0, 0, 9, 31, 606),
(607, 33, 90, 0, 0, 0, 0, 0, 94, 31, 607),
(608, 50, 91, 1, 0, 0, 0, 0, 71, 31, 608),
(609, 10, 58, 1, 0, 0, 0, 0, 13, 31, 609),
(610, 90, 41, 2, 0, 0, 0, 0, 14, 31, 610),
(611, 19, 31, 0, 0, 0, 0, 0, 18, 31, 611),
(612, 1, 94, 0, 0, 0, 0, 0, 92, 31, 612),
(613, 35, 45, 3, 0, 0, 0, 0, 77, 31, 613),
(614, 72, 34, 2, 0, 0, 0, 0, 81, 31, 614),
(615, 21, 42, 1, 0, 0, 0, 0, 47, 31, 615),
(616, 47, 64, 3, 1, 0, 0, 0, 75, 31, 616),
(617, 29, 1, 0, 0, 0, 0, 0, 48, 31, 617),
(618, 61, 57, 4, 0, 0, 0, 0, 18, 31, 618),
(619, 27, 70, 0, 0, 0, 0, 0, 97, 31, 619),
(620, 9, 58, 4, 2, 0, 0, 0, 12, 31, 620),
(621, 69, 72, 3, 0, 0, 0, 0, 75, 32, 621),
(622, 9, 61, 4, 0, 0, 0, 0, 68, 32, 622),
(623, 21, 9, 0, 0, 2, 0, 0, 5, 32, 623),
(624, 70, 58, 0, 0, 0, 0, 0, 30, 32, 624),
(625, 84, 12, 1, 0, 0, 0, 0, 15, 32, 625),
(626, 82, 32, 3, 0, 0, 0, 0, 54, 32, 626),
(627, 72, 65, 4, 2, 0, 0, 0, 15, 32, 627),
(628, 75, 28, 4, 0, 0, 0, 0, 23, 32, 628),
(629, 56, 32, 3, 0, 0, 0, 0, 98, 32, 629),
(630, 79, 31, 1, 0, 0, 0, 0, 32, 32, 630),
(631, 70, 56, 0, 0, 0, 0, 0, 54, 32, 631),
(632, 1, 60, 1, 0, 0, 0, 0, 47, 32, 632),
(633, 81, 21, 4, 0, 0, 0, 0, 18, 32, 633),
(634, 42, 13, 4, 0, 0, 0, 0, 39, 32, 634),
(635, 6, 46, 1, 0, 0, 0, 0, 31, 32, 635),
(636, 99, 14, 2, 0, 0, 0, 0, 47, 32, 636),
(637, 77, 54, 3, 0, 0, 0, 0, 4, 32, 637),
(638, 7, 22, 2, 0, 0, 0, 0, 23, 32, 638),
(639, 18, 100, 2, 0, 0, 0, 0, 51, 32, 639),
(640, 76, 59, 2, 0, 0, 0, 0, 53, 32, 640);




INSERT INTO "sqlite_sequence" ("name", "seq") VALUES
('teams', '32'),
('venues', '10'),
('outfielders', '640'),
('games', '65');

INSERT INTO "teams" ("id", "name", "abbreviation", "flagURL", "wins", "draws", "losses", "points", "scored", "concededGoals", "goalDifference") VALUES
(1, 'New Zealand', NZL, 'https://countryflagsapi.com/png/nz', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Norway', NOR, 'https://countryflagsapi.com/png/no', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Philippines', PHI, 'https://countryflagsapi.com/png/ph', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Switzerland', SUI, 'https://countryflagsapi.com/png/ch', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Canada', CAN, 'https://countryflagsapi.com/png/ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Nigera', NGA, 'https://countryflagsapi.com/png/ng', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Republic of Ireland', IRL, 'https://countryflagsapi.com/png/ie', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Australia', AUS, 'https://countryflagsapi.com/png/au', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Spain', ESP, 'https://countryflagsapi.com/png/es', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Costa Rica', CRC, 'https://countryflagsapi.com/png/cr', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Zambia', ZAM, 'https://countryflagsapi.com/png/zm', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Japan', JPN, 'https://countryflagsapi.com/png/jp', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'England', ENG, 'https://countryflagsapi.com/png/gb-eng', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Denmark', DEN, 'https://countryflagsapi.com/png/dk', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'China PR', CHN, 'https://countryflagsapi.com/png/cn', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'USA', USA, 'https://countryflagsapi.com/png/us', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Vietnam', VIE, 'https://countryflagsapi.com/png/vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Netherlands', NED, 'https://countryflagsapi.com/png/nl', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'France', FRA, 'https://countryflagsapi.com/png/fr', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Jamaica', JAM, 'https://countryflagsapi.com/png/jm', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Brazil', BRA, 'https://countryflagsapi.com/png/br', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Sweden', SWE, 'https://countryflagsapi.com/png/se', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'South Africa', RSA, 'https://countryflagsapi.com/png/za', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Italy', ITA, 'https://countryflagsapi.com/png/it', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Argentina', ARG, 'https://countryflagsapi.com/png/ar', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Germany', GER, 'https://countryflagsapi.com/png/de', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Morocco', MAR, 'https://countryflagsapi.com/png/ma', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Colombia', COL, 'https://countryflagsapi.com/png/co', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Korea Republic', KOR, 'https://countryflagsapi.com/png/kr', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Madagascar', MDG, 'https://countryflagsapi.com/png/md', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO "venues" ("id", "stadium") VALUES
(1, 'Eden Park'),
(2, 'Sydney Football Stadium'),
(3, 'Dunedin Stadium'),
(4, 'Melbourne Rectangular Stadium'),
(5, 'Wellington Regional Stadium'),
(6, 'Waikato Stadium'),
(7, 'Brisbane Stadium'),
(8, 'Perth Rectangular Stadium'),
(9, 'Hindmarsh Stadium'),
(10, 'Stadium Australia');