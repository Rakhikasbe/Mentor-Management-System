<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style type="text/css">
.box{
	width : 100%;
	height : 100px;
	border : 2px solid red;
	background: var(--i);
	margin: 2%;
	display: flex;
	justify-content : center;
	align-items : center;
	color: black;
	font-size : 23px;
	box-shadow: 2px 2px 2px 2px gray;
}
	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
	<!-- <div class="col-md-4">
           		  <div class="form-group">
	                 <label>Year<sup>*</sup></label>
	                 <select name="year" class="form-control" id="year">
	                     <option value="--Select Year--">--Select Year--</option>
	                     <option value="First Year">First Year</option>
	                     <option value="Second Year">Second Year</option>
	                     <option value="Third Year">Third Year</option>
	                     <option value="Fourth Year">Fourth Year</option>
	                 </select>
	             </div>
	           	</div> -->
	    <div class="row">
	    <%
	      String i = request.getParameter("i");
	    %>
	    <div class="col-md-10">
	    <div class="row">
	    <div class="col-md-4">
	    <a href="studentList.jsp?i=<%=i%>&&class=First Year">
			<div class="box box-1" style="--i : yellow;">
				<p>First Year</p>
			</div>
		</a>	
		</div>
		<div class="col-md-4">	
		<a href="studentList.jsp?i=<%=i%>&&class=Second Year">
			<div class="box box-2" style="--i : pink;">
				<p>Second Year</p>
			</div>
		</a>	
		</div>
		<div class="col-md-4">
		<a href="studentList.jsp?i=<%=i%>&&class=Third Year">
			<div class="box box-3" style="--i : yellow;">
				<p>Third Year</p>
			</div>
		</a>	
		</div>
		<div class="col-md-4">
		<a href="studentList.jsp?i=<%=i%>&&class=Fourth Year">	
			<div class="box box-4" style="--i : pink;">
				<p>Four Year</p>
			</div>
		</a>	
		</div>	
		</div>
		</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>