<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest" %>
	
 
 <%
 	MultipartRequest m = new MultipartRequest(request,"C:\\Users\\user\\workspace\\MentorManagement\\WebContent\\Student\\studentPhotos\\",1048*1048*1048);
 	String rdate = m.getParameter("rdate");
    String name = m.getParameter("name");
 	String dob = m.getParameter("dob");
 	String studentMobile = m.getParameter("studentMobile");
 	String Caddress = m.getParameter("Caddress");
 	String Paddress = m.getParameter("Paddress");
 	String guardianMobile = m.getParameter("guardianMobile");
 	String hobbies = m.getParameter("hobbies");
 	String photo = "studentPhotos/"+m.getFilesystemName("photo");
 	String gender = m.getParameter("gender");
 	String branch = m.getParameter("branch");
 	String year = m.getParameter("year");
 	String email = m.getParameter("email");
 	String password = m.getParameter("password");
 	String cpassword = m.getParameter("cpassword");
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into studentRegister(rdate, name, dob, studentMobile, Caddress, Paddress, guardianMobile, hobbies, photo, gender, branch, year, email, password, cpassword, mentorId)values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Not Assigned')";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, rdate);
	 ps.setString(2, name);
	 ps.setString(3, dob);
	 ps.setString(4, studentMobile);
	 ps.setString(5, Caddress);
	 ps.setString(6, Paddress);
	 ps.setString(7, guardianMobile);
	 ps.setString(8, hobbies);
	 ps.setString(9, photo);
	 ps.setString(10, gender);
	 ps.setString(11, branch);
	 ps.setString(12, year);
	 ps.setString(13, email);
	 ps.setString(14, password);
	 ps.setString(15, cpassword);
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Successfully Register ! Login now..");
    location.href="login.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="register.jsp";
  </script>
  <%}%>