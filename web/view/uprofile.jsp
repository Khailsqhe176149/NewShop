<%-- 
    Document   : uprofile
    Created on : Jan 10, 2024, 9:25:01 AM
    Author     : THINKPAD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <link rel="stylesheet" href="view/style.css">
    </head>
    <body>        
        <h1>User Profile</h1>
         <!--        thong bao success-->
        <%
            if (request.getAttribute("success") != null) {
        %>
        <div class="alert alert-success">
            <strong>Success:</strong> <%= request.getAttribute("success") %>
        </div>
        <%
            }
        %>
        <form method="post" action = "uprofile" enctype="multipart/form-data">
            <div style="display:flex">
                <div>
                    <label for ="mail"> Mail </label><br>
                    <input type="text" name ="mail" value="${sessionScope.account.mail}" readonly>   <br>
                    <label for = "uname">User name*</label><br>
                    <input id="uname" type="text" name="uname" required>
                    <br><br>

                    <label for="address">Address*</label><div></div>
                    <input id="address" type="text" name="address" required>
                    <br><br>

                    <label for="mobile">Mobile*</label><div></div>
                    <input id="mobile" type="number" name="mobile" required>
                    <br><br>                  

                    <input type="submit"  value="Submit" />
                </div>
                <div class="rightcontainerPro5">
                    <div class="rightPro5">
                        <div>
                            <img id="image-preview" alt="Image Preview"
                                 style="border-radius: 50%; object-fit: cover; width: 70px; height: 70px;">
                        </div>
                        <div>
                            <br>
                            <input type="file" id="image-upload" name="image-upload">

                            <div>Dung lượng file tối đo 1 MB</div>
                            <div>Định dạng: .JPEG, .PNG</div>
                        </div>
                    </div>
                </div>

            </div>
        </form>
        <footer></footer>
        <script src="view/main.js"></script>
    </body>

</html>
