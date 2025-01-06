<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
                <table class="table table-bordered">
                    <tr>
                        <th>Sr No</th>
                        <th>rollNumber</th>
                        <th>StudentName</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Attendance Percentage</th>
                        <th>Defaulter</th>
                    </tr>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor", "root", "root");
                            String fileName = request.getParameter("id");
                            String sql = "SELECT * FROM excelattendance WHERE filenameId = ? and mentorId=? ORDER BY (AttendancePercentage < 75) DESC, AttendancePercentage ASC";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.setString(1, fileName);
                            ps.setString(2, session.getAttribute("mentorId").toString());
                            ResultSet rs = ps.executeQuery();
                            int i = 1;

                            if (rs.next()) {
                    %>
                                <b>Branch:</b> <%= rs.getString("branch") %>
                                <b>Year:</b> <%= rs.getString("Year") %>
                                <b>Subject:</b> <%= rs.getString("Subject") %>
                                <b>Division:</b> <%= rs.getString("Division") %>
                    <% }
                            rs.beforeFirst(); // Reset ResultSet pointer to the start
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= i %></td>
                        <td><%= rs.getString("rollNumber") %></td>
                        <td><%= rs.getString("StudentName") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("mobile") %></td>
                        <td><%= rs.getString("AttendancePercentage") %></td>
                        <td>
                            <% if (rs.getDouble("AttendancePercentage") < 75) { %>
                                <b style="color:red;">Defaulter</b>
                            <% } %>
                        </td>
                    </tr>
                    <%
                                i++;
                            }
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            response.sendRedirect("../login.jsp");
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
</body>
</html>
