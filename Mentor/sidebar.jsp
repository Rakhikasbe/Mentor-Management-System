<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--slider menu-->
    <div class="sidebar-menu" style="height : 800px;">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
			      <!--<img id="logo" src="" alt="Logo"/>--> 
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="index.jsp"><i class="fa fa-home"></i><span>Home</span></a></li>
		    
		        
		        <li id="menu-home" ><a href="selectYear.jsp"><i class="fa fa-users nav_icon"></i><span>Student List</span></a></li>
		        <li id="menu-comunicacao" ><a href="#"><i class="fa fa-clipboard nav_icon"></i><span>Attendance</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		            <li id="menu-arquivos" ><a href="takeAttendance.jsp">Take Attendance</a></li>
		            <li id="menu-arquivos" ><a href="yearWiseAttendance.jsp">Attendance Report</a></li>
		          </ul>
		        </li>
		        <li id="menu-comunicacao" ><a href="#"><i class="fa fa-clipboard nav_icon"></i><span>Excel Records</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		            <li id="menu-arquivos" ><a href="UploadExcelAttendance.jsp">Upload-Excel Attendance</a></li>
		            <li id="menu-arquivos" ><a href="excelAttendanceReport.jsp">Attendance Report</a></li>
		          </ul>
		        </li>
		        <li id="menu-home" ><a href="createMetting.jsp"><i class="fa fa-users nav_icon"></i><span>Meeting for Students</span></a></li>
		        <li id="menu-home" ><a href="featuresMeetings.jsp"><i class="fa fa-users nav_icon"></i><span>Meeting Schedule (for you)</span></a></li>
		         <li id="menu-home" ><a href="studentQueries.jsp"><i class="fa fa-question-circle nav_icon"></i><span>Student Queries</span></a></li>
		         <li id="menu-home" ><a href="studentFeedback.jsp"><i class="fa fa-comments nav_icon"></i><span>Feedback from Student</span></a></li>
		          <li id="menu-home" ><a href="sendFeedback.jsp"><i class="fa fa-comments nav_icon"></i><span>Send feedback to Admin</span></a></li>
		        
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->s