<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--slider menu-->
    <div class="sidebar-menu" style="height : 700px;">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
			      <!--<img id="logo" src="" alt="Logo"/>--> 
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="index.jsp"><i class="fa fa-home"></i><span>Home</span></a></li>
		        <li id="menu-comunicacao" ><a href="#"><i class="fa fa-users nav_icon"></i><span>Mentor Detail</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		            <li id="menu-arquivos" ><a href="addMentor.jsp">Add New Mentor</a></li>
		            <li id="menu-arquivos" ><a href="mentorList.jsp?i=1">List - ENTC - Electronics and Telecommunication Engineering</a></li>
		            <li id="menu-arquivos" ><a href="mentorList.jsp?i=2">List - IT - Information Technology</a></li>
		            <li id="menu-arquivos" ><a href="mentorList.jsp?i=3">List - COMP - Computer Engineering</a></li>
		            <li id="menu-arquivos" ><a href="mentorList.jsp?i=4">List - MECH - Mechanical Engineering</a></li>
		            <li id="menu-arquivos" ><a href="mentorList.jsp?i=5">List - INSTRUMENT - Instrumentation Engineering</a></li>
		          </ul>
		        </li>
		       
		         <li id="menu-comunicacao" ><a href="#"><i class="fa fa-users nav_icon"></i><span>Student List</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		            <li id="menu-arquivos" ><a href="selectYear.jsp?i=1">ENTC - Electronics and Telecommunication Engineering</a></li>
		            <li id="menu-arquivos" ><a href="selectYear.jsp?i=2">IT - Information Technology</a></li>
		            <li id="menu-arquivos" ><a href="selectYear.jsp?i=3">COMP - Computer Engineering</a></li>
		            <li id="menu-arquivos" ><a href="selectYear.jsp?i=4">MECH - Mechanical Engineering</a></li>
		            <li id="menu-arquivos" ><a href="selectYear.jsp?i=5">INSTRUMENT - Instrumentation Engineering</a></li>
		          </ul>
		        
		        </li>
		        <li id="menu-home" ><a href="createMetting.jsp"><i class="fa fa-calendar nav_icon"></i><span>Create Meeting</span></a></li>
		        <li id="menu-home" ><a href="mentorFeedback.jsp"><i class="fa fa-comments nav_icon"></i><span>Mentor Feedback</span></a></li>
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