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
 <jsp:include page="sessionCheck.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<div class="container p-4">
	      <div class="row">
	         <div class="col-md-12"> 
	         
		         <h2 class="text-center"> Ask Query / Problem </h2>
		         
		           <form action="addQuerysDB.jsp" method="post" id="#">
		           <div class="row">
		           		<div class="col-md-4">
			           		<div class="form-group">
				              <label> Query Date<sup>*</sup> </label>
				              <input type="date" name="queryDate" id="queryDate" class="form-control" readonly>
			             	</div>
			           	</div>
		           </div>
		            <div class="row">
			           	<div class="col-md-4">
		       		    	<div class="form-group">
				              	<label>Subject<sup>*</sup></label>
				                 <input type="text" name="subject" id="subject" placeholder="subject title" class="form-control">
			             	</div>  
		           		</div>
			           	<div class="col-md-4">
		           		  	<div class="form-group">
				                 <label>Description<sup>*</sup></label>
				                  <textarea name="description" id="description" rows="5" class="form-control" placeholder="Description.."></textarea>
			             	</div>
			           	</div>
		          </div>
		          
		        
		          	<div class="offset-md-3 col-md-4">
			             <div class="form-group">
			              	<input type="submit" class="form-control btn btn-success" value=" Submit " onclick="return queryValidation()">
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
	         	<th>Query Date</th>
	         	<th>Subject</th>
	         	<th>Description</th>
	         	<th>Response</th>
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 
				 String sql = "select * from querys where studentId = ? order by queryId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("studId").toString());
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("queryDate") %></td>
				<td><%=rs.getString("subject") %></td>
				<td><%=rs.getString("description") %></td>
				<td><%=rs.getString("response") %></td>
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
	<script type="text/javascript">
		var queryDate = document.getElementById("queryDate");
		
		var fullDate = new Date();
		var date = fullDate.getDate().toString().padStart(2, '0');
		var month = (fullDate.getMonth() + 1).toString().padStart(2, '0');
		var currentYear = fullDate.getFullYear();
		var finalDate = currentYear + "-" + month + "-" + date;
		
		
		queryDate.value = finalDate;
	
	
	</script>
	<script src="app.js"></script>
</body>
</html>