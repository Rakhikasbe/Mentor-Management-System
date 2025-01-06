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
	         <div class="col-md-10">
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>MName</th>
	         	<th>Branch</th>
	         	<th>MMobile</th>
	         	<th>Email</th>
	         	<th>View Details</th>
	         	<th>Change Status</th>
	         </tr> 
	         <tr>
	         
	         	<%
				 try {
					String branchName = request.getParameter("i");
					if(branchName.equals("1")){
						branchName = "ENTC - Electronics and Telecommunication Engineering";
					}
					else if(branchName.equals("2")){
						branchName = "IT - Information Technology";
					}
					else if(branchName.equals("3")){
						branchName = "COMP - Computer Engineering";
					}
					else if(branchName.equals("4")){
						branchName = "MECH - Mechanical Engineering";
					}
					else if(branchName.equals("5")){
						branchName = "INSTRUMENT - Instrumentation Engineering";
					}else{
						
					}
					
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 
				 String sql = "select * from mentor_list where branch = ? order by mentorId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, branchName);
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("fullName") %></td>
				<td><%=rs.getString("branch") %></td>
				<td><%=rs.getString("contactNumber") %></td>
				<td><%=rs.getString("email") %></td>
				<td><a href="mentorProfile.jsp?id=<%=rs.getString("mentorId") %>" class="btn btn-success btn-sm">View</a></td>
				<td>
					<%if(rs.getString("mentorStatus").equals("Active")) {%>
					<a href="changeMentorStatusDB.jsp?id=<%=rs.getString("mentorId") %>&&status=<%=rs.getString("mentorStatus") %>&&branch=<%=rs.getString("branch") %>" class="btn btn-info btn-sm"><%=rs.getString("mentorStatus") %></a>
					<%}else{ %>
					<a href="changeMentorStatusDB.jsp?id=<%=rs.getString("mentorId") %>&&status=<%=rs.getString("mentorStatus") %>&&branch=<%=rs.getString("branch") %>" class="btn btn-danger btn-sm"><%=rs.getString("mentorStatus") %></a>
					<%} %>
				</td>
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