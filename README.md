# 📂 Knowledge Management System 🚀

![image](https://github.com/user-attachments/assets/eec48a5c-5457-4c77-be90-7e754972242f)

Welcome to the Knowledge Management System project repository! 🌟 This repository is a centralized hub for managing and sharing knowledge efficiently through a database-driven solution. It encompasses functionalities for user management, document categorization, comments, ratings, and more!

## 🎯 Purpose of the Project

The goal of this project is to design and implement a relational database for a Knowledge Management System based on an Entity-Relationship (ER) Diagram. It serves as a backend foundation for organizing users, locations, documents, and their interactions seamlessly.

## 🛠️ What’s Inside?

SQL Scripts 📝: Scripts for creating tables, inserting sample data, and running queries.
Reports 📊: Predefined SQL queries for generating insightful reports.
Views 👓: Optimized SQL views for simplified data access.
Documentation 📚: Clear explanations of the project components and their purpose.

## 💡Key Features

User Management 👥: Track users with detailed location-based information.
Document Tracking 📄: Categorize and maintain document submissions with metadata.
Ratings & Feedback ⭐: Engage with documents through comments and ratings.
Status Monitoring 🔍: Monitor the lifecycle of documents across different statuses.

## 🔗 Key Relationships in the Database

![image](https://github.com/user-attachments/assets/47cf3203-b5a7-449e-bb9e-de612e7fb5da)

1. User and Location 🌍:
Users (UserDetails) are linked to their locations through City, tbl_State (State), and Country tables.
Each user has the following:
A City (CityId) linked to the City table.
A State (StateId) linked to the tbl_State table.
A Country (CountryId) linked to the Country table.
Purpose: Tracks the geographical location of users accurately.
2. User and Login Accounts 🔐:
The UserDetails table references the UserLoginAccount table via UserId.
Ensures that each user has a unique login account for secure authentication.
Purpose: Links personal details to login credentials.
3. Documents and Categories 📂:
Documents in the DocumentDetails table are categorized using the DocumentCategory table.
The CategoryId field in DocumentDetails references the CategoryId in the DocumentCategory table.
Purpose: Enables grouping and filtering of documents by category.
4. Documents and Users 📝:
Each document is linked to its author (user) through the UserId field in the DocumentDetails table.
Purpose: Tracks ownership and authorship of documents.
5. Ratings and Comments ⭐:
The RatingComments table is connected to the DocumentDetails table via DocumentId.
This relationship helps track feedback, including ratings and comments, for specific documents.
Purpose: Provides a mechanism for user interaction and engagement.
6. Document Status 🔄:
The Status table keeps track of the current status of documents (e.g., Submitted, Approved, Rejected).
The StatusId in DocumentDetails links to StatusId in the Status table.
Purpose: Monitors the lifecycle of documents.
This structured design ensures a robust system for managing knowledge effectively and provides a solid foundation for real-world database implementations. 🚀

