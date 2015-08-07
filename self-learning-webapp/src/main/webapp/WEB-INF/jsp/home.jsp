<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<style>

.sitMap{
width: 92%;
background: rgba(108, 68, 68, 0);
position: absolute;
margin: 12px 27px;
overflow:hidden;

}

.boxesInner{
display: block;
background: rgba(139, 112, 112, 0.15);
margin-top: 25px;
padding: 20px 0 30px;
}

ul.hyperlinkContainerlist{position: relative;
left: 4em;
  padding-right: 5em;
  line-height: 1.5;}


ul.hyperlinkContainerlist li{margin-top: 1em;}

.headerImageDiv{padding-left: 20px;
padding-top: 9px;}


.sitMap a{color:black; cursor:pointer;}
.sitMap a:hover{text-decoration: none;}

.homePosition{display: inline-block;
font-size: 19px;
padding: 2px 5px;
color:black;}

.container { /* min-height: 740px !important; */ }

.home_blocks { display: none;}
.mainpanel {/*  min-height: 850px !important; */}
.width55 {width: 100%;}
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
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css" />
<link rel="stylesheet" href="css/dashboardTP.css" />
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
    	<div class="fl">
		  <div class="new_container">
			  <div class="TPRM_form">
			    <div class="TPRM_header">
			      <p>My Activities </p>
			    </div>
			    <div class="TPRM_cont pT0">
			    <table class="third_party_table">
			    <tr>
			    <th>Task</th>
			    <th>Status</th>
			    <th>Data Received</th>
			    <th>Data Submitted</th>
			    </tr>
			    <tr>
			    <td>Aaa Questionnaire</td>
			    <td>New</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Remediation task</td>
			    <td>Pending</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Bac Questionnaire</td>
			    <td>Submitted</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Remediation task</td>
			    <td>Accepted</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Ecc Questionnaire</td>
			    <td>In progress</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Remediation task</td>
			    <td>Completed</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Abc Questionnaire</td>
			    <td>Submitted</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Remediation task</td>
			    <td>Completed</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Abc Questionnaire</td>
			    <td>Submitted</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    <tr>
			    <td>Remediation task</td>
			    <td>Completed</td>
			    <td>dd/mm/yyyy</td>
			    <td>dd/mm/yyyy</td>
			    </tr>
			    </table>
			    </div>
			    
			  </div>
		  </div>
		  
		  </div>		  
  </div>
	
  
  <jsp:include page="footer.jsp"></jsp:include>
  
  
</div>




<!-- mainpanel --> 
<script src="js/jquery-1.10.2.min.js"></script> 
<script src="js/jquery.mCustomScrollbar.min.js"></script>
<script src="js/jquery.mousewheel.js"></script>
<script src="js/jquery-ui-1.11.0.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/custom.js"></script> 
<script src="js/tprm.js"></script> 
	
<script>
jQuery(document).ready(function(){

	//Button Participant
	 jQuery('.btn-recepient').click(function(e){
		 e.stopPropagation();
		 e.preventDefault();
		jQuery(this).siblings('.rName-detail').toggle();
		jQuery(this).toggleClass('toggle');	
	 });

	 function showPopup(clsName){
		   var windowWidth = document.documentElement.clientWidth;
		   var windowHeight = document.documentElement.clientHeight;
		   var popupHeight = jQuery('.'+clsName).height();
		   var popupWidth = jQuery('.'+clsName).width();
		   jQuery('.'+clsName).css({"position": "absolute","top": windowHeight*.5-popupHeight*.5,"left": windowWidth*.5-popupWidth*.5});
		   jQuery('.'+clsName).show();
		jQuery('.popupBg').show();
		   //this is needed for ie6
		   jQuery(".popupBg").css({ "height": windowHeight });
		}

	//This will disable the popup when needed
	 function hidePopup(clsName){
		 jQuery('.'+clsName).hide();
		 jQuery('.popupBg').hide();
	 }
	
	/* file upload  script starts */
	function fileUpload()
	{
		jQuery(".browseBtn").click(function(){
			alert();	
		var file=(jQuery(this).parent().find('.file'));
		var uploadText=(jQuery(this).parent().find('.uploadText'));
		jQuery(file).trigger('click');
		jQuery(file).change(function(){
			if((jQuery(file).val()))
			{
				jQuery(uploadText).val(jQuery(file).val());
			}
		    });	
		});
	}
	/* file upload  script ends  */
});
</script>

</body>

</html>
