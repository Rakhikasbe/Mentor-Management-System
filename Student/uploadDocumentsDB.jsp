<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="java.io.File"%>
<%
//try{
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor","root","root");
	    
	    PreparedStatement ps = null; ResultSet rs = null; int done = 0; String sql = "";
	   
	    String studId =session.getAttribute("studId").toString();
	    String path = "C:\\Users\\user\\workspace\\MentorManagement\\WebContent\\Student\\StudentDoc\\"+studId;
	    
	   // sql="select studDocumentsId from studdocuments order by studDocumentsId desc limit 1";

	    //ps=con.prepareStatement(sql);

	    //rs=ps.executeQuery();

	    //if(!rs.next()){
	    	
	    	//createfolder=1;
	    	
	    	//String path = "D:\\workspace\\MentorManagement\\WebContent\\Student\\StudentDoc\\" + createfolder;
	    	
	    	//File f = new File(path);
	    	
	    	//if(!f.exists()){
	    	
	    		//f.mkdirs();
	    		
	    	//}
	    		
	    		
	    //}else{
	    	
	    	//createfolder=Integer.parseInt(rs.getString("studDocumentsId"));
	    	
	    	//createfolder+=1;
	    	
	    	//String path = "D:\\workspace\\MentorManagement\\WebContent\\Student\\StudentDoc\\" + createfolder;
	    	
	    	//File f = new File(path);
	    	
	    	//if(!f.exists()){
	    	
	    	//	f.mkdirs();
	    	
	    	//}

	    //}
	    
	     	File f = new File(path);
	    	
	    	if(!f.exists()){
	    	
	    		f.mkdirs();
	    	
	    	}
	    
	    MultipartRequest m = new MultipartRequest(request,path,1048*1048*1048);
	    String documentName = m.getParameter("documentName");
	    String documentFile = "StudentDoc/"+studId+"/"+m.getFilesystemName("documentFile");
	    
	    sql = "insert into studdocuments(docName, documents, studentId) values (?, ?, ?)";
    	ps = con.prepareStatement(sql);
    	ps.setString(1, documentName);
    	ps.setString(2, documentFile);
    	ps.setString(3, session.getAttribute("studId").toString());
    	done = ps.executeUpdate();
    	if(done>0){
	         %>
	           <script>
	              alert("Document Added Successfully!!");
	              location.href = "uploadDocuments.jsp";
	           </script>
	    	<%}else{%>
	    		<script>
	              alert("Failed Try Again!!");
	              location.href = "uploadDocuments.jsp";
	           </script>
	    	<%}
			//}catch(Exception e){
				 //e.printStackTrace();
				 //response.sendRedirect("../login.jsp");
			//}
%>