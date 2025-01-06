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
		       <li id="menu-home" ><a href="profile.jsp"><i class="fa fa-user"></i><span>View Profile</span></a></li>
		        <li id="menu-comunicacao" ><a href="#"><i class="fa fa-graduation-cap nav_icon"></i><span>Academic Record</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		            <li id="menu-arquivos" ><a href="academicRecord.jsp">Add Academic Record</a></li>
		            <li id="menu-arquivos" ><a href="viewAcademicRecord.jsp">View Record</a></li>
		          </ul>
		        </li>
		        <li id="menu-home" ><a href="project.jsp"><i class="fa fa-clipboard nav_icon"></i><span>Project Details</span></a></li>
		        <li id="menu-home" ><a href="uploadDocuments.jsp"><i class="fa fa-book nav_icon"></i><span>Upload Documents</span></a></li>
		        <li id="menu-home" ><a href="fetchAttendance.jsp"><i class="fa fa-clipboard nav_icon"></i><span>Attendance Report</span></a></li>
		        <li id="menu-home" ><a href="featuresMeetings.jsp"><i class="fa fa-users nav_icon"></i><span>Meeting Schedule</span></a></li>
		        <li id="menu-home" ><a href="addQuerys.jsp"><i class="fa fa-question-circle nav_icon"></i><span>Ask Query / Problems</span></a></li>
		        <li id="menu-home" ><a href="sendFeedback.jsp"><i class="fa fa-comments nav_icon"></i><span>Send Feedback</span></a></li>
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