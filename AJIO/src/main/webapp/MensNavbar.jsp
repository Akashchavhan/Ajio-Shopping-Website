<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.serverfundamentals.*" %>
<%@ page import="servletfundamentals.Product" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajio Website</title>
    <link rel="stylesheet" href="./MensNavbar.css">
</head>
<body>
    <div class="navbar">
        <img src="./images/AJIO.png" alt="ajio" id="logo" onclick="location.href='./index.jsp'">
        <div class="list">
            <li onclick="location.href='./Product_Men.jsp'">MEN</li>
            <li>WOMEN</li>
            <li>KIDS</li>
            <li>BEAUTY</li>
            <li>HOME AND KITCHEN</li>
        </div>
        <div class="search-box">
            <input type="text" placeholder="Search AJIO" id="search">
            <img src="./images/search.png" alt="search-icon" id="search-icon">
            <img src="./images/wishlistIcon.svg" alt="wishlist" id="wishlist">
            <img src="./images/favpng_shopping-icon-shopping-bag-icon-bag-icon.png" 
                 alt="shopping" id="shopping" 
                 onclick="checkCart()">
        </div>
        <div class="top-nav">
            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
            %>
            <%
                String fname = (String) session.getAttribute("fname");
                if (fname != null) {
            %>
                <span style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 13.5px;margin-right: 7px;margin-bottom: 43px;position: relative;">Welcome, </span>
                <span style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 13.5px;margin-right: 12px;margin-bottom: 43px;position: relative;"><%= fname %></span>
                <a href="./Logout" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 13.5px;margin-right: 10px;margin-bottom:4px;position: relative;color:aliceblue;background-color: black;border: 1px solid transparent;width:355px;height:48px;padding-left:18.5px;padding-top:11.6px">Logout</a>
            <%
                } else {
            %>
                <p style="margin-bottom:18px;"><a href="./Login.jsp">Sign In / Join AJIO</a></p>
            <%
                }
            %>
            <p style="margin-bottom:18px">Customer Care</p>
            <p style="margin-bottom:18px">Visit AJIOLUXE</p>
        </div>
    </div>

    <script>
    function checkCart() {
        var cartSize = <%= (session.getAttribute("cart") != null) ? ((List<Product>)session.getAttribute("cart")).size() : 0 %>;

        if (cartSize > 0) {
            window.location.href = "cart.jsp"; // Redirect to cart
        } else {
            alert("Your cart is empty.");
            window.location.href = "index.jsp"; // Redirect to homepage
        }
    }
</script>
</body>
</html>
