# ASP.NET Student CRUD  

A simple **Student Management System** built with **ASP.NET Web Forms**, demonstrating **CRUD operations (Create, Read, Update, Delete)** using **GridView** and **SQL Server Stored Procedures**.  

---

## 🚀 Features
- Add new student records  
- View all students in a GridView  
- Update existing student information  
- Delete student records  

---

## 📂 Project Structure
- `/DatabaseScripts/student.sql` → SQL script for table + stored procedure  
- `/WebForms/demo.aspx` → ASP.NET Web Form with GridView  
- `/WebForms/demo.aspx.cs` → CodeBehind (C# logic)  
- `web.config` → Database connection string  

---

## 🛠️ Technologies Used
- ASP.NET Web Forms (C#)  
- SQL Server (Stored Procedures)  
- ADO.NET (SqlCommand, DataSet, SqlDataAdapter)
  
---

## ▶️ How to Run
1. Create a SQL Server database `DB(106)`  
2. Run the script from `/DatabaseScripts/student.sql`  
3. Update the connection string (`mycon`) in `web.config`  
4. Open the solution in Visual Studio and run `demo.aspx`  
