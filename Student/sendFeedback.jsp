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
	         <div class="col-md-10">
	         		<form action="sendFeedbackDB.jsp" method="post" onsubmit="return validateFeedbackForm()">			
			           
	           		<div class="form-group">
			              <label> Date<sup>*</sup> </label>
			              <input type="date" name="rdate" id="rdate" class="form-control" readonly>
		             	</div>
		           	
	           	
			            <div class="form-group">
			                <label for="feedbackType">Feedback Type:</label>
			                <select id="feedbackType" name="feedbackType" class="form-control">
			                    <option value="">Select Feedback Type</option>
			                    <option value="Suggestion">Suggestion</option>
			                    <option value="Complaint">Complaint</option>
			                    <option value="Inquiry">Inquiry</option>
			                    <option value="Other">Other</option>
			                </select>
			            </div>
			
			            
			            <div class="form-group">
			                <label for="message">Message:</label>
			                <textarea id="message" name="message" rows="5" class="form-control" placeholder="Write your feedback"></textarea>
			            </div>			
			            
			            <input type="submit" class="btn btn-primary" value="Submit Feedback">
			        </form>
	         </div>
	       </div>
	       
	         <br><br>
	         <h1 style="text-align: center; margin-bottom: 2%;">Feedback History</h1>
         <div class="row">
	         <div class="col-md-10">
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>Date</th>
	         	<th>Type</th>
	         	<th>message</th>
	         	
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				
				 String sql = "select * from studentfeedback where studentId = ? order by feedbackId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("studId").toString());
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("feedbackDate") %></td>
				<td><%=rs.getString("feedbackType") %></td>
				<td><%=rs.getString("message") %></td>
				
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
	<script>
        function validateFeedbackForm() {
            const fields = ["feedbackType", "message"];
            
            for (let i = 0; i < fields.length; i++) {
                const input = document.getElementById(fields[i]);
                if (input && input.value.trim() === "") {
                    alert("Please fill out the " + fields[i].replace(/([A-Z])/g, ' $1'));
                    input.focus();
                    return false;
                }
            }

            /* const email = document.getElementById("email").value;
            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (!email.match(emailPattern)) {
                alert("Please enter a valid email address.");
                document.getElementById("email").focus();
                return false;
            } */

            return true;
        }
        
        
        var rdate = document.getElementById("rdate");

    	
    	var fullDate = new Date();
    	var date = fullDate.getDate().toString().padStart(2, '0');
    	var month = (fullDate.getMonth() + 1).toString().padStart(2, '0');
    	var currentYear = fullDate.getFullYear();
    	var finalDate = currentYear + "-" + month + "-" + date;
    	
    	rdate.value = finalDate;
    </script>
</body>
</html>