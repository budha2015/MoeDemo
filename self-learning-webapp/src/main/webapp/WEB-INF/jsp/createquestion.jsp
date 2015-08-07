<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link href="css/quescommon.css" rel="stylesheet">

<link rel="stylesheet" href="css/questionnaire.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
<link href="css/qrmain.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/questionnaire/qr-common.css">
<link rel="stylesheet" type="text/css" href="css/questionnaire/qr-setup.css">
<link rel="stylesheet" href="css/commonDT.css" />
<link rel="stylesheet" href="css/mainDT.css" />

<!--
<link type="text/css" href="http://jscrollpane.kelvinluck.com/style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 http://jscrollpane.kelvinluck.com/ -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
.ansOpt {
    display: block;
    font-size: 11px;
    font-style: italic;
    padding: 0 0 5px !important;
}
.ui-widget-content {border: none;}
.setupQuestContainer{
	float:left;width:100%;
}
.questionContainer.current { border: none;}
.questionContainer {
width: 715px;
min-height:600px;
height:auto!important;
height:600px;
background:transparent;
position:relative;
vertical-align:middle;
padding:10px;
border:1px solid #ccc;
border-width:0px 1px 1px;
}
.questionContainer li.canvas-element{
width:692px;
display:inline-block;
display:block;
list-style-type:none;
height:auto;
padding-top:10px;
margin:10px
}
.questionContainer .ui-draggable .customCheckBox label{top:4px}
.qt_editBox{margin:0}
#multiple-choice-dropdown .mc_dd_opt{
display:inline-block;
position:relative;
}
.clearfix {padding-bottom: 5px}
.save-template-popup {
    background: none repeat scroll 0 0 #fff;
    border-radius: 10px;
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
    border-radius: 5px;
    color: #000 !important;
    font-size: 11px;
    font-weight: bold;
    height: 22px;
    padding-left: 2%;
    width: 99%;
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
.errorMsg {background: #ccc; display:none;font-size: 14px;padding:10px; margin:auto;width:100%; color:red; text-align:center}

.multiChoice_dd{float:left}
.select-category{border-radius:5px;border:1px solid #11b1aa; border-top:0;padding:2px 5px; width:200px;position:absolute}
.select-category input{width:100%; margin:2px 0; cursor:pointer;}
.select-category.hide{display:none}
.select-category.show{display:block;z-index:1}
#multiple-select-dropdown .mc_dd_opt.show{position:relative; display:inline-block}


.panel-tabs {border-bottom: none}
.controlPanel {padding-right: 22px}
.controlPanel li{padding-left: 20px}
.qt_settings {padding-bottom: 10px}
#qt_editBox {border: 1px solid #ccc}
.col1, .col2 {margin-right: 1em; width: 30%; font-style:italic}
.col3 {width:6%;margin-right:10px}
.setRange {
	color: #000;
	font-size: 12px;
	font-weight: normal;
	border-top: 1px solid #e1e3eb;
	display: block;
	width: 75%;
	padding: 10px 0;
}
.multiChoice_dd {width: 350px}
.mc_dd_opt {width: 100%}
.mc_dd_opt .score, .mc_dd_opt label.score {float:left; margin-left:10px; width: 16%; margin-right: 15px;}
.qt_field_opt button {float:left;}
.dd, .mm, .yy {float:left; margin-right: 20px}
.dateSel {width: 50%; display:inline-block; float:left}
#datepicker {margin-right: 21%; width: 30%}
.multiChoice_dd_select {width: 350px}

.questPopup ul {text-align:center}
.yesBtn, .noBtn{width: 75px; margin-top:10px; float:right}

.leftpanel {
    background: none repeat scroll 0 0 #3b3b3b;
    left: 0;
    position: absolute;
    top: 0;
    width: 240px;
    z-index: 100;
    height: 830px;
}
#errBackMsg{
 height: 28px;
overflow: hidden;
width: 500px;
margin: auto;
text-align: center;
padding-top: 6px;
}
.closer, .save {width: 95px}
.errorInput {border: 1px solid red !important}
.mainpanel {height: 100% !important}
.leftpanel {height: 100% !important}
.btns {width: 100%; }
.btns .btn {width: 100px}
span.qt_ansOpt, span.bulk {margin-left: 3px; margin-right: 4px; float:left}
.footer {position: relative !important; width: 100%;}
.multiChoice_dd .qt_add {margin-left: 10px}
.mc_dd_opt {overflow: auto; max-height:300px;}

#single-text-box ul .qt_ansOpt, #multiple-text-box ol .qt_ansOpt, #multiple-text-box ol .qt_score {opacity: 0.2; border: 1px solid #000;}
@media screen\0 {      
    select {
        max-height:200px;
    }     
}
.currencyBox li.clearfix select {float:left; margin-right: 60px}
.mainpanel {min-height: 100% !important}


.customSelectWrapperQuest{float:left; height:25px; position:relative; width:195px;}
.checkWrapQuest, .checkWrapQuest1{float:left; height:16px; margin-top:10px; width:16px; position:relative;}
.checkWrapQuest1{margin-right:10px; margin-top:6px;}
.customCheckboxNewQuest, .checkbox{height: auto; position:absolute; left:0; top:0; opacity:0; filter:alpha(opacity=0); outline:none; z-index:999;}
.checkWrapClickQuest{background:url(images/icons/form_set.png) 0 0 no-repeat; position:absolute; left:0; top:0; height:16px; width:16px; z-index:99;}
.qtCat, .qtCatCurrency{height:25px; width:194px !important; position:absolute; left:1px; top:0; opacity:0; filter: alpha(opacity=0); z-index:999;}
.mainpanel {margin-left: 0 !important}
.btns button {float:right}
.btns .cancelQt {margin-left: 15px}
.qt_field_opt {padding-left: 0}
input[type="radio"] {margin-right: 10px}
</style>
</head>

<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<%-- <div class="leftpanel">
  <div class="logopanel"> <a href="#"><img src="images/img_logo.png" alt="Partner Integrity" ></a> </div>
  <!-- logopanel -->
  
  <div class="leftpanelinner"> 
    
  <jsp:include page="leftPanel.jsp"></jsp:include>
</div>
</div> --%>
<!-- leftpanel -->

<div class="mainpanel">




<jsp:include page="header.jsp"></jsp:include>
			
		<!-- headerbar -->
		
		
		
		
		
  <form name="submit-questionnaire" id="submit-questionnaire" action="/partnerintegrity/createquestion" method="POST">
<div class="container">
 <div class="containerPanel clearfix">
   <h1 class="title">Add Question</h1>
  
  <div class="setupQuestContainer clearfix">
  <div class="panels ">
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
  
  <div class="questContainer">
  <div class="questContainerTabs">
  
     <div class="tab_content blueprint questionContainer current" style="display:block;">
     <div class="errorMsg">Please fill the fields highlighted in red.</div>
     <c:choose>
      <c:when test="${not empty message}"> 
        <div id="errBackMsg"><h3><font color="red">${message}</font></h3></div>
      </c:when>
      <c:otherwise>    
         <div id="errBackMsg">${errormessage}</div>
	  </c:otherwise>
	</c:choose>
     <ul class="questionn">  
       <div class="dragItemLabel">Drag and drop questions from left palette</div>	
     </ul>
    </div>
    <!-- /Dynamic Tab Contents -->
  
  <!-- contentpanel --> 
</div>  
</div>
<!-- <div style="padding:10px">
<button class="btn btn-xs closer" onclick="closeQues()">Close</button><button class="btn btn-xs fr save">Save</button>
</div> -->






</div>
</div>
<div class="btns">
							<button  class="btn cancelQt" disabled="disabled">Cancel</button>
								<%-- <button class="btn btn-xs" data-toggle="modal"
									href="${pageContext.request.contextPath}/createquestion">Create Question</button> --%>
								<!--<button class="btn btn-xs">+ External Organisation</button>-->
								<button class="btn fr save" disabled="disabled">Save</button>
</div>
</div>
</form>



 <jsp:include page="footer.jsp" />
					<!-- contentpanel -->



</div>
<!-- mainpanel -->
<div class="tooltipQst"></div>

<div class="questPopup">      
    <ul>
      <li>Are you sure you want to delete the question?</li>
      <li>
     <button type="button" class="btn btn-xs noBtn" name="no">Cancel</button>
     <button type="button" class="btn btn-xs yesBtn closePopup" name="yes">Ok</button>
     </li>
    </ul>    
</div>
<div class="popupBg"></div>

<div class="save-template-popup">  
	 <i class="fa fa-times-circle closeBtn"></i>       
    <ul>
      <li>Enter template name</li>
      <li><input class="template-name" /></li>
      <li><button type="button" class="btn btn-xs cancel closePopup" name="cancelQ">Cancel</button>
     <button type="button" class="btn btn-xs submitQ" name="submitQ">Submit</button></li>
    </ul>   
    
  
</div>



<script src="js/jquery-1.10.2.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script>
<script src="js/toggles.min.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/chosen.jquery.min.js"></script> 
<script src="js/bootstrap-wysihtml5.js"></script> 
<script src="js/bootstrap-switch.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
<script>

jQuery('.cancelQt').on('click', function(e) {
	e.preventDefault();
	window.location.href="${pageContext.request.contextPath}/displayquestionbank";
});


jQuery(".ui-datepicker-trigger").empty().html('<i class="icon-datePicker">');

jQuery(document).ready(function () {
	jQuery('#single-text-box').draggable({ helper: 'clone', cursor: 'move',live:true});
	jQuery('#multiple-text-box').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#numeric-box').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#currency-box').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#multiple-choice-radio').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#multiple-choice-dropdown').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#multiple-select-checkbox').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#multiple-select-dropdown').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#boolean-radio').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#boolean-checkbox').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#dt-select').draggable({helper: 'clone', cursor: 'move'});
	jQuery('#dt-picker').draggable({helper: 'clone', cursor: 'move'});


    jQuery("body .questionContainer.current").droppable({
	//console.log(jQuery(this).find("body .questionContainer.current"));
	
		//accept:'#single-text-box',
    drop: function (event, ui) {
		var $canvas = jQuery(this);
		if (!ui.draggable.hasClass('canvas-element') && jQuery('.questionn .ui-draggable').length == 0) {
			var $canvasElement = ui.draggable.clone();
			$canvasElement.addClass('canvas-element');
			//console.log($canvasElement);
			var htmlpart = idPicker($canvasElement);// calling the idPicker function to place the html in the container

			$canvasElement = jQuery($canvasElement).html(htmlpart);
			$('.questionn').append($canvasElement);
			$('.dragItemLabel').hide();
			$('.btns').find('button').removeAttr('disabled');
			$canvasElement.css({
				position: 'relative'
			});
			$('#errBackMsg').hide();
	
        }
		var $lis = jQuery(this).children('li.canvas-element');
		//assigning question numbers
			setTimeout(function(){
				$lis.each(function() {
				var $li = jQuery(this);
				var newVal = jQuery(this).index()-1;
				jQuery(this).find('.sortable-number').html(newVal+' )');
				});
			},10);//setTimeout	


			

			//for checkbox design
			var checkElmInner = jQuery(".customCheckboxNewQuest").parent("li"),
			    checkElm = jQuery(".customCheckboxNewQuest").parent("div.clearfix");
			checkElmInner.each(function(){
				jQuery(this).find("input[type='checkbox']").wrap("<div class='checkWrapQuest1'></div>");
				jQuery(this).find("input[type='checkbox']").after("<div class='checkWrapClickQuest'></div>");
			});
			
			checkElm.find("input[type='checkbox']").wrap("<div class='checkWrapQuest1'></div>");
			checkElm.find("input[type='checkbox']").after("<div class='checkWrapClickQuest'></div>");
			
			jQuery(document).on("click", ".customCheckboxNewQuest, .checkbox", function(){
				if(jQuery(this).is(":checked")){
					jQuery(this).next().css("background-position","-34px 0");
				}else{
					jQuery(this).next().css("background-position","0 0");
				}
			});


			


			//for new dropdown by Rahul
			var elm = jQuery(".qtCat").parent("li"),
				qtCatCurrency = jQuery(".qtCatCurrency").parent("li");

			qtCatCurrency.each(function(){
				jQuery(this).find("select[name='ansOpt']").wrap("<div class='customSelectWrapperQuest'></div>");
				jQuery(this).find("select[name='ansOpt']").after("<div class='customSelectClickQuest'></div>");
				jQuery(this).find("select[name='ansOpt']").next().html(jQuery(this).find("select[name='ansOpt']").find('option:selected').text());
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

    	//Allow only numeric values
        jQuery(document).on('keypress focus','input.col1, input.col2, input.col3',function (e) {
                    var key = window.e ? e.keyCode : e.which;
                    if (e.keyCode == 8 ||e.keyCode == 0) {
                                    return true;
                    }
                    else if ( key < 48 || key > 57 ) {                              
                        return false;
                    }
                    else return true;
                 });  

        	
/* 	 jQuery(".datepicker").datepicker({
	        dateFormat: "dd/mm/yy",
	        defaultDate: date,
			showOn: "button",
			changeMonth: true,
			changeYear: true,
	        onSelect: function () {
	            selectedDate = jQuery.datepicker.formatDate("dd/mm/yy", jQuery(this).datepicker('getDate'));
				jQuery(".datepicker").val(selectedDate);
	        }
	    }); */

			/*  jQuery(".datepicker").datepicker("setDate", date); */
			//jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-disabled">');
				
	jQuery(".customSelect").selectmenu();

      jQuery(".customSelect").selectmenu({
			close: function( event, ui ) {
				jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');}
			
			});	 
	  }
	  
    });
	
    //jQuery( "#container" ).disableSelection();
	
	//String categoryList ="<select class="qtCat" name=cat><option value=1> Select Question Category </option><option> GENERAL </option><option value=139> fff </option><option value=144> New category </option></select>";
	
function idPicker(id){
//console.log(jQuery(id[0]).attr("id"));
var draggableId;
	switch(jQuery(id[0]).attr("id")){
	
		case "single-text-box" : return draggableId = '<div class="singleTxtFields boxContainer">  <i class="icon-sTxtBox icons"></i><span class="widgetName">Single Text Box</span><div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt require" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer</label> </div> <ul> <li class="clearfix"><input class="submt hidden" name="qId" value= "1"><input class="qt_ansOpt submt" name="ansOpt" readonly="true"></li> </ul> </div></div>'; break;		
		
		case "multiple-text-box" : return draggableId = '<div class="multipleTxtBox boxContainer"><i class="icon-mTxtBox icons"></i><span class="widgetName">Multi text box</span> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt require" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer</label> </div><input class="submt hidden" name="qId" value="2"> <ol class="qt_multiTxtBoxList widgetsEl" type="a">  <li class="clearfix qt_multiTxtBox_row"><input class= "qt_ansOpt submt" name="ansOpt" readonly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class= "qt_ansOpt submt" name="ansOpt" readonly="true"></li>  </ol> </div></div>';
		break;
		
		case "numeric-box" : return draggableId = '<div class="textBoxNumeric boxContainer"> <i class="icon-nBox icons"></i><span class="widgetName">Numeric box</span><div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt hidden" name="qId" value= "3"><input class="submt require" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer</label> </div> <ul> <li class="clearfix"><input class="qt_ansOpt submt" name= "ansOpt" readonly="true"></li> </ul> </div></div>';
		break;
		
		case "currency-box" : return draggableId = '<div class="currencyBox boxContainer"> <i class="icon-cBox icons"></i><span class="widgetName">Currency box</span> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt hidden" name="qId" value= "4"><input class="submt require" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <label class="qt_ansOpt col1">Answer</label> </div> <ul> <li class="clearfix"><select class="qtCatCurrency currency" name="ansOpt"> <option> USD </option> <option> POUND </option> <option> RUPEE </option> </select><input class="qt_ansOpt submt currencyInput" name= "ansOpt" readonly="true"></li> </ul> </div></div>';
		break;
		
		case "multiple-choice-radio" : return draggableId = '<div class="mc-radio boxContainer"><i class="icon-radio icons"></i><span class="widgetName">Multiple choice radio</span> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <input class="require" id= "qt_editBox" name="qtext"> </div><input class="submt hidden" name="qId" value="5"> <div class= "qt_field_opt qt_mc_radio qt_multi clearfix widgetsEl"> <div class="clearfix"> <span class="qt_ansOpt">Answer Option</span> </div> <div class="clearfix hidden"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="ansOpt"><button class="qt_add"></button><button class="qt_remove"></button> </div> <div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="ansOpt"> </div> <div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="ansOpt"> </div> <div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="ansOpt"> <button class="qt_add"></button> </div> <div class="clearfix"></div> </div></div>'; break;
		
		case "multiple-choice-dropdown" :return draggableId = '<div class="mc-dropdown boxContainer"> <i class="icon-dropdown icons"></i><span class="widgetName">Multiple choice dropdown</span><div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <input class="multiDropdownQuest require" id="qt_editBox" name= "qtext"> </div> <div class="qt_field_opt qt_multiChoice_dd"> <ul> <li class="clearfix"> <div class="multiChoice_dd"> <div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div><input class="submt hidden" name="qId" value="6"> <div class="mc_dd_opt hide widgetsEl"> <label class="bulk">Answer Option</label> <div class="clearfix hidden"> <input class="bulk require" name= "ansOpt"><button class="qt_add"></button><button class="qt_remove"></button> </div> <div class="clearfix"> <input class="bulk require" name="ansOpt"> </div> <div class="clearfix"> <input class="bulk require" name="ansOpt"> </div> <div class="clearfix"> <input class="bulk require" name="ansOpt"><button class= "qt_add"></button> </div> </div> </div> </li> </ul> </div></div>'; break;
		
		case "multiple-select-checkbox" : return draggableId = '<div class="ms-chkbox boxContainer"><i class="icon-checkBox icons"></i><span class="widgetName">Multiple select checkbox</span>  <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"><input class="require" id= "qt_editBox" name="qtext"> </div><input class="submt hidden" name="qId" value="7"> <div class= "qt_field_opt qt_multi clearfix widgetsEl"> <div class="clearfix"> <span class="qt_ansOpt">Answer Option</span> </div> <div class="clearfix hidden"> <input class="qt_ms_chkbox customCheckboxNewQuest" type="checkbox"><input class="qt_ansOpt require" name= "ansOpt"><button class="qt_add"></button><button class="qt_remove"></button> </div> <div class="clearfix"><input class="qt_ms_chkbox customCheckboxNewQuest" type="checkbox"><input class="qt_ansOpt require" name= "ansOpt"> </div> <div class="clearfix"><input class="qt_ms_chkbox customCheckboxNewQuest" type="checkbox"><input class="qt_ansOpt require" name= "ansOpt"> </div> <div class="clearfix"><input class="qt_ms_chkbox customCheckboxNewQuest" type="checkbox"><input class="qt_ansOpt require" name= "ansOpt"><button class="qt_add"></button> </div> <div class="clearfix"></div> </div></div>'; break;
		
		case "multiple-select-dropdown" : return draggableId = '<div class="ms-dropdown boxContainer"><i class="icon-dropdown icons"></i><span class="widgetName">Multiple select dropdown</span> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"><input class="require" id= "qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_multi clearfix multiChoice_dd"> <div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div><input class="submt hidden" name="qId" value="8"> <div class="mc_dd_opt hide widgetsEl "> <div class="clearfix"> <span class="bulk">Answer Option</span> </div> <div class="clearfix hidden"><input type="checkbox" class="customCheckboxNewQuest"><input class="bulk require" name= "ansOpt"><button class="qt_add"></button><button class="qt_remove"></button> </div> <div class="clearfix"><input class="checkbox customCheckboxNewQuest" type="checkbox"><input class="bulk require" name= "ansOpt"> </div> <div class="clearfix"> <input class="checkbox customCheckboxNewQuest" type="checkbox"><input class="bulk require" name= "ansOpt"> </div> <div class="clearfix"><input class="checkbox customCheckboxNewQuest" type="checkbox"><input class="bulk require" name= "ansOpt"><button class="qt_add"></button> </div>  </div> </div></div>'; break;
		
		case "boolean-radio" : return draggableId = '<div class="boxContainer"> <div class="qt_settings clearfix"> <i class="icon-radio icons"></i><span class="widgetName">Boolean radio</span><ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"><input class="require" id= "qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_boolean_Radio clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer Option</label> </div> <ul> <li class="clearfix"><div class="radioWrapQuest"><input name="question" type="radio"><div class="radioWrapClickQuest"></div></div><input class="qt_ansOpt require" name="ansOpt"></li> <li><div class="radioWrapQuest"><input name= "question" type="radio"><div class="radioWrapClickQuest"></div></div><input class="submt hidden" name="qId" value="9"><input class="qt_ansOpt require" name="ansOpt"></li> </ul> </div></div>'; break; 
		
		case "boolean-checkbox" : return draggableId = '<div class="boxContainer"><i class="icon-checkBox icons"></i><span class="widgetName">Boolean checkbox</span> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"><input class="require" id= "qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_boolean_chkbox"> <div class="clearfix"> <span class="ansOpt">Answer Option</span> </div> <ul> <li class="clearfix"><input class="customCheckboxNewQuest" name="question" type="checkbox"><input class= "submt hidden" name="qId" value="10"><input class="qt_ansOpt require" name= "ansOpt"></li> </ul> </div></div>'; break;
		
		case "dt-select" : return draggableId = '<div class="dateSelection boxContainer"> <i class="icon-dateSelection icons"></i><span class="widgetName">Date selection box</span><div class="qt_settings clearfix"><ul class="controlPanel clearfix"> <li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"> <div class="quesCheckbox"> <input class="customCheckboxNewQuest" name="question" type="checkbox"><label for="question"></label> </div><label class="qt_editBox" for="qt_editBox" title=""></label> <input class="hidden" name="qId" type="text" value="11"><input class="hidden hq" name="section1" value=""><input class="q require" name="qtext" type="text"></div><div class="qt_field_opt clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answer</span><span class="qt_score">Score</span> </div><ul> <li class="clearfix"><span class="dateSel"> <div class="customSelectWrapperQuest disabledDates"> <select name="ansOpt" disabled> <option> dd </option> </select> <div class="customSelectClickQuest disabledDates">dd</div></div><div class="customSelectWrapperQuest disabledDates"> <select name="ansOpt" disabled> <option> mm </option> </select> <div class="customSelectClickQuest disabledDates">mm</div></div><div class="customSelectWrapperQuest disabledDates"> <select name="ansOpt" disabled> <option> yyyy </option> </select> <div class="customSelectClickQuest disabledDates">yyyy</div></div></span> <input class="qt_score" maxlength="5" name="s" type="text"></li></ul></div></div>'; break;
		
		case "dt-picker" : return draggableId = '<div class="datePicker boxContainer"><i class="icon-datePicker icons"></i><span class="widgetName">Date picker</span><div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li> ${categoryValues} </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title=""></label> <input class= "submt require" id="qt_editBox" name="qtext"></div><div class="qt_field_opt clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer Option</label></div> <ul> <li class="clearfix"><input class="submt hidden" name="qId" value="12"><input class="datepicker" disabled placeholder="dd/mm/yyyy" name="ansOpt" type= "text"><i class="dp-disabled"></i></li> </ul></div></div>'; break;
		
		case "dt-time" : return draggableId = "<div>Date and time</div>"; break;
		default : draggableId = "<div>Failed..Dragging please try again</div>";
		
	}
}

});


//Add and Remove Answer Options

jQuery('.questContainerTabs').on('click', '.qt_add', function(e) {
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

jQuery('.questContainerTabs').on('click', '.qt_remove', function(e) {
	   e.stopPropagation();
	   e.preventDefault();
	   jQuery(this).closest('.clearfix').remove();
	});
	
	
//Hide and Show Drop Down

jQuery('.questContainerTabs').on('click', '.mc-dropdown-select',function(){
   jQuery(this).next('.mc_dd_opt').toggleClass('hide');
});
	
//delete Widgets

jQuery('.questContainerTabs').on('click', '.icon-delete', function(e) {
  e.stopPropagation();
	var $this = $(this);
	jQuery('.popupBg, .questPopup').show();
	jQuery('body').on('click', '.btn ',function(e) {
		if(jQuery(this).hasClass('yesBtn')){
		    $this.closest('.ui-draggable').remove();
		    $('.errorMsg').hide();
		    $('.btns').find('button').attr('disabled', 'disabled');
		    $('.dragItemLabel').show();
		}
		$('.popupBg, .questPopup').hide();
	});
	
});
   function randonNumber(){
	  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
	  return rNum;                             
	}
   
   
  

   /* $('.save1').on('click', function (e) {
       var value = false;
       $('.questionn input').each(function (index) {
           if ($(this).closest('li').hasClass('hidden') != true && $(this).val() == '') {
               return false;
           }
           else {
               value = true
           }
       });
       if ($('.qtCat')[0].selectedIndex == 0 || value == false) {
    	   if($('.qtCat')[0].selectedIndex == 0){
        	   alert("asdasd");
    		   $('.qtCat').css({'border': '1px solid red'});
        	 }
      	 
           $('.errorMsg').show();
           return false;
       }
       else {
           return true;
       }
   });  */
   
    $('.save').on('click', function (e) {
       if ($('.boxContainer').length == 0) {
           return false;
       }
       
       var len = $('.questContainerTabs').find('.require').length, value = 0;
       $('.questContainerTabs').find('.require').each(function (index) {
           if ($(this).closest('.clearfix, li').hasClass('hidden') == false && $(this).val().trim() == '') {
        	   jQuery(this).addClass('errorInput').val('');
        	   jQuery(this).closest('div.widgetsEl').removeClass('hide');
               return;
           }

           else if ($(this).closest('li').hasClass('hidden') == true) {
               value++;
               return;
           }
           else {
               $(this).removeClass('errorInput');
               --len;
           }
       });

       if (len > value) {
           
            $('.errorMsg').show();
            return false;
       }
       else {
           return true;
       }
   });
   

   function closeQues()
   {
	   alert("in close question");
	   window.open('/partnerintegrity/displayquestionbank','_self');
	}

   $('.questionn').on('click', '.mc-dropdown-select', function() {
       $(this).closest('.boxContainer').find('.mc_dd_opt').toggleClass('hide') 
	});

   jQuery('.closeBtn, .closePopup').click(function(){
		jQuery('.questPopup').hide();
		jQuery('.popupBg').hide();
	});
	
</script>
<!-- the mousewheel plugin - optional to provide mousewheel support -->
<script type="text/javascript" src="script/jquery.mousewheel.js"></script>

<!-- the jScrollPane script -->
<script type="text/javascript" src="script/jquery.jscrollpane.min.js"></script>
<script src="js/custom.js"></script> 

</body>
</html>
