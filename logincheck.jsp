<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
  
  <%
     String role = request.getParameter("role");
     String email = request.getParameter("email");
     String password = request.getParameter("password");
     
     PreparedStatement ps = null; ResultSet rs = null; int done = 0; String sql = "";
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
      
      if(role.equals("Admin")){
    	  
    	  sql = "select *from admin where adminEmail=? and adminPassword=?";
    	  ps = con.prepareStatement(sql);
    	  ps.setString(1, email);
    	  ps.setString(2, password);
    	  rs = ps.executeQuery();
    	  if(rs.next()){
        	  session.setAttribute("adminId", rs.getString("id"));
        	  session.setAttribute("adminEmail", rs.getString("adminEmail"));
        	  response.sendRedirect("Admin/index.jsp");
          }else{%>
          
          <script>
            alert("Check Your email and pasword");
            location.href="login.jsp";
          </script>
        	  
         <% }
    	  
      }else if(role.equals("Mentor")){
    	  
    	  sql = "select *from mentor_list where email=? and password=? and mentorStatus='Active'";
    	  ps = con.prepareStatement(sql);
    	  ps.setString(1, email);
    	  ps.setString(2, password);
    	  rs = ps.executeQuery();
    	  if(rs.next()){
        	  session.setAttribute("mentorId", rs.getString("mentorId"));
        	  session.setAttribute("mentorName", rs.getString("fullName"));
        	  response.sendRedirect("Mentor/index.jsp");
          }else{%>
          
          <script>
            alert("Check Your email and pasword or contact to admin");
            location.href="login.jsp";
          </script>
        	  
         <% }
    	  
      }else if(role.equals("Student")){
    	  
    	  sql = "select *from studentregister where email=? and password=?";
    	  ps = con.prepareStatement(sql);
    	  ps.setString(1, email);
    	  ps.setString(2, password);
    	  rs = ps.executeQuery();
    	  if(rs.next()){
        	  session.setAttribute("studId", rs.getString("studentId"));
        	  session.setAttribute("studName", rs.getString("name"));
        	  session.setAttribute("mentorIDD", rs.getString("mentorId"));
        	  if(!session.getAttribute("mentorIDD").toString().equals("Not Assigned")){
        		  response.sendRedirect("Student/index.jsp");
        	  }else{%>
              
              <script>
                alert("Mentor is not Assigned !! contact to Admin");
                location.href="login.jsp";
              </script>
            	  
             <% }
        	  
          }else{%>
          
          <script>
            alert("Check Your email and pasword");
            location.href="login.jsp";
          </script>
        	  
         <% }
    	  
      }else{%>
    	  <script>
            alert("Something Wrong !!");
            location.href="login.jsp";
          </script>
      <%}
  %>