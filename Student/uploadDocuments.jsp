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
         <div class="col-md-12"> 
         
         <h2 class="text-center"> Upload Documents </h2>
         <br><br>
           <form action="uploadDocumentsDB.jsp" method="post" id="#" enctype="multipart/form-data">
           <div class="row">
           		<div class="col-md-4">
	           		<div class="form-group">
		              <label>Document Name<sup>*</sup> </label>
		              <input type="text" name="documentName" id="documentName" placeholder="Document Name" class="form-control">
	             	</div>
	           	</div>
	           	<div class="col-md-4">
	           		<div class="form-group">
		              <label>Upload Document<sup>*</sup> </label>
		              <input type="file" name="documentFile" id="documentFile" class="form-control">
	             	</div>
	           	</div>
           </div>
           <div class="offset-md-3 col-md-4">
             <div class="form-group">
              <input type="submit" class="form-control btn btn-success" value="Submit" onclick="return validationDocuments()">
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
	         	<th>Document Name</th>
	         	<th>Download</th>
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");

				 String sql = "select * from studdocuments where studentId = ?";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("studId").toString());
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("docName") %></td>
				<td><a href="<%=rs.getString("documents") %>" download><%=rs.getString("documents") %></a></td>
				
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
	<script src="app.js"></script>
</body>
</html>