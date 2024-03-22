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
        </nav>
        <section>
            <div class="card">
                <h2>Welcome, Admin!</h2>
                <p>This is your admin dashboard. Manage users, products, and settings from here.</p>
            </div>

            <div class="card">
                <h2>Recent Activities</h2>
                <!-- Search Form -->
<form action="SearchByRole" method="get">    
    <select name="role" onchange="this.form.submit();">
         <option value="5" >Search by Role</option>
        <option value="0" >All Role</option>
        <option value="1" >Role 1</option>
        <option value="2" >Role 2</option>
        <option value="3" >Role 3</option>
        <option value="4" >Role 4</option>
    </select>
</form>
    <form action="SearchByGender" method="get">
    <select name="gender" onchange="this.form.submit();">
        <option value="">Search by Gender</option>
        <option value="2">All Gender</option>
        <option value="1">Male</option>
        <option value="0">Female</option>
    </select>
</form>

</form>
    <form action="SearchByStatus" method="get">
    <select name="status" onchange="this.form.submit();">
        <option value="">Search by Status</option>
        <option value="2">All Status</option>
        <option value="1">Active</option>
        <option value="0">Inactive</option>
    </select>
</form>
<form action="Search" method="get">
    <input type="text" name="searchQuery" placeholder="Search by Name, Email, or Mobile">
    <input type="submit" value="Search">
</form>



<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Role</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                  <td><a href="UserDetail?userID=${user.userID}">${user.userID}</a></td>
                <td>${user.fullname}</td>
                <td>${user.gender ? 'Male' : 'Female'}</td>
                <td>${user.mail}</td>
                <td>${user.phone}</td>
                <td>
                    <select onchange="location.href='ChangeRole?userID=${user.userID}&role='+this.value;">
                        <option value="1" ${user.roleID == 1 ? 'selected' : ''}>Role 1</option>
                        <option value="2" ${user.roleID == 2 ? 'selected' : ''}>Role 2</option>
                        <option value="3" ${user.roleID == 3 ? 'selected' : ''}>Role 3</option>
                        <option value="4" ${user.roleID == 4 ? 'selected' : ''}>Role 4</option>
                    </select>
                </td>
                <td>
                    <select onchange="location.href='ChangeStatus?userID=${user.userID}&status='+this.value;">
                        <option value="1" ${user.userStatus ? 'selected' : ''}>Active</option>
                        <option value="0" ${!user.userStatus ? 'selected' : ''}>Inactive</option>
                    </select>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
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


