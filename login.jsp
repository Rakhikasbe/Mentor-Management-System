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
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
   
     <div class="row">
        
        <div class="col-md-5" style="margin: 4% auto;">
           <form action="logincheck.jsp" method="post">
           
              <div class="form-group">
                 <label>Role</label>
                 <select name="role" class="form-control" id="role">
                     <option value="--Select Role--">--Select Role--</option>
                     <option value="Student">Student</option>
                     <option value="Mentor">Mentor</option>
                     <option value="Admin">Admin</option>
                     
                 </select>
              </div>
              
              <div class="form-group">
                 <label>Email</label>
                 <input type="email" class="form-control" name="email" id="email">
              </div>
              
              <div class="form-group">
                 <label>Password</label>
                 <input type="password" class="form-control" name="password" id="password">
              </div>
              
              <input type="submit" value="Login" class="form-control btn btn-success" onclick="return validation();">
              
           </form>
           <br><br>
           <a href="register.jsp">New Student ? Register Here..</a>
        </div>
        
     </div>
   
   </div>
   
   
   <script type="text/javascript">
     function validation(){
    	 var role = $("#role").val();
    	 var email = $("#email").val();
    	 var password = $("#password").val();
    	 
    	 if(role=="--Select Role--"){
    		 alert("Select Role");
    		 return false;
    	 }else if(email==""){
    		 alert("Enter Email");
    		 return false;
    	 }else if(password==""){
    		 alert("Enter Password");
    		 return false;
    	 }else{
    		 return true;
    	 }
    	 
     }
  </script>
   
   
</body>
</html>