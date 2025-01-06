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
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
	<%
		 try {
			String studentId = request.getParameter("id"); 
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
		 
		 String sql = "select * from studentRegister where studentId = ? and mentorId = ?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, studentId);
		 ps.setString(2, session.getAttribute("mentorId").toString());
		 ResultSet rs = ps.executeQuery();
		 if(rs.next()){
		%>
		<div class="card">
			<div class="card-body">
				<img src="../Student/<%=rs.getString("photo") %>" style="height : 100px; width : 100px;">
			</div>
		</div>
	<br>
	<table class="table table-bordered">		
		
			<tr>
				<td><span>Reg Date : </span><%=rs.getString("rdate") %></td>
				<td><span>Name : </span><%=rs.getString("name") %></td>
				<td><span>DOB : </span><%=rs.getString("dob") %></td>
			</tr>
			<tr>				
				<td><span>Current Address : </span><%=rs.getString("Caddress") %></td>
				<td><span>Permanent Address : </span><%=rs.getString("Paddress") %></td>
			</tr>
			<tr>
				<td><span>Stud Mob : </span><%=rs.getString("studentMobile") %></td>
				<td><span>Guardian Mob : </span><%=rs.getString("guardianMobile") %></td>
				<td><span>Hobbies : </span><%=rs.getString("hobbies") %></td>
			</tr>
			<tr>
				<td><span>Branch : </span><%=rs.getString("branch") %></td>
				<td><span>Year : </span><%=rs.getString("year") %></td>
			</tr>
			<tr>
				<td><span>Gender : </span><%=rs.getString("gender") %></td>
				<td><span>Email : </span><%=rs.getString("email") %></td>
				<%-- <td><span>Password : </span><%=rs.getString("password") %></td> --%>
			</tr>
		<%} con.close();
         } catch (Exception e) {
             response.sendRedirect("../login.jsp");
         } %>
	</table>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>