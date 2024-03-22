<%-- 
    Document   : blogDetail
    Created on : Feb 18, 2024, 4:21:10 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1><i>Blogs</i></h1>
            </div>
            <div class="menu">
                <a href="home"><b>Home</b></a></br>
                <a href="#"><b>Blog List</b></a>
            </div>
            <div class="main">
                <div class="left">
                    <div class="title">
                        <h2>${detail.title}</h2><br>
                    </div>
                    <div class="image">
                        <img src="${detail.imageUrl}" alt="Cac" class="logo"/><br>
                    </div>
                    <div class="content">
                        ${detail.content}<br>
                        Author: ${detail.author}<br>
                        Time post: ${detail.timePost}<br>
                    </div>
                </div>
                <div class="right">
                    <form action="blogsearch?index=1" method="post">
                        <label for="searchTerm">Search here:</label>
                        <input type="text" id="searchTerm" name="searchTerm" value="${searchTerm}" required>
                        <input type="submit" value="&#128269;">
                    </form>
                </div>
            </div>
            <div class="footer">
                @FIFA since 2018
            </div>
        </div>
    </body>
</html>
