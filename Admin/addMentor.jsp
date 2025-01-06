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
	 <h2>Mentor Registration</h2>
	<div class="container">
      	<div class="row">
      	<div class="col-md-10"> 
		<form action="addMentorDB.jsp" method="post" enctype="multipart/form-data">
   
    <!-- Personal Information -->
    <fieldset>
        <legend>Personal Information</legend>
         <div class="row">
         
   		<div class="col-md-4">
   		<div class="form-group">
        	<label for="fullName">Full Name:</label>
        	<input type="text" id="fullName" name="fullName" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="gender">Gender:</label>
	        <select id="gender" name="gender" class="form-control">
	            <option value="Male">Male</option>
	            <option value="Female">Female</option>
	            <option value="Other">Other</option>
	        </select>
	      </div>
	      </div> 
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="dob">Date of Birth:</label>
	        <input type="date" id="dob" name="dob" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
          	<div class="form-group">
                <label> Photo ID (for identification purposes)<sup>*</sup> </label>
             	<input type="file" name="photo" id="photo" class="form-control">
             </div>
         </div>
	           	
		</div>
		
		 <div class="row">
         
   		<div class="col-md-4">
   		<div class="form-group">
	        <label for="contactNumber">Contact Number:</label>
	        <input type="number" id="contactNumber" name="contactNumber" class="form-control">
		</div>
		</div> 
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="email">Email Address:</label>
	        <input type="email" id="email" name="email" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="address">Address:</label>
	        <textarea id="address" name="address" rows="3" class="form-control"></textarea>
    	</div>
    	</div>
    	</div>
    </fieldset>

    <!-- Professional Information -->
    <fieldset>
        <legend>Professional Information</legend>
         <div class="row">
         
   		<div class="col-md-4">
   		<div class="form-group">
	        <label for="mentorId">Mentor ID:</label>
	        <input type="text" id="mentorId" name="mentorId" class="form-control">
		</div>
		</div> 
		
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
	        <label for="designation">Designation:</label>
	        <input type="text" id="designation" name="designation" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="specialization">Specialization:</label>
	        <input type="text" id="specialization" name="specialization" class="form-control">
		</div>
		</div>
		</div>
		
		<div class="row">
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="qualifications">Qualifications:</label>
	        <input type="text" id="qualifications" name="qualifications" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="experience">Years of Experience:</label>
	        <input type="number" id="experience" name="experience" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="skills">Skills:</label>
	        <textarea id="skills" name="skills" rows="2" class="form-control"></textarea>
		</div>
		</div>
		</div>
    </fieldset>
   
    <!-- Academic Information -->
    <fieldset>
        <legend>Academic Information</legend>
        
        <div class="row">
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="highestDegree">Highest Degree:</label>
	        <input type="text" id="highestDegree" name="highestDegree" class="form-control">
		</div>
		</div>
	
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="institution">Institution:</label>
	        <input type="text" id="institution" name="institution" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="graduationYear">Year of Graduation:</label>
	        <input type="number" id="graduationYear" name="graduationYear" class="form-control">
		</div>
		</div>
		</div>
    </fieldset>

    <!-- System Information -->
    <fieldset>
        <legend>System Information</legend>
		<div class="row">
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="password">Password:</label>
	        <input type="text" id="password" name="password" class="form-control">
		</div>
		</div>
		
		<div class="col-md-4">
   		<div class="form-group">
	        <label for="mentorStatus">Status:</label>
	        <select id="mentorStatus" name="mentorStatus" class="form-control">
	            <option value="Active">Active</option>
	            <option value="Inactive">Inactive</option>
	        </select>
	    </div>
	    </div>
	    </div>    
    </fieldset>

    <input type="submit" value="Register Mentor" class="btn btn-success" onclick="return validateForm()">
</form>
	</div>
	</div>
	</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>

<script>
function validateForm() {
    var fields = [
        "fullName", "gender", "dob", "photo", "contactNumber", "email", "address",
        "mentorId", "branch", "designation", "specialization", "qualifications", 
        "experience", "skills", "highestDegree", "institution", 
        "graduationYear", "password", "mentorStatus"
    ];

    for (var i = 0; i < fields.length; i++) {
        var field = fields[i];
        var input = document.getElementById(field);

        if (input && input.value.trim() === "") {
            // Convert camelCase field names to a readable format
            var fieldName = field.replace(/([A-Z])/g, ' $1').replace(/^./, str => str.toUpperCase());
            alert("Please fill out the " + fieldName);
            input.focus();
            return false;
        }
    }

    return true;
}
</script>

	
</body>
</html>