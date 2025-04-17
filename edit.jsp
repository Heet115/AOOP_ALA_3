<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String[] student = (String[]) request.getAttribute("student");
    if (student == null) {
        response.sendRedirect("student");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
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
</head>
<body class="min-h-screen bg-[#FFF1D5] flex flex-col font-sans text-[#2B4C7E]">
    <main class="container mx-auto px-4 py-8 flex-grow">
        <!-- Page Title -->
        <div class="mb-10 bg-white p-6 rounded-lg shadow-md border-l-4 border-[#9FB3DF]">
            <div class="flex items-center">
                <div class="rounded-full w-12 h-12 flex items-center justify-center bg-[#9FB3DF]/20 mr-4">
                    <svg class="w-7 h-7 text-[#9FB3DF]" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-3xl font-bold text-[#2B4C7E]">Edit Student</h2>
                    <p class="text-[#445566] max-w-2xl">Update the student information below.</p>
                </div>
            </div>
        </div>

        <!-- Edit Student Form -->
        <div class="max-w-md mx-auto bg-white rounded-lg shadow-md p-8 border-t-4 border-[#9FB3DF]">
            <form action="student" method="post" class="space-y-6">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= student[0] %>">
                
                <div class="space-y-2">
                    <label for="name" class="block text-sm font-medium text-[#2B4C7E]">Name *</label>
                    <input type="text" id="name" name="name" value="<%= student[1] %>" required 
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-[#9FB3DF] focus:ring-2 focus:ring-[#9FB3DF]/30">
                </div>
                
                <div class="space-y-2">
                    <label for="email" class="block text-sm font-medium text-[#2B4C7E]">Email *</label>
                    <input type="email" id="email" name="email" value="<%= student[2] %>" required 
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-[#9FB3DF] focus:ring-2 focus:ring-[#9FB3DF]/30">
                </div>
                
                <div class="space-y-2">
                    <label for="phone" class="block text-sm font-medium text-[#2B4C7E]">Phone *</label>
                    <input type="tel" id="phone" name="phone" value="<%= student[3] %>" required 
                           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-[#9FB3DF] focus:ring-2 focus:ring-[#9FB3DF]/30">
                </div>
                
                <div class="flex gap-4">
                    <button type="submit" 
                            class="flex-1 inline-flex items-center justify-center px-4 py-2 bg-[#9FB3DF] text-white font-semibold rounded-lg hover:bg-[#8A9FCA] transition-all duration-200 hover:-translate-y-0.5 hover:shadow-md">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                        </svg>
                        Update Student
                    </button>
                    
                    <a href="student" 
                       class="flex-1 inline-flex items-center justify-center px-4 py-2 bg-gray-200 text-[#2B4C7E] font-semibold rounded-lg hover:bg-gray-300 transition-all">
                        Cancel
                    </a>
                </div>
            </form>
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