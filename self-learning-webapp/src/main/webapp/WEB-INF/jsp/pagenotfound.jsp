<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link rel="stylesheet" href="css/jquery-ui-1.11.0.css" />
<link rel="stylesheet" href="css/tprm.css" />
<style>
.notfoundpanel {
    text-align: center;
    margin-top: 10%;
    width: 600px;
    margin: 10% auto 0 auto;
}

.notfoundpanel h1 {
    font-size: 130px;
    font-family: 'LatoBold', sans-serif;
    color: #333;
    margin: 0;
    line-height: 130px;
}

.notfoundpanel h3 {
    color: #333;
    margin: 0;
}

.notfound h4 {
    font-size: 14px;
}

.notfoundpanel form {
    width: 350px;
    margin: 20px auto 0 auto;
}

.notfoundpanel .form-control {
    width: 250px;
    float: left;
}
</style>
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

<!-- leftpanel starts here--> 

<!-- leftpanel ends here--> 

<!-- mainpanel starts here-->
<div class="mainpanel TPRM_bg"> 
  
  <!-- headerbar starts here-->
  <div class="header_bar"> <a href="/partnerintegrity"><img src="images/TP_logo.png" alt="logo" class="mL25" border=0 /></a><span class="dispNone menuTog"><img src="images/menu.png" /></span>  </div>
  
  <!-- headerbar ends here--> 
  <!--- Menus starts here -->
  
  
  <!--- Menus ends here --> 
  
  <!-- container starts here-->
  
  
  
  
  
  
  
  
  
  
  
  <div class="container">
     <div class="notfoundpanel">
    <h1>404!</h1>
    <h3>The page you are looking for has not been found!</h3>
    <h4>The page you are looking for might have been removed, had its name changed, or unavailable. <br /> </h4>
    <br>
	<a href="/partnerintegrity" target="_self">Click here to navigate to homepage</a>
  </div><!-- notfoundpanel -->
  </div>
  <!-- container -->
  
  <div class="footer">&copy; 2014 The Red Flag Group. All rights reserved. </div>
</div>

<!-- mainpanel --> 
<script src="js/jquery-1.10.2.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/custom.js"></script> 
<script src="js/tprm.js"></script> 

<script>
var jq  = jQuery.noConflict();

jq(document).ready(function(){

	jq(document).on('change','#confirmation_chk',function(){
		
		if(jq(this).is(":checked")){
			jq('.saveKeyPrincipal').removeClass('dissable').addClass('enable');
		}else{
			jq('.saveKeyPrincipal').removeClass('enable').addClass('dissable');
		}
	});
	
	
	//jq('.overlayUnclickable').removeClass('hide').show();
	//jq('.addKeyPrinciplePopUp').removeClass('hide').show();
	
	jq(document).on('click','.addKeyPrinciple', function(e){
		e.preventDefault();
		e.stopPropagation();
		console.log("Casasased...");
			jq('.overlayUnclickable').removeClass('hide').show();
			jq('.addKeyPrinciplePopUp').removeClass('hide').show();
			jq('#confirmation_chk').attr('checked', false);
			jq('.saveKeyPrincipal').removeClass('enable').addClass('dissable');
	});
	
	
	jq('.addKeyPrinciplePopUp').on('click','.cancelPopUp',function(){
		jq('.addKeyPrinciplePopUp').hide();
		jq('.overlayUnclickable').hide();
		
	});
	
	var fullName, nameLocal, rolePrincipal, counrtyP, principleDOP , insertParent , cloneThis;
	jq(document).on('click','.addKeyPrinciplePopUp .saveKeyPrincipal.enable',function(){
		fullName = jq('.firstname').val() +" "+ jq('.lastName').val();
		nameLocal = jq('.localName').val();
		rolePrincipal = jq('.rolePrincipal').val();
		counrtyP = jq('.countryPrincipal').val();
		principleDOP = jq('.dateOFBirth').val();
		
		insertParent = jq('.kpContainer .col-md-4:last');
		cloneThis = "<div class='col-md-4'> <div class='leftColFields'> <label class='txt_bold'>Name</label> <label class='labelDetail'>"+fullName+"</label> </div><div class='leftColFields'> <label class='txt_bold'>Name in local language</label> <label class='labelDetail'>"+nameLocal+"</label> </div><div class='leftColFields'> <label class='txt_bold'>Role</label> <label class='labelDetail'>"+rolePrincipal+"</label> </div><div class='leftColFields'> <label class='txt_bold'>Country</label> <label class='labelDetail'>"+counrtyP+"</label> </div><div class='leftColFields'> <label class='txt_bold'>Date of birth</label> <label class='labelDetail'>"+principleDOP+"</label> </div></div>";
		
		jq(cloneThis).insertAfter(insertParent);
		jq('.addKeyPrinciplePopUp').hide();
		jq('.overlayUnclickable').hide();
		console.log( fullName + nameLocal + rolePrincipal + counrtyP + principleDOP );
		
		
		jq('.firstname, .lastName, .localName, .rolePrincipal').val('');
		jq('.dateOFBirth').val('dd/mm/yyyy');
		jq('.countryPrincipal').val(jq('.countryPrincipal option:first').val());
		jq('.addKeyPrinciplePopUp .customSelectWrapper .customSelectClick').text(jq('.countryPrincipal option:first').val());
		
		
	});
	
	
		
	jq(document).on('click','.successLicenseStandalone',function(){
		jq('.overlayUnclickable').removeClass('hide').show();
		jq('.licenseSucessStandalonePopUp').removeClass('hide').show();
		
	});
	
	jq(document).on('click','.licenseSucessStandalonePopUp .cancelPopUp ,.licenseSucessStandalonePopUp .saveKeyPrincipal',function(){
		jq('.overlayUnclickable').hide();
		jq('.licenseSucessStandalonePopUp').hide();
		
	});
	
	
	
	
});

</script>



</body>
</html>











