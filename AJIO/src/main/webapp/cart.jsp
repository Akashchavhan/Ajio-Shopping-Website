<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="servletfundamentals.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Your Cart</h1>

        <%
            String productId = request.getParameter("productId");
            String productName = request.getParameter("productName");
            String productCategory = request.getParameter("productCategory");
            String productPriceParam = request.getParameter("productPrice");
            double productPrice = 0.0;

            
            if (productPriceParam != null) {
                try {
                    productPrice = Double.parseDouble(productPriceParam);
                } catch (NumberFormatException e) {
                   
                }
            }

    
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

   
            if (productId != null) {
                boolean found = false;
                for (Product product : cart) {
                    if (product.getId().equals(productId)) {
                        product.increaseQuantity();
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    cart.add(new Product(productId, productName, productCategory, productPrice));
                }
            }

            String action = request.getParameter("action");
            if ("clear".equals(action)) {
                cart.clear();
                session.setAttribute("cart", cart);
            }
        %>

        <div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    double totalAmount = 0.0;
                    for (Product product : cart) {
                        String name = product.getName();
                        String category = product.getCategory();
                        double price = product.getPrice();
                        int quantity = product.getQuantity();
                        double total = price * quantity;
                        totalAmount += total;
                %>
                    <tr>
                        <td><%= name %></td>
                        <td><%= category %></td>
                        <td>₹<%= String.format("%.2f", price) %></td>
                        <td><%= quantity %></td>
                        <td>₹<%= String.format("%.2f", total) %></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <p class="font-weight-bold">Total Amount: ₹<%= String.format("%.2f", totalAmount) %></p>
        </div>
        <a href="Product_Men.jsp" class="btn btn-primary">Continue Shopping</a>
        <form method="get" action="">
            <input type="hidden" name="action" value="clear">
            <button type="submit" class="btn btn-danger" style="margin-left:15%;margin-top:-6%;">Clear Cart</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
