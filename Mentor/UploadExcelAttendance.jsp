<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
				 <h2>Upload Attendance Excel File</h2><br>
			    <form action="UploadExcelAttendanceDB.jsp" method="post" enctype="multipart/form-data">
			        <div class="form-group">
			        	<label>File name (ex: AcademicYear-branch-year-subject-Division )</label>
			        	<input type="text" name="filename" class="form-control" placeholder="2025-IT-firstYear-math-A" required>
			        </div>
			        <div class="form-group">
				        <label for="file">Select Excel File:</label>
				        <input type="file" class="form-control" name="file" accept=".xlsx, .xls" required />
			        </div>
			        <br><br>
			        <input type="submit" class="btn btn-info" value="Upload and Save">
			    </form>
			   </div>
			 </div>
		</div>	    
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>