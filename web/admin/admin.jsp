<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 15px;
                text-align: center;
            }

            main {
                display: flex;
                flex: 1;
            }

            nav {
                background-color: #555;
                color: #fff;
                padding: 10px;
                text-align: center;
                width: 20%;
                min-width: 200px;
                position: sticky;
                top: 0;
                height: 100vh;
            }

            nav a {
                color: #fff;
                text-decoration: none;
                padding: 10px;
                margin: 0 10px;
                display: block;
            }

            section {
                padding: 20px;
                flex: 1;
            }

            .card {
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin: 10px;
                border-radius: 5px;
            }

            footer {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 10px;
            }
        </style>
    </head>
    <body>

        <header>
            <h1>Admin Dashboard</h1>
        </header>

        <main>
            <nav>
                <a href="admin">Dashboard</a>
                <a href="userlist">Users</a>
                <a href="#">Products</a>
                <a href="#">Settings</a>
                <a href="home">Home</a>
            </nav>
            <section>
                <div class="card">
                    <h2>Welcome, Admin!</h2>
                    <p>This is your admin dashboard. Manage users, products, and settings from here.</p>
                </div>

                
            </section>
        </main>

        <footer>
            <p>&copy; 2024 Admin Dashboard. All rights reserved.</p>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>


