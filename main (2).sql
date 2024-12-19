--  1: Creating Tables

-- AdminLogin Table
CREATE TABLE AdminLogin (
    AdminLoginId Number(9,0) PRIMARY KEY,
    Password VARCHAR(255) NOT NULL
);

-- UserType Table
CREATE TABLE UserType (
    UserTypeId Number(9,0) PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL,
    Description VARCHAR(255)
);

-- UserDetails Table
CREATE TABLE UserDetails (
    UserDetailsId Number(9,0) PRIMARY KEY,
    UserId  Number(9,0) NOT NULL,
    ContactNo  Number(9,0) ,
    Address VARCHAR(255) ,
    CityId Number(9,0),
    StateId Number(9,0) NOT NULL,
    CountryId Number(9,0) NOT NULL,
    StatusId  Number(9,0) NOT NULL,
    EmailId  Number(9,0) NOT NULL,
    DOB DATE,
    Sex VARCHAR(1),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    MiddleName VARCHAR(100),
    UserTypeId Number(9,0) NOT NULL,
    Qualification VARCHAR(100),
    RegisteredDate DATE ,
    FOREIGN KEY (StatusId) REFERENCES Status(StatusId),
    FOREIGN KEY (CountryId) REFERENCES Country(CountryId),
    FOREIGN KEY (UserTypeID) REFERENCES UserType(UserTypeID),
    FOREIGN KEY (UserId) REFERENCES UserLoginAccount(UserId),
    FOREIGN KEY (StateId) REFERENCES tbl_State(StateId),
    FOREIGN KEY (CityId) REFERENCES City(CityId)
);

-- UserLoginAccount Table
CREATE TABLE UserLoginAccount (
    UserId Number(9,0)  PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- DocumentCategory Table
CREATE TABLE DocumentCategory (
    CategoryId Number(9,0) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

-- DocumentDetails Table
CREATE TABLE DocumentDetails (
    DocumentId Number(9,0) PRIMARY KEY, 
    UserId Number(9,0), 
    StatusId Number(9,0) ,
    CategoryId Number(9,0), 
    DocumentTitle VARCHAR(255),
    ShortDescription VARCHAR(500), 
    FullDescription varchar(500), 
    DocumentUploaded DATE, 
    SubmittedBy VARCHAR(255), 
    SubmittedDate DATETIME, 
    Keywords VARCHAR(500) ,
    FOREIGN KEY (CategoryId) REFERENCES DocumentCategory(CategoryId),
    FOREIGN KEY (UserId) REFERENCES UserLoginAccount(UserId),
    FOREIGN KEY (StatusId) REFERENCES Status(StatusId)
);

-- RatingComments Table
CREATE TABLE RatingComments (
    RatingCommentID Number(9,0) PRIMARY KEY, 
    Rating Number(9,0), 
    Comments varchar(500), 
    CommentsBy VARCHAR(255),
    CommentsPersonEmailId VARCHAR(255), 
    DocumentId Number(9,0 ), 
    FOREIGN KEY (DocumentId) REFERENCES DocumentDetails(DocumentId) 
);

-- Status Table
CREATE TABLE Status (
    StatusId Number(9,0) PRIMARY KEY,
    StatusName VARCHAR(100),
    StatusDescription VARCHAR(200)
);

-- Country Table
CREATE TABLE Country (
    CountryId Number(9,0) PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    StatusId Number(9,0) ,
    CountryDescription VARCHAR(200),
    FOREIGN KEY (StatusId) REFERENCES Status(StatusId)
);

-- State Table
CREATE TABLE tbl_State (
    StateId Number(9,0) PRIMARY KEY,
    CountryId Number(9,0) NOT NULL,
    StateName VARCHAR(100) NOT NULL,
    StatusId Number(9,0) NOT NULL,
    StateDescription VARCHAR(200),
    FOREIGN KEY (CountryId) REFERENCES Country(CountryId),
    FOREIGN KEY (StatusId) REFERENCES Status(StatusId)
    
);

CREATE TABLE City (
    CityId Number(9,0) PRIMARY KEY,
    StateId Number(9,0) NOT NULL,
    StatusId Number(9,0) NOT NULL,
    CityName VARCHAR(100) NOT NULL,
    CountryId Number(9,0) NOT NULL,
    CityDescription VARCHAR(200),
    FOREIGN KEY (StateId) REFERENCES tbl_State(StateId),
    FOREIGN KEY (CountryId) REFERENCES Country(CountryId)
);

-- Insert into Status
INSERT INTO Status (StatusId, StatusName, StatusDescription) VALUES
(1, 'Active', 'Currently active'),
(2, 'Pending', 'Pending approval'),
(3, 'Inactive', 'Not active'),
(4, 'Suspended', 'Suspended temporarily'),
(5, 'Deleted', 'Removed from system');

-- Insert into Country
INSERT INTO Country (CountryId, CountryName, StatusId, CountryDescription) VALUES
(1, 'Palestine', 1, 'Country in the Middle East'),
(2, 'Jordan', 1, 'Neighboring country of Palestine'),
(3, 'Egypt', 1, 'Country in North Africa'),
(4, 'Lebanon', 2, 'Country in the Levant region'),
(5, 'Syria', 3, 'Country in the Levant region');

-- Insert into tbl_State
INSERT INTO tbl_State (StateId, CountryId, StateName, StatusId, StateDescription) VALUES
(1, 1, 'West Bank', 1, 'Region in Palestine'),
(2, 1, 'Gaza Strip', 1, 'Region in Palestine'),
(3, 2, 'Amman', 1, 'Capital of Jordan'),
(4, 3, 'Cairo', 1, 'Capital of Egypt'),
(5, 4, 'Beirut', 2, 'Capital of Lebanon');

-- Insert into City
INSERT INTO City (CityId, StateId, StatusId, CityName, CountryId, CityDescription) VALUES
(1, 1, 1, 'Tulkarm', 1, 'City in the West Bank'),
(2, 1, 1, 'Nablus', 1, 'City in the West Bank'),
(3, 2, 1, 'Gaza City', 1, 'City in the Gaza Strip'),
(4, 3, 1, 'Amman City', 2, 'Capital city of Jordan'),
(5, 4, 2, 'Cairo City', 3, 'Capital city of Egypt');

-- Insert into UserLoginAccount
INSERT INTO UserLoginAccount (UserId, Username, Password) VALUES
(1, 'AlaMousa', 'ala12345'),
(2, 'DimaSwalha', 'dima12345'),
(3, 'OmarAli', 'omar2024'),
(4, 'YousefHassan', 'yousef2024'),
(5, 'KhaledSaad', 'khaled2024');

-- Insert into UserType
INSERT INTO UserType (UserTypeId, TypeName, Description) VALUES
(1, 'Admin', 'System Administrator'),
(2, 'Editor', 'Content Editor'),
(3, 'Author', 'Content Author'),
(4, 'Viewer', 'Content Viewer'),
(5, 'Reviewer', 'Content Reviewer');

-- Insert into AdminLogin
INSERT INTO AdminLogin (AdminLoginId, Password) VALUES
(1, 'admin123'),
(2, 'securePass'),
(3, 'welcome2024'),
(4, 'pass@word'),
(5, 'oracle2024');

-- Insert into DocumentCategory
INSERT INTO DocumentCategory (CategoryId, CategoryName, Description) VALUES
(1, 'Science', 'Scientific Research'),
(2, 'Literature', 'Poetry and Stories'),
(3, 'Technology', 'Tech Articles'),
(4, 'Business', 'Business Studies'),
(5, 'Education', 'Educational Materials');

-- Insert into DocumentDetails
INSERT INTO DocumentDetails (DocumentId, UserId, StatusId, CategoryId, DocumentTitle, ShortDescription, FullDescription, DocumentUploaded, SubmittedBy, SubmittedDate, Keywords) VALUES
(1, 1, 1, 3, 'AI Innovations', 'Artificial Intelligence advancements', 'Detailed study on AI.', '2024-12-25', 'Alā’ Mousa', '2024-12-22', 'AI, Technology, Future'),
(2, 2, 2, 2, 'Modern Poetry', 'Collection of recent poems', 'Deep analysis of modern poetry.', '2024-11-19', 'Dima Swalha', '2024-11-15', 'Poetry, Literature'),
(3, 3, 3, 4, 'Market Analysis', 'Trends in marketing', 'Comprehensive analysis of market trends.', '2024-10-11', 'Omar Ali', '2024-10-10', 'Business, Marketing'),
(4, 4, 4, 5, 'Education Methods', 'New teaching techniques', 'Exploration of modern educational techniques.', '2024-09-18', 'Yousef Hassan', '2024-09-15', 'Education, Teaching'),
(5, 5, 5, 1, 'Physics Experiments', 'Innovative physics experiments', 'Compilation of advanced physics experiments.', '2024-08-05', 'Khaled Saad', '2024-08-01', 'Physics, Science');

-- Insert into UserDetails
INSERT INTO UserDetails (UserDetailsId, UserId, ContactNo, Address, CityId, StateId, CountryId, StatusId, EmailId, DOB, Sex, FirstName, LastName, UserTypeId, Qualification, RegisteredDate) VALUES
(1, 1, 972598765432, 'Street 1', 1, 1, 1, 1, 1, '2004-06-25', 'F', 'Alā’', 'Mousa', 3, 'B.Sc Computer Science', '2024-12-20'),
(2, 2, 972592345678, 'Street 2', 2, 2, 1, 1, 2, '2003-04-15', 'F', 'Dima', 'Swalha', 2, 'M.A Literature', '2024-12-21'),
(3, 3, 972599876543, 'Street 3', 3, 2, 1, 2, 3, '1995-11-10', 'M', 'Omar', 'Ali', 4, 'B.A Business', '2024-12-19'),
(4, 4, 972597654321, 'Street 4', 3, 1, 1, 1, 4, '1993-06-09', 'M', 'Yousef', 'Hassan', 1, 'Ph.D. Engineering', '2024-12-17'),
(5, 5, 972591234567, 'Street 5', 2, 1, 1, 2, 5, '1997-04-25', 'M', 'Khaled', 'Saad', 5, 'M.Sc Physics', '2024-12-18');

-- Insert into RatingComments
INSERT INTO RatingComments (RatingCommentID, Rating, Comments, CommentsBy, CommentsPersonEmailId, DocumentId) VALUES
(1, 5, 'This article provides excellent insights into AI advancements.', 'Alā’ Mousa', 'ala.mousa@example.com', 1),
(2, 4, 'The poetry collection is inspiring and well-curated.', 'Dima Swalha', 'dima.swalha@example.com', 2),
(3, 3, 'The market analysis is informative but could use more data.', 'Omar Ali', 'omar.ali@example.com', 1),
(4, 5, 'A must-read for educators looking for innovative methods.', 'Yousef Hassan', 'yousef.hassan@example.com', 1),
(5, 4, 'Great compilation of physics experiments, very useful.', 'Khaled Saad', 'khaled.saad@example.com', 5);

-- 1) Retrieve a list of all users in a specific city along with their details.
SELECT 
    UserDetails.UserDetailsId, 
    UserDetails.UserId, 
    UserDetails.FirstName, 
    UserDetails.LastName, 
    UserDetails.MiddleName, 
    UserDetails.ContactNo, 
    UserDetails.Address, 
    UserDetails.EmailId, 
    UserDetails.DOB, 
    UserDetails.Sex, 
    UserDetails.Qualification, 
    UserDetails.RegisteredDate, 
    City.CityName
FROM 
    UserDetails
JOIN 
    City ON UserDetails.CityId = City.CityId
WHERE 
    City.CityName = 'Nablus' ;

-- 2) Fetch the details of all documents submitted by a specific user.
 SELECT 
    DocumentDetails.DocumentId, 
    DocumentDetails.DocumentTitle, 
    DocumentDetails.ShortDescription, 
    DocumentDetails.FullDescription, 
    DocumentDetails.DocumentUploaded, 
    DocumentDetails.SubmittedBy, 
    DocumentDetails.SubmittedDate, 
    DocumentDetails.Keywords, 
    DocumentCategory.CategoryName
FROM 
    DocumentDetails
JOIN 
    DocumentCategory ON DocumentDetails.CategoryId = DocumentCategory.CategoryId
WHERE 
    DocumentDetails.UserId = 5 ;
-- 3) Find all comments and ratings given for a particular document.
SELECT 
    RatingComments.Rating, 
    RatingComments.Comments, 
    RatingComments.CommentsBy
  
FROM 
    RatingComments
WHERE 
    RatingComments.DocumentId = 1 ;
-- 4. Retrieve the status records for a specific document within a given date range.
SELECT 
    d.DocumentTitle,
    d.DocumentUploaded,
    d.SubmittedDate,
    s.StatusName,
    s.StatusDescription
FROM 
    DocumentDetails d
JOIN 
    Status s ON d.StatusId = s.StatusId
WHERE 
    d.DocumentId = 1 
    AND d.SubmittedDate BETWEEN '2024-07-00' 
    AND '2024-12-22';
-- 5. List the contact information for all users in a particular city.
SELECT 
    u.FirstName, 
    u.LastName, 
    u.ContactNo, 
    u.EmailId, 
    u.DOB, 
    u.Address
FROM 
    UserDetails u
JOIN 
    City c ON u.CityId = c.CityId
WHERE 
    c.CityName = 'Nablus'; 
-- 6. Fetch the average rating for each document category.
SELECT 
    dc.CategoryName, 
    AVG(rc.Rating) AS AverageRating
FROM 
    DocumentCategory dc
JOIN 
    DocumentDetails dd ON dc.CategoryId = dd.CategoryId
JOIN 
    RatingComments rc ON dd.DocumentId = rc.DocumentId
GROUP BY 
    dc.CategoryName;
-- 7. Display all documents along with their associated categories and user details.
SELECT 
    dd.DocumentId,
    dd.DocumentTitle,
    dd.ShortDescription,
    dd.FullDescription,
    dc.CategoryName,
    ud.FirstName,
    ud.LastName,
    ud.EmailId,
    ud.ContactNo,
    ud.Address,
    ud.CityId,
    ud.StateId,
    ud.CountryId
FROM 
    DocumentDetails dd
JOIN 
    DocumentCategory dc ON dd.CategoryId = dc.CategoryId
JOIN 
    UserDetails ud ON dd.UserId = ud.UserId;
-- 8. List all cities along with the number of users in each.
SELECT 
    c.CityName,
    COUNT(ud.UserId) AS NumberOfUsers
FROM 
    City c
LEFT JOIN 
    UserDetails ud ON c.CityId = ud.CityId
GROUP BY 
    c.CityName;
    
-- REPORT GENERATION
    -- City-wise user distribution (number of users per city).
    SELECT 
    c.CityName,
    COUNT(ud.UserId) AS NumberOfUsers
FROM 
    City c
LEFT JOIN 
    UserDetails ud ON c.CityId = ud.CityId
GROUP BY 
    c.CityName;

    -- Category-wise document details and the average ratings for those documents.
    SELECT 
    dc.CategoryName,
    COUNT(dd.DocumentId) AS NumberOfDocuments,
    AVG(rc.Rating) AS AverageRating
FROM 
    DocumentCategory dc
JOIN 
    DocumentDetails dd ON dc.CategoryId = dd.CategoryId
JOIN 
    RatingComments rc ON dd.DocumentId = rc.DocumentId
GROUP BY 
    dc.CategoryName;


-- IMPLEMENTING VIEWS:
-- View to show user details along with their city and state names 
CREATE VIEW UserCityStateDetails AS
SELECT 
    ud.UserId,
    ud.FirstName,
    ud.LastName,
    ud.EmailId,
    ud.ContactNo,
    c.CityName,
    s.StateName
FROM 
    UserDetails ud
JOIN 
    City c ON ud.CityId = c.CityId
JOIN 
    tbl_State s ON ud.StateId = s.StateId;
     
     SELECT * FROM UserCityStateDetails;

--  View to display documents along with their categories and authors.
CREATE VIEW DocumentCategoryAuthorDetails AS
SELECT 
    d.DocumentId,
    d.DocumentTitle,
    d.ShortDescription,
    dc.CategoryName,
    ud.FirstName AS AuthorFirstName,
    ud.LastName AS AuthorLastName
FROM 
    DocumentDetails d
JOIN 
    DocumentCategory dc ON d.CategoryId = dc.CategoryId
JOIN 
    UserDetails ud ON d.UserId = ud.UserId;

SELECT * FROM DocumentCategoryAuthorDetails;
 
 -- View to show comments and ratings for each document.
 CREATE VIEW DocumentCommentsRatings AS
SELECT 
    dc.DocumentId,
    dc.DocumentTitle,
    rc.Rating,
    rc.Comments,
    rc.CommentsBy,
    rc.CommentsPersonEmailId
FROM 
    DocumentDetails dc
JOIN 
    RatingComments rc ON dc.DocumentId = rc.DocumentId;

SELECT * FROM DocumentCommentsRatings;

-- View to list the status history for documents.
CREATE VIEW DocumentStatusHistoryView AS
SELECT
    d.DocumentId,
    d.DocumentTitle,
    d.StatusId,
    s.StatusName,
    d.SubmittedDate AS StatusChangedDate
FROM
    DocumentDetails d
JOIN
    Status s ON d.StatusId = s.StatusId
ORDER BY
    d.SubmittedDate;

SELECT * FROM DocumentStatusHistoryView;


