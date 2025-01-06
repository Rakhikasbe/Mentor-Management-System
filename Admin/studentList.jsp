<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style type="text/css">
	
	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<div class="row">
	         <div class="col-md-11">
	         <form action="assignStudentsDB.jsp" method="post">
	         
	         
	         <div class="col-md-6">
      		    	<div class="form-group">
	              	<label>Mentor<sup>*</sup></label>
	                 <select name="MentorId" class="form-control" id="MentorId">
	                   <option value="--Select Branch--">--Select Mentor--</option>
	         <%
	         Class.forName("com.mysql.jdbc.Driver");
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
			 String sql = ""; PreparedStatement ps = null; ResultSet rs = null;
			 String branchName = request.getParameter("i");
			 String branchName1 = request.getParameter("i");
			 String className = request.getParameter("class");
			 
				if(branchName.equals("1")){
					branchName = "ENTC - Electronics and Telecommunication Engineering";
				}
				else if(branchName.equals("2")){
					branchName = "IT - Information Technology";
				}
				else if(branchName.equals("3")){
					branchName = "COMP - Computer Engineering";
				}
				else if(branchName.equals("4")){
					branchName = "MECH - Mechanical Engineering";
				}
				else if(branchName.equals("5")){
					branchName = "INSTRUMENT - Instrumentation Engineering";
				}else{
					
				}
				
			 	sql = "select * from mentor_list where branch = ? and mentorStatus = 'Active'";
			 	ps = con.prepareStatement(sql);
				ps.setString(1, branchName);
				rs = ps.executeQuery();
				while(rs.next()){
	         %>
	         	
	                   
	                     <option value="<%=rs.getString("mentorId") %>"><%=rs.getString("fullName") %></option>          
	                     
	                 
	         <%} %>
	         </select>
	         <br>
	         <p style="color : red;">Note : Before submit Select Students</p>
	         <textarea id="values" name="values" placeholder="Select Students" readonly></textarea>
	         <input type="submit" class="btn btn-success">
             	</div>  
           		</div>
           		
           		<input type="hidden" name="branch" value="<%=branchName1 %>">
           		<input type="hidden" name="class" value="<%=className %>">
	         
	         <table class="table table-bordered">
	         <thead>
	         <tr>
	          <th><input type="checkbox" class="select20student" id="select20student"></th>
	          <td colspan="6">Select first 20</td>
	         </tr> 
	         </thead>
	         <tr>
	         	<th>Sr No</th>
	         	<th>SName</th>
	         	<th>Branch</th>
	         	<th>SMobile</th>
	         	<th>Email</th>
	         	<th>Assigned Mentor</th>
	         	<th>View Details</th>
	         </tr> 
	         <tr>
	        
	         	<%
				 //try {
		
				 //sql = "SELECT s.*, m.fullName FROM studentregister as s left join mentor_list as m on s.mentorId = m.mentorId where s.branch = ? and s.year = ? order by s.studentId desc";
				 sql = "SELECT s.*, m.fullName FROM studentregister as s "
					    + "LEFT JOIN mentor_list as m ON s.mentorId = m.mentorId "
					    + "WHERE s.branch = ? AND s.year = ? "
					    + "ORDER BY s.mentorId IS NOT NULL, s.studentId DESC";

				 ps = con.prepareStatement(sql);
				 ps.setString(1, branchName);
				 ps.setString(2, className);
				 rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td>
					<%=i %>
					<input type="checkbox" class="stud" id="stud<%=i%>" name="stud<%=i%>" value="<%=rs.getString("studentId") %>" onclick="checkStatus()">
				</td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("branch") %></td>
				<td><%=rs.getString("studentMobile") %></td>
				<td><%=rs.getString("email") %></td>
				<td>
					<%if(rs.getString("mentorId")==null || rs.getString("mentorId").equals("Not Assigned")){%>
					
						<p style="color : red;">Not Assigned </p>
					
					<%}else{ %>
						<mark><%=rs.getString("fullName") %></mark>
					<%} %>
					</td>
				<td><a href="studentProfile.jsp?id=<%=rs.getString("studentId") %>" class="btn btn-success btn-sm">View</a></td>
				</tr>
				<% i++;}
				 con.close();
		         //}catch (Exception e) {
		          //   response.sendRedirect("../login.jsp");
		         //}%>
				</table>
 				
				</form>
	         </div>
	         </div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
	
<script>
function checkStatus() {
    var v = document.getElementById("values");
    var stud = document.getElementsByClassName("stud");

    // Convert HTMLCollection to an array
    var studArray = Array.from(stud);

    // Collect checked checkbox values
    var selectedValues = [];
    studArray.forEach(function(checkbox) {
        if (checkbox.checked) {
            selectedValues.push(checkbox.value);
        }
    });

    // Set the selected values in the textarea
    v.value = selectedValues.join(",");
}


function validateForm() {
    // Get the selected mentor
    var mentor = document.getElementById("MentorId").value;

    // Check if a valid mentor is selected
    if (mentor === "--Select Branch--") {
        alert("Please select a mentor.");
        return false;
    }

    // Get the selected student checkboxes
    var stud = document.getElementsByClassName("stud");
    var selectedValues = Array.from(stud).filter(checkbox => checkbox.checked);

    // Check if at least one student is selected
    if (selectedValues.length === 0) {
        alert("Please select at least one student.");
        return false;
    }

    // If all validations pass
    return true;
}

// Attach the validation function to the form's onsubmit event
document.querySelector("form").onsubmit = validateForm;


</script>

<script type="text/javascript">
document.getElementById("select20student").addEventListener("change", function () {
    var v = document.getElementById("values");
    var stud = document.getElementsByClassName("stud");
    var selectedValues = [];
    var count = 0;

    if (this.checked) {
        // Select the first 20 unassigned students
        Array.from(stud).forEach(function (checkbox) {
            var row = checkbox.closest("tr");
            var assignedMentorCell = row.querySelector("td:nth-child(6)");

            // Check if the student is unassigned and the limit is not exceeded
            if (
                assignedMentorCell &&
                assignedMentorCell.textContent.trim() === "Not Assigned" &&
                count < 20
            ) {
                checkbox.checked = true;
                selectedValues.push(checkbox.value);
                count++;
            }
        });
    } else {
        // Uncheck all student checkboxes and clear the textarea
        Array.from(stud).forEach(function (checkbox) {
            checkbox.checked = false;
        });
        selectedValues = [];
    }

    // Set the selected values in the textarea
    v.value = selectedValues.join(",");
});



</script>
</body>
</html>