<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.rfg.tprm.questionnaire.model.RecordPojo"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">

<title>Partner Integrity</title>

<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main.css"
	rel="stylesheet">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/questionnaire/qr-common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/questionnaire/qr-previewbranch.css">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
.top_menu ul.top_menu_ul{  z-index: 100 !important;}
</style>
</head>

<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">
			<i class="fa fa-spinner fa-spin"></i>
		</div>
	</div>

	<div class="mainpanel">



		<jsp:include page="header.jsp" />
			
		<!-- headerbar -->
		
		


		<%
		    int temp = 0;
		 
		    
		
			RecordPojo recordPojo = (RecordPojo) request
					.getAttribute("BranchPreviewComponent1");
			String myContent = "";		
		
			//System.out.println("Size of DestinationQuestionTagNames Map is:"+(recordPojo.getDestinationQuestionTagNames()).size());
			
			//System.out.println("RecordPojo AnswerOptionValues Size is:"+(recordPojo.getAnswerOptionValues()).size());		
			
			//System.out.println("Size of sourceQuestionTagNames is::::::::::::::"+(recordPojo.getSourceQuestionTagNames()).size());
			
			if( (recordPojo.getSourceQuestionTagNames()).size() > 0  ){
			
			for(int k = 0;k<(recordPojo.getSourceQuestionTagNames()).size();k++){
				//System.out.println("Value1:"+(((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))));
				//System.out.println("Value2:"+((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k))));
				if(((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 3) || ((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 4) ){
					//System.out.println("Inside If Condition");
					temp = 1;
				}
				int j=0;
				int i=1;
				
				if (((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 3) || ((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 4)){
					j++;
					i++;
				}
			for (;  j < i; j++) {

				myContent += "<tr><td class='sourceQuestion'>"
						+ (recordPojo.getSourceQuestionTagNames()).get(k)
						+ "<span>"+(recordPojo.getQuestionText()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)+"</span></td><td>"
						+ (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j).replace("to","  To  ")
						+ "</td><td>"
						+ (((recordPojo.getIsSkip()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"						
						+ ((recordPojo.getDestinationQuestionTagNames()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j))
						+ "</td><td>"						
						+ (((recordPojo.getIsMandatory()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ (((recordPojo.getIsAttachment()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td></tr>";

			}
			
			
			
			for(;j < (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).size(); j++){
				myContent += "<tr><td>" +""+
						"</td><td>"+ (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j).replace("to","  To  ")
						+ "</td><td>"						
						+ (((recordPojo.getIsSkip()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ (recordPojo.getDestinationQuestionTagNames()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)
						+ "</td><td>"
						+ (((recordPojo.getIsMandatory()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ (((recordPojo.getIsAttachment()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td></tr>";
			}
			} //outer for loop
			
	} // OUTER IF CONDITION TO KNOW DATA IS THERE IN BRANCH TABLE OR NOT
	else{
		myContent += "<tr><td colspan='6' style='color:#f00; text-align: center'>NO DATA TO DISPLAY </tr></td>";
	}
		%>


		<div class="contentPanel">
			<div class="questHeader clearfix">
				<h1 class="title"><%= ((java.lang.String)session.getAttribute("qrname"))%> Branching Preview</h1>
			</div>
			<div class="setupQuestContainer branchPreview">
				<table width='100%'>
					<tr>
						<th><b>Source Question</b></th>
						<th><b>Answer Option</b></th>
						<th><b>Skip</b></th>
						<th><b>TargetQuestion</b></th>
						<th><b>Mandatory</b></th>
						<th><b>Attachment</b></th>
					</tr>
					<%
						out.println(myContent);
					%>
				</table>
			</div>
			<div class='btn-group'><button type="submit" class='btn cancel qstSubmitEdit'>Close</button></div>
			
			<!-- contentpanel -->

		</div>
		<!-- mainpanel -->
		  <jsp:include page="footer.jsp" />
	<div class="tooltop"></div>
	<script	src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
	<script>
		 if(jQuery('.branchPreview').find('tr td:first-child').html() != ''){
				jQuery('.branchPreview').find('tr td:first-child').parents('tr').find('td').css({'background':'#f4f5f5'});				
				} 
		
		jQuery('.branchPreview').find('td:empty').parents('tr').addClass('emptyRow');
		
	</script>
	<script>
	function goBack() {
     window.history.back();
 }
	// JQUERY FUNCTION ADDED 
	jQuery('.qstSubmitEdit').on('click', function() {
		//alert("My JQuery Method Called");    
	//	var khName = "";
	//	var khId = "";
   // $.post('./closebranchingpreview',{'questionnaireName' : khName , 'questionnaireId' : khId}); 
	//	window.open('/partnerintegrity/closebranchingpreview','_self');
		window.history.back();
});
// JQUERY FUNCTION ADDED
  jQuery('.setupQuestContainer').on('mouseenter', '.sourceQuestion', function(){
         var offset = jQuery(this).offset();
         var descText = jQuery(this).find('span').text();
        /*  jQuery('.tooltop').css({'top': offset.top - 50 +"px", 'left': offset.left - 30 + "px"}).text(descText).show(); */
       });
		 jQuery('.setupQuestContainer').on('mouseleave', '.sourceQuestion', function(){ 
         jQuery('.tooltop').hide();
       });

	</script>

</body>
</html>
