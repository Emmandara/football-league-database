-- 1. INSERT DATA INTO LOOKUP TABLES (Independent Tables)

-- GROUPS
INSERT INTO Groups (GroupID, GroupName) VALUES
    (1, 'Cohort 4'), (2, 'Cohort 5'), (3, 'Cohort 6'), (4, 'Cohort 7'),
    (5, 'Bench'), (6, 'Training Team'), (7, 'HR'), (8, 'Consultants');

-- TEAMS
INSERT INTO Teams (TeamID, Team_Name) VALUES
    (1, 'Data Masters'), (2, 'BI Gods'), (3, 'Vis Wizards'), (4, 'Data Cleaners');

-- VENUES
INSERT INTO Venues (VenueID, Venue_Name) VALUES
    (1, 'Wimbledon 1'), (2, 'Wimbledon 2'), (3, 'Wimbledon 3');

-- EVENTTYPE
INSERT INTO EventType (Event_Type_ID, Event) VALUES
    (1, 'Goal'), (2, 'Yellow Card'), (3, 'Red Card');

-- RESULTS
INSERT INTO Results (ResultsID, Result) VALUES
    (1, 'Home win'), (2, 'Away win'), (3, 'Draw');

-- 2. INSERT DATA INTO PLAYERS TABLE (Requires Teams and Groups)

-- PLAYERS (Verified with final data provided)
INSERT INTO Players (PlayerID, ConsultantID, Name, TeamID, GroupID) VALUES
    (1, 200, 'Aedan Petty', 3, 1),
    (2, 201, 'Aliza Santos', 1, 3),
    (3, 201, 'Kaylynn Vaughan', 1, 6),
    (4, 202, 'Arjun Bauer', 1, 4),
    (5, 202, 'Lilian Huber', 1, 2),
    (6, 203, 'Lizeth Roberts', 1, 6),
    (7, 203, 'Nathan Mcdowell', 1, 7),
    (8, 204, 'Alvin Ali', 1, 8),
    (9, 204, 'Jordin Christensen', 1, 7),
    (10, 205, 'Saul Blevins', 1, 7),
    (11, 205, 'Carina Meza', 2, 2),
    (12, 206, 'Isabelle Campos', 2, 5),
    (13, 206, 'Kyleigh Phelps', 2, 1),
    (14, 207, 'Angela Wong', 2, 8),
    (15, 207, 'Kole Rojas', 2, 7),
    (16, 208, 'Martha Potts', 2, 4),
    (17, 208, 'Tomas Powell', 2, 6),
    (18, 209, 'Paxton Clarke', 2, 5),
    (19, 209, 'Jamya Dodson', 2, 8),
    (20, 210, 'Georgia Clements', 2, 8),
    (21, 210, 'Edwin Crawford', 3, 2),
    (22, 211, 'Malachi Osborn', 3, 8),
    (23, 211, 'Zion Kent', 3, 2),
    (24, 212, 'Anahi Reyes', 3, 5),
    (25, 212, 'Maddox Cabrera', 3, 8),
    (26, 213, 'Brody Gutierrez', 3, 4),
    (27, 213, 'Hayley Stevenson', 3, 3),
    (28, 214, 'Kamora Sanchez', 3, 8),
    (29, 214, 'Livia Holmes', 3, 6),
    (30, 215, 'Tanner Jenkins', 3, 8),
    (31, 215, 'Madelyn Meadows', 4, 5),
    (32, 216, 'Paola Wilkerson', 4, 3),
    (33, 216, 'Jared Patton', 4, 6),
    (34, 217, 'Pierre Washington', 4, 8),
    (35, 217, 'Dominik Cochran', 4, 4),
    (36, 217, 'Miya Skinner', 4, 4),
    (37, 218, 'Mara Barnett', 4, 5),
    (38, 219, 'Cornelius Dodson', 4, 2),
    (39, 219, 'Ashleigh Kaiser', 4, 6),
    (40, 220, 'Weston Meza', 4, 6);

---


-- 3. INSERT DATA INTO FIXTURES TABLE (Requires Teams, Venues, Results)

INSERT INTO Fixtures (MatchID, ResultsID, MatchDate, MatchTime, Home_TeamID, Away_TeamID, VenueID, IsFriendly) VALUES
    (1, 1, '2022-10-01', '16:00:00', 1, 2, 1, FALSE),
    (2, 3, '2022-10-01', '16:00:00', 3, 4, 2, FALSE),
    (3, 1, '2022-10-08', '16:00:00', 1, 3, 2, FALSE),
    (4, 1, '2022-10-08', '16:00:00', 2, 4, 3, FALSE),
    (5, 3, '2022-10-22', '16:00:00', 1, 4, 3, FALSE),
    (6, 2, '2022-10-22', '16:00:00', 2, 3, 2, FALSE),
    (7, 3, '2022-10-29', '16:00:00', 2, 1, 1, FALSE),
    (8, 2, '2022-10-29', '16:00:00', 4, 3, 3, FALSE),
    (9, 1, '2022-11-05', '16:00:00', 3, 1, 3, FALSE),
    (10, 2, '2022-11-05', '16:00:00', 4, 2, 1, FALSE),
    (11, 1, '2022-11-12', '16:00:00', 4, 1, 2, FALSE),
    (12, 3, '2022-12-12', '16:00:00', 3, 2, 3, FALSE),
    (13, NULL, '2023-11-12', '16:00:00', 4, 1, 1, TRUE),
    (14, NULL, '2023-11-12', '16:00:00', 3, 2, 3, TRUE);

---

-- 4. INSERT DATA INTO EVENTS TABLE (Requires Fixtures, Players, EventType)

INSERT INTO Events (EventID, MatchID, PlayerID, Event_Type_ID, Minute) VALUES
    (1, 1, 8, 1, 5), (2, 1, 12, 2, 80),
    (3, 2, 27, 1, 10), (4, 2, 35, 1, 30),
    (5, 2, 30, 2, 10), (6, 2, 30, 2, 30),
    (7, 3, 8, 1, 5), (8, 3, 8, 1, 88),
    (9, 3, 1, 2, 10), (10, 3, 9, 2, 70),
    (11, 3, 27, 1, 85),
    (12, 4, 17, 1, 20), (13, 4, 17, 1, 40),
    (14, 4, 35, 1, 30), (15, 4, 32, 3, 40),
    (16, 5, 10, 2, 35), (17, 5, 38, 2, 88),
    (18, 6, 19, 1, 5), (19, 6, 28, 1, 2),
    (20, 6, 27, 1, 55),
    (21, 7, 19, 1, 1), (22, 7, 16, 1, 82),
    (23, 7, 8, 1, 35), (24, 7, 3, 1, 77),
    (25, 7, 3, 2, 60),
    (26, 8, 35, 1, 66), (27, 8, 35, 2, 10),
    (28, 8, 25, 1, 12), (29, 8, 27, 1, 68),
    (30, 9, 29, 1, 20), (31, 9, 29, 1, 25),
    (32, 9, 26, 1, 85), (33, 9, 23, 2, 30),
    (34, 9, 7, 1, 77), (35, 9, 8, 1, 89),
    (36, 10, 32, 3, 10), (37, 10, 35, 1, 75),
    (38, 11, 19, 1, 25), (39, 11, 37, 1, 46),
    (40, 11, 9, 2, 62),
    (41, 12, 26, 1, 80), (42, 12, 25, 1, 90),
    (43, 12, 19, 1, 29), (44, 12, 18, 1, 87),
    (45, 12, 17, 2, 42);