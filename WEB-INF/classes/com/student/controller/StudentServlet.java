package com.student.controller;

import com.student.dao.StudentDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    request.getRequestDispatcher("/add.jsp").forward(request, response);
                    break;
                case "edit":
                    int editId = Integer.parseInt(request.getParameter("id"));
                    String[] student = studentDAO.getStudentById(editId);
                    if (student != null) {
                        request.setAttribute("student", student);
                        request.getRequestDispatcher("/edit.jsp").forward(request, response);
                    } else {
                        request.setAttribute("error", "Student not found");
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                    break;
                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    studentDAO.deleteStudent(deleteId);
                    request.setAttribute("success", "Student deleted successfully");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    break;
                default:
                    List<String[]> students = studentDAO.getAllStudents();
                    request.setAttribute("students", students);
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "add";
        }

        try {
            switch (action) {
                case "add":
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    
                    if (name == null || name.trim().isEmpty() || 
                        email == null || email.trim().isEmpty() ||
                        phone == null || phone.trim().isEmpty()) {
                        throw new Exception("All fields are required");
                    }
                    
                    studentDAO.addStudent(name, email, phone);
                    request.setAttribute("success", "Student added successfully");
                    break;
                    
                case "update":
                    int id = Integer.parseInt(request.getParameter("id"));
                    name = request.getParameter("name");
                    email = request.getParameter("email");
                    phone = request.getParameter("phone");
                    
                    if (name == null || name.trim().isEmpty() || 
                        email == null || email.trim().isEmpty() ||
                        phone == null || phone.trim().isEmpty()) {
                        throw new Exception("All fields are required");
                    }
                    
                    studentDAO.updateStudent(id, name, email, phone);
                    request.setAttribute("success", "Student updated successfully");
                    break;
            }
            response.sendRedirect(request.getContextPath() + "/student");
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            if ("add".equals(action)) {
                request.getRequestDispatcher("/add.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/edit.jsp").forward(request, response);
            }
        }
    }
}
