<style>
.header_bar {background: #fff;width: 100%;padding: 10px 3px 15px 10px;}
/********Menu style *********/
.clr{clear:both;}
.flt{float:left;}
.flr{float:right;}
body{min-width:320px;max-width:1000px;margin:0 auto;}
.top_menu{margin:10px 0 0 0px;position:relative;}
.top_menu ul li{float:left;margin: 0 5px;padding: 10px 0;width: 13%;color:#fff;background-image:url(./images/icons/down_arrow.png);background-repeat:no-repeat;background-position: 97% 18px;cursor:pointer; }
.top_menu ul li img{margin: 0 5px 0 10px;}
.home_menu{background:#17a2d6; background-image:none !important;}
.patnrs_menu{background:#13a75e; background-image:none !important;}
.board_menu{background:#b05e9d;}
.report_menu{background:#e39344; background-image:none !important;}
.mngmnt_menu{background:#d83949; background-image:none !important;}
.quick_menu{float: right;margin: 0px 12px 0 0;}
.top_menu ul li .top_submenu li{background-image:none;color:#fff;padding: 15px 0;width:auto;}
.top_submenu li span{border-right: 1px solid #fff;padding: 5px 10px;}
.top_submenu{position: absolute;width:100%;padding: 0 0 0 27%;left: 0;top:50px;}
.srch_box{border: 1px solid #17a2d6;width:75px;float: left;height: 25px;border-radius: 5px;margin:6px 5px 0 0;position: absolute;right: 255px;
z-index: 1;padding: 0 25px 0 5px;}
#srchIcon{cursor:pointer;position: relative;z-index: 9;right:4px;bottom: 1px;}
.logout{cursor:pointer;}
#myform{display:inline;}

@media only screen 
and (max-width : 779px) {
.top_menu ul li{float:none;width:100%;background-position: 98% 18px;position:relative;height:auto !important;z-index:9;}
.logout,.prof_init{display:none;}
.srch_box{right:64px;top:57px;}
#srchIcon{float: left;top: 55px;right:70px;}
.menuTog{display:block; float: left; margin-top: 50px;cursor:pointer;z-index: 9;position: relative;}
.gearIcon{display:none; float:left;margin:50px 0 0 10px;}
.top_menu ul{margin: 30px 5px 0 0px;display:none;}
.top_menu{position: absolute; width: 100%; margin: 10px 0 0 0px;}
.top_submenu{  margin-top:0 !important; width: 100%;position:static;padding-left: 0;}
.top_submenu li span{border-right:none;}
/*.container{min-width:97.4%;}*/
.notify{position:absolute;top:54px;right:3px;border:none;}
.user_prof {border-radius: 15px;font-size: 15px;height: 30px;padding: 6px 0;width: 30px;}
.user_initial{font-size:11px;}
.quick_menu{display: block;position: absolute;top:0;right:32px;}
.mL25{margin-left:-25px;}
.plus_bdr{display:none;}
.plus_icon{display:block;}
}

</style>


<!-- mainpanel starts here-->
<div class="mainpanel TPRM_bg">
	<!-- headerbar starts here-->
	<div class="header_bar"> <a href=""><img src="images/TP_logo.png" class="mL25" alt="logo" border=0 /></a><span class="dispNone menuTog"><img src="images/menu.png" /></span><span class="dispNone gearIcon"><img src="images/gear.png" /></span>
	<span class="fr"><span id="srchIcon"><img src="images/header_search_normal.png"  /> </span>
	
		<input type="text" class="srch_box dispNone" /> 
		<span class="notify">
			 <span class="user_prof">RK</span>
			 <span class="prof_init">
			 	<span class="user_initial"><%=session.getAttribute("loggedInUser")%>
			 	<img src="images/header_dropdown_normal.png" />
			 	
			 </span>
		</span>
	 
		<form id="myform" method="post" action="/partnerintegrity/logout"><span class="logout" onclick="document.getElementById('myform').submit();"><img src="images/logout_normal.png" alt="" /> Logout</span> </span>
		</form>
		 
	</div>
	
	
	
	<!-- headerbar ends here--> 
	<!--- Menus starts here -->
	<div class="top_menu">
		<ul>
			<li class="home_menu"><img src="images/icons/home.png" width="24" height="24" alt="" />Home</li>
			<li class="patnrs_menu"><img src="images/icons/Partners.png" width="24" height="24" alt=""/>Third party</li>
			<li class="board_menu"><img src="images/icons/Onboarding.png" width="24" height="24" alt="" />Onboard
				<ul class="dispNone top_submenu">
					<li><span>Data Collection</span></li>
					<li><span>Validate & Review</span></li>
					<li><span>Remediation</span></li>
					<li><span>Contracts</span></li>
				</ul>
			</li>
			<li class="report_menu"><img src="images/icons/Reports.png" width="24" height="24" alt="" />Reports</li>
			<li class="mngmnt_menu"><img src="images/icons/Management.png" width="24" height="24" alt="" /> Management</li>
		</ul>
		<span class="quick_menu plus_bdr"><img src="images/Quick-menu.png" /></span>
		<span class="quick_menu dispNone plus_icon"><img src="images/Quick.png" /></span>
	</div>
	<!--- Menus ends here -->
	

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>	
<script src="${pageContext.request.contextPath}/js/tprmDT.js"></script> 
<script>
// Header Menu Header Menu Header Menu Header Menu Header Menu

var jq=$.noConflict();

    jq(document).ready(function(){
        //console.log("Rahul Doccclsdkmslk....");
	jq('.top_menu ul li').click(function(e){
		var li_class = jq(this).attr('class');
		jq('.top_submenu').hide();
		jq('.top_menu ul li').css('height','43px');
		jq(this).css('height','50px');
		jq(this).children('ul').addClass(li_class).show();
		
		e.stopPropagation();
		
	});
	jq('body').click(function(){
		jq('.top_menu ul li').css('height','43px');
		jq('.top_submenu').hide();
			
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





	