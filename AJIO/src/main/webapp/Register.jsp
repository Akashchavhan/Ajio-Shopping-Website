<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>User Registration</title>
<link rel="stylesheet" href="Register.css">
</head>
<body>
<div class="parent">
   <div class="left_block">
      <img src="./images/adobe.png" alt="logo" id="logo">
      <h3>.Adobe</h3>
     <p>We are glad to see you again!</p>
     <h1>Join our next negotiation <br> group in few minutes!</h1>
     <button onclick="location.href='./Login.jsp'">Apply Now!</button>
   </div>
   <div class="right_block">
      <form method="post" action="http://localhost:8080/AJIO/UserRegister">
         <h1>Registration</h1>
         <p>First Name</p>
         <input type="text" placeholder="Enter your first name" required name="fname" id="fname">
         <p>Email</p>
         <input type="text" placeholder="Enter your email" required name="email" id="email">
         <p>City</p>
         <input type="text" placeholder="Enter your city" required name="city" id="city">
         <p>Address</p>
         <input type="text" placeholder="Enter your address" required name="address" id="address">
         <p>Last Name</p>
         <input type="text" placeholder="Enter your last name" required name="lname" id="lname">
         <p>Password</p>
         <input type="password" placeholder="Enter your current password" required name="password" id="password">
         <input type="submit" value="Register" name="submit" id="submit">
      </form>
   </div>
</div>
</body>
</html>