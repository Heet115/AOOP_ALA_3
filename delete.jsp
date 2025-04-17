<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
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
<body class="min-h-screen bg-background flex flex-col font-sans text-text-dark">
    <main class="container mx-auto px-4 py-8 flex-grow">
        <!-- Page Title -->
        <div class="mb-10 bg-white p-6 rounded-lg shadow-md border-l-4 border-danger">
            <div class="flex items-center">
                <div class="rounded-full w-12 h-12 flex items-center justify-center bg-danger/20 mr-4">
                    <svg class="w-7 h-7 text-danger" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-3xl font-bold text-text-dark">Delete Student</h2>
                    <p class="text-text-light max-w-2xl">Are you sure you want to delete this student record? This action cannot be undone.</p>
                </div>
            </div>
        </div>

        <!-- Delete Confirmation -->
        <div class="max-w-md mx-auto bg-white rounded-lg shadow-md p-8 border-t-4 border-danger">
            <div class="space-y-6">
                <div class="bg-danger/10 p-4 rounded-lg">
                    <div class="flex items-start">
                        <div class="flex-shrink-0">
                            <svg class="h-5 w-5 text-danger" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                            </svg>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-sm font-medium text-danger">Warning</h3>
                            <div class="mt-2 text-sm text-danger">
                                <p>This action will permanently delete the student record for:</p>
                                <p class="font-semibold mt-1">${student.name}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <form action="student" method="post" class="space-y-4">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${student.id}">
                    
                    <div class="flex gap-4">
                        <button type="submit" 
                                class="flex-1 inline-flex items-center justify-center px-4 py-2 bg-danger text-white font-semibold rounded-lg hover:bg-red-600 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-md">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                            </svg>
                            Delete Student
                        </button>
                        
                        <a href="index.jsp" 
                           class="flex-1 inline-flex items-center justify-center px-4 py-2 bg-gray-200 text-text-dark font-semibold rounded-lg hover:bg-gray-300 transition-all">
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-accent text-text-dark py-8 mt-auto border-t-4 border-secondary">
        <div class="container mx-auto px-4">
            <div class="flex flex-col md:flex-row justify-between items-center gap-4">
                <div class="flex items-center gap-3">
                    <svg class="w-6 h-6 text-text-dark" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                    <h2 class="text-lg font-bold text-text-dark">Student Management System</h2>
                </div>
                <div class="bg-text-dark px-5 py-3 rounded-lg">
                    <p class="text-white text-sm font-medium">Developed by: <span class="text-background font-bold">Viradiya Heet</span></p>
                    <p class="text-white/80 text-sm">Enrollment No: 20231105060523</p>
                </div>
            </div>
            <div class="border-t border-secondary mt-6 pt-6 text-center">
                <p class="text-text-dark text-sm font-bold">© 2023 Student Management System. All rights reserved.</p>
                <p class="mt-1 text-xs text-text-dark font-medium">College Project - WEB DEVELOPMENT</p>
            </div>
        </div>
    </footer>
</body>
</html>