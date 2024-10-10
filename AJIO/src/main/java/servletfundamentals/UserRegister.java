package servletfundamentals;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out=response.getWriter();
     
	    String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String city=request.getParameter("city");
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","mclauren");
		PreparedStatement stmt=con.prepareStatement("insert into user values(?,?,?,?,?,?)");
        stmt.setString(1,fname);
        stmt.setString(2,lname);
        stmt.setString(3,email);
        stmt.setString(4,city);
        stmt.setString(5,address);
        stmt.setString(6,password);
        
		int rs=stmt.executeUpdate();
		
		if(rs!=0) {
			out.println("<h1>Successfully Registered!<h1>");
		}
		else {
			out.println("<h1>Already Registered!<h1>");
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

