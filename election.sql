

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


