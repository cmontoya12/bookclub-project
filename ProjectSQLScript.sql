
CREATE DATABASE  BookClubDB;
USE BookClubDB;

-- Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);

-- Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200),
    Author VARCHAR(100),
    Genre VARCHAR(50)
);

-- Meetings Table
CREATE TABLE Meeting (
    MeetingID INT AUTO_INCREMENT PRIMARY KEY,
    Length VARCHAR(50),
    Date DATE,
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    Rating INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Attends Table (Many-to-Many between Members and Meetings)
CREATE TABLE Attends (
    MemberID INT,
    MeetingID INT,
    PRIMARY KEY (MemberID, MeetingID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (MeetingID) REFERENCES Meeting(MeetingID)
);
