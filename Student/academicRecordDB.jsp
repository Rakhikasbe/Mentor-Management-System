<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest" %>
	
 
 <%
 try{
 	MultipartRequest m = new MultipartRequest(request,"C:\\Users\\user\\workspace\\MentorManagement\\WebContent\\Student\\studentPhotos\\",1048*1048*1048);
 	String academicUpdateDate = m.getParameter("academicUpdateDate");
 	String branch = m.getParameter("branch");
 	String year = m.getParameter("year");
 	String semester1 = m.getParameter("semester1");
 	String sgpa1 = m.getParameter("sgpa1");
 	String semester2 = m.getParameter("semester2");
 	String sgpa2 = m.getParameter("sgpa2");
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into academicrecords(uploadedDate, branch, year, semister1, sgpa1, semister2, sgpa2, studentId)values(?, ?, ?, ?, ?, ?, ?, ?)";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, academicUpdateDate);
	 ps.setString(2, branch);
	 ps.setString(3, year);
	 ps.setString(4, semester1);
	 ps.setString(5, sgpa1);
	 ps.setString(6, semester2);
	 ps.setString(7, sgpa2);
	 ps.setString(8, session.getAttribute("studId").toString());
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Successfully Added Records..");
    location.href="academicRecord.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="academicRecord.jsp";
  </script>
  <%}
 }catch(Exception e){
	 e.printStackTrace();
	 response.sendRedirect("../login.jsp");
 }
  %>