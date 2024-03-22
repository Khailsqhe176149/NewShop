<%-- 
    Document   : blog
    Created on : Feb 17, 2024, 9:32:16 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style_1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1><i>Posts</i></h1>
            </div>
            <div class="menu">
                <a href="home"><b>Home</b></a>
            </div>
            <div class="main">
                <div class="left">
                    <div id="messageDiv" class="message">
                        ${message};
                    </div>
                    <c:forEach var="b" items="${list}">
                        <div class="title">
                            <h2><a href="blogdetail?id=${b.id}">${b.title}</a></h2>
                        </div>
                        <div class="image">
                            <img src="${b.imageUrl}" alt="Cac" class="logo"/>
                        </div>
                        <div class="description">
                            ${b.shortDescription}
                        </div>


                        <div class="actions">
                            <!-- Nút Hide -->
                            <button class="btn hide-btn" onclick="#">Hide</button>
                            <!-- Nút Edit -->
                            <a href="postedit?id=${b.id}" class="btn">Edit</a>
                            <!-- Nút Delete -->
                            <a href="postdelete?id=${b.id}" class="btn">Delete</a>
                        </div>
                    </c:forEach>
                    <div class="pagination">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <a id="${i}" href="blogsearch?index=${i}&searchTerm=${searchTerm}">${i}</a>
                        </c:forEach>
                    </div>
                    <script>
                        function showMessage(messageId) {
                            var messageDiv = document.getElementById(messageId);
                            messageDiv.style.display = "block";
                            setTimeout(function () {
                                messageDiv.style.display = "none";
                            }, 3000);
                        }
                        window.onload = function () {
                            showMessage('messageDiv');
                        };
                    </script>
                </div>
                <div class="right">
                    <form action="postsearch?index=1" method="post">
                        <label for="searchTerm">Search here:</label>
                        <input type="text" id="searchTerm" name="searchTerm" value="${searchTerm}" required>
                        <input type="submit" value="&#128269;">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
