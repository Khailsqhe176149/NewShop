<%-- 
    Document   : customerList
    Created on : Feb 24, 2024, 1:06:22 AM
    Author     : THINKPAD
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
        <link href="css/style.css" rel="stylesheet">
        <style>
            .pagnination{
                display: inline-block;
            }
            .pagnination a{
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagnination a.active{
                background-color: #4caf50;
                color: white;
            }
            .pagnination a:hover:not(.active){
                background-color: chocolate;
            }
            .error-message {
                color: green;
                font-weight: bold;
                margin-bottom: 1
            }
            /* Reset style trình duyệt */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Cấu trúc trang */
            .container {
                width: 800px;
                margin: 0 auto;
            }

            /* Thông báo lỗi */
            .error-message {
                color: red;
                font-weight: bold;
                margin-bottom: 10px;
            }

            /* Tiêu đề trang */
            h1 {
                text-align: center;
                font-size: 24px;
                margin-bottom: 20px;
            }

            /* Form tìm kiếm */
            .search-form {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            .search-form label {
                margin-right: 10px;
                font-weight: bold;
            }

            .search-form select,
            .search-form input {
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .search-form input {
                width: 200px;
            }

            /* Nhóm nút */
            .button-group {
                margin-top: 10px;
            }

            .button-group button {
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-right: 10px;
                cursor: pointer;
            }

            .button-group .search-btn {
                background-color: #007bff;
                color: #fff;
            }

            .button-group .reset-btn {
                background-color: #ccc;
            }

            /* Bảng khách hàng */
            .customer-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .customer-table th,
            .customer-table td {
                border: 1px solid #ccc;
                padding: 5px;
                text-align: center;
            }

            .customer-table th {
                font-weight: bold;
            }

            /* Link sửa */
            .edit-link {
                color: #007bff;
                text-decoration: none;
            }

            /* Media queries (đáp ứng màn hình nhỏ) */
            @media only screen and (max-width: 768px) {
                .container {
                    width: 100%;
                }

                .search-form {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-2">
                        <div class="logo"><a href="home"><img src="images/logo.png" alt="FlatShop"></a></div>
                    </div>
                    <div class="col-md-10 col-sm-10">
                        <div class="header_top">
                            <div class="row">
                                <div class="col-md-4">
                                    <ul class="option_nav">
                                        <li class="dorpdown">
                                            <a href="#">Eng</a>
                                            <ul class="subnav">
                                                <li><a href="#">Eng</a></li>
                                                <li><a href="#">Vns</a></li>
                                                <li><a href="#">Fer</a></li>
                                                <li><a href="#">Gem</a></li>
                                            </ul>
                                        </li>
                                        <li class="dorpdown">
                                            <a href="#">USD</a>
                                            <ul class="subnav">
                                                <li><a href="#">USD</a></li>
                                                <li><a href="#">UKD</a></li>
                                                <li><a href="#">FER</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-sm-8">
                                    <div class="pull-right" style="margin-top: 3%;">
                                        <ul class="nav navbar-nav">
                                            <li><a href="checkout"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                            <li><a href="carts"><i class="fa fa-shopping-cart"></i> Cart</a></li>

                                            <c:choose>
                                                <c:when test="${empty sessionScope.user}">
                                                    <li><a href="login" class="active"><i class="fa fa-lock"></i> Login</a></li>
                                                    </c:when>

                                                <c:when test="${sessionScope.user.roleID == 1}">
                                                    <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}<i class="fa fa-angle-down"></i></a>
                                                        <ul role="menu" class="sub-menu task-bar">
                                                            <li><a href="uprofile">My Profile</a></li>
                                                            <li><a href="#">My Order</a></li> 
                                                            <li><a href="#">My Feedback</a></li> 
                                                            <li><a href="changepass">Change Password</a></li> 
                                                            <li><a href="logout">Log out</a></li> 
                                                        </ul>
                                                    </li> 
                                                </c:when>

                                                <c:when test="${sessionScope.user.roleID eq 2}">
                                                    <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}<i class="fa fa-angle-down"></i></a>
                                                        <ul role="menu" class="sub-menu task-bar">
                                                            <li><a href="uprofile">My Profile</a></li>
                                                            <li><a href="#">My Order</a></li> 
                                                            <li><a href="adminDashboard">Setting</a></li> 
                                                            <li><a href="changepass">Change Password</a></li> 
                                                            <li><a href="logout">Log out</a></li> 
                                                        </ul>
                                                    </li>
                                                </c:when>


                                                <c:when test="${sessionScope.user.roleID eq 3}">
                                                    <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}<i class="fa fa-angle-down"></i></a>
                                                        <ul role="menu" class="sub-menu task-bar">
                                                            <li><a href="#">MKT Dashboard</a></li>
                                                            <li><a href="postlist">Post Manager</a></li>
                                                            <li><a href="postdetail">Post detail</a></li>
                                                            <li><a href="SliderList">Slider List</a></li>
                                                            <li><a href="CustomerList">Customer List</a></li>
                                                            <li><a href="changepass">Change Password</a></li> 
                                                            <li><a href="logout">Log out</a></li> 
                                                        </ul>
                                                    </li>
                                                </c:when>

                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="header_bottom">
                            
                            <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="home">Home</a></li>
                                    <li><a href="shop">Shop</a></li>
                                    <li><a href="shop?gender=1">Men</a></li>
                                    <li><a href="shop?gender=0">Women</a></li>
                                    <li><a href="blog">Blog</a></li>
                                    <li><a href="contact.html">Contact us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 3%">
        <c:if  test = "${!empty requestScope.noticeUpdate }">
            <p class="error-message">${requestScope.noticeUpdate}</p>
        </c:if>
        <h1>Customer List</h1>
        <form class = "search-form" action="CustomerList" method="POST">
            <label for="statusSearch">Search by status</label>
            <select name="statusSearch" id="statusSearch">
                <option value="">Normal Search</option>      
                <option value="1">Search Active User</option>
                <option value="0">Search Non-active User</option>                              
            </select>
            Full Name: <input type="text" name="Fullname" value="" /><br>
            Email: <input type="text" name="Email" value="" /><br>
            Phone: <input type="text" name="Phone" value="" /><br>
            <input class="button-group" type="submit" name="action" value="Search" />
            <input class="button-group" type="submit" name="action" value="Reset" />
        </form>
        <table class="customer-table" border ="1px">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Mail</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Do sth</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.listUserPaging}" var="i">
                    <tr>                    
                        <td>${i.getUserID()}</td>
                        <td>${i.getFullname()}</td>
                        <td>                            
                            <c:if test="${i.isGender() eq true}">
                                <p>Female</p>
                            </c:if> 
                            <c:if test="${i.isGender() ne true}">
                                <p> Male</p>
                            </c:if> 
                        </td>                        
                        <td>${i.getMail()}</td>                        
                        <td>${i.getPhone()}</td>
                        <td>                           
                            <c:if test="${i.isUserStatus() eq true}">
                                <p>Active</p>
                            </c:if> 
                            <c:if test="${i.isUserStatus() ne true}">
                                <p>Non-Active</p>
                            </c:if> 
                        </td>
                        <td><a  class="edit-link" href="EditCustomer?CusID=${i.getUserID()}">Edit</a></td>                
                    </tr>                
                </c:forEach>
            </tbody>
        </table>
        <c:set var="page" value="${requestScope.pageChosing}"/>
        <div class="pagnination">
            <c:forEach begin="${1}" end ="${requestScope.numPage}" var="i">
                <a class="${i==page?"active":""}" href="CustomerList?page=${i}">${i}</a>
            </c:forEach>
        </div>
        </div>
        <div class="clearfix"></div>
        <div class="footer"  style="margin-top: 5%">
            <div class="footer-info">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="footer-logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <h4 class="title">Contact <strong>Info</strong></h4>
                            <p>FPTU, Hoa Lac, Hanoi , Vietnam</p>
                            <p>Call Us : (084) 1900 1008</p>
                            <p>Email : bachnhhe173308@fpt.edu.vn</p>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <h4 class="title">Customer<strong> Support</strong></h4>
                            <ul class="support">
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">Payment Option</a></li>
                                <li><a href="#">Booking Tips</a></li>
                                <li><a href="#">Infomation</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <h4 class="title">Get Our <strong>Newsletter </strong></h4>
                            <p>Lorem ipsum dolor ipsum dolor.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-info">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <p>Copyright © 2012. Designed by <a href="#">B</a>. All rights reseved</p>
                        </div>
                        <div class="col-md-6">
                            <ul class="social-icon">
                                <li><a href="#" class="linkedin"></a></li>
                                <li><a href="#" class="google-plus"></a></li>
                                <li><a href="#" class="twitter"></a></li>
                                <li><a href="#" class="facebook"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
