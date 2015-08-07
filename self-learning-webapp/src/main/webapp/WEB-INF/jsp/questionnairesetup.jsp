<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link href="css/common.css" rel="stylesheet">

<link rel="stylesheet" href="css/questionnaire.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-switch.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
<link href="css/qrmain.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/questionnaire/qr-common.css">
<link rel="stylesheet" type="text/css" href="css/questionnaire/qr-setup.css">
<link rel="stylesheet" type="text/css" href="css/slider.css">
<link rel="stylesheet" href="css/mainDT.css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
select {
	border:1px solid #e1e3eb;
	border-radius:3px;
}
.qt_multiChoice_dd input {font-size: 12px !important}
select:hover {border: 1px solid #11b1aa;}

.settings-panel table{ border-bottom:#e1e3eb 1px solid; margin-bottom: 1em;}
td{ padding: 5px}
.settings-panel tr > td:first-child {
    text-align: right;
	width: 80%;
}
.tag { width: 55px; padding-right: 0}
.questionn>li{ border-bottom:#e1e3eb 1px solid;}
.questionn>li:last-child{ border:none;}
.selectall {display: inline-block;
    margin-right: 1em;
    position: relative;
    top: 1em;}

.setupQuestContainer{
	float:left;width:100%;
}
.questionContainer.current { border:1px solid #e1e3eb;}
.deleteQst {
    background: url("./images/icons/tab_close.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
    cursor: pointer;
    margin: 3px 0;
    position: absolute;
    right: 1px;
    top: 0;
    width: 10px;
    height: 10px;
}
.questionContainer {
/*	min-height: 600px;
	height: auto!important; */
	height: 617px;
	background: transparent;
	position: relative;
	vertical-align: middle;
	padding: 10px;
	border: 1px solid #e1e3eb;
	border-width: 0px 1px 1px;
	overflow-y: auto;
	overflow-x: hidden;
}
.questionContainer li.canvas-element{
	width:653px;
	display:inline-block;
	display:block;
	list-style-type:none;
	height:auto;
	padding-top:10px;
	margin:10px
}
.questionContainer .ui-draggable .customCheckBox label{top:4px}
.qt_editBox{margin:0}
#multiple-select-dropdown ul.widgetsEl li{margin-left: 2em;}
#multiple-choice-dropdown .mc_dd_opt,#multiple-select-dropdown .mc_dd_opt {
        display:inline-block;
        position:relative;
}


.customSelect {width: 270px ;}
.ui-selectmenu-menu {z-index : 9999999}
.ui-selectmenu-menu { position: fixed; }
.ui-selectmenu-menu .ui-menu {height: 130px; overflow-y: auto; overflow-x: hidden; top: 0; min-height: 66px; max-width: 297px}

.save-template-popup {
    background: none repeat scroll 0 0 #fff;
    display: none;
    height: 135px;
    left: 50%;
    margin: -100px 0 0 -100px;
    position: fixed;
    top: 50%;
    width: 340px;
    z-index: 9999;
}
.save-template-popup ul {
    list-style-type: none;
    margin: 0 auto;
    padding: 20px 0 0;
    width: 85%;
}
.save-template-popup ul li {
    padding-bottom: 15px;
}
.save-template-popup input {
    border: 1px solid #d9d9d9;
    color: #000 !important;
    font-size: 11px;
    padding-left: 2%;
    width: 100%;
}
.save-template-popup .submitQ {
    float: right;
    border: 1px solid #19b5a3;
    color: #19b5a3;
	background:none;
}
.save-template-popup .submitQ:hover{
background:#19b5a3;
color:#FFF;
}
.multiChoice_dd{float:left}
.select-category{border-radius:5px;border:1px solid #11b1aa; border-top:0;padding:2px 5px; width:200px;position:absolute}
.select-category input{width:100%; margin:2px 0; cursor:pointer;}
.select-category.hide{display:none}
.select-category.show{display:block;z-index:1}
#multiple-select-dropdown .mc_dd_opt.show{position:relative; display:inline-block}
.dragItemLabel{margin:0}


.panel-tabs {
    border-bottom: 1px solid #e1e3eb;
    padding: 10px;
}
.controlPanel li{padding-left: 3px}
.qt_settings {padding-bottom: 10px}
#qt_editBox {border: 1px solid #e1e3eb}
.col1, .col2, .col3 { font-style:italic; display: inline-block; padding-bottom: 5px;}
.col1, .col2 {margin-right: 1em; width: 30%; }
.col3 {width:8%;margin-right:10px}

.multiChoice_dd, .mc_dd_opt {width: 420px}
.qt_field_opt button {float:left;}
.dateSel select {float:left; margin-right: 20px}
.dateSel {width: 50%; display:inline-block; float:left}
.multiChoice_dd_select {width: 420px}
.dragItemLabel {
    background: none repeat scroll 0 0 #f4f5f5;
    border: 1px dashed #e1e3eb;
    border-radius: 5px;
    font-size: 0.8em;
    font-style: italic;
    margin: 30% 1em;
    padding: 1em;
    text-align: center;
}


.yesBtn, .noBtn{width: 75px; margin-top:10px}
.yesBtn {margin-right: 20px; background: #d9534f}
.questPopup { height: auto;}
.questPopup ul {text-align:left;}
.quesDesc {width: 100%;
height: 50px;
padding: 5px;
font-size:1em;
}
.leftpanel {
    background: none repeat scroll 0 0 #3b3b3b;
    left: 0;
    position: absolute;
    top: 0;
    width: 240px;
    z-index: 100;
    height: 830px;
}
.btn-block { margin: 10px 0 75px;}
.preview { margin-right: 1em;}
.settings-panel tr > td:first-child {
    text-align: right;
}
.ui-widget-content { border:none;}
.nolist { list-style: none;}
.icon-settings, .icon-delete { cursor: pointer;}
.settings-panel td { vertical-align: center; padding: 5px 0 4px 5px;} 
	#errMsgCreate {text-align:center}
	.questErrMsg {color: red; display:none; padding: 10px 20px 0 22px}
ul.mc_dd_opt.widgetsEl li{margin-left: 2em;}
.popupBgDelete ,.popupBg {
background: #000;
opacity: 0.5;
width: 100%;
height: 100%;
position: fixed;
opacity: 0.5;
top: 0;
bottom: 0;
left: 0;
right: 0;
z-index: 9999;
display: none;
}

.ui-selectmenu-button span.ui-selectmenu-text {text-overflow: clip;}
.pipeline {
	display: inline-block;
	width: 2px;
	margin: 0 1em;
	border-right: #ccc 1px solid;
	height: 32px;
	vertical-align: middle;
}
.saveTmpError {display:none; color: red}
#single-text-box ul .qt_ansOpt, #multiple-text-box ol .qt_ansOpt, #multiple-text-box ol .qt_score {opacity: 0.2; border: 1px solid #000;}


.checkWrapQuest, .checkWrapQuest1{float:left; height:16px; margin-top:10px; width:16px; position:relative;}
.checkWrapQuest1{margin-right:10px; margin-top:6px;}
.checkWrapClickQuest{background:url(images/icons/form_set.png) 0 0 no-repeat; position:absolute; left:0; top:0; height:16px; width:16px; z-index:99;}
.customCheckboxNewQuest, .checkbox{height: auto; position:absolute; left:0; top:0; opacity:0; filter:alpha(opacity=0); outline:none; z-index:999;}
.qt_field_opt input[type="checkbox"]{margin-left:0 !important;}
#numeric-box .qt_ansOpt{width:50%}


/* For New Custom Select by Ravi */

.customSelectWrapperQuest{float:left; height:25px; position:relative; width:195px;}
.qtCat, .qtCatCurrency{height:25px; width:195px !important; position:absolute; left:0; top:0; opacity:0; filter: alpha(opacity=0); z-index:999;}

.dateSelector .qt_score {margin-left: 20px}

.bussinessCase {width: 100%; padding: 20px;}
.bussinessCase table {width: 100%}
.bussinessCase .bleft {text-align:right; padding-right: 20px}
.bussinessCase .bright {color: #000}
#numeric-box .qt_score, #currency-box .qt_score, #numeric-box .qt_field_opt, .currencydiv ,.score{display: none}
.mainpanel {margin-left: 0 !important}
.cSel + .ui-selectmenu-button {width: 297px !important}
.footer {position: static}
.datepicker:focus {border: 0 !important}
</style>
</head>

<!-- THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU -->
 
<%@ page import="com.rfg.tprm.questionnaire.model.QsttBoilerplate" %>
<%@ page import="com.rfg.tprm.questionnaire.model.QsttQuestionBank" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rfg.tprm.questionnaire.service.QsttBoilerplateServiceImpl" %>
<!-- THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU -->

<body>

<%-- <div class="leftpanel">
  <div class="logopanel"> <a href="#"><img src="images/img_logo.png" alt="Partner Integrity" ></a> </div>
  <!-- logopanel -->
  
 		<div class="leftpanelinner">
			<jsp:include page="leftPanel.jsp"></jsp:include>	

		</div>
  <!-- leftpanelinner --> 
</div>
<!-- leftpanel --> --%>

<div class="mainpanel">





<jsp:include page="header.jsp"></jsp:include>
			
		<!-- headerbar -->
		
		
		
		
		
  
<div class="container qstContainer">

 <div class="containerPanel clearfix">
 <div class="questHeader row clearfix">

  <sec:authorize access="hasRole('1-DESIGN')"> 
  <h2 class="col-md-3"><span class="qrName">${QRName}</span><a class="questTitleEdit" href="#"></a></h2>
  </sec:authorize>
  <div class="col-md-9 questBtnGlobal clearfix">
 <div class="fl"><span class="customInput customCheckBox selectall"><input type="checkbox" id="selectAll" style="display: none"><label for="selectAll">select all</label></span></div>
 <div class="fr"><button class="btn btn-xs addBank save1" type="button" disabled="disabled">Add to bank</button><button class="btn btn-xs insertBank save1" type="button">Insert from bank</button></div>
 <div class="hidden quesId"> <%=((Long)request.getAttribute("questionnaireId")) %></div>
 <div class="hidden quesId1"> <%=((java.lang.String)request.getAttribute("QRName")) %></div>
  </div>
  
  </div>
 <div class="setupQuestContainer clearfix">
  <div class="panels">
  	<div class="quesTabTitle">Question Type</div>
    <div id="questType" class="tab_content" style="display: block;">
     	<ul class="questTypeSprite">
  	  <li>Text box<ul>
  	  
  	  <li id="single-text-box" class="ui-widget-content"><i class="icon-sTxtBox"></i>Single text box</li>
  	  <li id ="multiple-text-box"><i class="icon-mTxtBox"></i>Multi text box</li>
      <li id ="numeric-box"><i class="icon-nBox"></i>Numeric box</li>
      <li id ="currency-box"><i class="icon-cBox"></i>Currency box</li>
      </ul></li>
  	  <li>Multiple choice<ul>
  	  <li id="multiple-choice-radio"><i class="icon-radio"></i>Radio</li>
  	  <li id="multiple-choice-dropdown"><i class="icon-dropdown"></i>Dropdown</li>
       </ul></li>
  	  <li>Multiple select<ul>
  	  <li id="multiple-select-checkbox"><i class="icon-checkBox"></i>Checkbox</li>
  	  <li id="multiple-select-dropdown"><i class="icon-dropdown"></i>Dropdown</li>
       </ul></li>
  	  <li>Boolean<ul>
  	  <li id="boolean-radio"><i class="icon-radio"></i>Radio</li>
  	  <li id="boolean-checkbox"><i class="icon-checkBox"></i>Checkbox</li>
       </ul></li>
  	  <li>Date<ul>
  	  <li id="dt-select"><i class="icon-dateSelection"></i>Date selection box</li>
  	  <li id="dt-picker"><i class="icon-datePicker"></i>Date picker</li>
	    </ul>
        </li>
        </ul>
    </div>
  	
        
  </div>
  <c:choose>
		<c:when  test="${!empty popup}">
  <form name="questionnaire" id="questionnaire"  method="POST">
<div class="createQuestion questPopup">  
     <!-- <i class="closeBtn closePopup redirect" ></i>  -->          
    <ul>
    <li><div class="questErrMsg">${displayName} cannot be empty</div>
     <div class="red">${message}</div>
     </li>
      <li>${displayName}<span class="red"> *</span></li>
      <li><input class="quesName" name="questionnairename" maxlength="44" /></li>
       <li>${displayDesc}</li>
      <li><textarea class="quesDesc" name="description" maxlength="255"></textarea></li>   
       <!-- THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU -->
        
      <li class='sTemplate'>Select from Template</li>
     <li class='sTemplate'> <select class="customSelect cSel">
       <option value="0">Select Template</option>
      <c:forEach items="${qsttBoilerplates}" var="template">
		<option value="${template.id}">${template.name}</option>
	  </c:forEach>
      </select>
     </li>
 <li><input class="hidden leftTagName" name="leftTagName" value="0" /></li>
  
 <!-- THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU -->   
      <li class="cancelSubmitBtn">
      <button type="button" class="btn btn-xs closePopup redirect cancel" >Cancel</button>
            <button type="button" class="btn btn-xs fr qstSubmit" >Submit</button>
     </li>
     
    </ul>    
</div>
</form>
<div class="popupBg"></div>
</c:when>
</c:choose>
  
  <div class="popupBgDelete"></div>
   <form name="submitquestionnaire" id="submit-questionnaire" action="./setupquestionnaire" method="POST">
  <div class="questContainer">
   <div class="errorMsg status-warn" style="display:none">Please fill the fields highlighted in red.</div>
   <div class="duplicate status-warn" style="display:none">Duplicate Names, Please give different name.</div>
  <!-- Dynamic Tabs -->
   <c:choose>
		<c:when  test="${empty businessCase}">
     <div class="questContainerTabs">
        <ul class="quest-tabs">
            <li class="active tab blueprintTab hidden" >
                <label class="sectionTitle" title=""></label>  
                <input class="sectionInput" />
                <span class="deleteQst"></span>
            </li>  	
            <li class="active tab" data-link='sectionTitle10'>
                <label for="sectionTitle1051" class="sectionTitle" title=""></label>  
                <input name="sectionTitle1051" id="sectionTitle1051" class="sectionInput" value="Default"/>
            </li>
             <li class="addSection"><span class="icon-plus">+</span>new section</li>
       </ul>
 	 </div>  
 	 </c:when>
</c:choose>
<c:choose>
		<c:when  test="${!empty businessCase}">
 	 <div class="bussinessCase">
       <table>
       <tr>
          <td class="bleft">Business case name</td>
          <td class="bright">${QRName}</td> 
         </tr>
       <tr>
         <td class="bleft">Company's full legal name</td>
         <td class="bright"><input type="text" class="search-table" />
         <input class="hidden" name="q1" value="Company's full legal name"/>
         <input class="hidden hiddenId" name="a1" value="" />
         </td> 
       </tr>
     </table>  
   </div>
</c:when>
</c:choose>
  	<!-- /Dynamic Tabs -->
    <!-- Dynamic Tab Contents -->
     <div class="tab_content hidden blueprint questionContainer" >
     <ul class="questionn sortable">       
     </ul>
     	<div class="dragItemLabel">Drag and drop questions from left palette</div>
    </div>  
    <div class="tab_content questionContainer current" id="sectionTitle10" style="display: block;">
       <ul class="questionn sortable">
       </ul>
       <div class="dragItemLabel">Drag and drop questions from left palette</div>
      </div>
</div>

<input type="hidden" name="qrid" value = "${questionnaireId}"/>
<input type="hidden" name="qrbank" value = "No"/>
<input type="hidden" name="tmpName" class="tmpName" value = "No"/>

<!-- THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU -->

<input type="hidden" name="insertBank" value="">
<input type="hidden" name="sectionName" value="">


<!-- THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU -->



</form>


</div>
</div>
<div class="btn-block">
<div class="fl paddingleft"><button class="btn saveAsTemplate" disabled="disabled">Save as template</button></div>
<div class="btns-fr"><form class="deleteFunction" method="post" action="./deletequestionnaire"><input type="hidden" class="quesId" name="questionnaireId" value="${questionnaireId}" /><button class="btn closer delete">Delete</button> </form><!-- <span class="pipeline"></span> --><button class="btn fr save1">Save</button></div>

</div>
</div>




		<!-- contentpanel -->



</div>
  <jsp:include page="footer.jsp" />

<div id="errMsgCreate"></div>
<!-- mainpanel -->


<div class="save-template-popup questPopup">  
<!-- 	 <i class="closeBtn"></i>    -->    
    <ul>
       <li class="saveTmpError">Template Name cannot be empty</li>
      <li>Enter Template Name</li>
      <li><input class="template-name" name="tempName" /></li>
      <li class="cancelSubmitBtn">
         <button class="btn btn-xs cancel closePopup" name="cancelQ">Cancel</button>
         <button class="btn btn-xs fr saveTemplate save1" name="submitQ">Submit</button>
      </li>
      
      
     <!-- <button class="btn btn-xs fr saveTmp" name="submitQ">Submit</button></li> -->
    </ul>  
</div>
<div class="questPopup deleteQuestion">  
<!-- 	 <i class="closeBtn"></i>  -->      
    <ul>
      <li>Are you sure you want to delete this questionnaire?</li>
      <li>
     <button type="button" class="btn btn-xs fr noBtn" name="no">Cancel</button>
     <button type="button" class="btn btn-xs cancel yesBtn closePopup" name="yes">Ok</button>
     </li>
     
    </ul>    
</div>

<!-- HERE IAM CREATING A FORM TO MAKE POPUP COMES TO ONE FORM  -->
<!-- 
  <form action = "./editquestionnairename" method="post"> 
 -->  

<div class="editQuestName questPopup">       
     <div class="questErrMsg">${displayName} cannot be empty</div>
     <div class="red">${message}</div>
     <br>
     <span id="boolResult" class="red"></span>
    <ul>
      <li>${displayName} <span class="red"> *</span></li>
      <li><input class="quesName" name="questionnairename" value="${QRName}" maxlength="44"/> <input type="hidden" class="quesId" name="questionnaireId" value="${questionnaireId}" /></li>
       <li>${displayDesc}</li>
      <li><textarea class="quesDesc" name="description" maxlength="255">${QRDescription}</textarea></li>     
      <li class="cancelSubmitBtn"><button type="button" class="btn btn-xs closePopup cancel" >Cancel</button>
     <button type="submit" class="btn btn-xs fr qstSubmitEdit" >Submit</button></li>     
    </ul>    
</div>
<div class="tooltop"></div>

<div class="tooltipQst"></div>

<!--  </form>

 --> 
 <!-- HERE IAM CREATING A FORM TO MAKE POPUP COMES TO ONE FORM  -->
 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
<script>
/* jQuery(document).on('keyup','.qt_score',function(){

	console.log("clicked...");

	var UpNum = /(?=.*[0-9])/;
	var inputVal = jQuery(this).val();

	if(inputVal.match(UpNum)){
	console.log("number");
	}

	else{
		console.log("alphabet");
		jQuery(this).val('');
		}


	}); */


//THIS IS THE CODE I ADDED FOR QUESTIONNAIRE NAME

jQuery('.qstSubmitEdit').on('click', function() {
	//alert(" IN EDIT QUESTIONNAIRE JQUERY METHOD");
    var khName = jQuery(this).closest('.editQuestName').find('.quesName').val(),
    khId = jQuery(this).closest('.editQuestName').find('.quesId').val(),
    khDesc = jQuery(this).closest('.editQuestName').find('.quesDesc').val();
   // alert("Questionnaire Description Entered By User is:"+khDesc);
    var flagValue = '';
    //Added for Business case
   
    //$('.qrName').text(khName);
    //$('.editQuestName, .popupBg, .popupBgDelete').hide();
if(khName.trim() == ''){
	jQuery('.questErrMsg').show();
	jQuery('#boolResult').html("");
//	$('#boolResult').html( 'Questionnaire Name and Description cannot be empty' );
	return false;	
}
jQuery('.qrName, .bussinessCase .bright:first').text(khName);  
  // Send the data using post
//alert("Hello");
 jQuery.post( './editquestionnairename', {'questionnaireName' : khName , 'questionnaireId' : khId, 'questionnaireDescription' : khDesc }, function(data) {
	// alert("--------FIRST SUCCESS--------");
	 
	 console.log("Result Came From Server is" + data);
//	 $('#boolResult').html( data );
var res = data;
var msg = '';
console.log("Resultant Data is:"+res);

//	 $('.boolResult').html(data);
	 if(res == '"true"') {
         msg = '${displayName} already exists';
         jQuery('#boolResult').html( msg );
         jQuery('.questErrMsg').hide();
 	//  console.log($('.boolResult').val() == true);
 //   $('.editQuestName, .popupBgDelete').hide();
 } 
	 else{
		 console.log("In Else Block");
	//	 $('.editQuestName, .popupBgDelete').hide();
		 jQuery('.editQuestName, .popupBg, .popupBgDelete').hide();
		 } 

	
}).done(function() {
   console.log( "--------SECOND SUCCESS--------" );
}).fail(function() {
       //alert("FAIL");
		});
	    
//	console.log("============");  
   
   // alert("Value is" + $('.boolResult').val());
   // console.log($('.boolResult').val());
  //  console.log($('.boolResult').val() == 'false');
 //   if($('.boolResult').val() == 'true') {
   // 	if(data == '"true"') {
      //    console.log("Damodar");
  	//  console.log($('.boolResult').val() == true);
  //	$('.editQuestName, .popupBg, .popupBgDelete').hide();
   //  $('.editQuestName, .popupBgDelete').hide();
 // }  
    
});

//THIS IS THE CODE I ADDED FOR EDIT QUESTIONNAIRE NAME

jQuery('.questTitleEdit').on('click',function(e){
     e.preventDefault();
	 jQuery('.editQuestName .quesName').val(jQuery('.qrName').text());
});

var global = 0;
var insert = 0;
jQuery('.addBank').on('click',function() {
	document.submitquestionnaire.qrbank.value = "Yes";
 });

/* jQuery('.addTemplate').on('click',function() {
	document.submitquestionnaire.tempName.value = "addTemplate1212";
 }); */

 

jQuery('.redirect').on('click',function() {
    
    window.open('/partnerintegrity/createquestionnaire','_self');
 });


jQuery(window).load(function(){
	
//alert("Pop Up is Creating");
	
	jQuery('.createQuestion').show();
	jQuery('.popupBg').show();

});
jQuery('.closeBtn, .closePopup').click(function(){
	// alert("Pop Up is Closing");
	jQuery('.template-name').val("");
	jQuery('.questPopup').hide();
	jQuery('.popupBg, .popupBgDelete').hide();
	
});
jQuery(document).ready(function () {
	
/*jQuery(".datepicker").datepicker({
	showOn: "button",
	changeMonth: true,
	changeYear: true
});*/
	jQuery('#single-text-box').draggable({helper: 'clone', cursor: 'move',live:true, start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#multiple-text-box').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#numeric-box').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#currency-box').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#multiple-choice-radio').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#multiple-choice-dropdown').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#multiple-select-checkbox').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#multiple-select-dropdown').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#boolean-radio').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#boolean-checkbox').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#dt-select').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	jQuery('#dt-picker').draggable({helper: 'clone', cursor: 'move' , start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') } });
	/* CODE TO FIND SELECTED OPTION OF SELECT BOX*/

	jQuery(".cSel").selectmenu({
			  select: function(event, data) {
			   jQuery('.leftTagName').val(data.item.value);
               if(data.item.value == '0') {
                 
                }
			  }
			});
		
		});	

	 /* CODE TO FIND SELECTED OPTION OF SELECT BOX*/


//assigning question numbers
function changeQstNo(){
	jQuery('#submit-questionnaire .current').find('.qt_No').each(function(index) {
		  jQuery(this).text((index+1) + ' )');							
		});	
 }

	jQuery('.sortable').sortable({
		connectWith: ".qt_settings",
		handle: ".icon-sort",
		stop: function() {
			changeQstNo();
		}
	});

 

  function dropMe() {
    var m = 1;
    jQuery("body .questionContainer.current").droppable({
	//console.log(jQuery(this).find("body .questionContainer.current"));
	//accept:'#single-text-box',
    drop: function (event, ui) {
		var $canvas = jQuery(this);
		if (!ui.draggable.hasClass('canvas-element')) {
			var $canvasElement = ui.draggable.clone();
			$canvasElement.addClass('canvas-element').removeClass('qstType');
			//console.log($canvasElement);
			var htmlpart = idPicker($canvasElement);// calling the idPicker function to place the html in the container
            var el = jQuery(this).closest('.questionContainer').attr('id');
            var parts = jQuery(htmlpart).find('.hq').attr('value', el+'51').end().find('.hq').attr('name', 'section'+ (m++)).end();
			$canvasElement = jQuery($canvasElement).html(parts);
			jQuery('.setupQuestContainer').find('.current .questionn').append($canvasElement);
			jQuery(this).find('.dragItemLabel').hide();
			$canvasElement.css({
				position: 'relative'
			});	
			jQuery('body').animate({scrollTop: jQuery('.questionContainer.current .question').height() + 150}, 1000);
			jQuery('.questionContainer.current').animate({scrollTop: jQuery('.questionContainer.current .questionn').height()+150}, 1000);	
        }

			//for checkbox design
			var checkElm = jQuery(".customCheckboxNewQuest").parent(".quesCheckbox"),
				checkElmInner = jQuery(".customCheckboxNewQuest, .checkbox").parent("li");
			checkElmInner.each(function(){
				jQuery(this).find("input[type='checkbox']").wrap("<div class='checkWrapQuest1'></div>");
				jQuery(this).find("input[type='checkbox']").after("<div class='checkWrapClickQuest'></div>");
			});
			
			checkElm.find("input[name='question']").wrap("<div class='checkWrapQuest'></div>");
			checkElm.find("input[name='question']").after("<div class='checkWrapClickQuest'></div>");
			jQuery(document).on("click", ".customCheckboxNewQuest, .checkbox", function(){
				if(jQuery(this).is(":checked")){
					jQuery(this).next().css("background-position","-34px 0");
				}else{
					jQuery(this).next().css("background-position","0 0");
				}
			});
			


			//for new dropdown by Ravi
			var elm = jQuery(".qtCat").parent("li"),
				qtCatCurrency = jQuery(".qtCatCurrency").parent("div");

			qtCatCurrency.each(function(){
				jQuery(this).find("select[name='a']").wrap("<div class='customSelectWrapperQuest'></div>");
				jQuery(this).find("select[name='a']").after("<div class='customSelectClickQuest'></div>");
				jQuery(this).find("select[name='a']").next().html(jQuery(this).find("select[name='a']").find('option:selected').text());
			});

			elm.each(function(){
				jQuery(this).find("select[name='cat']").wrap("<div class='customSelectWrapperQuest'></div>");
				jQuery(this).find("select[name='cat']").after("<div class='customSelectClickQuest'></div>");
				jQuery(this).find("select[name='cat']").next().html(jQuery(this).find("select[name='cat']").find('option:selected').text());
			});
			
			jQuery(document).on("change", ".qtCat, .qtCatCurrency", function(){
				jQuery(this).next().html(jQuery(this).find('option:selected').text());
			});

			
			
				
			//Date Picker
	var date = new Date();
    date.setDate(date.getDate());

	 
	jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-icon">');
	
  	//Dropdown hiding
	jQuery('.cancel, .save, .save-bulkanswer').on('click', function(){
  		jQuery(this).parents('.dd').hide();
	});
	
	/* jQuery("select").selectmenu(); */

       function customSelect() {
		 jQuery(".customSelect").selectmenu({
			close: function( event, ui ) {
				jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');}
			
			});
			 jQuery(".customSelect").selectmenu({
				open: function( event, ui ) {
				jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');
				}
			});			
    } 
	customSelect(); 
	//Save Template enable/disable
	jQuery(".saveAsTemplate").attr("disabled","disabled");
	
		jQuery("input[name^=question]").click(function(){
	      jQuery('li.canvas-element').each(function(){
	                      if(jQuery('input[name^=question]').is(':checked')) {    
	                                      jQuery(".saveAsTemplate").removeAttr("disabled");
	                                      jQuery(".addBank").removeAttr("disabled");
	                      }
	                      else if(jQuery('input[name^=question]').not(':checked')) { 
	                                      jQuery(".saveAsTemplate").attr("disabled","disabled"); 
	                                      jQuery(".addBank").attr("disabled","disabled");            
	                      }    
	                                                            
	      });
	});

		
		changeQstNo();		
 
//Drop function ends
    }

});



  }

  dropMe();
  

	//Dynamic Tab	
	(function(){
		 var uid = 11;
		jQuery('.addSection').on('click', function(){
		   if(jQuery('.tab').length <= 15 ) {
			 jQuery('.tab').removeClass('active');
			 /* var dataValue = jQuery('.addSection').prev().data('link').split('').reverse().join('');
			 var newVal = "dTab" + (parseInt(dataValue) + 1); */
		     jQuery('.blueprintTab').clone().find('label').attr('for', 'sectionTitle' + uid + '51').end().find('input').attr('id', ('sectionTitle' + uid + '51')).end().find('.sectionInput').attr('name', ('sectionTitle' + uid + '51')).end().removeClass('blueprintTab').removeClass('hidden').addClass('active').attr('data-link', 'sectionTitle' + uid).insertBefore('.addSection');
             jQuery('.questionContainer').removeClass("current").hide();  
             jQuery('.blueprint').clone().removeClass('blueprint hidden').addClass('current').attr('id', 'sectionTitle' + uid).show().droppable().appendTo('.questContainer');
			 dropMe();
			 uid++;
             //console.log(jQuery(this));
		   }
     });
  
       jQuery('.questContainer').on('click', '.tab', function(){
	       var showContainer = jQuery(this).attr('data-link');
	       jQuery('.tab').removeClass('active');
	       jQuery(this).addClass('active');	
	       jQuery('.questionContainer').removeClass('current').hide();
	       jQuery('#' + showContainer).addClass('current').show();
		   //console.log(jQuery(this).attr());
		   //console.log(this);
	    });
	 })();
    //jQuery( "#container" ).disableSelection();
	
function idPicker(id){
//console.log(jQuery(id[0]).attr("id"));
var draggableId;
	switch(jQuery(id[0]).attr("id")){
	
	case "single-text-box" : return draggableId = "<div class='qt_settings clearfix'> <i class='icon-sTxtBox icons'></i><span class='widgetName'>Single Text Box</span><ul class='controlPanel clearfix'> <li>${categoryValues}</li> <li><span class='qt_each_settings icon-sort'></span></li> <li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td> Mandatory <span class='redTxt'>*</span></td> <td><label class='switch-light switch-slider'><input name='mCheck' type='checkbox' class='customCheckboxNewQuest' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input name='aCheck' type='checkbox' class='customCheckboxNewQuest' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= ''></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div> </li> <li><span class='qt_each_settings icon-delete'></span></li> </ul></div><div class='clearfix ques'> <div class='quesCheckbox'> <input name='question' type='checkbox' class='customCheckboxNewQuest questionQ'><label for='question'></label> </div><span class='qt_No'></span><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden' name='qt' type='text' value= '1'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix'> <div class='clearfix'> <span class='qt_ansOpt'>Answer</span> </div> <ul> <li class='clearfix'><input class='qt_ansOpt' name='a' type= 'text' readOnly='true'></li> </ul></div>"; break;		
	
	/* case "multiple-text-box" : return draggableId = '<div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" checked /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "2"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answer option</span><span class= "qt_score">Score</span> </div> <ol class="qt_multiTxtBoxList widgetsEl" type="a"> <li class="clearfix qt_multiTxtBox_row hidden"><input class="qt_ansOpt" name="a" type="text" readOnly="true"><input class="qt_score" name="s" type= "text" readOnly="true"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"><input class="qt_score" name="s" type="text" readOnly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"><input class="qt_score" name="s" type="text" readOnly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"><input class="qt_score" name="s" type= "text" readOnly="true"><button class="qt_add"></button></li> </ol></div>';
	break; */

	case "multiple-text-box" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-mTxtBox icons"></i><span class="widgetName">Multi text box</span><ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td> Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "2"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answers</span></div> <ol class="qt_multiTxtBoxList widgetsEl" type="a">  <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"></li> </ol></div>';
	break; 
	
	case "numeric-box" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-nBox icons"></i><span class="widgetName">Numeric box</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "3"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_ansOpt clearfix" style="margin:10px 10px 5px 45px; font-style: italic;"> Answer</div><div class="clearfix" style="padding:0 10px 16px 45px"> <input class="qt_ansOpt" name="a" type="text" readonly="true"></div><div class="qt_field_opt qt_multi clearfix"> <label class="setRange">Set range</label> <div class="clearfix"></div> <div class="clearfix"> <span class="col1">From</span><span class="col2">To</span><span class= "col3 qt_score">Score</span> </div> <ul class="qt_multiTxtBoxList widgetsEl"> <li class="clearfix qt_multiTxtBox_row hidden"><input class= "col1" name="from" type="text"><input class="col2" name="to" type="text"><input class="col3 qt_score" maxlength=5 name="s" type= "text"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="col1" name="from" type="text"><input class="col2" name="to" type= "text"><input class="col3 qt_score" maxlength=5 name="s" type="text"><button class= "qt_add"></button></li> </ul></div>';
	break;
	
	case "currency-box" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-cBox icons"></i><span class="widgetName">Currency box</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "4"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <span class="qt_ansOpt"></span><span class="qt_ansOpt pleft col1">Answer</span> </div> <div class="clearfix"> <select class= "qtCatCurrency currency" name="a"> <option value="USD">USD</option> <option value="POUND">POUND</option> <option value="RUPEE">RUPEE</option> </select><input class="qt_ansOpt mleft currencyInput" name="a" type="text" readonly="true"> </div><div class="currencydiv"><label class="setRange">Set range</label> <div class="clearfix"></div> <div class="clearfix"> <span class="col1">Min. value</span><span class="col2">Max. value</span><span class="col3 qt_score">Score</span> </div> <ul class="qt_multiTxtBoxList widgetsEl"> <li class="clearfix qt_multiTxtBox_row hidden"><input class= "col1" name="from" type="text"><input class="col2" name="to" type="text"><input class="col3 qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="col1" name="from" type="text"><input class="col2" name="to" type= "text"><input class="col3 qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button></li> </ul></div></div>';
	break;
	
	case "multiple-choice-radio" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-radio icons"></i><span class="widgetName">Multiple choice radio</span><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-sort"></span></li><li><span class="qt_each_settings icon-settings"></span><div class="settings-panel dd"><table><tr><td>Mandatory <span class="redTxt">*</span></td><td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr><td>Allow Attachment</td><td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr><td>Tag</td><td><input class="tag" name="tag" type="text" value=""></td></tr></table><button class="btn btn-xs cancel" type="button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button></div></li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><div class="quesCheckbox"><input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label></div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value="5"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><ul class="qt_field_opt qt_mc_radio qt_multi clearfix widgetsEl nolist"><li class="clearfix"><span class="qt_ansOpt">Answer Option</span><span class="qt_score">Score</span></li><li class="clearfix hidden"><div class="radioWrapQuest"><input name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"><button class="qt_add"></button><button class="qt_remove"></button></li><li class="clearfix"><div class="radioWrapQuest"><input name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" maxlength=5 name="s" type="text"></li><li class="clearfix"><div class="radioWrapQuest"><input name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li><li class="clearfix"><div class="radioWrapQuest"><input name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><label for="radio17"></label><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"><button class="qt_add"></button></li></ul><div class="clearfix"></div>'; break;
	
	case "multiple-choice-dropdown" :return draggableId = '<div class="qt_settings clearfix multiple-choice-dropdown"> <i class="icon-dropdown icons"></i><span class="widgetName">Multiple choice dropdown</span><ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li> <button class="btn btn-xs bulk-answer" type="button">Bulk Answer</button> <div class="bulk-answer-panel dd"> Bulk answer <textarea></textarea><button class="btn btn-xs cancel" type="button">Cancel</button><button class="btn btn-xs save-bulkanswer" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "6"><input class="hidden hq" name="section1" value=""><input class="multiDropdownQuest q require" name="q" type="text"></div><div class="qt_field_opt qt_multiChoice_dd"> <ul> <li class="clearfix"> <div class="multiChoice_dd"> <div class="mc-dropdown-select multiChoice_dd_select"> Select answer option </div> <ul class="mc_dd_opt hide widgetsEl"> <li><label class="bulk">Answer Option</label><label class= "score">Score</label></li> <li class="clearfix hidden"><input class="bulk require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix"><input class="bulk require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><input class="bulk require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><input class="bulk require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"><button class="qt_add"></button></li> </ul> </div> </li> </ul></div>'; break;
	
	case "multiple-select-checkbox" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-checkBox icons"></i><span class="widgetName">Multiple select checkbox</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "7"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><ul class="qt_field_opt qt_multi clearfix widgetsEl nolist"> <li class="clearfix"><span class="qt_ansOpt">Answer Option</span><span class="qt_score">Score</span></li> <li class="clearfix hidden"><label for="checkbox123"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" name="checkbox123" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button><button class="qt_remove"></button></li> <li class="clearfix"><label for="checkbox124"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" id="checkbox124" name="checkbox124" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="checkbox125"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" id="checkbox125" name="checkbox125" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="checkbox126"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" id="checkbox126" name="checkbox126" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button></li> <li style="list-style: none; display: inline"> <div class="clearfix"></div> </li></ul>'; break;
	
	case "multiple-select-dropdown" : return draggableId = '<div class="qt_settings clearfix multiple-select-dropdown"><i class="icon-dropdown icons"></i><span class="widgetName">Multiple select dropdown</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li> <button class="btn btn-xs bulk-answer" type="button">Bulk Answer</button> <div class="bulk-answer-panel dd"> Bulk answer <textarea></textarea><button class="btn btn-xs cancel" type="button">Cancel</button><button class="btn btn-xs save-bulkanswer" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" name="tag" type="text" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "8"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix multiChoice_dd"> <div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div> <ul class="mc_dd_opt hide widgetsEl"> <li class="clearfix"><label class="bulk">Answer Option</label><label class="score">Score</label></li> <li class="clearfix hidden"><label></label><input name="checkbox130" type= "checkbox" class="customCheckboxNewQuest"><input class="bulk require" name="a" type="text"><input class= "qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button><button class="qt_remove"></button></li> <li class="clearfix"><label for="mcheckbox421"></label><input class= "checkbox" id="mcheckbox421" name="checkbox421" type="checkbox"><input class="bulk require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="mcheckbox521"></label><input class= "checkbox" name="checkbox521" id="mcheckbox521" type="checkbox"><input class="bulk require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="mcheckbox621"></label><input class= "checkbox" id="mcheckbox621" name="checkbox621" type="checkbox"><input class="bulk require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button></li> </ul> </div><div class="clearfix"></div>'; break;
	
	case "boolean-radio" : return draggableId = '<div class="qt_settings clearfix"> <i class="icon-radio icons"></i><span class="widgetName">Boolean radio</span><ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "9"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type= "text"></div><div class="qt_field_opt qt_boolean_Radio clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answer Option</span><span class= "qt_score">Score</span> </div> <ul> <li class="clearfix"><div class="radioWrapQuest"><input name="qstion" type="radio"><div class="radioWrapClickQuest"></div></div><input class= "qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type= "text"></li> <li><div class="radioWrapQuest"><input name="qstion" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li> </ul></div>'; break; 
	
	case "boolean-checkbox" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-checkBox icons"></i><span class="widgetName">Boolean checkbox</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td>Mandatory <span class="redTxt">*</span></td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"  /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest questionQ"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "10"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type= "text"></div><div class="qt_field_opt qt_boolean_chkbox"> <div class="clearfix"> <span class="qt_ansOpt">Answer</span><span class= "qt_score">Score</span> </div> <ul> <li class="clearfix"><input name="qstion"  type= "checkbox" class="customCheckboxNewQuest"><input class="qt_ansOpt require" name="a" type="text"><input class= "qt_score" name="s" maxlength=5 type="text"></li> </ul></div>'; break;
	
	case "dt-select" : return draggableId = "<div class='qt_settings clearfix'> <i class='icon-dateSelection icons'></i><span class='widgetName'>Date selection box</span> <ul class='controlPanel clearfix'> <li>${categoryValues}</li><li><span class='qt_each_settings icon-sort'></span></li><li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td>Mandatory <span class='redTxt'>*</span></td><td><label class='switch-light switch-slider'><input class='customCheckboxNewQuest' name='mCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr> <td>Allow Attachment</td><td><label class='switch-light switch-slider'><input class='customCheckboxNewQuest' name='aCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr> <td>Tag</td><td><input class='tag' name='tag' type='text' value=''></td></tr></table><button class='btn btn-xs cancel' type='button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div></li><li><span class='qt_each_settings icon-delete'></span></li></ul></div><div class='clearfix'> <div class='quesCheckbox'> <input class='customCheckboxNewQuest questionQ' name='question' type='checkbox'><label for='question'></label> </div><span class='qt_No'></span> <label class='qt_editBox' for='qt_editBox' title=''></label> <input class='hidden' name='qt' type='text' value='11'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix'> <div class='clearfix'> <span class='qt_ansOpt'>Answer</span><span class='qt_score'>Score</span> </div><ul> <li class='clearfix'><span class='dateSel'> <div class='customSelectWrapperQuest disabledDates'> <select> <option> dd </option> </select> <div class='customSelectClickQuest disabledDates'>dd</div></div><div class='customSelectWrapperQuest disabledDates'> <select> <option> mm </option> </select> <div class='customSelectClickQuest disabledDates'>mm</div></div><div class='customSelectWrapperQuest disabledDates'> <select> <option> yyyy </option> </select> <div class='customSelectClickQuest disabledDates'>yyyy</div></div></span> <input class='qt_score' maxlength=5 name='s' type='text'></li></ul></div>"; break;
	
	case "dt-picker" : return draggableId = "<div class='qt_settings clearfix'><i class='icon-datePicker icons'></i><span class='widgetName'>Date picker</span> <ul class='controlPanel clearfix'> <li>${categoryValues}</li> <li><span class='qt_each_settings icon-sort'></span></li> <li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td>Mandatory <span class='redTxt'>*</span></td> <td><label class='switch-light switch-slider'><input name='mCheck' type='checkbox' class='customCheckboxNewQuest' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input  name='aCheck' type='checkbox' class='customCheckboxNewQuest' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class='tag' type='text' name='tag' value= ''></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div> </li> <li><span class='qt_each_settings icon-delete'></span></li> </ul></div><div class='clearfix'> <div class='quesCheckbox'> <input name='question' type='checkbox' class='customCheckboxNewQuest questionQ'><label for='question'></label> </div><span class='qt_No'>1)</span> <label class='qt_editBox' for= 'qt_editBox' title=''></label><input class='hidden' name='qt' type= 'text' value='12'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix qt_dp dateSelector'> <div class='clearfix'> <span class='qt_ansOpt'>Answer</span><span class= 'qt_score'>Score</span> </div> <ul> <li class='clearfix'><input class='datepicker' disabled placeholder='dd/mm/yyyy' name='a' type= 'text'><i class='dp-disabled'></i><input class='qt_score' name='s' maxlength=5 type='text'></li> </ul></div>"; break;

	default : draggableId = "<div>Failed..Dragging please try again</div>";
		
	}
}

jQuery('.qt_No').siblings('input').css('width','92%');
	
    jQuery('.saveTemplate').on('click', function(e) {
  	   var tmp =  jQuery(this).closest('.save-template-popup').find('.template-name').val();
  	   jQuery('.tmpName').val(tmp);
  	   if(jQuery('.template-name').val().trim() == '') {
     	    jQuery('.saveTmpError').show();
     	    global = 1;
     	    return false;
     	   }
  	   else {
            global = 0;
  	   }
    	  
    	//$.post('./setupquestionnaire', $('#submit-questionnaire').serialize());
    	   
      });



//Add and Remove Answer Options

jQuery('.questContainer').on('click', '.questionContainer.current .qt_add', function(e) {
	   e.stopPropagation();
	   e.preventDefault();
	   var parentEl = jQuery(this).closest('.widgetsEl');
	
	   if(parentEl.hasClass('qt_mc_radio') || parentEl.hasClass('qt_multi') || parentEl.hasClass('mc_dd_opt')){
		   var num = randonNumber();
		   parentEl.find('.hidden').clone().removeClass('hidden').find('label').attr('for', num).end().find('input:radio').attr('id', num).end().find('input:checkbox').attr('id', num).end().appendTo(parentEl);		  
	   } else {
	       parentEl.find('.hidden').clone().removeClass('hidden').appendTo(parentEl);
	   }
	});

jQuery('.questContainer').on('click', '.questionContainer.current .qt_remove', function(e) {
	   e.stopPropagation();
	   e.preventDefault();
	   jQuery(this).closest('.clearfix').remove();
	});
	
	
//Hide and Show Drop Down
jQuery('.questContainer').on('click', '.mc-dropdown-select',function(){
   jQuery(this).toggleClass('toggle').next('.mc_dd_opt').toggleClass('hide');
  
});
//Hide and Show Drop Down

//Tabs
	jQuery(".panel-tabs li").click(function() {
        jQuery(".panel-tabs li").removeClass('active');
        jQuery(this).addClass("active");
        jQuery(".tab_content").hide();
        var selected_tab = jQuery(this).find("a").attr("href");
        jQuery(selected_tab).fadeIn();
        return false;
    });	

//Dynamic ID creation
	
//delete Widgets
jQuery('.setupQuestContainer').on('click', '.icon-delete', function(e) {
    e.stopPropagation();
    jQuery(".settings-panel").hide();
	var $this = jQuery(this);
	jQuery('.popupBgDelete, .deleteQuestion').show();
	jQuery('body').on('click', '.btn ',function(e) {
		if(jQuery(this).hasClass('yesBtn')){
			$this.closest('.ui-draggable').remove();
			if(jQuery('.questContainer').find('.current ul li.ui-draggable').length == 0) {
				jQuery('.questContainer').find('.current .dragItemLabel').show();
				
		   }
			
			if(jQuery('.questContainer').find('ul li.ui-draggable').length == 0) {
				jQuery('.addBank').prop('disabled', 'disabled');
			}
			
   
           jQuery('#submit-questionnaire').find('.qt_No').each(function(index) {
                 jQuery(this).text(index+1 + " )");
           }); 			   
		}
		jQuery('.popupBgDelete, .questPopup, .errorMsg, .duplicate').hide();
	});
/* 	if(jQuery(this).closest('.questionContainer.current').find('ul.questionn').find('li.ui-draggable').length == 1 ) {
        $(".saveAsTemplate").attr("disabled","disabled");            
	} */
	
	
});
   function randonNumber(){
	  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
	  return rNum;                             
	}
   

   jQuery('.qstSubmit').on('click', function(){
	   if(jQuery('.quesName').val().trim() == '') {
             jQuery('.quesName').val('');
            jQuery('.questErrMsg').show()
	    }
	   else {
		   document.questionnaire.action = "${pageContext.request.contextPath}/createquestionnaire";
		 	document.questionnaire.submit();
		   //jQuery('#submit-questionnaire').submit();
             return true;
		   }
       
	});

  
   
   function clearMsg(){
		document.getElementById('errMsgCreate').innerHTML="";
		
	}

//THIS IS THE CODE TO PASS QUESTIONNAIRE ID BY SATYA & TRIPU
   
   jQuery('.insertBank').on('click',function() {
	   var sectionName = jQuery('.questContainerTabs').find('.active input').val();
		document.submitquestionnaire.sectionName.value = sectionName;
	  // global = 1;
	  insert = 1;
	  document.submitquestionnaire.insertBank.value="insert"; 
	  return true;
  	  
   	 });

   //THIS IS THE CODE TO PASS QUESTIONNAIRE ID BY SATYA & TRIPU


    jQuery('.save1').on('click', function(){
   //	//alert(jQuery('.questionn>li.canvas-element').index()+1);
  // var i = jQuery('.questionn li.canvas-element').length/2;	
  //Dynamic ID generation for Questionnaire
        var startNum = jQuery('.bussinessCase').length;
		jQuery('.questionContainer li.canvas-element').each(function(i,el){
				el = i+1+startNum;	   
			//Question Checkbox
			jQuery(this).find("#question").attr('name', function(i,v){
				return v.replace(/[0-9]/g, '')+el; 				
			});
			jQuery(this).find(".hq").attr('name', function(i,v){
				return v.replace(/[0-9]/g, '')+el; 				
			});
			//Settings 
			jQuery(this).find(".settings-panel input").attr('name', function(i,v){
				return v.replace(/[0-9]/g, '')+el; 				
			});
			//Text value
			jQuery(this).find("input[type='text'], select.currency").attr('name', function(i,v){
				return v.replace(/[0-9]/g, '')+el; 				
			});

			//checkbox value
			jQuery(this).find("input[type='checkbox'], select.currency").attr('name', function(i,v){
				return v.replace(/[0-9]/g, '')+el; 				
			});			
			//Select Category
		   jQuery(this).find(".qt_settings .controlPanel li select").attr('name', function(i, v){
				return v.replace(/[0-9]/g, '')+el; 
			});
/* 		   jQuery(this).find(".dateSel select").attr('name', function(i, v){
				return v.replace(/[0-9]/g, '')+el; 
			}); */
		  jQuery(this).find('.widgetsEl li input[type="text"]').attr('name', function(i,v){
						return v.replace(/[0-9]/g, '')+el;
			});	
		
 		});

		if (jQuery('.questionContainer').find('.ui-draggable').length == 0) {
			
			if(insert < 1 )
	           return false;
	       }
	       
	       var len = jQuery('.questionContainer').find('.require').length, value = 0;

	       jQuery('.questionContainer').find('.require').each(function (index) {
	           if (jQuery(this).closest('li').hasClass('hidden') == false && jQuery(this).val().trim() == '') {
	               jQuery(this).addClass('errorInput').val('');
	              
	               return;
	           }

	           else if (jQuery(this).closest('li').hasClass('hidden') == true) {
	               value++;
	               return;
	           }
	           else {
	               jQuery(this).removeClass('errorInput');
	               --len;
	           }
	       });
	       
	       var lenSel = jQuery('.questionContainer').find('.requireSelect').length;
	       jQuery('.questionContainer').find('.requireSelect').each(function (index) {
	           if (jQuery('.questionContainer .requireSelect')[index].selectedIndex == 0) {
	        	   jQuery('.questionContainer .requireSelect').eq(index).addClass('errorInput');
	           }
	           else {
	        	   jQuery('.questionContainer .requireSelect').eq(index).removeClass('errorInput');
	               --lenSel;
	           }
	       });
	     
	       var m =  jQuery('.questContainerTabs').find('.sectionInput').length;	
	       jQuery('.questContainerTabs').find('.sectionInput').each(function(index) { 
		             	   
	    	     if(!jQuery(this).closest('.tab').hasClass('hidden') && jQuery(this).val().trim() == '') {    
	    	            jQuery(this).addClass('errorInput').val('');  	    		    	                 		    	  
	    	      }	 
	    	     else {
	    	    	    jQuery(this).removeClass('errorInput');  
	    	    	    m--;
		    	     }  
	    	  });

	       var arr = [], duplicate = true;
	    
	       jQuery('.questContainerTabs').find('.sectionInput').each(function(index) {
	           arr.push(jQuery(this).val());   
	       });

	       for(var i=1; i < arr.length; i++) {
	          for(var j=i+1; j< arr.length; j++) {
	            if(arr[i] == arr[j]) {
	            	jQuery('.questContainerTabs').find('.sectionInput').eq(i).addClass("errorInput");
	               duplicate = false;
	             }
	            else {
	            	jQuery('.questContainerTabs').find('.sectionInput').eq(i).removeClass("errorInput");
		            }
	          } 
	       }
	       
	       duplicateTags();
	                
	       if (len > value || lenSel > 0 || m > 0) {
	    	   //alert("In End Save JQuery Method");	   
	        	jQuery('.errorMsg').show();
	        	var selId = jQuery('.errorInput').closest('.questionContainer').find('.hq').val();
                jQuery('#'+ selId).trigger('click');
                jQuery('.errorInput').closest('ul.widgetsEl').removeClass('hide');
	            return false;
	       }
	       else if(duplicate == false || dupTags == false){
	    	 //  //alert("In End Save JQuery Method1");
	    	   console.log("duptags " + dupTags);
	    	   jQuery('.errorMsg').hide();
		       jQuery('.duplicate').show();
	           return false;
	       }
	       else {
	    	   if(global < 1 )
		           document.submitquestionnaire.submit();
		       //alert("In End Save JQuery Method2");
               return true;
		       }		
   }); 

    jQuery('.questContainer').on('click', '.deleteQst', function(e){
        e.stopPropagation();
        var showContainer = jQuery(this).closest("li").prev().attr('data-link');
        jQuery(this).closest("li").prev().addClass("active");
    	var els = jQuery(this).closest('li').attr('data-link');
    	jQuery(this).closest('li').remove();
    	jQuery('#' + els).remove();
    	jQuery('.questionContainer').removeClass('current').hide();
	    jQuery('#' + showContainer).addClass('current').show();
    });
    

    function validateFields() {
    	var len = jQuery('.questionContainer').find('.require').length, value = 0;

	       jQuery('.questionContainer').find('.require').each(function (index) {
	           if (jQuery(this).closest('li').hasClass('hidden') == false && jQuery(this).val().trim() == '') {
	               jQuery(this).addClass('errorInput').val('');
	              
	               return;
	           }

	           else if (jQuery(this).closest('li').hasClass('hidden') == true) {
	               value++;
	               return;
	           }
	           else {
	               jQuery(this).removeClass('errorInput');
	               --len;
	           }
	       });
	       
	       var lenSel = jQuery('.questionContainer').find('.requireSelect').length;
	       jQuery('.questionContainer').find('.requireSelect').each(function (index) {
	           if (jQuery('.questionContainer .requireSelect')[index].selectedIndex == 0) {
	        	   jQuery('.questionContainer .requireSelect').eq(index).addClass('errorInput');
	           }
	           else {
	        	   jQuery('.questionContainer .requireSelect').eq(index).removeClass('errorInput');
	               --lenSel;
	           }
	       });
	     
	       var m =  jQuery('.questContainerTabs').find('.sectionInput').length;	
	       jQuery('.questContainerTabs').find('.sectionInput').each(function(index) { 
		             	   
	    	     if(!jQuery(this).closest('.tab').hasClass('hidden') && jQuery(this).val().trim() == '') {    
	    	            jQuery(this).addClass('errorInput').val('');  	    		    	                 		    	  
	    	      }	 
	    	     else {
	    	    	    jQuery(this).removeClass('errorInput');  
	    	    	    m--;
		    	     }  
	    	  });

	       var arr = [], duplicate = true;
	    
	       jQuery('.questContainerTabs').find('.sectionInput').each(function(index) {
	           arr.push(jQuery(this).val());   
	       });

	       for(var i=1; i < arr.length; i++) {
	          for(var j=i+1; j< arr.length; j++) {
	            if(arr[i] == arr[j]) {
	            	jQuery('.questContainerTabs').find('.sectionInput').eq(i).addClass("errorInput");
	               duplicate = false;
	             }
	            else {
	            	jQuery('.questContainerTabs').find('.sectionInput').eq(i).removeClass("errorInput");
		            }
	          } 
	       }
	       
	       duplicateTags();
	       var validate = true;
	                
	       if (len > value || lenSel > 0 || m > 0) {
	    	   //alert("In End Save JQuery Method");	   
	        	jQuery('.errorMsg').show();
	        	var selId = jQuery('.errorInput').closest('.questionContainer').find('.hq').val();
             jQuery('#'+ selId).trigger('click');
             jQuery('.errorInput').closest('ul.widgetsEl').removeClass('hide');
               validate = false;
	            return false;
	       }
	       else if(duplicate == false || dupTags == false){
	    	 //  //alert("In End Save JQuery Method1");
	    	   console.log("duptags " + dupTags);
	    	   jQuery('.errorMsg').hide();
		       jQuery('.duplicate').show();
		       validate = false;
	           return false;
	       }
	       else {
	    	   jQuery('.errorMsg, .duplicate').hide();
	       }
	       
	       return validate;
    }

    
    
    jQuery('.mainpanel').on('click', '.saveAsTemplate', function(e){
    	e.stopPropagation();
    	
    	
    	var validate = validateFields();
    	
    	if(validate == true) {
	        jQuery('.save-template-popup').show();
	        jQuery('.popupBgDelete').show();
    	}
    });

     jQuery('.questTitleEdit').on('click',  function(e){
     //    alert("Pop Up Created");
         e.preventDefault();
    	 document.getElementById('boolResult').innerHTML = "";
         jQuery('.editQuestName').show();
         jQuery('.popupBgDelete').show();
         jQuery('.questErrMsg').hide();
     });


     jQuery('.deleteFunction').on('click', function(e) {
         e.preventDefault();
         e.stopPropagation();
         jQuery('.qstText').text('questionnaire');
         jQuery('.deleteQuestion,  .popupBgDelete').show();
         jQuery('.yesBtn').on('click', function() {
         jQuery('.deleteFunction').submit(); 
       });
         
         jQuery('.noBtn').on('click', function(e) {
        	 jQuery('.deleteQuestion,  .popupBgDelete').hide();  
         });
     });
    	     
  

</script>
	<script src="js/custom.js"></script>

</body>
</html>