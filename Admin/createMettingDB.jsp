<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	<%@page import="com.oreilly.servlet.MultipartRequest" %>
	
 
 <%         
 //try {
 	//MultipartRequest m = new MultipartRequest(request,"D:\\workspace\\MentorManagement\\WebContent\\Admin\\mentorPhotos\\",1048*1048*1048);
 	String meetingTitle = request.getParameter("meetingTitle");
    String meetingDate = request.getParameter("meetingDate");
 	String meetingTime = request.getParameter("meetingTime");
 	
 	String meetingDuration = request.getParameter("meetingDuration");
 	String platform = request.getParameter("platform");
 	String platformLink = request.getParameter("platformLink");
 	String branch = request.getParameter("branch");
 	String notes = request.getParameter("notes");
 	String mentorMeetStatus = request.getParameter("mentorMeetStatus");
 	
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into mentorMetting(meetingTitle, meetingDate, meetingTime, meetingDuration, platform, platformLink, branch, notes, status)values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, meetingTitle);
	 ps.setString(2, meetingDate);
	 ps.setString(3, meetingTime);
	 ps.setString(4, meetingDuration);
	 ps.setString(5, platform);
	 ps.setString(6, platformLink);
	 ps.setString(7, branch);
	 ps.setString(8, notes);
	 ps.setString(9, mentorMeetStatus);
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Metting Added !");
    location.href="createMetting.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="createMetting.jsp";
  </script>
  <%
  }
  		con.close();
         /* } catch (Exception e) {
           response.sendRedirect("../login.jsp");
         } */
         %>