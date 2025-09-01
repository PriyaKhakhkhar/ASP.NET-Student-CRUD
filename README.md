# Student Management System (ASP.NET WebForms + SQL Server)

A simple CRUD (Create, Read, Update, Delete) application built using ASP.NET WebForms and SQL Server.

---

## Features
- Add new students
- Edit student details
- Delete students
- View all students in a grid
- Uses Stored Procedure (Student_Crud) for all operations

---

## Setup Instructions

### 1. Database Setup
1. Open SQL Server Management Studio (SSMS).
2. Create a new database named StudentDB.
3. Run the provided script file `StudentDB.sql` from this repository to create:
   - Student table
   - Student_Crud stored procedure
   - Sample data

---

### 2. Configure Connection String
In your project’s Web.config, update the connection string:

<connectionStrings>
  <add name="mycon" 
       connectionString="Data Source=YOUR_SERVER_NAME;Initial Catalog=StudentDB;Integrated Security=True;" 
       providerName="System.Data.SqlClient" />
</connectionStrings>

➡ Replace `YOUR_SERVER_NAME` with your SQL Server instance (example: .\SQLEXPRESS or localhost).

---

### 3. Run the Project
1. Open the project in Visual Studio.
2. Build the solution (Ctrl + Shift + B).
3. Press F5 or run without debugging.

---

## Technologies Used
- ASP.NET WebForms
- C#
- SQL Server
- ADO.NET

---

✅ You’re now ready to use the Student Management System!
