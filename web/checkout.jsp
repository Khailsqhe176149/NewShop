<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -16px;
}


.col-50 {
  flex: 50%;
}





.container {
  background-color: #f2f2f2;
  margin-left: 250px;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>

<h2> Checkout </h2>

<div class="row">
  <div class="col-75">
    <div class="container">
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th>ProductID</th>
            <th>ProductName</th>
            <th>img</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${cart.items}">
              <tr>
                <td>${item.product.getProductID()}</td>
                <td>${item.product.getProductName()}</td>
                <td><img src="${item.product.image}" width="50"></td>
                <td>${item.quantity}</td>
                <td>${item.price}</td>
                <td>${item.quantity * item.price}</td>
              </tr>
          </c:forEach>
        </tbody>
      </table>
      <p><b>Total Cart Value: </b>${cart.totalMoney}</p>

    </div>
  </div>

  <div class="col-25">
    <div class="container">
        <form action="checkout" method="post">
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <input type="hidden" name="UserID" value="${user.getUserID()}" placeholder="UserID"/>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" name="fullName" value="${user.getFullname()}" placeholder="Full Name"/>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" value="${user.getMail()}" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" value="${user.getAddress()}" placeholder="542 W. 15th Street">
            <label for="phone"><i class="fa fa-phone"></i> Phone</label>
            <input type="text" id="phone" name="phone" value="${user.getPhone()}" placeholder="Phone number">
        
          </div>
        </div>
        <input type="submit" value="Submit" class="btn">
      </form>
    </div>
  </div>
</div>

</body>
</html>



