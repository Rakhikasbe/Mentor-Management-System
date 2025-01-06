<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style type="text/css">
	
	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<div class="row">
	         <div class="col-md-11">
	         <%
	         Class.forName("com.mysql.jdbc.Driver");
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
			 String sql = ""; PreparedStatement ps = null; ResultSet rs = null;
			 %>
			 
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>SName</th>
	         	<th>Branch</th>
	         	<th>SMobile</th>
	         	<th>Email</th>
	         	<th>View Details</th>
	         </tr> 
	         <tr>
	        
	         	<%
				 try {
				 String className = request.getParameter("class");
				 sql = "SELECT s.*, m.fullName FROM studentregister as s left join mentor_list as m on s.mentorId = m.mentorId where s.mentorId = ? and year = ? order by s.studentId desc";
				 ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("mentorId").toString());
				 ps.setString(2, className);
				 rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td>
					<%=i %>
				</td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("branch") %></td>
				<td><%=rs.getString("studentMobile") %></td>
				<td><%=rs.getString("email") %></td>
				
				<td><a href="studentProfile.jsp?id=<%=rs.getString("studentId") %>" class="btn btn-success btn-sm">View</a></td>
				</tr>
				<% i++;}
				 con.close();
		         }catch (Exception e) {
		             response.sendRedirect("../login.jsp");
		         }%>
				</table>
 				
			
	         </div>
	         </div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>