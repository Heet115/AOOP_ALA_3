## Video Demonstration

A video demonstration of the application is available in the file `ALA_3_20231105060523.mp4`.

# Student Management System

This is a web-based application for managing student records. It allows users to add, edit, view, and delete student information.

## Features
- Add new students with name, email, and phone number.
- Edit existing student details.
- View a list of all students.
- Delete student records.

## Technologies Used
- Java
- JSP (JavaServer Pages)
- Servlet
- MySQL
- Tailwind CSS
- Apache Tomcat

## Setup Instructions

1. **Database Setup**:
   - Ensure MySQL is installed and running.
   - Create a database named `studentdb`.
   - Create a table named `students` with the following structure:
     ```sql
     CREATE TABLE students (
         id INT AUTO_INCREMENT PRIMARY KEY,
         name VARCHAR(100) NOT NULL,
         email VARCHAR(100) NOT NULL,
         phone VARCHAR(20) NOT NULL
     );
     ```

2. **Project Deployment**:
   - Copy the project folder to `C:\xampp\tomcat\webapps\StudentCRUD`.
   - Ensure all `.class` files are compiled and located in the correct directories.

3. **Running the Application**:
   - Start the Apache Tomcat server.
   - Access the application at `http://localhost:8080/StudentCRUD/`.