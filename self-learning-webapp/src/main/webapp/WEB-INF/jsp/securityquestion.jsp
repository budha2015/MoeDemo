<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
   <head>
    <script type='text/javascript' src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script type='text/javascript' src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	 <script type="text/javascript">
	  	function submitForm() {
	  		document.getElementById("validatesqform").submit();
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
      <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->
      
      <style>
      body, html {height: 100%}
     .mainpanel {margin-left: 0 !important; height: 100%; background: #5dbee2;}
     .container {width: 70% !important; padding-top: 36px;}
     .brand-logo {  margin: 1em 0 0;}
     .containerPanel {border-radius: 0; margin-top: 2em;}
     .errorParent {margin-bottom: -8px;}
     .errorMessage {color: red; display: block; width: 37%; margin: auto;}
     .forgot-ans {width: 65% !important; margin: auto; display:block}
     @media screen and (max-width : 900px) {
		.pwd-fields .col-md-4 { text-align: left; }
		 body { overflow: visible; }		
		 .mainpanel	{ height: auto;}
	 }
	 @media screen and (max-width : 400px) {
		 .container {width: 90% !important}		
		
	 }
	 .fr{ float:right;}
	 input{  width: 257px; height: 26px;}
      </style>
   </head>
   <body>

      <div class="mainpanel">
        <!-- Forgot Password -->
         <div class="container">
            <img class="brand-image" src="images/img_logoRFG.gif" alt="Red Flag Group">
            <img class="fr brand-logo" src="images/img_logo_login.gif" alt="Partnern Integrity">
            <div class="containerPanel clearfix">            
               <div class="forgot">
                  <h1 class="title"><spring:message  code="label.forgetpwdheading1" /></h1>
                  <div class="forgotDiv clearfix">
                     <div class="pwd-fields">
					     <form:form action="/partnerintegrity/validatesq" id="validatesqform" modelAttribute="authenticationDTO"  method="POST">
						 <form:hidden path="applicationMessage"/>
	                     <form:hidden path="securityQuestionCount" value="${authenticationDTO.securityQuestionCount}"/>
	                     <form:hidden path="loginId" id="loginId"  value="${authenticationDTO.loginId}" />
	                     <form:hidden path="userId" value="${authenticationDTO.userId}" />
                        <%-- <div class="row"><span class="<!-- status-info --> forgot-ans"><form:errors path="applicationMessage" /></span></div> --%>
                        <div class="col-md-4"></div>
                        <%-- <div class="col-md-8 italic"><spring:message  code="label.forgetpwdheading2"/></div> --%>
                       <%--  <div class="col-md-4"><spring:message  code="label.questioncaption" /> </div> --%>
                        <div class="col-md-8">${authenticationDTO.securityQuestionForUser} <span class="redTxt">*</span></div>
                         <div class="col-md-4"><%--<span class="redTxt">*</span><spring:message  code="label.answer"/>--%></div> 
                        <div class="col-md-8 input"><form:input path="securityAnswerFromUser" value="${authenticationDTO.securityAnswerFromUser}" autocomplete="off" placeholder="Answer"/></div>
                        <div class="row errorParent"><span class="errorMessage"><form:errors path="securityAnswerFromUser" cssClass="tprmerrormsg"/></span></div>
                        <div class="col-md-4"> </div>
                        <div class="col-md-4 "><button type="button" id="sqsubmit" class="btn btn-xs fr" name ="securityquestionparm"  onclick="submitForm();"><spring:message  code="label.submit" /></button>
                        </div>
                         <div class="col-md-4"> </div>
					 </form:form>	
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- /Forgot Password -->
         <!-- mainpanel -->
      </div>
      <script src="js/jquery-1.10.2.min.js"></script> 
      <script src="js/bootstrap-switch.min.js"></script> 
      <script src="js/jquery-ui-1.10.3.min.js"></script> 
      <script src="js/common.js"></script> 
      <script src="js/custom.js"></script> 
      <script></script>
   </body>
</html>

