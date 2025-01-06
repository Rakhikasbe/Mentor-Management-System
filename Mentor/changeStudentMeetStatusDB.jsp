<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

    <%
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	 	
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		String sql = ""; PreparedStatement ps = null; int done;
		if(status.equals("InProcess")){
			sql = "update studentmeeting set status = 'Complete' where studMeetingId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			done = ps.executeUpdate();
			
		}else{
			sql = "update studentmeeting set status = 'InProcess' where studMeetingId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			done = ps.executeUpdate();
		}
		 if(done>0){
			 response.sendRedirect("createMetting.jsp");
    	}else{
    		response.sendRedirect("createMetting.jsp");
  		}%>