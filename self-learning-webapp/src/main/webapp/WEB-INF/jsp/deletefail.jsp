<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>Partner Integrity</title>

  <link href="${pageContext.request.contextPath}/css/style.default.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-fileupload.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.tagsinput.css" />

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
        <a href="#"><img src="${pageContext.request.contextPath}/images/img_logo.png" alt="Partner Integrity" border="0"></a>
       
    </div><!-- logopanel -->
        
    <div class="leftpanelinner">    
        
        <jsp:include page="leftPanel.jsp"></jsp:include>
      
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    
    
    
    <jsp:include page="header.jsp"></jsp:include>
			
		<!-- headerbar -->
		
		
		
    
    <div class="alert alert-success" >
      <h4 class="text-center">  Record Deletion is not successful. User is linked to the organisation. </h4>
      
    </div>
    
    
    
     <jsp:include page="footer.jsp"></jsp:include>
		<!-- contentpanel -->
	
	
		
   
  </div><!-- mainpanel -->
  
	 

  
</section>


 



 

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/modernizr.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/js/toggles.min.js"></script>
<script src="${pageContext.request.contextPath}/js/retina.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookies.js"></script>



<script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wysihtml5-0.3.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-wysihtml5.js"></script>

<script src="${pageContext.request.contextPath}/js/custom.js"></script>
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
<script src="${pageContext.request.contextPath}/js/jquery.tagsinput.min.js"></script>
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
