<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	
	
 
 <%
 try{
 	
 	String queryDate = request.getParameter("queryDate");
 	String subject = request.getParameter("subject");
 	String description = request.getParameter("description");
 	
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into querys(queryDate, subject, description, studentId, mentorId, response)values(?, ?, ?, ?, ?, '')";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, queryDate);
	 ps.setString(2, subject);
	 ps.setString(3, description);
	 ps.setString(4, session.getAttribute("studId").toString());
	 ps.setString(5, session.getAttribute("mentorIDD").toString());
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Sent Query..");
    location.href="addQuerys.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="addQuerys.jsp";
  </script>
  <%}
 }catch(Exception e){
	 e.printStackTrace();
	 response.sendRedirect("../login.jsp");
 }
  %>