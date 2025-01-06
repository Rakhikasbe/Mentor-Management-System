	var rdate = document.getElementById("rdate");

	
	var fullDate = new Date();
	var date = fullDate.getDate().toString().padStart(2, '0');
	var month = (fullDate.getMonth() + 1).toString().padStart(2, '0');
	var currentYear = fullDate.getFullYear();
	var finalDate = currentYear + "-" + month + "-" + date;
	
	rdate.value = finalDate;


   function validation(){
	  var name = document.getElementById("name").value;
	  var dob = document.getElementById("dob").value;
	  var studentMobile = document.getElementById("studentMobile").value;
	  var Caddress = document.getElementById("Caddress").value;
	  var Paddress = document.getElementById("Paddress").value;
	  var guardianMobile = document.getElementById("guardianMobile").value;
	  var photo = document.getElementById("photo").value;
	  var gender = document.getElementById("gender").value;
	  var branch = document.getElementById("branch").value;
	  var year = document.getElementById("year").value;
	  var email = document.getElementById("email").value;
	  var password = document.getElementById("password").value;
	  var cpassword = document.getElementById("cpassword").value;
	  
		if(name==""){
			alert("Enter Your Name");
			return false;
		}
		else if(dob == ""){
			alert("Select Date of Birth");
			return false;
		}
		else if(studentMobile.length!=10){
			alert("Enter 10 Digit Student Mobile Number");
			return false;
		}
		else if(Caddress==""){
			alert("Enter Your Current Address");
			return false;
		}
		else if(Paddress==""){
			alert("Enter Your Permanent Address");
			return false;
		}
		else if(guardianMobile.length!=10){
			alert("Enter 10 Digit Guardian Mobile Number");
			return false;
		}
		else if(photo==""){
			alert("Upload Your Profile Photo");
			return false;
		}
		else if(gender=="--Select Gender--"){
			alert("Select Gender");
			return false;
		}
		else if(branch=="--Select Branch--"){
			alert("Select Branch");
			return false;
		}
		else if(year=="--Select Year--"){
			alert("Select Year");
			return false;
		}
		else if(email==""){
			alert("Enter Your Email Address");
			return false;
		}
		else if(password.length<=5){
			alert("Enter Atleast 6 Chrecter of Password");
			return false;
		}
		else if(password!=cpassword){
			alert("Password and Re-Enter Password Not Matched !! ");
			return false;
		}
		else{
			return true;
		}
		
   }
   
 