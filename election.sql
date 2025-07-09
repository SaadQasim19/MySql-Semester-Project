

-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Vote;
DROP TABLE IF EXISTS Candidate;
DROP TABLE IF EXISTS PollingStation;
DROP TABLE IF EXISTS Election;
DROP TABLE IF EXISTS Party;
DROP TABLE IF EXISTS Voter;

-- CREATE TABLES
CREATE TABLE Voter (
  voter_id INT PRIMARY KEY,
  name VARCHAR(100),
  cnic VARCHAR(15),
  age INT,
  address VARCHAR(255)
);

CREATE TABLE Party (
  party_id INT PRIMARY KEY,
  name VARCHAR(100),
  symbol VARCHAR(10)
);

CREATE TABLE Election (
  election_id INT PRIMARY KEY,
  title VARCHAR(100),
  election_date DATE,
  type VARCHAR(50)
);

CREATE TABLE Candidate (
  candidate_id INT PRIMARY KEY,
  name VARCHAR(100),
  party_id INT,
  election_id INT,
  FOREIGN KEY (party_id) REFERENCES Party(party_id),
  FOREIGN KEY (election_id) REFERENCES Election(election_id)
);
CREATE TABLE Vote (
  vote_id INT PRIMARY KEY,
  voter_id INT,
  candidate_id INT,
  election_id INT,
  FOREIGN KEY (voter_id) REFERENCES Voter(voter_id),
  FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id),
  FOREIGN KEY (election_id) REFERENCES Election(election_id)
);

CREATE TABLE PollingStation (
  station_id INT PRIMARY KEY,
  location VARCHAR(255),
  election_id INT,
  FOREIGN KEY (election_id) REFERENCES Election(election_id)
  
);
CREATE TABLE Result (
  result_id INT PRIMARY KEY,
  candidate_id INT,
  election_id INT,
  total_votes INT,
  FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id),
  FOREIGN KEY (election_id) REFERENCES Election(election_id)
);
-- INSERT VOTERS
INSERT INTO Voter VALUES (1, 'Ali Khan', '12345-1111111-1', 30, 'Lahore');
INSERT INTO Voter VALUES (2, 'Sana Malik', '12345-2222222-2', 28, 'Karachi');
INSERT INTO Voter VALUES (3, 'Bilal Ahmed', '12345-3333333-3', 35, 'Islamabad');
INSERT INTO Voter VALUES (4, 'Hira Shah', '12345-4444444-4', 26, 'Peshawar');
INSERT INTO Voter VALUES (5, 'Usman Tariq', '12345-5555555-5', 32, 'Quetta');

-- INSERT PARTIES
INSERT INTO Party VALUES (1, 'Unity Party', 'U');
INSERT INTO Party VALUES (2, 'Progress Party', 'P');

-- INSERT ELECTION
INSERT INTO Election VALUES (1, 'National Election 2025', '2025-07-15', 'National');

-- INSERT CANDIDATES
INSERT INTO Candidate VALUES (1, 'Ahmed Nawaz', 1, 1);
INSERT INTO Candidate VALUES (2, 'Zara Sheikh', 2, 1);

-- INSERT VOTES
INSERT INTO Vote VALUES (1, 1, 1, 1);
INSERT INTO Vote VALUES (2, 2, 2, 1);
INSERT INTO Vote VALUES (3, 3, 1, 1);
INSERT INTO Vote VALUES (4, 4, 1, 1);
INSERT INTO Vote VALUES (5, 5, 2, 1);

-- INSERT POLLING STATIONS
INSERT INTO PollingStation VALUES (1, 'Lahore Center', 1);
INSERT INTO PollingStation VALUES (2, 'Karachi Central', 1);

-- INSERT RESULTS (manually calculated)
-- Ahmed Nawaz (candidate 1) got 3 votes
-- Zara Sheikh (candidate 2) got 2 votes
INSERT INTO Result VALUES (1, 1, 1, 3);
INSERT INTO Result VALUES (2, 2, 1, 2);



