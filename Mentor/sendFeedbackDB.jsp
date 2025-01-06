<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	<%@page import="java.sql.*" %>
	\
	
 
 <%   
 try {
 	
 	String feedbackType = request.getParameter("feedbackType");
 	String message = request.getParameter("message");
 	String feedbackDate = request.getParameter("rdate");         
 	
 
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 
	 String sql = "insert into mentorfeedback(feedbackType, message, feedbackDate, mentorId)values(?, ?, ?, ?)";
	 PreparedStatement ps = con.prepareStatement(sql);
	 ps.setString(1, feedbackType);
	 ps.setString(2, message);
	 ps.setString(3, feedbackDate);
	 ps.setString(4, session.getAttribute("mentorId").toString());
	 int done = ps.executeUpdate();
	 if(done>0){
  %>
  <script>
    alert("Feedback Added !");
    location.href="sendFeedback.jsp";
  </script>
  <%}else{ %>
   <script>
    alert("Failed Try Again !!");
    location.href="sendFeedback.jsp";
  </script>
  <%}
  		con.close();
         } catch (Exception e) {
             response.sendRedirect("../login.jsp");
         }%>