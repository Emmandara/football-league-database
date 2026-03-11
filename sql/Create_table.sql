

CREATE TABLE Groups (
    GroupID SERIAL PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL
);

CREATE TABLE Teams (
    TeamID SERIAL PRIMARY KEY,
    Team_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Venues (
    VenueID SERIAL PRIMARY KEY,
    Venue_Name VARCHAR(50) NOT NULL
);

CREATE TABLE EventType (
    Event_Type_ID SERIAL PRIMARY KEY,
    Event VARCHAR(50) NOT NULL
);

CREATE TABLE Results (
    ResultsID SERIAL PRIMARY KEY,
    Result VARCHAR(50) NOT NULL 
);


-- Players Table 
CREATE TABLE Players (
    PlayerID SERIAL PRIMARY KEY,
    ConsultantID INT,
    Name VARCHAR(100) NOT NULL,
    
    TeamID INT REFERENCES Teams(TeamID) ON DELETE CASCADE,
    GroupID INT REFERENCES Groups(GroupID) ON DELETE CASCADE
);


-- Fixtures Table 
CREATE TABLE Fixtures (
    MatchID SERIAL PRIMARY KEY,
   
    ResultsID INT REFERENCES Results(ResultsID) ON DELETE SET NULL NULL,
    MatchDate DATE NOT NULL,
    MatchTime TIME NOT NULL,
    Home_TeamID INT REFERENCES Teams(TeamID) ON DELETE CASCADE,
    Away_TeamID INT REFERENCES Teams(TeamID) ON DELETE CASCADE,
    VenueID INT REFERENCES Venues(VenueID) ON DELETE SET NULL,
    IsFriendly BOOLEAN DEFAULT FALSE
);


-- Events Table 
CREATE TABLE Events (
    EventID SERIAL PRIMARY KEY,
    MatchID INT REFERENCES Fixtures(MatchID) ON DELETE CASCADE,
    PlayerID INT REFERENCES Players(PlayerID) ON DELETE CASCADE,
    Event_Type_ID INT REFERENCES EventType(Event_Type_ID) ON DELETE SET NULL,
    Minute INT
);