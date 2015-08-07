<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<style>


.sitMap{
width: 94%;
background: rgba(108, 68, 68, 0);
margin: 12px 27px;
overflow:hidden;

}

.boxesInner{
display: block;
background: rgba(139, 112, 112, 0.15);
margin-top: 25px;
/* padding: 20px 0 30px; */
min-height: 183px;
}

ul.hyperlinkContainerlist{position: relative;
  line-height: 1.5;}


ul.hyperlinkContainerlist li{margin-top: 1em;}
ul.hyperlinkContainerlist li a { display: block; text-align: center; padding: 70px 0;}
.headerImageDiv{padding-left: 20px;
padding-top: 9px;}


.sitMap a{color:black; cursor:pointer;}
.sitMap a:hover{text-decoration: none;}

.homePosition{display: inline-block;
font-size: 19px;
padding: 2px 5px;
color:black;}



.home_blocks { display: none;}
.quest-block { padding: 20px 0; }
.remediation-block { padding: 50px 0;}
.quest-block li a, .remediation-block li a { text-align: left !important; padding: 0 42px !important;}
.headerImageDiv { padding-left: 40px !important;}
.masterDataBlock { display: none;}
/* .masterDataBlock li a { padding: 70px 15px;} */
.masterDataBlock li a { cursor:default;}
.masterDataBlock li a:visited { text-decoration: none;}
.displayPad{ padding: 0px !important; padding-top: 38px !important;}
.brPos{position: relative;left: -21px;}
.linkActive{cursor:pointer !important}


@media only screen 
and (max-width : 990px) {


	}
@media only screen 
and (max-width : 767px) {
.boxesInner { min-height: 10px;}
ul.hyperlinkContainerlist li a {  padding: 20px 0; }
.quest-block li a, .remediation-block li a { text-align: center !important; padding: 0 !important;}
.headerImageDiv { padding-left: 0 !important; text-align:center;}
.remediation-block {  padding: 20px 0; }
}
</style>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link rel="stylesheet" href="css/jquery-ui-1.11.0.css" />
<link rel="stylesheet" href="css/tprm.css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->

</head>
 
 
      
<body>



<!-- Preloader starts here-->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>
<!-- Preloader end here--> 

 
  
  	<jsp:include page="header.jsp"></jsp:include>
  
  
  
  
  
  <!-- container starts here-->
  <div class="container">
    <div class="containerPanel clearfix">
  <div class="sitMap">
			
			
			<!--<div class="row">
					<div class="col-md-3">
					<div class="boxesInner">
						
						<div class="headerImageDiv"><img src="images/internal_selected.png"><span><b> Partners</b></span></div>
						
						<ul class="hyperlinkContainerlist">
							<form id="searchExtorgform" method="post" action="${pageContext.request.contextPath}/searchexternalorganisation">
								<li><a onClick="document.getElementById('searchExtorgform').submit();"><i class="fa fa-caret-right"></i> Third Party</a></li>
							</form>
							<form id="searchuserform" method="POST" action="${pageContext.request.contextPath}/searchuser">
								<li><a onClick="document.getElementById('searchuserform').submit();"><i	class="fa fa-caret-right"></i>Contacts</a></li>
							</form>							
						</ul>
					</div>
					</div>
				</div> -->
				<div class="mgmt-block">
					<div class="row">
						<%-- <div class="col-sm-4">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="searchorgform" method="post" 	action="${pageContext.request.contextPath}/searchmyorganisation">
									<li><a onClick="document.getElementById('searchorgform').submit();"><i class="fa fa-caret-right"></i> My Organisation</a></li>
								</form>
							</ul>
							</div>
						</div> --%>
						<sec:authorize access="hasAnyRole('10-READ', '10-CREATE', '10-EDIT', '10-DELETE')">
						<div class="col-sm-4">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="searchorgform" method="post" 	action="${pageContext.request.contextPath}/postmyorganisation">
									<li><a onClick="document.getElementById('searchorgform').submit();"><i class="fa fa-caret-right"></i> My Organisation</a></li>
								</form>
							</ul>
							</div>
						</div>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('7-READ', '7-DELETE', '7-CREATE', '7-EDIT')">
						<div class="col-sm-4">
						<div class="boxesInner">
						
							<ul class="hyperlinkContainerlist">
								<form id="searchuserform" method="POST" action="${pageContext.request.contextPath}/searchuser">
								    <input type="hidden" name="userMgmtSearch" value="users"/>
									<li><a onClick="document.getElementById('searchuserform').submit();"><i class="fa fa-caret-right"></i>Users</a></li>
								</form>	
							</ul>
						
						</div>
						
					</div>
					</sec:authorize>
						<%-- <div class="col-sm-4">
							<div class="boxesInner remediation-block">
							<div class="headerImageDiv">Remediation</div>
							<ul class="hyperlinkContainerlist">
								<form id="remediationconfigureform" method="post"
									action="${pageContext.request.contextPath}/remediationconfigure">
									<li><a onClick="document.getElementById('remediationconfigureform').submit();"><i class="fa fa-caret-right"></i> Configure</a></li>
								</form>
							</ul>
							</div>
						</div> --%>
						<sec:authorize access="hasRole('1-DESIGN')">
						<div class="col-sm-4">
							<div class="boxesInner quest-block">
							<ul class="hyperlinkContainerlist">
								<form id="questionnairesSetupform" method="post" action="${pageContext.request.contextPath}/datacollection">
									<li><a onClick="document.getElementById('questionnairesSetupform').submit();"><i class="fa fa-caret-right"></i> Data collection design</a></li>
								</form>
								<form id="questionnairesBankform" method="post" action="${pageContext.request.contextPath}/displayquestionbank">
									<li><a onClick="document.getElementById('questionnairesBankform').submit();"><i class="fa fa-caret-right"></i> Question Bank</a></li>
								</form>
								<form id="questionnairesform" method="post" action="${pageContext.request.contextPath}/retrievequestioncategory">
									<li><a onClick="document.getElementById('questionnairesform').submit();"><i class="fa fa-caret-right"></i> Question Category</a></li>
								</form>
<%-- 								<form id="businesscaseform" method="post" action="${pageContext.request.contextPath}/datacollection">
									<input type="hidden" name="businesCase"/> 
									<li><a onClick="document.getElementById('businesscaseform').submit();"><i class="fa fa-caret-right"></i> Business Case Design </a></li>		
								</form> --%>
							</ul>
							</div>
						</div>
						</sec:authorize>
						<%-- <div class="col-md-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="questionnairesBankform" method="post" action="${pageContext.request.contextPath}/displayquestionbank">
									<li><a onClick="document.getElementById('questionnairesBankform').submit();"><i class="fa fa-caret-right"></i> Question Bank</a></li>
								</form>
							</ul>
							</div>
						</div>
						<div class="col-md-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="questionnairesform" method="post" action="${pageContext.request.contextPath}/retrievequestioncategory">
									<li><a onClick="document.getElementById('questionnairesform').submit();"><i class="fa fa-caret-right"></i> Question Category</a></li>
								</form>
							</ul>
							</div>
						</div>	 --%>				
						<sec:authorize access="hasAnyRole('18-READ', '18-CREATE', '18-DELETE', '18-EDIT')">
						<div class="col-sm-4">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="dmsform" method="post" action="${pageContext.request.contextPath}/dmsflow">
									<li><a onClick="document.getElementById('dmsform').submit();"><i class="fa fa-caret-right"></i> Document Repository </a></li>
								</form>
							</ul>
							</div>
						</div>
						</sec:authorize>
						
						<sec:authorize access="hasAnyRole('19-READ', '19-DELETE', '19-CREATE', '19-EDIT')">
						<div class="col-sm-4">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">							
									<form>
										<li>
											<a class="showMasterData" href="javascript:void(0);">
											<i class="fa fa-caret-right"></i>Configure System Fields</a>
										</li>	
									</form>
									
																	
							</ul>
							</div>
						</div>
						</sec:authorize>
					<!-- Role Management Link -->
					<sec:authorize access="hasAnyRole('8-READ', '8-DELETE', '8-CREATE', '8-EDIT')">
						<div class="col-sm-4">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
									<form id="roleform" method="post"
										action="${pageContext.request.contextPath}/rolesummary">
										<li><a
											onClick="document.getElementById('roleform').submit();">
												<i class="fa fa-caret-right"></i> Role Management
										</a></li>
									</form>

								</ul>
							</div>
						</div>
						</sec:authorize>
					
								<!-- Email Template Configuration -->
							<sec:authorize access="hasAnyRole('20-READ', '20-DELETE', '20-CREATE', '20-EDIT')">
							<div class="col-sm-4">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
									<form id="emailTemplateForm" method="post"
										action="${pageContext.request.contextPath}/getETemplateList">
										<li><a
											onClick="document.getElementById('emailTemplateForm').submit();">
												<i class="fa fa-caret-right"></i> Email Template Configuration
										</a></li>
									</form>

								</ul>
							</div>
						</div>
						</sec:authorize>
					</div>
				</div>
				
				
				<div class="masterDataBlock">
					<div class="row">
						<div class="col-md-12">
							<a class="back_link" onclick="goBack();" href="javascript:void(0);">Go Back</a>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">							
								<form id="addresstype" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="Address Type"/>
									<li><a class="linkActive" onClick="document.getElementById('addresstype').submit();"><i	class="fa fa-caret-right"></i> Address Type </a></li>
								</form>
							</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="organisationbusiness" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="OrganisationBusiness"/>
									<li><a class="linkActive" onClick="document.getElementById('organisationbusiness').submit();"><i	class="fa fa-caret-right"></i> Oganisation Business </a></li>
							</form>
							</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="organisationindustry" method="post" action="${pageContext.request.contextPath}/masterdatadisplay">
									<input type="hidden" name="name" value="OrganisationIndustry"/>
									<li><a class="linkActive" onClick="document.getElementById('organisationindustry').submit();"><i	class="fa fa-caret-right"></i>Organisation Industry </a></li>
								</form>
							</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="organisationsource" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="OrganisationSource"/>
									<li><a class="linkActive" onClick="document.getElementById('organisationsource').submit();"><i	class="fa fa-caret-right"></i> Organisation Source </a></li>
								</form>
							</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="boxesInner">							
							<ul class="hyperlinkContainerlist">
								<form id="organisationstructure" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="OrganisationStructure"/>
									<li><a class="linkActive" onClick="document.getElementById('organisationstructure').submit();"><i	class="fa fa-caret-right"></i> Org Structure Attribute </a></li>
								</form>
							</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="organisationtype" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="OrganisationType"/>
									<li><a class="linkActive" onClick="document.getElementById('organisationtype').submit();"><i	class="fa fa-caret-right"></i> Organisation Type </a></li>
								</form>
							</ul>
							</div>
						</div>								
						
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="orgrelmaster" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="OrganisationUserRelationship"/>
									<li><a class="linkActive" onClick="document.getElementById('orgrelmaster').submit();"><i	class="fa fa-caret-right"></i> Org User Relation Type </a></li>
								</form>
							</ul>
							</div>
						</div>
						
							
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="relationshiptype" method="POST" action="${pageContext.request.contextPath}/displayaddresstype">
									<input type="hidden" name="name" value="RelationshipType"/>
									<li><a class="linkActive" onClick="document.getElementById('relationshiptype').submit();"><i	class="fa fa-caret-right"></i> Relation Type </a></li>
								</form>
							</ul>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="userrelationtype" method="post" action="${pageContext.request.contextPath}/masterdatadisplay">
									<input type="hidden" name="name" value="UserRelationType"/>
									<li><a class="linkActive" onClick="document.getElementById('userrelationtype').submit();"><i	class="fa fa-caret-right"></i>User Relation Type </a></li>
								</form>
							</ul>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								<form id="vendorType" method="post" action="${pageContext.request.contextPath}/masterdatadisplay">
									<input type="hidden" name="name" value="VendorType"/>
									<li><a class="linkActive" onClick="document.getElementById('vendorType').submit();"><i	class="fa fa-caret-right"></i>Vendor Type </a></li>
								</form>
							</ul>
							</div>
						</div>
											
							
						<div class="col-sm-3">
							<div class="boxesInner">
							<ul class="hyperlinkContainerlist">
								
								<form id="businessRegionform" method="POST" action="${pageContext.request.contextPath}/businessRegion">
									<li>
										<a class="linkActive" onClick="document.getElementById('businessRegionform').submit();">
										<i class="fa fa-caret-right"></i>Business Region</a>
									</li>
								</form>	
								
								
								
							</ul>
							</div>
						</div>
						
					</div>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- <div class="col-md-3 home_blocks block_admin">
					<div class="boxesInner">
						
						<div class="headerImageDiv"><img src="images/Partner-Management_selected.png"> <span><b>Admin</b></span></div>
						
						<ul class="hyperlinkContainerlist">							
							<a href="javascript:void(0);"><li>Address Type</li></a>
							<a href="javascript:void(0);"><li>Oganisation Business</li></a>
							<a href="javascript:void(0);"><li>Organisation Industry</li></a>
							<a href="javascript:void(0);"><li>Organisation Source</li></a>
							<a href="javascript:void(0);"><li>Organisation Structure Attribute</li></a>	
						</ul>
					</div>
				</div>
				<div class="col-md-3 home_blocks block_admin">
					<div class="boxesInner">
						
						<div class="headerImageDiv"><img src="images/Partner-Management_selected.png"> <span><b>Admin</b></span></div>
						
						<ul class="hyperlinkContainerlist">							
							<a href="javascript:void(0);"><li>Organisation Type</li></a>
							<a href="javascript:void(0);"><li>Organisation User Relation Type</li></a>
							<a href="javascript:void(0);"><li>Relationship Type</li></a>
							<a href="javascript:void(0);"><li>User relation Type</li></a>
							<a href="javascript:void(0);"><li>Vendor Type</li></a>	
						</ul>
					</div>
				</div> -->
				
				
			</div>
			
			
			
		
	</div>
	</div>
  
	
  
  <jsp:include page="footer.jsp"></jsp:include>
  
  

<!-- mainpanel --> 
<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/modernizr.min.js"></script>
	<script src="js/jquery.sparkline.min.js"></script>
	<script src="js/toggles.min.js"></script>
	<script src="js/retina.min.js"></script>
	<script src="js/jquery.cookies.js"></script>

	<script src="js/chosen.jquery.min.js"></script>
	<script src="js/wysihtml5-0.3.0.min.js"></script>
	<script src="js/bootstrap-wysihtml5.js"></script>
	<script src="js/tprmDT.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/commonvalidation.js"></script>
	<script>
	jQuery(window).load(function(){
		
		jQuery(".mainpanel.TPRM_bg").css({'min-height':'650px'});
		
	});
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
    
    function goBack(e) {
    	console.log("Back...");
    	jQuery('.masterDataBlock').fadeOut(600).hide();
		jQuery('.mgmt-block').fadeIn(600).show();
    }
    
</script>
	<script src="js/jquery.tagsinput.min.js"></script>
	<script>
jQuery(document).ready(function(){
    
  // Chosen Select
  jQuery(".chosen-select").chosen({'width':'100%','white-space':'nowrap'});
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});

	
	
	jQuery('.showMasterData').click(function(){
		jQuery('.mgmt-block').fadeOut(600).hide();
		jQuery('.masterDataBlock').fadeIn(600).show();
        return false;
    });
  
});
 
</script>

</body>

</html>
