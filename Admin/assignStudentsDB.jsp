<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" %>
	
	<%
	//try{
	 String values = request.getParameter("values");
     String mentorId = request.getParameter("MentorId");
     String branch = request.getParameter("branch");
     String className = request.getParameter("class");
    	int done = 0;
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	
	 String sql = "UPDATE studentregister SET mentorId = ? WHERE studentId = ?";
	 PreparedStatement ps = con.prepareStatement(sql);
	
	 
    String[] studentIds = values.split(","); 
    
    for (String studId : studentIds) {
    	ps.setString(1, mentorId);
    	ps.setString(2, studId);
    	done = ps.executeUpdate();
    }
    if(done>0){
    	  %>
    	  <script>
    	    alert("Successfully Assigned to Mentor !");
    	    location.href = "studentList.jsp?i=" + "<%=branch%>" + "&&class=" + encodeURIComponent("<%=className%>");
    	  </script>
    	  <%}else{ %>
    	   <script>
    	    alert("Failed Try Again !!");
    	    location.href = "studentList.jsp?i=" + "<%=branch%>" + "&&class=" + encodeURIComponent("<%=className%>");
    	  </script>
    	  <%
    	  }
    	  		con.close();
    	         //} catch (Exception e) {
    	           //response.sendRedirect("../login.jsp");
    	         //}
    	         %>