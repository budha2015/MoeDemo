<!DOCTYPE html>
<!--[if IE 9]><html id="ie9" class="no-js lt-ie10 signin_html" lang="en"><![endif]-->

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--[if gt IE 9]><!-->
<html lang="en" class="signin_html"><!--<![endif]-->
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
 <link rel="stylesheet" href="css/jquery-ui-1.11.0.css" />
<link rel="stylesheet" href="css/login-page.css" />
 <%-- <link href="${pageContext.request.contextPath}/css/style.default.css"
	rel="stylesheet"> --%>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
  <script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/="js/respond.min.js"></script>
  <![endif]-->
  <style>
  .newContainer{  background: none !important;  border: none !important;}
  .forgotPass{  position: relative;  top: -92px;  left: 114px;  background: none;  border: none;  font-size: 14px;}
  .forgotPass:hover{text-decoration: underline;  color: rgba(0, 0, 0, 0.77)}
  .login_message {   margin-top: 15px; font-size: 13px; color: #FF0000; display:block; }
  </style> 
</head>

<body class="signin">

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">
			<i class="fa fa-spinner fa-spin"></i>
		</div>
	</div>
	<div class="login-container ">
	 <div class="logos-top clearfix">	
		<img class="brand-image" src="images/img_logoRFG.gif" alt="Red Flag Group" />
		<img class="brand-logo" src="images/img_logo_login.gif" alt="Partnern Integrity" />
	 </div>	
	<section class="clearfix">
	
		<div class="signinpanel clearfix">

			<div class="right-col">

					<c:url var="url" value="/j_spring_security_check" />
					<form:form action="${url}" id="loginform" modelAttribute="authenticationDTO"  method="POST" >
					
					   <c:set var="messageDTO" value="${authenticationDTO.messageDto}"/>
					   <c:if test="${messageDTO.messageExist}">
						   <c:choose>
						    	<c:when test="${messageDTO.messageType=='ERROR'}">
						    		<c:set var="messageClass" value="alert alert-danger"/>
	      						</c:when>
	      						<c:otherwise >
	      							<c:set var="messageClass" value="alert alert-info"/>
	      						</c:otherwise>
	      					</c:choose>
					   </c:if>	
					   		   
					   <c:if test="${messageDTO.messageExist}">
						 <div class="${messageClass}" >
						 <spring:message  code="${messageDTO.messageKey}" arguments="${messageDTO.argumentAsString}" argumentSeparator="${messageDTO.argumentSeparator}"/>
						 </div>
					   </c:if>
					   
					    <spring:message  code="label.header.signin" var="submitsignin" />
					    <spring:message  code="label.forgetpwdheading1" var="submitforgotpwd" />
						<h4 class="nomargin">${submitsignin}</h4> 
						<p class="mt5"><spring:message  code="label.loginaccess" /></p>
						<span class="login_message">
					
				<%-- 		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<c:choose>
								<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
								Please provide correct User Name or Password
								</c:when>
								<c:otherwise>
								<spring:message  code="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:otherwise>
							</c:choose>
						</c:if> --%>
						
						
						<c:if test="${not empty param['error']}"> 
    						<c:choose>
								<c:when test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
								Please provide correct User Name or Password
								</c:when>
								<c:otherwise>
								<spring:message  code="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:otherwise>
							</c:choose>
    						<c:remove var = "SPRING_SECURITY_LAST_EXCEPTION" scope="session" /> 
						</c:if> 
						</span>
						
						<br>
						<label for="loginId">Username</label>						
						<form:input path="j_username" class="form-control uname" id="j_username" value="${authenticationDTO.j_username}"/>
						<form:errors path="loginId" cssClass="tprmerrormsg" />
						<label for="password">Password</label>						
						<form:password path="j_password"	class="form-control pword" id="j_password" value="${authenticationDTO.j_password}" />
						<form:errors path="password" cssClass="tprmerrormsg"/>
						<form:hidden path="viewId" id="viewId" value="${authenticationDTO.viewId}" />
						<%-- <label>Domain</label>
                                <select name="tenantId" id="tenantId" class="tName" >
										<c:forEach items="${domainList}" var="domain">
										<option  value="${domain.id}">${domain.name}</option>
										</c:forEach>
								</select> --%>
						<!-- <span class="customInput customCheckBox">
						   <input type="checkbox" id="send-TP" />
						   <label for="send-TP" style="padding-top:10px">Remember me</label>
						</span> -->
						
						<input class="hidden tenantName" name="tenantName" value="Satya" /> 
						
						<input type="submit" class="btn btn-success btn-block" name="login" value="${submitsignin}" style="position: relative;top: 30px;" >
					</form:form>
						<form:form action="/partnerintegrity/authenticate" id="forgotpwdform" modelAttribute="authenticationDTO" class="newContainer"  method="POST" >
							<button type="submit" class="fbutton forgotPass" id="forgotpwd" name="forgot" value="Default"/>Forgot Password?</button>
						</form:form>
					
				</div>
			<!-- row -->
			<br> <br> <br>
		
		</div>
		<!-- signin -->

	</section>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/modernizr.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/retina.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<script type="text/javascript">
/* 
   (function() {
	 	var selectedI = document.getElementById('tenantId'), 
	    selectedText = selectedI.options[selectedI.selectedIndex].text;
        document.getElementsByClassName('tenantName')[0].value = selectedText;
   })(); 
      */
     jQuery('#forgotpwd').on('click', function() {
    	var uname = jQuery("#j_username").val();
    	jQuery('#forgotpwd').attr("value",uname);
     });

  
	
	
</script>
</body>
</html>
