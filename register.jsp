<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
#studRegistrationForm sup{
 color : red;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
 <div class="container p-4">
      <div class="row">
         <div class="col-md-12"> 
         
         <h2 class="text-center"> Student Registration </h2>
         
           <form action="registerDB.jsp" method="post" id="studRegistrationForm" enctype="multipart/form-data">
           <div class="row">
           		<div class="col-md-4">
	           		<div class="form-group">
		              <label> Registration Date<sup>*</sup> </label>
		              <input type="date" name="rdate" id="rdate" class="form-control" readonly>
	             	</div>
	           	</div>
           </div>
           <div class="row">
	           	<div class="col-md-4">
	           		<div class="form-group">
		              <label> Full Name<sup>*</sup> </label>
		              <input type="text" name="name" id="name" class="form-control" placeholder="Enter Your Name">
	             	</div>
	           	</div>
	           	<div class="col-md-4">
	           		 <div class="form-group">
		              <label> DOB<sup>*</sup> </label>
		              <input type="date" name="dob" id="dob" class="form-control">
	             	</div>
	           	</div>
	           	<div class="col-md-4">
	           		 <div class="form-group">
		              <label> Student Mobile<sup>*</sup> </label>
		              <input type="number" name="studentMobile" id="studentMobile" class="form-control" placeholder="Student Mobile">
	             	</div>
	           	</div>
           </div>
           
           <div class="row">
	           	<div class="col-md-4">
           		  <div class="form-group">
		              <label> Current Address<sup>*</sup></label>
		              <textarea name="Caddress" id="Caddress" class="form-control" placeholder="Current Address"></textarea>
	             </div>
	           	</div>
	           	<div class="col-md-4">
           		  <div class="form-group">
		              <label> Permanent  Address<sup>*</sup> </label>
		              <textarea name="Paddress" id="Paddress" class="form-control" placeholder="Permanent Address"></textarea>
	             </div>
	           	</div>
	           	<div class="col-md-4">
           		 <div class="form-group">
		              <label>Guardian/Emergency Contact Information<sup>*</sup> </label>
		              <input type="number" name="guardianMobile" id="guardianMobile" class="form-control" placeholder="Guardian Mobile">
	             </div>
	           	</div>
           </div>
           
           <div class="row">
	           	<div class="col-md-4">
       		    	<div class="form-group">
		              <label> Hobbies and Interests </label>
		              <textarea name="hobbies" id="hobbies" class="form-control" placeholder="Hobbies and Interests"></textarea>
	             	</div>  
	           	</div>
	           	<div class="col-md-4">
           		  <div class="form-group">
	                <label> Photo ID (for identification purposes) upload photo with name<sup>*</sup> </label>
              		<input type="file" name="photo" id="photo" class="form-control">
	             </div>
	           	</div>
	           	<div class="col-md-4">
           		 <div class="form-group">
		             <label>Gender<sup>*</sup></label>
	                 <select name="gender" class="form-control" id="gender">
	                     <option value="--Select Gender--">--Select Gender--</option>
	                     <option value="Male">Male</option>
	                     <option value="Female">Female</option>                 
	                 </select>
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
		              	<label> Email<sup>*</sup> </label>
              			<input type="email" name="email" id="email" class="form-control" placeholder="Enter Your Email">
	             	</div>  
	           	</div>
	           	<div class="col-md-4">
           		  <div class="form-group">
	                 <label> Password<sup>*</sup> </label>
	             	<input type="password" name="password" id="password" class="form-control" placeholder="Enter Your Password">
	             </div>
	           	</div>
	           	<div class="col-md-4">
	           		<div class="form-group">
		              <label> Re-Enter Password<sup>*</sup> </label>
		              <input type="password" name="cpassword" id="cpassword" class="form-control" placeholder="Re-Enter Password">
             		</div>
	           	</div>
           </div>
           <br>
             <div class="offset-md-3 col-md-4">
	             <div class="form-group">
	              <input type="submit" class="form-control btn btn-success" value="Register" onclick="return validation()">
	             </div>
	             <div class="form-group">
               		<a href="login.jsp" >Already Registered ? Login Here</a>
             	</div>
             </div>
             
           </form>
         </div>
      </div>
   </div>

<script src="app.js"></script>
</body>
</html>