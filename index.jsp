<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#9FB3DF',
                        'primary-dark': '#8A9FCA',
                        secondary: '#9EC6F3',
                        accent: '#BDDDE4',
                        background: '#FFF1D5',
                        'text-dark': '#2B4C7E',
                        'text-light': '#445566',
                        danger: '#ef4444',
                        success: '#38a169',
                        warning: '#dd6b20',
                    }
                }
            }
        }
    </script>
    <style>
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        @keyframes fadeOut {
            from {
                opacity: 1;
                transform: translateX(0);
            }
            to {
                opacity: 0;
                transform: translateX(50px);
            }
        }
        .animate-slideIn {
            animation: slideIn 0.3s ease-out;
        }
        .animate-fadeOut {
            animation: fadeOut 0.5s ease-out forwards;
        }
    </style>
</head>
<body class="min-h-screen bg-[#FFF1D5] flex flex-col font-sans text-[#2B4C7E]">
    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8 flex-grow">
        <!-- Page Title -->
        <div class="mb-10 bg-white p-6 rounded-lg shadow-md border-l-4 border-[#9FB3DF]">
            <div class="flex items-center">
                <div class="rounded-full w-12 h-12 flex items-center justify-center bg-[#9FB3DF]/20 mr-4">
                    <svg class="w-7 h-7 text-[#9FB3DF]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-3xl font-bold text-[#2B4C7E]">Student Management System</h2>
                    <p class="text-[#445566] max-w-2xl">Manage your student records - add new students, update existing entries, and keep track of your database.</p>
                </div>
            </div>
        </div>

        <!-- Messages -->
        <%
            String success = (String) request.getAttribute("success");
            String error = (String) request.getAttribute("error");
            if (success != null) {
        %>
            <div class="mb-6 p-4 bg-[#38a169]/10 border border-[#38a169] text-[#38a169] rounded-lg animate-slideIn">
                <%= success %>
            </div>
        <%
            }
            if (error != null) {
        %>
            <div class="mb-6 p-4 bg-[#ef4444]/10 border border-[#ef4444] text-[#ef4444] rounded-lg animate-slideIn">
                <%= error %>
            </div>
        <%
            }
        %>

        <!-- Add New Student Button -->
        <div class="mb-6">
            <a href="student?action=new" class="inline-flex items-center px-4 py-2 bg-[#9FB3DF] text-white rounded-lg hover:bg-[#8A9FCA] transition-colors">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
                Add New Student
            </a>
        </div>

        <!-- Student List -->
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <%
                        List<String[]> students = (List<String[]>) request.getAttribute("students");
                        if (students != null && !students.isEmpty()) {
                            for (String[] student : students) {
                    %>
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= student[0] %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= student[1] %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= student[2] %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= student[3] %></td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                <div class="flex space-x-2">
                                    <a href="student?action=edit&id=<%= student[0] %>" class="text-[#9FB3DF] hover:text-[#8A9FCA]">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                        </svg>
                                    </a>
                                    <a href="student?action=delete&id=<%= student[0] %>" class="text-[#ef4444] hover:text-[#dc2626]" onclick="return confirm('Are you sure you want to delete this student?')">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                        </svg>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5" class="px-6 py-4 text-center text-sm text-gray-500">No students found</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-white py-4 mt-8">
        <div class="container mx-auto px-4 text-center text-sm text-gray-500">
            &copy; 2024 Student Management System. All rights reserved.
        </div>
    </footer>
</body>
</html>
