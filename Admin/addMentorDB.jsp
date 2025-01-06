<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest" %>
	
 
 <%   
 try {
 	MultipartRequest m = new MultipartRequest(request,"C:\\Users\\user\\workspace\\MentorManagement\\WebContent\\Admin\\mentorPhotos\\",1048*1048*1048);
 	String fullName = m.getParameter("fullName");
    String gender = m.getParameter("gender");
 	String dob = m.getParameter("dob");
 	String photo = "mentorPhotos/"+m.getFilesystemName("photo");
 	String contactNumber = m.getParameter("contactNumber");
 	String email = m.getParameter("email");
 	String address = m.getParameter("address");
 	String mentorId = m.getParameter("mentorId");
 	String branch = m.getParameter("branch");
 	         
 	String designation = m.getParameter("designation");
 	String specialization = m.getParameter("specialization");
 	String qualifications = m.getParameter("qualifications");
 	String experience = m.getParameter("experience");
 	String skills = m.getParameter("skills");
 	String highestDegree = m.getParameter("highestDegree");
 	String institution = m.getParameter("institution");
 	String graduationYear = m.getParameter("graduationYear");
 	String password = m.getParameter("password");
 	String mentorStatus = m.getParameter("mentorStatus");
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into mentor_list(fullName, gender, dob, photo, contactNumber, email, address, mentor_Id, branch, designation, specialization, qualifications, experience, skills, highestDegree, institution, graduationYear, password, mentorStatus)values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, fullName);
	 ps.setString(2, gender);
	 ps.setString(3, dob);
	 ps.setString(4, photo);
	 ps.setString(5, contactNumber);
	 ps.setString(6, email);
	 ps.setString(7, address);
	 ps.setString(8, mentorId);
	 ps.setString(9, branch);
	 ps.setString(10, designation);
	 ps.setString(11, specialization);
	 ps.setString(12, qualifications);
	 ps.setString(13, experience);
	 ps.setString(14, skills);
	 ps.setString(15, highestDegree);
	 ps.setString(16, institution);
	 ps.setString(17, graduationYear);
	 ps.setString(18, password);
	 ps.setString(19, mentorStatus);
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Mentor Added !");
    location.href="addMentor.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="addMentor.jsp";
  </script>
  <%}
  		con.close();
         } catch (Exception e) {
             response.sendRedirect("../login.jsp");
         }%>