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
			<form action="createMettingDB.jsp" method="post">
           
      <div class="container">
      <div class="row">
         <div class="col-md-10"> 
         
         <div class="row">
           <div class="col-md-4">
            <div class="form-group">
                <label for="meetingTitle">Meeting Title:</label>
                <input type="text" id="meetingTitle" name="meetingTitle" class="form-control" placeholder="Enter meeting title">
            </div>
            </div>
            
            <div class="col-md-4">
            <div class="form-group">
                <label for="meetingDate">Date:</label>
                <input type="date" id="meetingDate" name="meetingDate" class="form-control">
            </div>
            </div> 
            
            <div class="col-md-4">
            <div class="form-group">
                <label for="meetingTime">Time:</label>
                <input type="time" id="meetingTime" name="meetingTime" class="form-control">
            </div>
            </div>
           </div> 
            
            <div class="row">
            <!-- Meeting Duration -->
            <div class="col-md-4">
            <div class="form-group">
                <label for="meetingDuration">Duration (in minutes):</label>
                <input type="number" id="meetingDuration" name="meetingDuration" class="form-control" placeholder="Enter duration">
            </div>
            </div>
            
            <div class="col-md-4">
            <div class="form-group">
                <label for="platform">Platform:</label>
                <select id="platform" name="platform" class="form-control">
                    <option value="">Select Platform</option>
                    <option value="Zoom">Zoom</option>
                    <option value="Google Meet">Google Meet</option>
                    <option value="Microsoft Teams">Microsoft Teams</option>
                    <option value="Offline">Offline</option>
                </select>
            </div>
            </div>
            
            <div class="col-md-4">
            <div class="form-group">
                <label for="platformLink">Platform Link:</label>
                <textarea rows="" cols="" class="form-control" id="platformLink" name="platformLink"></textarea>
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
                <label for="notes">Additional Notes:</label>
                <textarea id="notes" name="notes" rows="4" class="form-control" placeholder="Add any notes or agenda"></textarea>
            </div>
           </div> 
           <div class="col-md-4">
   		<div class="form-group">
	        <label for="mentorStatus">Status:</label>
	        <select id="mentorMeetStatus" name="mentorMeetStatus" class="form-control">
	            <option value="InProcess">InProcess</option>
	            <option value="Complete">Complete</option>
	        </select>
	    </div>
	    </div>
           </div>
            
            <!-- Submit Button -->
            <input type="submit" class="btn btn-primary" value="Schedule Meeting">
            </div>
            </div>
            </div>
            
        </form>
        <br><br>
         <div class="row">
	         <div class="col-md-10">
	         <table class="table table-bordered">
	         <tr>
	         	<th>Sr No</th>
	         	<th>Meeting Title</th>
	         	<th>Date / Time / Duration</th>
	         	<th>Duration / platform</th>
	         	<th>Branch</th>
	         	<th>Notes</th>
	         	<th>Status</th>
	         </tr> 
	         <tr>
	         	<%
				 try {
				 Class.forName("com.mysql.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
				 
				 String sql = "select * from mentormetting order by mentorMettingId desc";
				 PreparedStatement ps = con.prepareStatement(sql);
				 ResultSet rs = ps.executeQuery();
				 int i = 1;
				 while(rs.next()){
				%>
				<td><%=i %></td>
				<td><%=rs.getString("meetingTitle") %></td>
				<td>Date: <%=rs.getString("meetingDate") %>, Time: <%=rs.getString("meetingTime") %>, Duration: <%=rs.getString("meetingDuration") %></td>
				<td>Platform: <%=rs.getString("platform") %>, Link: <a href="<%=rs.getString("platformLink") %>" target="_blank"><%=rs.getString("platformLink") %></a></td>
				<td><%=rs.getString("Branch") %></td>
				<td><%=rs.getString("Notes") %></td>
				<td>
					<%if(rs.getString("status").equals("InProcess")) {%>
					<a href="changeMentorMeetStatusDB.jsp?id=<%=rs.getString("mentorMettingId") %>&&status=<%=rs.getString("status") %>" class="btn btn-info btn-sm"><%=rs.getString("status") %></a>
					<%}else{ %>
					<a href="changeMentorMeetStatusDB.jsp?id=<%=rs.getString("mentorMettingId") %>&&status=<%=rs.getString("status") %>" class="btn btn-danger btn-sm"><%=rs.getString("status") %></a>
					<%} %>
				</td>
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
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>