<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style>
#heading{
	text-align: center;
	margin: 2% 0px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<div class="container">
			<div class="row">
	         <div class="col-md-10">
	         <h1 id="heading">Meeting Schedule</h1>
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>Meeting Title</th>
	         	<th>Date / Time / Duration</th>
	         	<th>Duration / platform</th>
	         	<th>Branch</th>
	         	<th>Notes</th>
	         	<th>Status</th>
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 
				 String sql = "select * from studentmeeting where mentorId = ? order by studMeetingId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("mentorIDD").toString());
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("meetingTitle") %></td>
				<td>Date: <%=rs.getString("meetingDate") %>, Time: <%=rs.getString("meetingTime") %>, Duration: <%=rs.getString("meetingDuration") %></td>
				<td>Platform: <%=rs.getString("platform") %>, Link: <a href="<%=rs.getString("platformLink") %>" target="_blank"><%=rs.getString("platformLink") %></a></td>
				<td><b><%=rs.getString("Branch") %></b></td>
				<td><%=rs.getString("Notes") %></td>
				<td>
					<%if(rs.getString("status").equals("InProcess")) {%>
					<a href="#" class="btn btn-info btn-sm"><%=rs.getString("status") %></a>
					<%}else{ %>
					<a href="#" class="btn btn-danger btn-sm"><%=rs.getString("status") %></a>
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
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

</body>
</html>