<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>Partner Integrity</title>

  <link href="css/style.default.css" rel="stylesheet">
  <link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
  <link rel="stylesheet" href="css/bootstrap-fileupload.min.css" />
  <link rel="stylesheet" href="css/jquery.tagsinput.css" />

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body>
    
<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<section>
  
  <div class="leftpanel">
    
    <div class="logopanel">
        <a href="#"><img src="images/img_logo.png" alt="Partner Integrity" border="0"></a>
        
    </div><!-- logopanel -->
        
    <%-- <div class="leftpanelinner">    
        
        <jsp:include page="leftPanel.jsp"></jsp:include>
  </div> --%><!-- leftpanel -->
</div>  
  <div class="mainpanel">
    
    <div class="headerbar">
      
     <%-- <a class="menutoggle"><i class="fa fa-bars"></i></a>
      <form class="searchform" action="#" method="post">
        <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
      </form>
      
      
   <div class="header-right">
      
        <ul class="headermenu">
          <li>
            <div class="btn-group" >
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/photos/loggeduser.png" alt="" />
                <%=session.getAttribute("loggedInUser")%>
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                 <form id="myform" method="post" action="/partnerintegrity/logout">
									
 				<a href="#" onclick="javascript:logout();"><i class="glyphicon glyphicon-log-out"></i> Log Out</a>	</form>
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
                    <span class="thumb"><img src="images/photos/user4.png" alt="" /></span>
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
      </div><!-- header-right --> 
      
    </div><!-- headerbar --> --%>
    </div>
    <div class="pageheader">
      <h2>  Set security questions </h2>
      
    </div>
    
    <div class="signuppanel">
        
        <div class="row">
            
            <!-- col-sm-6 -->
            
            <div class="col-lg-12">
                
                <form method="post" action="/partnerintegrity/savesecurity" name="myForm" onsubmit="return(validate());">
                
                <%--  <input type="hidden" name="user_id" value="${userID}" />    --%> 
                    <div class="mb10">
                        <label class="control-label">Enter first security Question <span style="color:#FF0000;" >*</span></label>
                        <input type="text" class="form-control" name="securityQuestion1" value="${user.securityQuestion1}"/>
                    </div>
                     <div class="mb10">
                        <label class="control-label">Answer1 <span style="color:#FF0000;" >*</span></label>
                        <input type="text" class="form-control" name="securityAnswer1" value="${user.securityAnswer1}"/>
                    </div>
                    
                    <div class="mb10">
                        <label class="control-label">Enter Second security Question <span style="color:#FF0000;" >*</span></label>
                        <input type="text" class="form-control" name="securityQuestion2" value="${user.securityQuestion2}"/>
                    </div>
                     <div class="mb10">
                        <label class="control-label">Answer2 <span style="color:#FF0000;" >*</span></label>
                        <input type="text" class="form-control" name="securityAnswer2" value="${user.securityAnswer2}"/>
                    </div>
                                   
                    
                    
                    
                    
                    <br/>
                    <div class="row mb10" >
                    	<div class="col-sm-4">
                             <button class="btn btn-danger" type="reset">Reset</button>    
                        </div>
                        
                        <div class="col-sm-4">
                            <button class="btn btn-success btn-block" type="submit">Submit</button>    
                        </div>
                     </div>   
                    
                </form>
            </div><!-- col-sm-6 -->
            
        </div><!-- row -->
        
      </div><!-- signuppanel -->
      
    <br/>
	  
         <jsp:include page="footer.jsp"></jsp:include>
		<!-- contentpanel -->
		
     
  </div><!-- mainpanel -->
 

</section>


 



 

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
<script src="js/jquery.tagsinput.min.js"></script>
<script>
jQuery(document).ready(function(){
    
  // Chosen Select
  jQuery(".chosen-select").chosen({'width':'100%','white-space':'nowrap'});
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  
  });
</script>

<script type="text/javascript">
function validate()
{
	var questionpattern = /^[a-zA-Z0-9]{1,15}$/i;
	
   if( document.myForm.securityQuestion1.value == "" )
   {
     alert( "Please enter your first security question!" );
     document.myForm.securityQuestion1.focus() ;
     return false;
   }
   if( document.myForm.securityAnswer1.value == "" )
   {
     alert( "Please enter first security answer!" );
     document.myForm.securityAnswer1.focus() ;
     return false;
   }else if( !questionpattern.test(document.myForm.securityAnswer1.value.toString().trim())){
		 alert("Answer must be 1 to 15 charachters!");
		 document.myForm.securityAnswer1.focus() ;
	     return false;
   }
   if( document.myForm.securityQuestion2.value == "" )
   {
     alert( "Please enter second security question!" );
     document.myForm.securityQuestion2.focus() ;
     return false;
   }
   if( document.myForm.securityAnswer2.value == "" )
   {
     alert( "Please enter second security answer!" );
     document.myForm.securityAnswer2.focus() ;
     return false;
   }else if( !questionpattern.test(document.myForm.securityAnswer2.value.toString().trim())){
		 alert( "Answer must be 1 to 15 charachters!" );
		 document.myForm.securityAnswer2.focus() ;
	     return false;
   }
   return( true );
}

</script>



</body>
</html>
