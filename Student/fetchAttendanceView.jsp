<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="inner-block">
		<div class="container">
			<div class="row">
			
	         <div class="col-md-10">
	         <button onclick="printPage()" id="print" class="btn btn-success">Print</button><br><br>
<%
    // Step 1: Retrieve date range from request
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");

    if (fromDate != null && toDate != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Step 2: Database Connection
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor", "root", "root");

            // Step 3: Query to Fetch Records
            String sql = "SELECT a.studentId, s.name, a.prasentStatus, a.date " +
                         "FROM attendance a " +
                         "LEFT JOIN studentregister s ON a.studentId = s.studentId " +
                         "WHERE a.date BETWEEN ? AND ? and a.studentId = ?" +
                         "ORDER BY a.date ASC";
            ps = con.prepareStatement(sql);
            ps.setString(1, fromDate);
            ps.setString(2, toDate);
            ps.setString(3, session.getAttribute("studId").toString());
            rs = ps.executeQuery();

            // Step 4: Display Results in Table
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MMM-dd");
%>
            <h2>Attendance Records from <%= outputFormat.format(inputFormat.parse(fromDate)) %> to <%= outputFormat.format(inputFormat.parse(toDate)) %></h2>
            <br>
            <table border="1" class="table table-bordered">
                <thead>
                    <tr>
                      <!--   <th>Student ID</th> -->
                        <th>Name</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                            String studentId = rs.getString("studentId");
                            String name = rs.getString("name");
                            String status = rs.getString("prasentStatus");
                            String date = rs.getString("date");

                            // Format the date before displaying it
                            String formattedDate = outputFormat.format(inputFormat.parse(date));
                    %>
                        <tr>
                            <%-- <td><%= studentId %></td> --%>
                            <td><%= name %></td>
                            <td><b> <%= status %> </b></td>
                            <td><%= formattedDate %></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
<%
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        out.println("Please select a valid date range.");
    }
%>

		</div>
	</div>
</div>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>   

<script type="text/javascript">
	function printPage(e){
		document.getElementsByClassName("sidebar-menu")[0].style.display="none";
		document.getElementById("print").style.display="none";
		document.getElementsByClassName("copyrights")[0].style.display="none";
		document.getElementsByClassName("header-main")[0].style.display="none";
		
		window.print();
		document.getElementsByClassName("sidebar-menu")[0].style.display="block";
		document.getElementById("print").style.display="block";
		document.getElementsByClassName("copyrights")[0].style.display="block";
		document.getElementsByClassName("header-main")[0].style.display="block";
	}
</script>  
</body>
</html>
