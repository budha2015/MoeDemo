<style>

.user_prof{background: #11b2aa;
border-radius: 20px;
display: inline-block;
height: 26px;
vertical-align: middle;
width: 28px;
color: #fff;
font-family: trebuchet ms;
font-size: 17px;
padding: 1px 0;}

</style>

<div class="headerbar">

				<a class="menutoggle"><i class="fa fa-bars"></i></a>
				<form class="searchform" action="#" method="get">
					<input type="text" class="form-control" name="keyword"
						placeholder="Search here..." />
				</form>


				<div class="header-right">

					 <ul class="headermenu">
                  <li>
                     <div class="btn-group" >
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        
                        <span class="user_prof"></span>
                        <span class="loggedUserName"><%=session.getAttribute("loggedInUser")%></span>
                        <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                           <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                           <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                           <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                           <li><a href="#"><form id="myform" method="post" action="/partnerintegrity/logout"><span  onclick="javascript:logout();">
											
 									<i class="glyphicon glyphicon-log-out"></i> Log Out</span>
 											 												
 												
											</form></a></li>
                        </ul>
                     </div>
                  </li>
                  <li>
                     <div class="btn-group">
                        <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-bell" style="color:#999999"></i>
                        <span class="badge">1</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-head pull-right">
                           <h5 class="title">You Have 1 New Notifications</h5>
                           <ul class="dropdown-list gen-list">
                              <li class="new">
                                 <a href="">
                                 <span class="thumb"><img src="${pageContext.request.contextPath}/images/photos/user4.png" alt="" /></span>
                                 <span class="desc">
                                 <span class="name">Zaham Sindilmaca <span class="badge badge-success">new</span></span>
                                 <span class="msg">is now following you</span>
                                 </span>
                                 </a>
                              </li>
                              <li class="new"><a href="">See All Notifications</a></li>
                           </ul>
                        </div>
                     </div>
                  </li>
               </ul>
					
					
			</div>
			<!-- header-right -->

		</div>


<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/header.js"></script>


<script>

// JavaScript Document

jQuery(function(){

	var loggedUserName = jQuery(".loggedUserName").text();
	loggedUserName = loggedUserName.split(' ');
	console.log("loggedUserName "+loggedUserName);
	var fname = loggedUserName[0];
	var sname = loggedUserName[1];
	var initialfname  = fname.substring(0,1); 	
	var initialsname = sname.substring(0,1);
	var dynamicInitials = initialfname+initialsname;
	dynamicInitials = dynamicInitials.toUpperCase();
	jQuery(".user_prof").text(dynamicInitials);
});

</script>





 
 
 		