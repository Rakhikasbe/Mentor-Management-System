<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest" %>
	
 
 <%
 try{
 	MultipartRequest m = new MultipartRequest(request,"C:\\Users\\user\\workspace\\MentorManagement\\WebContent\\Student\\studentPhotos\\",1048*1048*1048);
 	String title = m.getParameter("title");
 	String desc = m.getParameter("desc");
 	String size = m.getParameter("size");
 	String skills = m.getParameter("skills");
 	String year = m.getParameter("year");
 	String semester2 = m.getParameter("semester2");
 	String sgpa2 = m.getParameter("sgpa2");
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into projectdetails(projectTitle, projectDesc, teamSize, projectSkills, projectYear, studentId)values(?, ?, ?, ?, ?, ?)";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, title);
	 ps.setString(2, desc);
	 ps.setString(3, size);
	 ps.setString(4, skills);
	 ps.setString(5, year);
	 ps.setString(6, session.getAttribute("studId").toString());
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Successfully Added Records..");
    location.href="project.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="project.jsp";
  </script>
  <%}
 }catch(Exception e){
	 e.printStackTrace();
	 response.sendRedirect("../login.jsp");
 }
  %>