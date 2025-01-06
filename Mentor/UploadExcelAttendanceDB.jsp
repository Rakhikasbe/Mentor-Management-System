<%@ page import="java.io.*, java.sql.*, java.util.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.*, org.apache.poi.hssf.usermodel.*" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%
    if (ServletFileUpload.isMultipartContent(request)) {
        try {
            // File upload setup
            String savePath = "C:/Users/user/workspace/MentorManagement/WebContent/Mentor/excelFils";
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            // Setup for file upload
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            List<FileItem> items = upload.parseRequest(request);
            String filePath = "";
            String fileName = "";

            // Process uploaded file
            for (FileItem item : items) {
            	if (item.isFormField()) {
                    // Extract file name from form field
                    if (item.getFieldName().equals("filename")) {
                        fileName = item.getString();
                    }
                } else {
                    // Save the uploaded file
                    filePath = savePath + File.separator + item.getName();
                    item.write(new File(filePath));
                }
            }
            Class.forName("com.mysql.jdbc.Driver");
            // Read the uploaded Excel file
            try (FileInputStream fis = new FileInputStream(new File(filePath));
                 Workbook workbook = filePath.endsWith(".xlsx") ? new XSSFWorkbook(fis) : new HSSFWorkbook(fis);
            	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor", "root", "root")) {
                 
                  String filenameInsertQuery = "INSERT INTO excelFilename (fileName, mentorId, uploadedDate) VALUES (?, ?, ?)";	
                  try (PreparedStatement pstmtFilename = conn.prepareStatement(filenameInsertQuery, Statement.RETURN_GENERATED_KEYS)) {
                	  
                	  pstmtFilename.setString(1, fileName);
                	  pstmtFilename.setString(2, session.getAttribute("mentorId").toString());
                	  pstmtFilename.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
                      pstmtFilename.executeUpdate();
                      
                      ResultSet generatedKeys = pstmtFilename.getGeneratedKeys();
                      int filenameId = 0;
                      if (generatedKeys.next()) {
                          filenameId = generatedKeys.getInt(1);
                      }
                      
                      
                      String attendanceInsertQuery = "INSERT INTO excelattendance (rollNumber, StudentName, email, mobile, Branch, Year, Subject, Division, AttendancePercentage, filenameId, mentorId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                      try (PreparedStatement pstmtAttendance = conn.prepareStatement(attendanceInsertQuery)) {
                Sheet sheet = workbook.getSheetAt(0);
          
                for (Row row : sheet) {
                	
                    if (row.getRowNum() == 0) continue; // Skip header row
                   
                    pstmtAttendance.setString(1, row.getCell(0).getStringCellValue());
                    pstmtAttendance.setString(2, row.getCell(1).getStringCellValue());
                    pstmtAttendance.setString(3, row.getCell(2).getStringCellValue());
                    pstmtAttendance.setDouble(4, row.getCell(3).getNumericCellValue());
                    pstmtAttendance.setString(5, row.getCell(4).getStringCellValue());
                    pstmtAttendance.setString(6, row.getCell(5).getStringCellValue());
                    pstmtAttendance.setString(7, row.getCell(6).getStringCellValue());
                    pstmtAttendance.setString(8, row.getCell(7).getStringCellValue());
                    pstmtAttendance.setDouble(9, row.getCell(8).getNumericCellValue());
                    pstmtAttendance.setInt(10, filenameId);
                    pstmtAttendance.setString(11, session.getAttribute("mentorId").toString());
                    pstmtAttendance.addBatch();
                    
                }

                // Execute batch insert
                pstmtAttendance.executeBatch();
             }
            }
               // out.println("<h3>Data successfully uploaded to the database!</h3>");
                %>
         	   <script>
         	    alert("Data successfully uploaded to the database!!");
         	    location.href="excelAttendanceReport.jsp";
         	  </script>
         	  <%
            }
           
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    } else {
        out.println("<h3>Error: Request is not multipart. Please use the proper form to upload a file.</h3>");
    }
%>
