package com.serverfundamentals;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserLogin")
public class RequestDispatcherDemo extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String fname=request.getParameter("fname");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
		
		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","mclauren");
	        Statement stmt=con.createStatement();
	        String query="select * from user where email='"+email+"' and password='"+password+"'";
	        ResultSet rs=stmt.executeQuery(query);
		
		if(rs.next())
		{
			HttpSession session = request.getSession();
			session.setAttribute("isLoggedIn", true);
	        session.setAttribute("fname", rs.getString("fname"));
			RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		else {
//			out.println("<h2>Incorrect email or password<h2>");
			out.print("<div style='color: red; position: absolute;  top: 46.6%; left: 34.7%;font-size: 12px;'>Incorrect email or password</div>");
			RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
			rd.include(request, response);
		}
		con.close();
        } 
        catch (SQLException e1) {
		e1.printStackTrace();
		out.println(e1.getMessage());
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
