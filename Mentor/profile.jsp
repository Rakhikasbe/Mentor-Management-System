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
			String mentorId = session.getAttribute("mentorId").toString(); 
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
		 
		 String sql = "select * from mentor_list where mentorId = ?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, mentorId);
		 ResultSet rs = ps.executeQuery();
		 if(rs.next()){
		%>
		<div class="card">
			<div class="card-body">
				<img src="../Admin/<%=rs.getString("photo") %>" style="height : 100px; width : 100px;">
			</div>
		</div>
	<br>
	<table class="table table-bordered">		
			<tr>
				<td><span>fullName : </span><%=rs.getString("fullName") %></td>
				<td><span>mentor_Id : </span><%=rs.getString("mentor_Id") %></td>
				<td><span>DOB : </span><%=rs.getString("dob") %></td>
			</tr>
			<tr>				
				<td><span>Address : </span><%=rs.getString("address") %></td>
				<td><span>contactNumber : </span><%=rs.getString("contactNumber") %></td>
				<td><span>Branch : </span><%=rs.getString("branch") %></td>
			</tr>
			<tr>
				
				<td><span>qualifications : </span><%=rs.getString("qualifications") %></td>
				<td><span>designation : </span><%=rs.getString("designation") %></td>
				<td><span>specialization : </span><%=rs.getString("specialization") %></td>
				
			</tr>
			<tr>
				<td><span>institution : </span><%=rs.getString("institution") %></td>
				<td><span>experience : </span><%=rs.getString("experience") %></td>
				<td><span>skills : </span><%=rs.getString("skills") %></td>
				<td><span>highestDegree : </span><%=rs.getString("highestDegree") %></td>
				<td><span>graduationYear : </span><%=rs.getString("graduationYear") %></td>
			</tr>
			<tr>
				<td><span>Gender : </span><%=rs.getString("gender") %></td>
				<td><span>Email : </span><%=rs.getString("email") %></td>
				<td><span>Password : </span><%=rs.getString("password") %></td>
				<td><span>mentorStatus : </span><%=rs.getString("mentorStatus") %></td>
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