<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>

<link href="css/common.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script src="js/jquery-1.10.2.min.js"></script> 
   
<style>
.mainpanel {height: 100% !important}
.popupBgrnd { 
background: none repeat scroll 0 0 #fff; 
bottom: 0; 
display: none; 
height: 100%; 
left: 0; 
opacity: 0.5; 
position: fixed; 
right: 0; 
top: 0; 
width: 100%; 
z-index: 999; 
}

.imagePopup { 
background: url(images/loaders/loader6.gif) no-repeat; 
display: none; 
height: 35px; 
left: 62%; 
margin: -100px 0 0 -100px; 
position: fixed; 
top: 50%; 
width: 40px; 
z-index: 9999; 
}
.btn-reply {margin-top: 1em}
.ui-widget-content {max-height: 210px; overflow-y:auto}
.footer {text-align:center; position: relative}
.ui-autocomplete {padding: 0 !important}
.ui-autocomplete li{padding: 0 .5em;}
.ui-helper-hidden-accessible {display:none !important}
.ui-menu {position: absolute; max-height: 180px; overflow-y: auto;}
</style>

<script type="text/javascript">
function assignThreadId(threadid) {
	//alert('assigned thread id'+threadid);
	document.privateForm.assignedThreadId.value=threadid;
	document.getElementById("assignedThreadId").value=threadid;
	//alert('value by id '+document.getElementById("assignedThreadId").value);
	//alert(document.privateForm.assignedThreadId.value);
}

</script>

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
				<a href="#"><img src="images/img_logo.png"
					alt="Partner Integrity" border="0"></a>
			</div>
			<!-- logopanel -->

			<div class="leftpanelinner">

				<jsp:include page="leftPanel.jsp"></jsp:include>

			</div>
		</div>
		<!-- leftpanel -->

		<div class="mainpanel">
			

				<jsp:include page="header.jsp"></jsp:include>
			
		<!-- headerbar -->
			<div class="container" id="container">
				<input type="text" class="hidden fieldValue" value="<c:out value='${flag}' />" />			
					<%-- <jsp:include page="messageincludeWithAjax.jsp"></jsp:include> --%>
					
					 <form:form method="post" name="privateForm" id="privateForm" action="/partnerintegrity/savecomments" modelAttribute="commentThreadDTO">
	<h1 class="title">Post New Comments</h1>
	<ul class="panel-tabs comments-tab clearfix">
		<li class="active"><a href="#public" id="publicflag">Public </a></li>
		<li><a href="#private" id="privateflag">Private</a></li>
	</ul>

	<div class="row" align="center">               
    	<c:set var="messageDTO" value="${commentThreadDTO.messageDto}"/>
         <c:if test="${messageDTO.messageExist}">
			<div class="alert-success errorMsg" style="width: 60%; font-size: 15px !important;" color="red">
				<spring:message  code="${messageDTO.messageKey}" arguments="${messageDTO.argumentAsString}" argumentSeparator="${messageDTO.argumentSeparator}"/>
			</div>
		</c:if>
 	</div>

	<div id="ajaxResponse"></div>

	<div id="private" class="tab_content comments-tab_content">

		<!-- <input class="search-recepients clearfix fetchRecepient"
			placeholder="Search Recepients" name="searchUser" id="searchUser" /> -->
		<input type="text" name="storeToFields"
			class="hidden storeVal emailIdValue" value="" />
		<div class="comments-txt clearfix">
			<span class="toLabel">To</span> <input class="toRecepient"
				name="privateTo" />
			<div class="textArea">
				<a href="#" class="comments-attach"></a>
				<textarea data-placeholder="Start Typing..." name="privateComment">Start Typing...</textarea>
			</div>

			<button class="btn" disabled="disabled" id="private-comment"
				name="privatePost" type="submit">Post</button>
		</div>

	</div>

	<div id="public" class="tab_content comments-tab_content"
		style="display: block">
		<div class="comments-txt clearfix">
			<span class="toLabel">To</span> <input disabled="disabled"
				value="All approvers/reviewers" />
			<div class="textArea">
				<a href="#" class="comments-attach"></a>
				<textarea data-placeholder="Start Typing..." name="publicComment">Start Typing...</textarea>
			</div>
			<div class="customInput customCheckBox send-TP">
				<input id="send-TP" type="checkbox" name="sendToTP" /> <label
					for="send-TP">Send to third party</label>
			</div>

			<button class="btn" id="public-comment" disabled="disabled"
				name="publicPost" type="submit">Post</button>
		</div>
	</div>

	<div class="comments-trail">
		<h1 class="clearfix">
			Comments<span class="icon-toggle"></span>
		</h1>

		<!-- needs to check -->

		<div class="comments-reply clearfix hidden">
			<div class="textArea">
				<a class="comments-attach"></a>
				<textarea data-placeholder="Start Typing..."
					name="repliedCommentTextarea" maxlength='256'>Start Typing...</textarea>
			</div>
			<button id="" class="btn btn-xs btn-post" disabled="disabled"
				name="repliedComment" value="" type="submit">Post</button>
		</div>
		<div class="publicContainer"></div>

		<!-- <div class="alert alert-success publicError"
			style="width: 800px; margin: 0 auto;" align="center"></div> -->

	</div>
</form:form>
					
				
			</div>
			
			<!-- mainpanel -->
			
			 <jsp:include page="footer.jsp"></jsp:include>
		<!-- contentpanel -->



		</div>
	</section>
	
	<div class="popupBgrnd" style="display: none;"></div> 
	<div class="imagePopup" style="display: none;"></div> 
	
	
	<script src="js/jquery-ui-1.11.0.min.js"></script> 
	<script src="js/bootstrap.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/toggles.min.js"></script>
	<script src="js/common.js"></script>
	<script src="js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>


<script type="text/javascript">

    (function(){
      jq('.commentsTails').each(function(index){
         if(jq(this).find('.comments-trail-container').length == 0) {
             jq(this).closest('ul').remove();
         }
        
      });       
	})();
    
    jq('.fetchRecepient').on('keydown', function(e){
    	if(e.keyCode == 13)
    		 return false;
    });
	
</script>

</body>
</html>