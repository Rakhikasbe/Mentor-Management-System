<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" %>
	<%@ page import="org.json.*" %>
	<%
	try{

	String payload = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
	 JSONObject jsonPayload = new JSONObject(payload);
     JSONArray students = jsonPayload.getJSONArray("students");
     String mentorId = String.valueOf(jsonPayload.get("mentorId"));
     String date = jsonPayload.getString("date");
    
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");

	 String sql = "insert into attendance(studentId,prasentStatus,date,mentorId)values(?,?,?,?)";
	 PreparedStatement ps = con.prepareStatement(sql);
	 int done = 0;
	 
	 for (int i = 0; i < students.length(); i++) {
         JSONObject student = students.getJSONObject(i);
         String studentId = String.valueOf(student.get("id"));
         String presentStatus = student.getString("status");

         ps.setString(1, studentId);
         ps.setString(2, presentStatus);
         ps.setString(3, date);
         ps.setString(4, mentorId);

         done += ps.executeUpdate();
     }
    if(done>0){
    	  %>
    	  <script>
    	    alert("Successfully Submit Data !");
    	    location.href="attendanceChart.jsp?class=First Year";
    	  </script>
    	  <%}else{ %>
    	   <script>
    	    alert("Failed Try Again !!");
    	    location.href="attendanceChart.jsp?class=First Year";
    	  </script>
    	  <%
    	  }
    	  		con.close();
    	        } catch (Exception e) {
    	           response.sendRedirect("../login.jsp");
    	         }
    	         %>