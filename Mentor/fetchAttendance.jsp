<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
   <jsp:include page="link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="inner-block">
		<div class="container">
			<div class="row">
	         <div class="col-md-10">
			    <h2>View Attendance Records</h2>
			    <form method="GET" action="fetchAttendanceView.jsp">
			    <%String className = request.getParameter("class"); %>
			    <input type="hidden" name="class" value="<%=className%>">
			    <div class="row">
				    <div class="col-md-4">
			       	<div class="form-group">
				        <label for="fromDate">From Date:</label>
				        <input type="date" id="fromDate" name="fromDate" class="form-control" required>
				    </div>
				    </div>
			    
				    <div class="col-md-4">
			         <div class="form-group">    
				        <label for="toDate">To Date:</label>
				        <input type="date" id="toDate" name="toDate" class="form-control" required>
				        
				     </div>
				     </div>   
			        
			     </div>   
			        <button type="submit" class="btn btn-info">Fetch Records</button>
			        
			    </form>
    
    </div>
  </div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>    
</body>
</html>
