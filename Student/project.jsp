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
	         <div class="col-md-11"> 
	         
		         <h2 class="text-center"> Project Records/Internship </h2>
		         <br><br>
		           <form action="projectDB.jsp" method="post" id="#" enctype="multipart/form-data">
		           <div class="row">
		           		<div class="col-md-4">
			           		<div class="form-group">
				              <label> Project Title/Company Name<sup>*</sup> </label>
				              <input type="text" name="title" id="title" class="form-control" placeholder="Title">
			             	</div>
			           	</div>
			           	<div class="col-md-6">
			           		<div class="form-group">
				              <label> Project/company Description<sup>*</sup> </label>
				              	<textarea name="desc" id="desc" class="form-control" placeholder="Project Description"></textarea>
			             	</div>
			           	</div>
		           </div>
		            <div class="row">
		           		<div class="col-md-3">
			           		<div class="form-group">
				              <label> Team Size<sup>*</sup> </label>
				              <input type="number" name="size" id="size" class="form-control" placeholder="Team Size">
			             	</div>
			           	</div>
			           	<div class="col-md-3">
			           		<div class="form-group">
				              <label> Skills<sup>*</sup> </label>
				              	<textarea name="skills" id="skills" class="form-control" placeholder="Project Skills(HTML, Java)"></textarea>
			             	</div>
			           	</div>
			           	<div class="col-md-3">
			           		<div class="form-group">
				              <label> Year<sup>*</sup> </label>
				              <input type="number" name="year" id="year" class="form-control" placeholder="eg., 2024" min="1900" max="2099" step="1">
			             	</div>
			            </div>	
		           </div>
		           	<div class="offset-md-3 col-md-4">
			             <div class="form-group">
			              	<input type="submit" class="form-control btn btn-success" value=" Submit " onclick="return validationAcademic()">
			             </div>
             		</div>
		         </form>  
		       </div>
		     </div>
		     <div class="row">
	         <div class="col-md-10">
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>Project Title</th>
	         	<th>Description</th>
	         	<th>Skills</th>
	         	<th>TeamSize / Year</th>
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 
				 String sql = "select * from projectdetails where studentId = ?";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("studId").toString());
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("projectTitle") %></td>
				<td><%=rs.getString("projectDesc") %></td>
				<td><%=rs.getString("projectSkills") %></td>
				<td>Team - <%=rs.getString("teamSize") %> / Year - <%=rs.getString("projectYear") %></td>
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