<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Detail</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>User Details</h2>
            <div class="row">
                <div class="col-md-4">
                    <img src="uploads/${user.avatar}?timestamp=${System.currentTimeMillis()}" alt="User Avatar" class="img-thumbnail">
                </div>
                <div class="col-md-8">
                    <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data" class="mb-3">
                        <input type="hidden" name="userID" value="${user.userID}">
                        <div class="form-group">
                            <label for="avatar">Select image to upload:</label>
                            <input type="file" name="img" id="avatar" class="form-control-file">
                        </div>
                        <input type="submit" value="Upload Image" name="submit" class="btn btn-primary">
                    </form>
                    <form action="UpdateUser" method="post">
                        <!-- User detail fields -->
                        <input type="hidden" name="userID" value="${user.userID}">
                        <!-- Use form-group for each input for better spacing and alignment -->
                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text" name="fullname" value="${user.fullname}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <p class="form-control-plaintext">${user.mail}</p>
                        </div>
                        <div class="form-group">
                            <label>Phone:</label>
                            <input type="text" name="phone" value="${user.phone}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" name="address" value="${user.address}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Gender:</label>
                            <div>
                                <input type="radio" name="gender" value="1" ${user.gender ? 'checked' : ''}> Male
                                <input type="radio" name="gender" value="0" ${!user.gender ? 'checked' : ''}> Female
                            </div>
                        </div>
                        <!-- Additional fields -->
                        <input type="submit" value="Update User" class="btn btn-success">
                    </form>
                </div>
            </div>
        </div>
        <!-- Include Bootstrap JS and its dependencies below, if you plan to use any Bootstrap JS components -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
