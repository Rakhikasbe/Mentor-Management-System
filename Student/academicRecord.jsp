<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style type="text/css">
 p{
 	color: red;
 	font-weight: bold;
 }
</style>
</head>
<body>
 <jsp:include page="sessionCheck.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<div class="container p-4">
	      <div class="row">
	         <div class="col-md-12"> 
	         
		         <h2 class="text-center"> Academic Performance Records </h2>
		         
		           <form action="academicRecordDB.jsp" method="post" id="#" enctype="multipart/form-data">
		           <div class="row">
		           		<div class="col-md-4">
			           		<div class="form-group">
				              <label> Upload Date<sup>*</sup> </label>
				              <input type="date" name="academicUpdateDate" id="academicUpdateDate" class="form-control" readonly>
			             	</div>
			           	</div>
		           </div>
		            <div class="row">
			           	<div class="col-md-4">
		       		    	<div class="form-group">
				              	<label>Branch<sup>*</sup></label>
				                 <select name="branch" class="form-control" id="branch">
				                     <option value="--Select Branch--">--Select Branch--</option>
				                     <option value="ENTC - Electronics and Telecommunication Engineering">ENTC - Electronics and Telecommunication Engineering</option>
				                     <option value="IT - Information Technology">IT - Information Technology</option>
				                     <option value="COMP - Computer Engineering">COMP - Computer Engineering</option>
				                     <option value="MECH - Mechanical Engineering">MECH - Mechanical Engineering</option>
				                     <option value="INSTRUMENT - Instrumentation Engineering">INSTRUMENT - Instrumentation Engineering</option>
				                     
				                 </select>
			             	</div>  
		           		</div>
			           	<div class="col-md-4">
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
			           	</div>
		          </div>
		           <div class="row">
			           	<div class="col-md-4">
		       		    	<div class="form-group">
				                 <input type="text" name="semester1" id="semester1" value="Semister 1" class="form-control" readonly>
			             	</div>  
		           		</div>
			           	<div class="col-md-4">
		           		  	<div class="form-group">
				                 <input type="text" name="sgpa1" id="sgpa1" placeholder="SGPA (e.g., 7.8)" class="form-control">
			             	</div>
			           	</div>
		          </div>
		          <div class="row">
			           	<div class="col-md-4">
		       		    	<div class="form-group">
				                 <input type="text" name="semester2" id="semester2" value="Semister 2" class="form-control" readonly>
			             	</div>  
		           		</div>
			           	<div class="col-md-4">
		           		  	<div class="form-group">
				                 <input type="text" name="sgpa2" id="sgpa2" placeholder="SGPA (e.g., 7.8)" class="form-control">
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
	        <p>Note : If you have already added, don`t add repeat..
	        <a href="viewAcademicRecord.jsp"> Check record Here..</a></p>
       </div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	<script type="text/javascript">
		var academicUpdateDate = document.getElementById("academicUpdateDate");
		
		var fullDate = new Date();
		var date = fullDate.getDate().toString().padStart(2, '0');
		var month = (fullDate.getMonth() + 1).toString().padStart(2, '0');
		var currentYear = fullDate.getFullYear();
		var finalDate = currentYear + "-" + month + "-" + date;
		
		
		academicUpdateDate.value = finalDate;
	
	
	</script>
	<script src="app.js"></script>
</body>
</html>