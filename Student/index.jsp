<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="link.jsp"></jsp:include>
<style type="text/css">
	.inner-block h2{
		text-align: center;
		font-size: 1em;
	}
	.inner-block h1{
		text-align: center;
		font-size: 2em;
	    color: #FC8213;
	    line-height: 1em;
	    font-weight: 700;
	}
	
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="inner-block">
		<h2>Welcome To <%=session.getAttribute("mentorIDD").toString() %></h2><br>
		<h1>MKSSS's Cummins College of Engineering For Women ,Pune.</h1>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="sidebar.jsp"></jsp:include>
	
</body>
</html>