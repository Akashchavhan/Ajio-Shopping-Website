<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page session="true" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Men's Products</title>
</head>
<body>
    <%@ include file="./MensNavbar.jsp" %>
    <div class="container mt-4">
        <h1>Men's Products</h1>
        <div class="row">
            <%
                String dbURL = "jdbc:mysql://localhost:3306/mydb";
                String dbUser = "root";
                String dbPass = "mclauren";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM Product_Men";
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String category = rs.getString("category");
                        double price = rs.getDouble("price");
                        String image = rs.getString("image");
            %>
            
            <div class="col-md-4" style="margin-top:50px">
                <div class="card mb-4 shadow-sm">
                    <img src="<%= image %>" class="card-img-top" alt="<%= name %>" style="height: 320px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title"><%= name %></h5>
                        <p class="card-text"><%= category %></p>
                        <p class="card-text"><strong>Price: ₹<%= price %></strong></p>
                        <%
                       
                            Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
                            if (isLoggedIn != null && isLoggedIn) {
                        %>
                            <form action="cart.jsp" method="post">
                                <input type="hidden" name="productId" value="<%= id %>">
                                <input type="hidden" name="productName" value="<%= name %>">
                                <input type="hidden" name="productCategory" value="<%= category %>">
                                <input type="hidden" name="productPrice" value="<%= price %>">
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                            </form>
                        <%
                            } else {
                        %>
                            <button class="btn btn-secondary" disabled>Add to Cart (Log in to enable)</button>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
            <div class="alert alert-danger" role="alert">
                Error retrieving products. Please try again later.
            </div>
            <%
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException e) {}
                    try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
                    try { if (conn != null) conn.close(); } catch (SQLException e) {}
                }
            %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
