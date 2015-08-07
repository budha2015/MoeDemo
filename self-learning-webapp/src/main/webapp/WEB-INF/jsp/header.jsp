<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
.header_bar {background: #fff;width: 100%;padding: 10px 3px 15px 10px;}
/********Menu style *********/
.clr{clear:both;}
.flt{float:left;}
.flr{float:right;}
body{min-width:320px;max-width:1000px;margin:0 auto;}
.top_menu{margin:10px 0 10px -5px;position:relative;}
.top_menu ul li{float:left;margin: 0 5px; padding:0;;width: 130px;color:#fff;background-image:url(./images/icons/down_arrow.png);background-repeat:no-repeat;background-position: 92% 18px;cursor:pointer; position:relative; }
.top_menu ul li img{margin: 0 5px 0 10px;}
.home_menu{background:#17a2d6; background-image:none !important;}
.patnrs_menu{background:#13a75e; background-image:none !important;}
.board_menu{background:#b05e9d;}
.report_menu{background:#e39344; background-image:none !important;}
.mngmnt_menu{background:#d83949; background-image:none !important;}
.quick_menu{float: right;margin: -1px 0px 0 0;}
.top_menu ul li .top_submenu li{background-image:none;color:#fff;padding: 15px 0;width:auto;}
.top_submenu li span{border-right: 1px solid #fff;padding: 5px 7px;}
.top_submenu{position: absolute;width:100%; padding:0;  left: 0;;top:44px;}
.srch_box{border: 1px solid #17a2d6;width:75px;float: left;height: 25px;margin:0 5px 0 0;position: relative;right: -25px;
z-index: 1;padding: 0 25px 0 5px;/* top:6px; */}
#srchIcon{cursor:pointer;position: relative;z-index: 9;right:4px;bottom: 1px;}
.logout{cursor:pointer;}
#myform{display:inline;}
.notify { margin-right: 8px; cursor: pointer;}
.top_submenu .last-child span {border: none !important;}
.prof_init { position: relative;}
.initialDrop { display: none;
  position: absolute;
   top: 52px;
  right: 0px;
  border: 1px solid #ccc;
  background: #fff;
  width: 13.6em; 
  z-index: 9;
}
.showDrop { display: block;}
  
.initialDrop li { list-style: none;}
.initialDrop li a {   padding: 12px 10px;   display: block; }
.initialDrop li a:focus, .initialDrop li a:hover { text-decoration: none; }
.license_mngr{background:coral;background-image:none !important;height: 44px;padding: 5px 0 0 13px !important;}
@media only screen  and (max-width : 767px) {
	.plus_bdr img { width: 24px; }
.top_menu ul li{float:none;width:101%;background-position: 98% 18px;position:relative;height:auto !important;z-index:9;}
/* .logout,.prof_init{display:none;} */
.top_menu ul{margin: 30px 5px 0 0px;display:none;}
.top_menu ul li { margin: 0;}
.top_menu{position: absolute; width: 100%; margin: 10px 0 0 0px;}
.top_submenu{  margin-top:0 !important; width: 100%;position:static;padding-left: 0;}
.top_submenu li span{border-right:none;}
}

@media only screen 
and (max-width : 767px) {
}

@media only screen 
and (max-width : 767px) {
.defaultImage{padding: 6px 0;}
.srch_box{right: 165px !important;   top: 62px !important;   position: absolute !important;}
#srchIcon{float: left;top: 55px;right:170px !important;}
.menuTog{display:block; float: left; margin-top: 50px;cursor:pointer;z-index: 9;position: relative;}
.gearIcon{display:none; float:left;margin:50px 0 0 10px;}

/*.container{min-width:97.4%;}*/
.notify{position:absolute;top:56px;right:35px;border:none;}
.user_prof {border-radius: 15px;font-size: 15px;height: 30px;padding: 6px 0;width: 30px;}
.user_initial{font-size:11px;}
.initialDrop { top: 33px;}
/* .quick_menu{display: block;position: absolute;top:0;right:32px;} */
.mL25{margin-left:-25px;}

/* .plus_bdr{display:none;} */
/* .plus_icon{display:block;} */
}
.top_menu li a { color: #fff; padding: 10px 0; display: block;}
.top_menu li li a { padding: 0;}
.top_menu li a:focus, .top_menu li a:hover { text-decoration: none;}
.notify img {border-radius: 20px}
.report_menu a, .noLink { cursor:default !important;}
</style>


<!-- mainpanel starts here-->
<div class="mainpanel TPRM_bg">
	<!-- headerbar starts here-->
	<div class="header_bar"><img src="images/TP_logo.png" class="mL25" alt="logo" border=0 /><span class="dispNone menuTog"><img src="images/menu.png" /></span><span class="dispNone gearIcon"><img src="images/gear.png" /></span>
	<span class="fr"><span id="srchIcon"><img src="images/header_search_normal.png"  /> </span>
	
		<input type="text" class="srch_box dispNone" /> 
		<span class="notify">			
			<span class="user_initial"> <%--  <%=session.getAttribute("loggedInUser")%>	<img src="images/header_dropdown_normal.png" /> --%>
			 		<%-- <img src="http://10.137.236.9:8080/standalone/HCL/userpreference/${userDTO.documentName}"  --%>
			 		
			 		<c:set var="image" value="${sessionScope.userImage}" />
			 		<c:choose>
			 		  <c:when test="${image eq 'null.null'}">
			 		    <span class="defaultImage" id="defaultImage1"><%=session.getAttribute("defaultName")%></span>   
			 		    <span  id="displayThumbnail" ><img src="${sessionScope.userPreferenceImage}"  width="26" height="26" /> </span> 
			 		  </c:when>
			 		  <c:otherwise>
			 		    
			 		  <img src="${sessionScope.userPreferenceImage}"  width="26" height="26" />  
			 		    <%-- <span class="defaultImage"><%=session.getAttribute("defaultName")%></span>  --%>
			 		  </c:otherwise>
			 		</c:choose>
			 		
			 		
                    <span class="user_initial_text"><%=session.getAttribute("loggedInUser")%></span>                     
                    <span class="caret"></splan>
			 	<span class="initialDrop">
			 		<form id="userPreferenceform" method="post" action="${pageContext.request.contextPath}/userPrefenceLoad">
						<li><a onClick="document.getElementById('userPreferenceform').submit();"><i	class="fa fa-caret-right"></i> My Preference</a></li>
					</form>	
					<form id="myform" method="post" action="/partnerintegrity/j_spring_security_logout">
						<li class="logout"><a onclick="document.getElementById('myform').submit();">Logout</a> </li>
					</form>	
			 	</span>			 
			 </span>
		</span>
	 	</span>
		<!-- <form id="myform" method="post" action="/partnerintegrity/logout"><span class="logout" onclick="document.getElementById('myform').submit();"><img src="images/logout_normal.png" alt="" /> Logout</span> </span>
		</form>		 --> 
	</div>	
	
	<!-- headerbar ends here--> 
	<!--- Menus starts here -->
	<div class="top_menu">
		<ul>
		<c:set var="test" value="${sessionScope.userIsInternal}" /> 
		 <c:choose>
                       <c:when test="${test eq 'true'}">
			<li class="home_menu" ><a href="${pageContext.request.contextPath}/homepage"><img src="images/icons/home.png" width="24" height="24" alt="" />Home</a></li>
			 </c:when>
                       <c:otherwise>
                       <li class="home_menu" ><a href="${pageContext.request.contextPath}/myactivities"><img src="images/icons/home.png" width="24" height="24" alt="" />Home</a></li>
		   
		     </c:otherwise>
                     </c:choose> 
			<sec:authorize access="hasAnyRole('9-READ', '9-CREATE', '9-EDIT', '9-DELETE')">
			
			<form id="searchExtorgform" method="post" action="${pageContext.request.contextPath}/searchthirdpartydirectory">
			<li class="patnrs_menu top_menu_ul"><a href="javascript:void(0);" onClick="document.getElementById('searchExtorgform').submit();"><img src="images/icons/Partners.png" width="24" height="24" alt=""/>Third party</a></li>
			</form>
			</sec:authorize>
			<li class="role_board board_menu top_menu_ul"><a href="javascript:void(0);"><img src="images/icons/Onboarding.png" width="24" height="24" alt="" />Onboard</a>
				<ul class="dispNone top_submenu">
				
				<sec:authorize access="hasAnyRole('1-APPROVE', '1-READ', '1-ASSIGN', '1-RESPOND', '1-DELETE')">
				<li><form id="questionnairesLinkform" method="post" action="${pageContext.request.contextPath}/assigndatacollection">
								<a onClick="document.getElementById('questionnairesLinkform').submit();"><span>Data Collection</span></a>
							</form></li>
				</sec:authorize>
				<%-- <li><form id="datacollection" method="post" action="${pageContext.request.contextPath}/datacollection"><a onClick="document.getElementById('datacollection').submit();"><span>Data Collection Response</span></a></form></li> --%>
				
					<sec:authorize access="hasAnyRole('5-SEARCH', '5-MANAGE', '5-ONGOING', '5-BATCHSCREEN')">
					<li class="noLink"><span>Validate & Review</span></li>
					</sec:authorize>
					
					<sec:authorize access="hasAnyRole('3-READ', '3-ASSIGN', '3-RESPOND', '3-DELETE')">
					<li>
					<form id="viewRemediationform" method="post" action="${pageContext.request.contextPath}/tasksassignedtome">
						<input type="hidden" name="displayrecievedtask" value="displayrecievedtask">
						<a onClick="document.getElementById('viewRemediationform').submit();">
						<span>Remediation</span></a>
					</form>
					</li>
					</sec:authorize>
					
					<sec:authorize access="hasAnyRole('4-APPROVE', '4-READ', '4-ASSIGN', '4-RESPOND', '4-DELETE', '4-DESIGN')">
					<li>
					<form id="contractSummeryform" method="post" action="${pageContext.request.contextPath}/contractsummary">
					<a onClick="document.getElementById('contractSummeryform').submit();"><span>Contracts</a></span>
					</form>
					</li>
					</sec:authorize>
				</ul>
			</li>
			<sec:authorize access="hasAnyRole('12-CREATE', '12-VIEW')">
			<li class="report_menu top_menu_ul"><a href="javascript:void(0);"><img src="images/icons/Reports.png" width="24" height="24" alt="" />Reports</a></li>
			</sec:authorize>
			<!-- <li class="mngmnt_menu top_menu_ul"><a href="javascript:void(0);"><img src="images/icons/Management.png" width="24" height="24" alt="" /> Management</a></li> -->
			
			<sec:authorize access="hasAnyRole('10-READ', '10-CREATE', '10-EDIT', '10-DELETE','7-READ', '7-DELETE', '7-CREATE', '7-EDIT','1-DESIGN','18-VIEW', '18-MANAGE','19-READ', '19-DELETE', '19-CREATE', '19-EDIT','8-READ', '8-DELETE', '8-CREATE', '8-EDIT')">
			<form id="displayManagementform" method="post" action="${pageContext.request.contextPath}/displaymanagement?param=displaymanagement">
						<li class="mngmnt_menu top_menu_ul"><a onClick="document.getElementById('displayManagementform').submit();"><img src="images/icons/Management.png" width="24" height="24" alt="Management" />
						Management</a></li>
					</form>
			</sec:authorize>
			<!-- <li class="top_menu_ul dispNone license_mngr"><a href="javascript:void(0);"> License Manager</a></li> -->
			<form id="licenseSummaryform" method="POST"
				action="${pageContext.request.contextPath}/licensemanager">
				<li class="top_menu_ul dispNone license_mngr"><a onClick="document.getElementById('licenseSummaryform').submit();">License Manager</a></li>
			</form>
		</ul>
		<!--<span class="quick_menu plus_bdr"><img src="images/Quick-menu.png" /></span> -->
		<c:set var="test" value="${sessionScope.userIsInternal}" /> 
		 <c:choose>
                       <c:when test="${test eq 'true'}">
                        <span class="quick_menu plus_icon"><img src="images/Quick-menu.png" /></span>
                        </c:when>
                       <c:otherwise>
		   
		     </c:otherwise>
                     </c:choose> 
	</div>
	<!--- Menus ends here -->
	

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>	
<script src="${pageContext.request.contextPath}/js/tprmDT.js"></script> 
<script>
// Header Menu Header Menu Header Menu Header Menu Header Menu



    jq(document).ready(function(){
    	
    	//Role 
    	console.log("length of li "+ jq('.top_menu ul li.board_menu ul').find('li').length);
    	
    	var dropmenulist = jq('.top_menu ul li.board_menu ul').find('li').length
    	
    	if(dropmenulist == 0 ) {
    		console.log('inside if');
    		jq('.role_board').css('display', 'none');
    	}
    	else if (dropmenulist == 2){
    		console.log('inside else 2');
    		jq('.top_submenu').css('width', '22em');
    		jq('.top_submenu li:last-child').addClass("last-child");
    	}
    	else if (dropmenulist == 3){
    		console.log('inside else 3');
    		jq('.top_submenu').css('width', '31em');
    		jq('.top_submenu li:last-child').addClass("last-child");
    	}
    	else if (dropmenulist == 4){
    		console.log('inside else 4');
    		jq('.top_submenu').css('width', '37em');
    		jq('.top_submenu li:last-child').addClass("last-child");
    	}
    	else {
    		console.log('inside else');
    		jq('.top_submenu li:last-child').addClass("last-child");
    	}
    	
    	
        //console.log("Rahul Doccclsdkmslk....");
        jQuery("#displayThumbnail").css("display","none");
	jq('.top_menu ul li').click(function(e){
		var li_class = jq(this).attr('class');
		jq('.top_submenu').hide();
		jq('.top_menu ul li').css('height','44px');
		jq(this).css('height','44px');
		jq(this).children('ul').addClass(li_class).show();
		
		e.stopPropagation();
		
	});

	jq('.notify').click(function(e){	
		
		
		jq(this).find('.initialDrop').toggle();
		
		e.stopPropagation();
		
	});
	
	
	
	jq('body').click(function(){
		jq('.top_menu ul li').css('height','44px');
		jq('.top_submenu').hide();
		jq('.initialDrop').hide();
			
	});
	jq('#srchIcon').click(function(){
		jq('.srch_box').animate({width: "175px", marginLeft: "0.6in" }, 250 ).show();
		
		});		
	jq('.menuTog').click(function(){
		jq('.top_menu ul').toggle();
		});
	
    });





    
// JavaScript Document

jQuery(function(){
		//console.log("RTahul headerrrr...");
		var user_initial = jQuery(".user_initial").text();
		user_initial = user_initial.split(' ');
		//console.log("user_initial "+user_initial);
		var fname = user_initial[0];
		var sname = user_initial[1];
		var initialfname  = fname.substring(0,1); 	
		var initialsname = sname.substring(0,1);
		var dynamicInitials = initialfname+initialsname;
		dynamicInitials = dynamicInitials.toUpperCase();
		jQuery(".user_prof").text(dynamicInitials);


	
});

</script>





	