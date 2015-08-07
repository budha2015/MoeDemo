<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="com.rfg.tprm.questionnaire.model.QuestionComponent" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
<link rel="stylesheet" href="css/questionnaire.css" />
<link href="css/main.css" rel="stylesheet">
<link rel="stylesheet" href="css/commonDT.css" />


<link href="css/branching.css" rel="stylesheet">
<!-- http://jscrollpane.kelvinluck.com/ -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <style>
    .contentPanelContainer {margin-top:10px;}
    .contentPanelContainer .questHeader {border-radius: 0}
    .ui-menu {width: 210px !important}
  </style>
</head>
<body>
<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>


<jsp:include page="header.jsp" />
			
<div class="clearfix"></div>
 <div class="contentPanelContainer">
  <div class="questHeader clearfix">
  <h1 class="title"><%= ((java.lang.String)session.getAttribute("QuestionnaireName"))%></h1></div>
  
  <div class="setupQuestContainer clearfix">
  <div class="col-md-4 panels mt">
  <%
  //System.out.println("Scriptlet Starts");
  List<QuestionComponent> retrieveQuestionnaireComponents = (List<QuestionComponent>)session.getAttribute("RETRIEVE QUESTIONNAIRE");
 
  System.out.println("Size of QuestionComponents List:"+retrieveQuestionnaireComponents.size());
  
  String branchingQuestionnaireId = session.getAttribute("BranchingQuestionnaireId").toString();
  
  ////System.out.println("Questionnaire Id In Branching JSP is :"+((branchedQuestionComponents.get(0).getQuestionnaireId())));
  
  //System.out.println("Scriptlet Next");
  List<String> tagNames = new ArrayList<String>();
  for(QuestionComponent qcc:retrieveQuestionnaireComponents){
	  //System.out.println("Question Tag:"+qcc.getQuestionTag());
	  if(!(qcc.getQuestionTag()).contentEquals("")){
		  if(!(qcc.getQuestionTypeId() == 1) && !(qcc.getQuestionTypeId() == 2) && !(qcc.getQuestionTypeId() == 3) && !(qcc.getQuestionTypeId() == 4) && !(qcc.getQuestionTypeId() == 11) && !(qcc.getQuestionTypeId() == 12) && !(qcc.getQuestionId()==0)){
			  System.out.println("Question Id is:"+qcc.getQuestionId());
	  tagNames.add(qcc.getQuestionTag());}
	  }
  }
 System.out.println("TagNames List Size:"+tagNames.size());
  
  int tagNamesSize = tagNames.size();
  
  String button = "";
  
  button = "<button class='btn' type='button' onclick='retrieveQuestionnaire("+branchingQuestionnaireId+")'>";
  
  %>
  
  
  
	<form class="branchform" method="post" action="./getbranchedquestionoftag">
		<p class="branching-select">Select Source Question Tag</p>
		<div class="search-dropdown">
		
		
		<% 
		String leftSelectBox = "";
		leftSelectBox = "<select class='customSelect addBranch' name='tags'><option value='Select'>Select</option>";
		
		for(int i =0;i<tagNames.size();i++){
			if(!tagNames.get(i).equals(""))
			leftSelectBox += "<option value='"+tagNames.get(i)+"'>"+tagNames.get(i)+"</option>";
		}
		
		leftSelectBox += "</select>";
		
		out.println(leftSelectBox);
		
		%>           
         <!-- HIDDEN FIELD CREATED BY SHAILENDRA -->
         
         <%-- <form:input  /> --%>
         
         <input class="hidden leftTagName" name="leftTagName" /> 
         
         <%--  <form:hidden  path="" /> --%>
         
        <%--  <form:hidden cssClass="hidden leftTagName" path="questionTag" id="leftTagName" /> --%>
         
         <!-- HIDDEN FIELD CREATED BY SHAILENDRA --> 
		</div>
		<!-- HERE WE REMOVED add-new STYLE FROM class ATTRIBUTE OF INPUT TAG -->	
		<input type="submit" class="btn btn-xs fr mt" disabled="disabled" name="submit" value="Add new branch"/>
	</form>	
  </div>
  <div class="col-md-8 questContainer">  
  <!-- RIGHT SIDE PANEL -->
  <%
  if(tagNamesSize !=0){
	  
  %>
  <!-- <div class="branch-container clearfix target1-sel">
	<div class="branch-info">
	<p class="branching-select">Source Question</p><p class="branching-select">Action</p>	
	</div>  
	<div class="branch-static-text"><p>Your company is environment friendly</p></div>
	<div class="data-display">
		<div class="head">
			<div class="header answer-option">Answer option</div>
			<div class="header skip">Skip</div>
			<div class="header target-question">Target question</div>
			<div class="header mandatory">Mandatory</div>
			<div class="header attachment">Allow Attachment</div>
			<div class="header add-target">Add target</div>
		</div>
	</div>
	<div class="data-display-body">
    <div class="body hidden">
		<div class="data answer-option">Neutral</div>
		<div class="data skip"><input type="checkbox" data-off-text="off" data-on-text="on"  data-size="large" class="switch"></div>
		<div class="data target-question">
         <select class="customSelect">
        	<option>Select Target</option>
            <option>Tag one</option>
             <option>Tag two</option>
              <option>Tag third</option>
               <option>Tag four</option>
                <option>Tag five</option>
                 <option>Tag six</option>
                  <option>Tag seven</option>
         </select>
		</div>
		<div class="data mandatory"> <input type="checkbox" data-off-text="off" data-on-text="on"  data-size="large" class="switch"></div>		
		<div class="data attachment"><input id="question" type="checkbox" name="attachment1"><label for="question"></label></div>
		<div class="data add-target"><span class="addElement"></span><span class="removeElement"></span></div>
	</div>
	<div class="body branching">
		<div class="data answer-option">Agree</div>
		<div class="data skip"><input type="checkbox" data-off-text="off" data-on-text="on"  data-size="large" class="switch"></div>
		<div class="data target-question">
         <select class="customSelect">
        	<option>Select Target</option>
            <option>Tag one</option>
             <option>Tag two</option>
              <option>Tag third</option>
               <option>Tag four</option>
                <option>Tag five</option>
                 <option>Tag six</option>
                  <option>Tag seven</option>
         </select>
		
		</div>
		<div class="data mandatory"><input type="checkbox" data-off-text="off" data-on-text="on"  data-size="large" class="switch"></div>		
		<div class="data attachment"><input id="question" type="checkbox" name="attachment1"><label for="question"></label></div>
		<div class="data add-target"><span class="addElement"></span></div>
	</div>
   
</div> -->



<%
}else
{
%>
	<div class="branch-info">
	<p><center><font color='red'>No Tag Names Available To Branch This Questionnaire.</font></center></p>	
	</div> 

<%
}
%>
<!-- mainpanel -->
<!-- </div> -->

</div>
<!-- <button class='btn' type='button' onclick='retrieveQuestionnaire("+(branchedQuestionComponents.get(0)).getQuestionnaireId()+")'>Cancel</button> -->
<form name='branch' class='branchform' method='post' action='' >
<input type="hidden" name="id" />
<div class='branch-footer'><div class='footer-left'><% out.println(button); %>Close</button></div></div>
</form>
 </div>
 </div>
 
<jsp:include page="footer.jsp" />
		<!-- contentpanel -->




<!-- 
<div class="branch-footer"> 
  <div class="footer-right"><button class="btn branch-close" type="button">Close</button></div>
  <div class="footer-left"><button class="btn branch-left" type="button">Save</button><button class="btn branch-left" type="button">Branch Preview</button></div>
</div> -->

<%-- <div class='branch-footer'>
   <div class='footer-right'><button class='btn branch-close' type='button'>Close</button></div>
   <form class='branchform branchPreview' action='./branchPreview?id="+(branchedQuestionComponents.get(0)).getQuestionnaireId()+"' method='post'>
   <button class='btn branch-left' type='submit'>Branch Preview</button></form>
   <div class='footer-left'><button class='btn branch-left' type='submit'>Save</button></div>
</div> --%>


<script src="js/jquery-1.10.2.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script>
<script src="js/bootstrap-switch.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
<script src="js/common.js"></script> 
<script src="js/custom.js"></script>

<script>




	var question1 = ["this is the first answer", "this is the first skip", "this is the first man", "this is the first attach"];
	var question2 = ["this is the sec answer", "this is the sec skip", "this is the sec man", "this is the sec attach"];
	var branch = [0,question1,1,question2];
	


  jQuery(document).ready(function(){
	  jQuery('.branch-container').hide();
	  jQuery('.add-new').click(function(){
		jQuery('.branch-container').show();
		});
		jQuery(".selected").css("display","block");
		
		
  //Score Schema starts
	   jQuery('.data-display-body').on('click', '.addElement, .removeElement', function(e){
           e.stopPropagation();
           var jqthis = jQuery(this);
		   var tr = jQuery(this).closest('.branching');
           var el = tr.closest('.data-display-body');
            if(jqthis.hasClass('addElement')){		
				el.find('.hidden').clone().removeClass('hidden').addClass('branching').insertAfter(tr);			
          }
          else {
			  tr.remove();
			
          }
		 
        });
	   jQuery('.ss-table td').find('.toggle').hide();
	   jQuery('.ss-table').on('click', '.ss-icon' , function(){
			jQuery(this).toggleClass('active').siblings('.toggle').toggle();												 
	  });
	  
	  jQuery('.clearScore').on('click', function(){
		  jQuery('.clearPopup').show();
		   jQuery('.popupBg').show();
		  
	  });
	  jQuery('.clearPopup .delete').click(function(){
	  		jQuery('.clearPopup').hide();
		   jQuery('.popupBg').hide();
	  });
	  
	//Score Schema ends		
	//Bootstrap-switch
	jQuery('.switch').bootstrapSwitch();	
	//Add Multiple TextBox Rows	
/*jQuery('.qt_field_opt').on('click', '.qt_add', function(e){
			
		jQuery(this).parents('.qt_field_opt').append('<div class="body odd qt_field_opt"><div class="data answer-option">Neutral</div><div class="data skip"><input type="checkbox" data-off-text="off" data-on-text="on"  data-size="large" class="switch"></div><div class="data target-question"><div class="search-dropdown"><select class="customSelect"><option>Select Target</option><option>Tag one</option>
<option>Tag two</option><option>Tag third</option><option>Tag four</option><option>Tag five</option>
                 <option>Tag six</option>
                  <option>Tag seven</option>
         </select>
			
			</div>
		</div>
		<div class="data mandatory"> <input type="checkbox" data-off-text="off" data-on-text="on"  data-size="large" class="switch"></div>		
		<div class="data attachment customInput customCheckBox"><input id="question" type="checkbox" name="attachment1"><label for="question"></label></div>
		<div class="data add-target"><button class="qt_add"></button></div>
	</div><button class="qt_remove"></button></div></li>');		
	
	});
	//Remove Multiple TextBox Rows
	jQuery('.qt_field_opt').on('click','.qt_remove', function(){		
			jQuery(this).parents('.qt_field_opt-add').remove();
	});	
	
*/




/* CODE TO FIND SELECTED OPTION OF SELECT BOX*/



	
	});	

  jQuery("body .addBranch").selectmenu({
	  select: function(event, data) {
	   jQuery('.leftTagName').val(data.item.value);
	  	// val = branch[0][0];
	  	// alert("val"+val);
		// alert("first q"+ val[0]);
		if(data.item.value == ('Select').trim()) {
			jQuery('.fr').attr('disabled', 'disabled');
	   }
		else {
			jQuery('.fr').removeAttr('disabled');
			}
	  }
	});
  
  function retrieveQuestionnaire(link)
  {
 // 	alert("In BRANCHING JSP JQUery Method"+link);
  	//window.open("/partnerintegrity/branchPreview?id="+link,"_self");
     // document.retrieve.brId.value=link;
      //   alert("ID Value is:"+brId);
        document.branch.method="post";
        document.branch.id.value = link;
   //    document.branch.action = "/partnerintegrity/retrievequestionnaire?id="+link;
   document.branch.action = "${pageContext.request.contextPath}/retrievequestionnaire";
         document.branch.submit();
  } 

/* 
  var cusSelWidth = jQuery('.ui-selectmenu-menu .ui-menu').width();
	 jQuery('.ui-selectmenu-menu .ui-menu').css('width', cusSelWidth - 2); */

</script>
 
</body>
</html>
