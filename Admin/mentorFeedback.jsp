<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<div class="container">
			<div class="row">
	         <div class="col-md-10">
	         	 <h1 style="text-align: center; margin-bottom: 2%;">Mentor Feedback</h1>
         <div class="row">
	         <div class="col-md-10">
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>Date</th>
	         	<th>Type</th>
	         	<th>message</th>
	         	<th>Mentor Name</th>
	         	
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				
				 String sql = "select f.*,m.mentorId, m.fullName from mentorfeedback as f inner join mentor_list as m on f.mentorId = m.mentorId  order by f.feedbackId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("feedbackDate") %></td>
				<td><%=rs.getString("feedbackType") %></td>
				<td><%=rs.getString("message") %></td>
				<td><a href="mentorProfile.jsp?id=<%=rs.getString("mentorId") %>"><%=rs.getString("fullName") %></a></td>
				
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
	     </div>
	   </div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>      
</body>
</html>