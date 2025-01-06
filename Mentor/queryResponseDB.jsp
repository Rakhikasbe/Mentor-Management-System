<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	
	
 
 <%
 try{
 	
 	String queryId = request.getParameter("queryId");
 	String queryResponse = request.getParameter("response");
 	
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "update querys set response=? where queryId = ?";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, queryResponse);
	 ps.setString(2, queryId);
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Sent Response..");
    location.href="studentQueries.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="studentQueries.jsp";
  </script>
  <%}
 }catch(Exception e){
	 e.printStackTrace();
	 response.sendRedirect("../login.jsp");
 }
  %>