<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>User Login</title>
    <link rel="stylesheet" href="Login.css">
</head>
<body>
    <div class="main">
        <div class="left-block">
            <form method="post" action="http://localhost:8080/AJIO/UserLogin">
               <h1>Sign In</h1>
               <p>EMAIL ADDRESS</p>
               <input type="email" name="email" id="email" required placeholder="Enter your email">
               <p>PASSWORD</p>
               <input type="password" name="password" id="password" required placeholder="Enter your password">
               <input type="submit" name="submit" value="Sign In" id="submit">
               <p>Forgot Password?</p>
            </form>
            <img src="./images/facebook.png" alt="facebook" id="facebook">
            <img src="./images/twitter.png" alt="twitter" id="twitter">
            <img src="./images/linkedin.png" alt="linkedin" id="linkedin">
            <img src="./images/social.png" alt="social" id="social">
        </div>
        <div class="right-block">
            <h1>New here?</h1>
            <p>Sign up and discover great amount <br> of new opportunities!</p>
            <p id="tag">By login</p>
            <p>Get great results! <br> upto 50% discount</p>
            <a href="./Register.jsp">Sign Up</a>
        </div>
    </div>
</body>
</html>