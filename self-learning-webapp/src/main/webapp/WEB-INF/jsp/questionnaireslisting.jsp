<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.container { min-height: 740px !important; }

.home_blocks { display: none;}
.mainpanel { min-height: 850px !important;}
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
    	<div class="fl width55">
		  <div class="new_container">
			  <div class="TPRM_form">
				    <div class="TPRM_header">
				      <p>My Activities </p>
				    </div>
				    <div class="TPRM_cont pT0">
				    
				    <form name="qbank" method="post">
				    <input type="hidden" name="id" />				    			    
				    </div>    
				  </div>				
				   <table class="third_party_table questionnaire">
				    <tr>
				    <th>QuestionnaireName</th>
				    <th>Status</th>
				    <th>Date Received</th>
				    <th>Date Submitted</th>
				    </tr>    
				    <c:if test="${!empty dataCollectionList}">            
				   <c:forEach items="${dataCollectionList}" var="dataCollection" >            
				          <tr>         
				 <c:choose>
							<c:when test="${not empty dataCollection.questionnaireDefname}">
								<td data-attr="${dataCollection.questionnaireId}" class="score link name redirect" ><c:out value="${dataCollection.questionnaireDefname}"/></td>
							</c:when>
							<c:otherwise>
								<td><span class="empty"><c:out value='none' /></span></td>
							</c:otherwise>
						</c:choose>			
							<c:choose>
							<c:when test="${not empty dataCollection.status}">
								  <td class="statusHead"><c:out value="${dataCollection.status}"/></td>
							</c:when>
							<c:otherwise>
								<td><span class="empty"><c:out value='none' /></span></td>
							</c:otherwise>
						</c:choose>		
						<c:choose>
							<c:when test="${not empty dataCollection.dateSent}">
								 <td><fmt:formatDate type="date" value="${dataCollection.dateSent}" /></td>
							</c:when>
							<c:otherwise>
								<td><span class="empty"><c:out value='none' /></span></td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty dataCollection.dateCompleted}">
								 <td><fmt:formatDate type="date" value="${dataCollection.dateCompleted}" /></td>
							</c:when>
							<c:otherwise>
								<td><span class="empty"><c:out value='none' /></span></td>
							</c:otherwise>
						</c:choose>
				            </tr> 
				    </c:forEach>  
				  </c:if> 
				    </table>
				    </form>
				    <!-- <form id="createExtorgform" method="post" action="/partnerintegrity/authenticate">
					<input type="hidden" value="externalOrg" name="orgFormType">
						<div class="createNewContactBtn" onclick="document.getElementById('createExtorgform').submit();">Close</div>
					</form> -->
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
		//	alert();	
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

jQuery(document).ready(function () {
	jQuery('.questionnaire td.name').on('click', function() {
//		alert("Came to the Questionnaire Method");	
		var id = jQuery(this).attr(
				'data-attr');	
	//	alert("QuestionnaireDefId"+id);
		document.qbank.id.value = id;
		// document.qbank.method=post;
		//  alert("question id "+qid);
		document.qbank.method = "post";
		document.qbank.action = "${pageContext.request.contextPath}/retrievequestionnairedistribution";
		document.qbank.submit();		
	});
});
</script>

</body>

</html>
