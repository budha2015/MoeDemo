<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html lang="en">
   <head>
   <script type='text/javascript' src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
   <script type='text/javascript' src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
   	 <script type="text/javascript">
	  	function submitForm() {
	  		document.getElementById("confirmpwdform").submit();
		}  
      </script>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="shortcut icon" href="images/favicon.png" type="image/png">
      <title>Partner Integrity</title>
      <link href="css/common.css" rel="stylesheet">
      <link href="css/main.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="css/bootstrap-switch.min.css">
      <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->
   </head>
   <style>
     body, html {height: 100%}
     .mainpanel {margin-left: 0 !important; height: 100%}
     .container {width: 70% !important}
     .errorParent {margin-bottom: -8px}
     .errorMessage {color: red; display:block; margin: auto; width: 36%}
  .tprmerrormsg { 
	color : #FF0000;
	font-size : 12px;
	font-style: normal; 
	}
   </style>
   
   <body>

      <div class="mainpanel">
             <!-- Reset Password -->
         <div class="container" id="resetPwdDiv">
            <div class="containerPanel clearfix" style="margin-top:5em">
               <div class="forgot">
                  <h1 class="title"></h1>
                  <div class="forgotDiv clearfix">
                     <div class="pwd-fields">
                        <div class="col-md-4"></div>
                        
								<h6 class="text-center" style="color:red">User profile has been deleted.</h6><br>
			 					<form id="externaluserform" method="POST" action="${pageContext.request.contextPath}/">
				            <button onclick="document.getElementById('externaluserform').submit();" class="btn btn-xs" type="submit" style="align:center;">Go Back to home</button></li>
			                   </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- mainpanel -->
     
      <script src="js/jquery-1.10.2.min.js"></script> 
      <script src="js/bootstrap-switch.min.js"></script> 
      <script src="js/jquery-ui-1.10.3.min.js"></script> 
      <script src="js/common.js"></script> 
   </body>
</html>

