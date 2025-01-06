<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style>
 table tr td span{
 	font-weight: bold;
 }
 .card img{
 	border : 2px solid black;
 	padding: 0px 5px;
 }
</style>
</head>
<body>
 <jsp:include page="sessionCheck.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
	<%
		 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
		 
		 String sql = "select * from academicrecords where studentId = ?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, session.getAttribute("studId").toString());
		 ResultSet rs = ps.executeQuery();
		 while(rs.next()){
		%>
		
	<br>
	<table class="table table-bordered">		
			<tr>
				<td><span>uploaded Date : </span><%=rs.getString("uploadedDate") %></td>
				<td><span>Branch : </span><%=rs.getString("branch") %></td>
				<td><span>Year : </span><%=rs.getString("year") %></td>
			</tr>
			<tr>				
				<td><span>semister - 1 : </span><%=rs.getString("semister1") %></td>
				<td><span>sgpa1 : </span><%=rs.getString("sgpa1") %></td>
			</tr>
			<tr>				
				<td><span>semister - 2 : </span><%=rs.getString("semister2") %></td>
				<td><span>sgpa2 : </span><%=rs.getString("sgpa2") %></td>
			</tr>
			</table>
		<%} con.close();
         } catch (Exception e) {
             response.sendRedirect("../login.jsp");
         } %>
	
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>