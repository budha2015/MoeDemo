<!DOCTYPE HTML>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.png"
	type="image/png">

<title>Partner Integrity</title>

<link href="css/style.default.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-fileupload.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.tagsinput.css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->

</head>

<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">
			<i class="fa fa-spinner fa-spin"></i>
		</div>
	</div>

	<section>

		<div class="leftpanel">

			<div class="logopanel">
				<a href="#"><img
					src="${pageContext.request.contextPath}/images/img_logo.png"
					alt="Partner Integrity" border="0"></a>

			</div>
			<!-- logopanel -->

			<div class="leftpanelinner">

				<jsp:include page="leftPanel.jsp"></jsp:include>
				<!-- This is only visible to small devices -->
				<%-- <div class="visible-xs hidden-sm hidden-md hidden-lg">
					<div class="media userlogged">
						<img alt=""
							src="${pageContext.request.contextPath}/images/photos/loggeduser.png"
							class="media-object">
						<div class="media-body">
							<h4><%=session.getAttribute("loggedInUser")%></h4>

						</div>
					</div>

					<h5 class="sidebartitle actitle">Account</h5>
					<ul class="nav nav-pills nav-stacked nav-bracket mb30">
						<li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
						<li><a href=""><i class="fa fa-cog"></i> <span>Account
									Settings</span></a></li>
						<li><a href=""><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
						<li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign
									Out</span></a></li>
					</ul>
				</div> --%>

				<!-- <br>
				<ul class="nav nav-pills nav-stacked nav-bracket">
					<li><a href="#"><i class="fa fa-home"></i> <span>Home</span></a></li>
					<li class="nav-parent"><a href=""><i
							class="glyphicon glyphicon-plane"></i> <span>Onboarding</span></a>
						<ul class="children">
							<li><a href="#"><i class="fa fa-caret-right"></i> New
									Onboarding</a></li>
							<li><a href="#"><i class="fa fa-caret-right"></i> Data
									Collection</a></li>
							<li><a href="#"><i class="fa fa-caret-right"></i>
									Validation</a></li>
						</ul></li>
					<li><a href=""><i class="glyphicon glyphicon-map-marker"></i>
							<span>3P Organisations</span></a></li>
					<li><a href="#"><i class="glyphicon  glyphicon-ok"></i> <span>Remediations</span></a></li>
					<li><a href=""><i class="glyphicon glyphicon-pencil"></i>
							<span>Contracts</span></a></li>
				</ul> -->



			</div>
			<!-- leftpanelinner -->
		</div>
		<!-- leftpanel -->

		<div class="mainpanel">

			<div class="headerbar">

				<a class="menutoggle"><i class="fa fa-bars"></i></a>
				<form class="searchform" action="#" method="post">
					<input type="text" class="form-control" name="keyword"
						placeholder="Search here..." />
				</form>


				<div class="header-right">

					<ul class="headermenu">
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									<img
										src="${pageContext.request.contextPath}/images/photos/loggeduser.png"
										alt="" /> <%=session.getAttribute("loggedInUser")%> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
									<li><a href="#"><i class="glyphicon glyphicon-user"></i>
											My Profile</a></li>
									<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
											Account Settings</a></li>
									<li><a href="#"><i
											class="glyphicon glyphicon-question-sign"></i> Help</a></li>
								 <form id="myform" method="post" action="/partnerintegrity/logout">
									
 				<a href="#" onclick="javascript:logout();"><i class="glyphicon glyphicon-log-out"></i> Log Out</a>	</form>
								</ul>
							</div>
						</li>

						<li>
							<div class="btn-group">
								<button class="btn btn-default dropdown-toggle tp-icon"
									data-toggle="dropdown">
									<i class="glyphicon glyphicon-bell" style="color: #999999"></i>
									<span class="badge">1</span>
								</button>
								<div class="dropdown-menu dropdown-menu-head pull-right">
									<h5 class="title">You Have 1 New Notifications</h5>
									<ul class="dropdown-list gen-list">
										<li class="new"><a href=""> <span class="thumb"><img
													src="${pageContext.request.contextPath}/images/photos/user4.png"
													alt="" /></span> <span class="desc"> <span class="name">Zaham
														Sindilmaca <span class="badge badge-success">new</span>
												</span> <span class="msg">is now following you</span>
											</span>
										</a></li>
										<li class="new"><a href="">See All Notifications</a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- header-right -->

			</div>
			<!-- headerbar -->

			<div class="pageheader">
				<h2>Templates</h2>

			</div>
			
			<h2>Template Deleted Successfully</h2>
			<br>
			</div>

</div>
			Copyright © 2014 The Red Flag Group. All rights reserved.
	

	</section>


	<script
		src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/modernizr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/toggles.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/retina.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.cookies.js"></script>



	<script
		src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/wysihtml5-0.3.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap-wysihtml5.js"></script>

	<script src="js/custom.js"></script>
	<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
	<script>
    jQuery(document).ready(function(){
        // Chosen Select
        jQuery(".chosen-select").chosen({'width':'100%','white-space':'nowrap'});
    });
    
    jQuery('#acc').click(function(){
        jQuery('#cc').show();
        jQuery(this).hide();
        return false;
    });
    
    jQuery('#abcc').click(function(){
        jQuery('#bcc').show();
        jQuery(this).hide();
        return false;
    });
    
    // HTML5 WYSIWYG Editor
    jQuery('#wysiwyg').wysihtml5({color: true,html:true});
    
</script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.tagsinput.min.js"></script>
	<script>
jQuery(document).ready(function(){
    
  // Chosen Select
  jQuery(".chosen-select").chosen({'width':'100%','white-space':'nowrap'});
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  
  });
</script>
</body>
</html>
