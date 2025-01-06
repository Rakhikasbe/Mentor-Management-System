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
	         	<div class="row">
	         	<h1 style="text-align: center;">Student Queries</h1><br>
	         <div class="col-md-12">
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>Query Date</th>
	         	<th>Subject</th>
	         	<th>Description</th>
	         	<th>Response</th>
	         </tr> 
	         <tr>
	         	<%
				 //try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 
				 String sql = "select * from querys where mentorId = ? order by queryId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("mentorId").toString());
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("queryDate") %></td>
				<td><%=rs.getString("subject") %></td>
				<td><%=rs.getString("description") %></td>
				<%if(!rs.getString("response").equals("")){ %>
					<td><%=rs.getString("response") %></td>
				<%}else{ %>
				<td>
						<form action="queryResponseDB.jsp" method="post">
							<textarea name="response" class="form-control" placeholder="Response.." required></textarea>
							<input type="hidden" name="queryId" value="<%=rs.getString("queryId") %>">
							<input type="submit" class="btn btn-primary btm-sm">
						</form>
				</td>
				<%} %>
				</tr>
				<% i++;}
				 con.close();
		        /*  }catch (Exception e) {
		             response.sendRedirect("../login.jsp");
		         } */
		         %>
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