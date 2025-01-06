<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style type="text/css">
.main {
  width: 100%;
    height: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}

.table {
  width: 90%;
 	
}

table tr td {
  padding: 5px;
}

.table .chart {
  height: 10px;
  width: 10px;
  background: white;
  border: 2px solid slategray;
  padding: 20px;
  margin-left: 35%;
  color: black;
  font-weight: bold;
  cursor: pointer;
  display: flex;
    justify-content: center;
    align-items: center;
}

.table .chart.highlight-green {
  background: green;
  color: white;
}

.table .chart.highlight-red {
  background: red;
  color: white;
}
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="inner-block">
		<div class="container">
			<div class="row">
	         <div class="col-md-10">
	         	Date : <input type="text" value="" id="datevalue" readonly><br><br>
	         	<div class="main"> 
	         		
				  <table class="table" border="1">
				    <tr>
				      <th> Sr.No </th>
				      <th> Name</th>
				      <th>Present</th>
				      <th>Absent</th>
				    </tr>
				    <tr data-student-id="1">
	         	<%
				 //try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 String sql = ""; PreparedStatement ps = null; ResultSet rs = null;
				 String className = request.getParameter("class");
				 sql = "SELECT s.*, m.fullName FROM studentregister as s left join mentor_list as m on s.mentorId = m.mentorId where s.mentorId = ? and year = ? order by s.studentId desc";
				 ps = con.prepareStatement(sql);
				 ps.setString(1, session.getAttribute("mentorId").toString());
				 ps.setString(2, className);
				 rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
					
			      <td><%=i %></td>
			      <td><%=rs.getString("name") %></td>
			      <td><div onclick="checkPresent(this, <%=rs.getString("studentId") %>, '<%=rs.getString("name") %>')" class="chart">P</div></td>
			      <td><div onclick="checkAbsent(this, <%=rs.getString("studentId") %>, '<%=rs.getString("name") %>')" class="chart">A</div></td>
			    </tr>
			    
				<%i++;}
				
					//con.close();
		         	//}catch (Exception e) {
		            // response.sendRedirect("../login.jsp");
		         	//}
		         %>
		         
		          </table>
				</div>
				<!-- Submit Button -->
				<p style="color : red;">Note 1: Before submit please check all students presentee is selected</p>
				<p style="color : red;"><mark>Note 2: Repeate don`t submit, Once Submitted on current date.</mark> </p>
				<button onclick="submitData()" class="btn btn-primary">Submit Attendance</button>
	         </div>
	       </div>
	    </div>
	 </div>    
	<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>     
	 <script>
	 const currentDateValue = new Date().toISOString().split("T")[0]; // Get current date in YYYY-MM-DD format
	document.getElementById("datevalue").value=currentDateValue;
  // Initialize an empty student data array
  const students = [];
  const mentorId = <%=session.getAttribute("mentorId").toString()%>; // Example Mentor ID

  function checkPresent(element, studentId, studentName) {
    clearHighlights(element);
    element.classList.add("highlight-green");
    updateStudentStatus(studentId, studentName, "Present");
  }

  function checkAbsent(element, studentId, studentName) {
    clearHighlights(element);
    element.classList.add("highlight-red");
    updateStudentStatus(studentId, studentName, "Absent");
  }

  function clearHighlights(element) {
    const row = element.closest("tr");
    row.querySelectorAll(".chart").forEach(chart => {
      chart.classList.remove("highlight-green", "highlight-red");
    });
  }

  function updateStudentStatus(studentId, studentName, status) {
    var student = students.find(s => s.id === studentId);
    if (student) {
      student.status = status;
    } else {
      students.push({ id: studentId, name: studentName, status: status });
    }
    console.log("Updated Students Data:", students);
  }

  function submitData() {
    const currentDate = new Date().toISOString().split("T")[0]; // Get current date in YYYY-MM-DD format
	
    // Prepare data to send
    const payload = {
      mentorId: mentorId,
      date: currentDate,
      students: students
    };

    // Send data to database.jsp using AJAX
    fetch('attendanceChartDB.jsp', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(payload)
    })
      .then(response => {
        if (response.ok) {
          return response.text();
        } else {
        	
          throw new Error("Failed to submit data");
        }
      })
      .then(data => {
        alert("Data submitted successfully!");
      })
      .catch(error => {
        console.error("Error:", error);
        alert("Failed to submit data.");
      });
  }
</script>    
    
</body>
</html>