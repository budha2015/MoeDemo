<!DOCTYPE html>
 <%@ page import="java.util.*" %>
    <%@ page import = "com.rfg.tprm.questionnaire.model.QuestionComponent"%>
    <%@ page import = "com.rfg.tprm.questionnaire.model.Question" %>
   
<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link rel="stylesheet" href="css/questionnaire.css" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
<link href="css/questionnaire/qr-common.css" rel="stylesheet">
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

.setupQuestContainer{
	float:left;width:100%;
}
.questionContainer.current { border:1px solid #e1e3eb;}
.questionContainer {
width: 100%;
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
.customSelectWrapperQuest{float:left; height:25px; position:relative; width:195px}
.qtCat, .qtCatCurrency{height:25px; width:194px !important; position:absolute; left:1px; top:0; opacity:0; filter: alpha(opacity=0); z-index:999;}
.container h1 {padding-left: 0}
.questionContainer li.canvas-element{
display:inline-block;
display:block;
list-style-type:none;
height:auto;
padding-top:10px;
margin:10px
}
.btns-block {clear:both; padding-top:10px}
.questionContainer .ui-draggable .customCheckBox label{top:5px; left: 1px}
.qt_editBox{margin:0}
#multiple-choice-dropdown .mc_dd_opt{
display:inline-block;
position:relative;
}

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
.dragItemLabel{margin:0}


.panel-tabs {border-bottom: none}
.controlPanel li{padding-left: 20px}
.qt_settings {padding-bottom: 10px}
#qt_editBox {border: 1px solid #ccc; width: 96%}
.col1, .col2 {margin-right: 1em; width: 30%; font-style:italic}
.col3 {width:6%;margin-right:10px}
.setRange {color: #000; font-size: 12px; font-weight: normal; height: 20px}
.clearfix {padding-bottom: 5px}
.multiChoice_dd {width: 350px}
.mc_dd_opt {width: 100%}
.mc_dd_opt .score, .mc_dd_opt label.score {float:left; margin-left:10px; width: 16%; margin-right: 15px;}
.qt_field_opt button {float:left;}
.dd, .mm, .yy {float:left; margin-right: 20px}
.dateSel {width: 50%; display:inline-block; float:left}
#datepicker {margin-right: 21%; width: 30%}
.multiChoice_dd_select {width: 350px}
.dragItemLabel {
    background: none repeat scroll 0 0 #f4f5f5;
    border: 1px dashed #ccc;
    border-radius: 5px;
    font-size: 0.8em;
    font-style: italic;
    margin: 30% 1em;
    padding: 1em;
    text-align: center;
}

.questPopup ul {text-align:center}
.yesBtn, .noBtn{width: 75px; margin-top:10px}
.yesBtn {margin-right: 20px; background: #d9534f}
.questPopup ul {padding: 36px 0 0}

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
.closer {width: 95px}
.errorInput {border: 1px solid red !important}
.btns {padding: 0 15px;}
.container {padding: 20px 20px 0}
.leftpanel {height: 100% !important}
.btns a, .btns button {width: 95px}
.currencyBox li.clearfix select {float:left; margin-right: 60px}
.mainpanel {margin-left: 0 !important}
.qt_field_opt {padding-left: 0}
input[type="radio"] {margin-right: 10px}
.tooltipQst {left: 149px !important}
.qt_multiTxtBoxList {list-style-type:none !important; margin-top: 6px}
.checkWrapQuest, .checkWrapQuest1{float:left; height:16px; margin-top:5px; width:25px; position:relative;}
.checkWrapClickQuest{background:url(images/icons/form_set.png) 0 0 no-repeat; position:absolute; left:1px; top:0; height:16px; width:16px; z-index:99;}
.customCheckboxNewQuest, .checkbox{height: auto; position:absolute; left:0; top:0; opacity:0; filter:alpha(opacity=0); outline:none; z-index:999;}

</style>
</head>

<body>

<%-- <%
List<QuestionComponent> questionComponentsList=(List<QuestionComponent>)request.getAttribute("QuestionComponents");
String questionText= (questionComponentsList.get(0)).getQuestionText();
String answerOptionValue=((questionComponentsList.get(0)).getAnswerOptionValue()).get(0);
Short answerOptionScore=((questionComponentsList.get(0)).getAnswerOptionScore()).get(0);
String questionType = (questionComponentsList.get(0)).getQuestionType();

String htmlContent="";
if(questionType.equalsIgnoreCase("MULTIPLE"))
	htmlContent+="<div class='singleTxtFields boxContainer'><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li><select><option> Select Question Category </option><option> Category 1 </option><option> Category 2 </option></select></li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input name='singleTxtInput' class='submt' id='qt_editBox' placeholder='Textbox - Single Textbox...' value='"+questionText+"'></div><div class='qt_field_opt clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer Option</label><label class='qt_score'>Score</label></div><ul><li class='clearfix'><input class='qt_ansOpt submt' name='singleTxtAns' value='"+answerOptionValue+"'><input class='qt_score submt' name='singletxtScore' value='"+answerOptionScore+"'></li></ul></div></div>";
	
%> --%>
<%
String categoryList = (String)request.getAttribute("categoryList");
%>
<%
Question question = (Question)request.getAttribute("Question");
String questionText= question.getQuestionText();
String questionTypeId= question.getQuestionTypeId()+"";
Long questionId = question.getQuestionId();

System.out.println("question id======" + questionId);

System.out.println("QuestionText From UI is:"+questionText);
List<Long> answerOptionIdList = question.getAnswerOptionId();
System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
List<String> answerOptionValueList = question.getAnswerOptionValue();  
System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
System.out.println("questionTypeId is:"+questionTypeId);
String myContent="";
		
if(questionTypeId.equals("1")){
	myContent="<div class='singleTxtFields boxContainer'><i class='icon-sTxtBox icons'></i><span class='widgetName'>Single Text Box</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input name='qtext' class='submt require' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt clearfix'><div class='clearfix'><label class='qt_ansOpt' readonly='true'>Answer</label></div><ul><li class='clearfix'><input type='hidden' class='submt' name='qId' value='1'>";
	for(int i = 0; i < answerOptionValueList.size() ; i++){
			
			myContent+="<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><input class='qt_ansOpt submt' name='ansOpt' readonly='true' value='"+answerOptionValueList.get(i)+"'></li></ul></div></div>";
			
		}
}
if(questionTypeId.equals("2")){
	int i=0;
	myContent=	"<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='multipleTxtBox boxContainer'><i class='icon-mTxtBox icons'></i><span class='widgetName'>Multi text box</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='submt require' id='qt_editBox' name='qtext' value='"+questionText+"'></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt' readonly='true'>Answer</label></div><ol class='qt_multiTxtBoxList widgetsEl' type='a'><li class='clearfix qt_multiTxtBox_row hidden'><input class='qt_ansOpt submt' readonly='true' name='ansOpt'></li><input type='hidden' class='submt' name='qId' value='2'>";
	for(i = 0; i < 1 ; i++){
			
			myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='qt_ansOpt submt' name='ansOpt' readonly='true'></li>";
			
		}
	myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='qt_ansOpt submt' name='ansOpt' readonly='true'></li></ol></div></div>";
}
/* if(questionTypeId.equals("3")){
	int i=0;
	myContent = "<div class='textBoxNumeric boxContainer'><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input type='hidden' class='submt' name='qId' value='3'><input class='submt require' id='qt_editBox' name='qtext' value='"+questionText+"'></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer</label></div>";
	if(answerOptionValueList !=null)
		myContent+="<ul><li class='clearfix'><input class='qt_ansOpt submt' readonly='true' name='ansOpt' value='"+answerOptionValueList.get(0)+"'></li></ul>";
	myContent+="<label class='setRange'>Set Range</label><div class='clearfix'></div><div class='clearfix'><label class='col1'>From</label><label class='col2'>To</label></div><ul class='qt_multiTxtBoxList widgetsEl'><li class='clearfix qt_multiTxtBox_row hidden'><input class='col1 require' name='rangeOpt1'><input class='col2 require' name='rangeOpt2'><button class='qt_add'></button><button class='qt_remove'></button></li>";
	myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='rangeOpt1' value='"+answerOptionValueList.get(1).substring(0,answerOptionValueList.get(1).indexOf("to"))+"'><input class='col2 require' name='rangeOpt2' value='"+answerOptionValueList.get(1).substring(answerOptionValueList.get(1).indexOf("to")+2,answerOptionValueList.get(1).length())+"'><button class='qt_add'></li>";
	
	for(i = 2; i < answerOptionValueList.size() ; i++){
		
		myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='rangeOpt1' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2 require' name='rangeOpt2' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><button class='qt_add'><button class='qt_remove'></button></li>";
		
	}
	//myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='rangeOpt1' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2 require' name='rangeOpt2' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><button class='qt_add'></button></li></ul></div></div>";
	myContent+="</li></ul></div></div></li>";
} */
if(questionTypeId.equals("3")){
	/* int i=0;
	myContent=	"<div class='multipleTxtBox boxContainer'><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='submt require' id='qt_editBox' name='qtext' value='"+questionText+"'></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt' readonly='true'>Answer</label></div><ol class='qt_multiTxtBoxList widgetsEl' type='a'><li class='clearfix qt_multiTxtBox_row hidden'><input class='qt_ansOpt submt' readonly='true' name='ansOpt'></li><input type='hidden' class='submt' name='qId' value='2'>";
	for(i = 0; i < 1 ; i++){
			
			myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='qt_ansOpt submt' name='ansOpt' readonly='true'></li>";
			
		}
	myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='qt_ansOpt submt' name='ansOpt' readonly='true'></li></ol></div></div>"; */
	myContent="<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='singleTxtFields boxContainer'><i class='icon-nBox icons'></i><span class='widgetName'>Numeric box</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input name='qtext' class='submt require' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt clearfix'><div class='clearfix'><label class='qt_ansOpt' readonly='true'>Answer</label></div><ul><li class='clearfix'><input type='hidden' class='submt' name='qId' value='1'>";
	for(int i = 0; i < answerOptionValueList.size() ; i++){
			
			myContent+="<input class='qt_ansOpt submt' name='ansOpt' readonly='true' value='"+answerOptionValueList.get(i)+"'></li></ul></div></div>";
			
		}
}
if(questionTypeId.equals("4")){
	
	String[] currencyVlues = null;
	String amount = "";
	String currency = "";
	if(answerOptionValueList !=null)
	currency=answerOptionValueList.get(0).toString().trim();
	/* currencyVlues = (answerOptionValueList.get(0).toString()).split(" ");
	String amount=currencyVlues[0];
	String currency=currencyVlues[1]; */
	
	int i=0;
	myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='currencyBox boxContainer'><i class='icon-cBox icons'></i><span class='widgetName'>Currency box</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input type='hidden' class='submt' name='qId' value='4'><input name='qtext' class='submt require' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt col1'>Answer</label></div><ul><li class='clearfix'>";
	if(answerOptionValueList !=null)
		myContent+="<select name='ansOpt'><option "+(currency.equalsIgnoreCase("USD")?"selected":"")+">USD</option><option "+(currency.equalsIgnoreCase("POUND")?"selected":"")+">POUND</option> <option "+(currency.equalsIgnoreCase("RUPEES")?"selected":"")+">RUPEES</option> </select>";
		myContent+="<input class='qt_ansOpt submt' name='ansOpt' readonly='true' value='"+amount+"'></li></ul></div></div>";
	//myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='rangeOpt1' value='"+answerOptionValueList.get(1).substring(0,answerOptionValueList.get(1).indexOf("to"))+"'><input class='col2 require' name='rangeOpt2' value='"+answerOptionValueList.get(1).substring(answerOptionValueList.get(1).indexOf("to")+2,answerOptionValueList.get(1).length())+"'><button class='qt_add'></li>";
	/* for(i = 2; i < answerOptionValueList.size() ; i++){
		
		myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='rangeOpt1' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2 require' name='rangeOpt2' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><button class='qt_add'><button class='qt_remove'></button></li>";
		
	} */
	//myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='rangeOpt1' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2 require' name='rangeOpt2' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><button class='qt_add'></button></li></ul></div></div>";
	myContent+="</li></ul></div></div></li>";
}
if(questionTypeId.equals("5")){
	int i=0;
	myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='mc-radio boxContainer'><i class='icon-radio icons'></i><span class='widgetName'>Multiple choice radio</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input name='qtext'  class='require' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt qt_mc_radio qt_multi clearfix widgetsEl customInput customRadio'><div class='clearfix'><span class='qt_ansOpt'>Answer Option</span></div><div class='clearfix hidden'><div class='radioWrapQuest'><input name='multiRadio' type='radio'><div class='radioWrapClickQuest'></div></div><input type='hidden' class='submt' name='qId' value='5'><input name='ansOpt' class='qt_ansOpt  require'><button class='qt_add'><button class='qt_remove'></button></div>";
	if(answerOptionValueList !=null)
		myContent+="<div class='clearfix'><div class='radioWrapQuest'><input name='multiRadio' type='radio'><div class='radioWrapClickQuest'></div></div><input name='ansOpt' class='qt_ansOpt require' value='"+answerOptionValueList.get(0)+"'></div>";
		myContent+="<div class='clearfix'><div class='radioWrapQuest'><input name='multiRadio' type='radio'><div class='radioWrapClickQuest'></div></div><input name='ansOpt' class='qt_ansOpt require' value='"+answerOptionValueList.get(1)+"'></div>";
		myContent+="<div class='clearfix'><div class='radioWrapQuest'><input name='multiRadio' type='radio'><div class='radioWrapClickQuest'></div></div><input name='ansOpt' class='qt_ansOpt require' value='"+answerOptionValueList.get(2)+"'><button class='qt_add'></div>";
	for(i = 3; i < answerOptionValueList.size() ; i++){
		
		myContent+="<div class='clearfix'><div class='radioWrapQuest'><input name='multiRadio' type='radio'><div class='radioWrapClickQuest'></div></div><input name='ansOpt' class='qt_ansOpt require' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'><button class='qt_remove'></div>";
		
	}
	//myContent+="<div class='clearfix'><label for='radio13'></label><input id='radio13' name='multiRadio' type='radio'><input name='ansOpt' class='qt_ansOpt require' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'></button></div><div class='clearfix'></div></div></div>";
	myContent+="</li></ul></div></div></li>";
}
if(questionTypeId.equals("6")){
int i=0;
myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='mc-dropdown boxContainer'><i class='icon-dropdown icons'></i><span class='widgetName'>Multiple choice dropdown</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='multiDropdownQuest require' name='qtext' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt qt_multiChoice_dd'><ul><li class='clearfix'><div class='multiChoice_dd'><div class='mc-dropdown-select multiChoice_dd_select'> Select Answer Option </div><div class='mc_dd_opt hide widgetsEl'><label class='bulk'>Answer Option</label><input type='hidden' class='submt' name='qId' value='6'><div class='clearfix hidden'><input name='ansOpt' class='bulk require'><button class='qt_add'></button><button class='qt_remove'></button></div>";
if(answerOptionValueList !=null)
myContent+="<div class='clearfix'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(0)+"'></div>";
myContent+="<div class='clearfix'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(1)+"'></div>";
myContent+="<div class='clearfix'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(2)+"'><button class='qt_add'></div>";
for(i = 3; i < answerOptionValueList.size() ; i++){
	
	myContent+="<div class='clearfix'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'><button class='qt_remove'></div>";
	
}
//myContent+="<div class='clearfix'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(i)+"'></div>";
//i++;
//myContent+="<div class='clearfix'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'></button></div>";
myContent+="</li></ul></div></div></li>";

}
//multi select checkbox
if(questionTypeId.equals("7")){
int i=0;
myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='ms-chkbox boxContainer'><i class='icon-checkBox icons'></i><span class='widgetName'>Multiple select checkbox</span> <div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input id='qt_editBox' class='require' name='qtext' value='"+questionText+"'></div><div class='qt_field_opt qt_multi clearfix widgetsEl'><div class='clearfix'><label class='qt_ansOpt'>Answer Option</label></div><input type='hidden' class='submt' name='qId' value='7'><div class='clearfix hidden'><div class='checkWrapQuest'><input class='qt_ms_chkbox customCheckboxNewQuest' id='checkbox120' type='checkbox'><div class='checkWrapClickQuest'></div></div><input class='qt_ansOpt require' name='ansOpt'><button class='qt_add'></button><button class='qt_remove'></button></div>";
if(answerOptionValueList !=null)
	myContent+="<div class='clearfix customInput customCheckBox'><input class='qt_ms_chkbox' id='checkbox124' type='checkbox'><label for='checkbox124'></label><input class='qt_ansOpt require' name='ansOpt' value='"+answerOptionValueList.get(0)+"'></div>";
	myContent+="<div class='clearfix customInput customCheckBox'><input class='qt_ms_chkbox' id='checkbox125' type='checkbox'><label for='checkbox125'></label><input class='qt_ansOpt require' name='ansOpt' value='"+answerOptionValueList.get(1)+"'></div>";
	myContent+="<div class='clearfix customInput customCheckBox'><input class='qt_ms_chkbox' id='checkbox126' type='checkbox'><label for='checkbox126'></label><input class='qt_ansOpt require' name='ansOpt' value='"+answerOptionValueList.get(2)+"'><button class='qt_add'></div>";
for(i = 3; i < answerOptionValueList.size() ; i++){
	
	myContent+="<div class='clearfix customInput customCheckBox'><input class='qt_ms_chkbox' id='checkbox12"+ i +"' type='checkbox'><label for='checkbox12"+ i +"'></label><input class='qt_ansOpt require' name='ansOpt' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'><button class='qt_remove'></div>";
	
}
//myContent+="<div class='clearfix'><label for='checkbox126'></label><input class='qt_ms_chkbox' id='checkbox126' type='checkbox'><label></label><input class='qt_ansOpt require' name='ansOpt' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'></button></div><div class='clearfix'></div></div></div>";
myContent+="</li></ul></div></div></li>";

}
//multi select drop down
if(questionTypeId.equals("8")){
int i=0;
myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='ms-dropdown boxContainer'><i class='icon-dropdown icons'></i><span class='widgetName'>Multiple select dropdown</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input name='qtext' id='qt_editBox' class='require' value='"+questionText+"'></div><div class='qt_field_opt qt_multi clearfix multiChoice_dd'><div class='mc-dropdown-select multiChoice_dd_select'> Select Answer Option </div><div class='mc_dd_opt hide widgetsEl'><div class='clearfix'><label class='bulk'>Answer Option</label></div><input type='hidden' class='submt' name='qId' value='8'><div class='clearfix hidden'><div class='checkWrapQuest1'><input type='checkbox' class='checkbox customCheckboxNewQuest'><div class='checkWrapClickQuest'></div></div><input name='ansOpt' class='bulk require'><button class='qt_add'></button><button class='qt_remove'></button></div>";
if(answerOptionValueList !=null)
	myContent+="<div class='clearfix'><div class='checkWrapQuest1'><input class='checkbox customCheckboxNewQuest' type='checkbox'><div class='checkWrapClickQuest'></div></div><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(0)+"'></div>";
	myContent+="<div class='clearfix'><div class='checkWrapQuest1'><input class='checkbox customCheckboxNewQuest' type='checkbox'><div class='checkWrapClickQuest'></div></div><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(1)+"'></div>";
	myContent+="<div class='clearfix'><div class='checkWrapQuest1'><input class='checkbox customCheckboxNewQuest' type='checkbox'><div class='checkWrapClickQuest'></div></div><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(2)+"'><button class='qt_add'></div>";
for(i = 3; i < answerOptionValueList.size() ; i++){
	
	myContent+="<div class='clearfix'><div class='checkWrapQuest1'><input class='checkbox customCheckboxNewQuest' type='checkbox'><div class='checkWrapClickQuest'></div></div><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'><button class='qt_remove'></div>";
	
}
//myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' id='mcheckbox421' type='checkbox'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(i)+"'></div>";
		//i++;
		//myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' id='mcheckbox421' type='checkbox'><input name='ansOpt' class='bulk require' value='"+answerOptionValueList.get(i)+"'><button class='qt_add'></button></div><div class='clearfix'></div></div></div></div>";
myContent+="</li></ul></div></div></li>";
}

//boolean Radio

if(questionTypeId.equals("9")){
int i=0;
myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='boxContainer'><i class='icon-radio icons'></i><span class='widgetName'>Boolean radio</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input name='qtext' id='qt_editBox' class='require' value='"+questionText+"'></div><div class='qt_field_opt qt_boolean_Radio clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer Option</label></div><input type='hidden' class='submt' name='qId' value='9'><ul>";
if(answerOptionValueList !=null)
for(i = 0; i < answerOptionValueList.size() ; i++){
	
	myContent+="<li class='clearfix'><div class='radioWrapQuest'><input name='question' type='radio'><div class='radioWrapClickQuest'></div></div><input name='ansOpt' class='qt_ansOpt require' value='"+answerOptionValueList.get(i)+"'></li>";
	
}
myContent+="</ul></div></div>";

}

//boolean checkbox

if(questionTypeId.equals("10")){
int i=0;
myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='boxContainer'><i class='icon-checkBox icons'></i><span class='widgetName'>Boolean checkbox</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input id='qt_editBox' name='qtext' class='require' value='"+questionText+"'></div><div class='qt_field_opt qt_boolean_chkbox'><div class='clearfix'><label class='qt_ansOpt'>Answer Option</label></div><input type='hidden' class='submt' name='qId' value='10'><ul class='customInput customCheckBox'>";
if(answerOptionValueList !=null)
for(i = 0; i < answerOptionValueList.size() ; i++){
	
	myContent+="<li class='clearfix'><input name='question' id='booleanChkBox' type='checkbox'><label for='booleanChkBox'></label><input class='qt_ansOpt require' name='ansOpt' value='"+answerOptionValueList.get(i)+"'></li>";
	
}
myContent+="</ul></div></div>";

}

//date select

if(questionTypeId.equals("11")){

String[] date = null;

if(answerOptionValueList !=null)
date = (answerOptionValueList.get(0).toString()).split("-");
String day=date[0];
String mon=date[1];
String year=date[2];
//out.println(day.equalsIgnoreCase("5")?"select":"");

myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='dateSelection boxContainer'> <i class='icon-dateSelection icons'></i><span class='widgetName'>Date selection box</span><div class='qt_settings clearfix'> <ul class='controlPanel clearfix'> <li>"+categoryList+"</li> <li></li> </ul> </div> <div class='clearfix'> <label class='qt_editBox' for='qt_editBox' title=''></label> <input class='submt require' id='qt_editBox' class='require' name='qtext' value='"+questionText+"'> </div> <div class='qt_field_opt clearfix'> <div class='clearfix'><input type='hidden' class='submt' name='qId' value='11'> <label class='qt_ansOpt'>Answer Option</label> </div> <ul> <li class='clearfix'><span class='dateSel'>";

myContent+="<div class='customSelectWrapperQuest disabledDates'><select name='ansOptDay' class='dd'> <option>dd</option> <option "+(day.equalsIgnoreCase("1")?"selected":"")+">1</option> <option "+(day.equalsIgnoreCase("2")?"selected":"")+">2<option "+(day.equalsIgnoreCase("3")?"selected":"")+">3<option "+(day.equalsIgnoreCase("4")?"selected":"")+">4<option "+(day.equalsIgnoreCase("5")?"selected":"")+">5</option> <option "+(day.equalsIgnoreCase("6")?"selected":"")+">6</option> <option "+(day.equalsIgnoreCase("7")?"selected":"")+">7<option "+(day.equalsIgnoreCase("8")?"selected":"")+">8<option "+(day.equalsIgnoreCase("9")?"selected":"")+">9</option> <option "+(day.equalsIgnoreCase("10")?"selected":"")+">10</option> <option "+(day.equalsIgnoreCase("11")?"selected":"")+">11</option> <option "+(day.equalsIgnoreCase("12")?"selected":"")+">12</option> <option "+(day.equalsIgnoreCase("13")?"selected":"")+">13<option "+(day.equalsIgnoreCase("14")?"selected":"")+">14</option> <option "+(day.equalsIgnoreCase("15")?"selected":"")+">15</option> <option "+(day.equalsIgnoreCase("16")?"selected":"")+">16</option> <option "+(day.equalsIgnoreCase("17")?"selected":"")+">17</option> <option "+(day.equalsIgnoreCase("18")?"selected":"")+">18</option> <option "+(day.equalsIgnoreCase("19")?"selected":"")+">19</option> <option "+(day.equalsIgnoreCase("20")?"selected":"")+">20</option> <option "+(day.equalsIgnoreCase("21")?"selected":"")+">21<option "+(day.equalsIgnoreCase("22")?"selected":"")+">22</option> <option "+(day.equalsIgnoreCase("23")?"selected":"")+">23</option> <option "+(day.equalsIgnoreCase("24")?"selected":"")+">24</option> <option "+(day.equalsIgnoreCase("25")?"selected":"")+">25</option> <option "+(day.equalsIgnoreCase("26")?"selected":"")+">26</option> <option "+(day.equalsIgnoreCase("27")?"selected":"")+">27</option> <option "+(day.equalsIgnoreCase("28")?"selected":"")+">28</option> <option "+(day.equalsIgnoreCase("29")?"selected":"")+">29</option> <option "+(day.equalsIgnoreCase("30")?"selected":"")+">30</option> <option "+(day.equalsIgnoreCase("31")?"selected":"")+">31</option> </select><div class='customSelectClickQuest disabledDates'>dd</div></div>";

myContent+="<div class='customSelectWrapperQuest disabledDates'><select name='ansOptMon' class='mm'> <option>mm</option> <option "+(mon.equalsIgnoreCase("January")?"selected":"")+">January</option> <option "+(mon.equalsIgnoreCase("February")?"selected":"")+">February</option> <option "+(mon.equalsIgnoreCase("March")?"selected":"")+">March</option> <option "+(mon.equalsIgnoreCase("April")?"selected":"")+">April</option> <option "+(mon.equalsIgnoreCase("May")?"selected":"")+">May</option> <option "+(mon.equalsIgnoreCase("June")?"selected":"")+">June</option> <option "+(mon.equalsIgnoreCase("July")?"selected":"")+">July</option> <option "+(mon.equalsIgnoreCase("August")?"selected":"")+">August</option> <option "+(mon.equalsIgnoreCase("September")?"selected":"")+">September</option> <option "+(mon.equalsIgnoreCase("October")?"selected":"")+">October</option> <option "+(mon.equalsIgnoreCase("November")?"selected":"")+">November</option> <option "+(mon.equalsIgnoreCase("December")?"selected":"")+">December</option> </select><div class='customSelectClickQuest disabledDates'>mm</div></div>";

myContent+="<div class='customSelectWrapperQuest disabledDates'><select name='ansOptYear' class='yy'> <option>yyyy</option> <option "+(year.equalsIgnoreCase("1980")?"selected":"")+">1980</option> <option "+(year.equalsIgnoreCase("1981")?"selected":"")+">1981</option> <option "+(year.equalsIgnoreCase("1982")?"selected":"")+">1982</option> <option "+(year.equalsIgnoreCase("1983")?"selected":"")+">1983</option> <option "+(year.equalsIgnoreCase("1984")?"selected":"")+">1984</option> <option "+(year.equalsIgnoreCase("1985")?"selected":"")+">1985</option> <option "+(year.equalsIgnoreCase("1986")?"selected":"")+">1986</option> <option "+(year.equalsIgnoreCase("1987")?"selected":"")+">1987</option> <option "+(year.equalsIgnoreCase("1988")?"selected":"")+">1988</option>  <option "+(year.equalsIgnoreCase("1989")?"selected":"")+">1989</option>  <option "+(year.equalsIgnoreCase("1990")?"selected":"")+">1990</option>  <option "+(year.equalsIgnoreCase("1991")?"selected":"")+">1991</option>  <option "+(year.equalsIgnoreCase("1992")?"selected":"")+">1992</option>  <option "+(year.equalsIgnoreCase("1993")?"selected":"")+">1993</option>  <option "+(year.equalsIgnoreCase("1994")?"selected":"")+">1994</option>  <option "+(year.equalsIgnoreCase("1995")?"selected":"")+">1995</option>  <option "+(year.equalsIgnoreCase("1996")?"selected":"")+">1996</option>  <option "+(year.equalsIgnoreCase("1997")?"selected":"")+">1997</option>  <option "+(year.equalsIgnoreCase("1998")?"selected":"")+">1998</option>  <option "+(year.equalsIgnoreCase("1999")?"selected":"")+">1999</option>  <option "+(year.equalsIgnoreCase("2000")?"selected":"")+">2000</option>  <option "+(year.equalsIgnoreCase("2001")?"selected":"")+">2001</option>  <option "+(year.equalsIgnoreCase("2002")?"selected":"")+">2002</option>  <option "+(year.equalsIgnoreCase("2003")?"selected":"")+">2003</option>  <option "+(year.equalsIgnoreCase("2004")?"selected":"")+">2004</option>  <option "+(year.equalsIgnoreCase("2005")?"selected":"")+">2005</option>  <option "+(year.equalsIgnoreCase("2006")?"selected":"")+">2006</option>  <option "+(year.equalsIgnoreCase("2007")?"selected":"")+">2007</option>  <option "+(year.equalsIgnoreCase("2008")?"selected":"")+">2008</option>  <option "+(year.equalsIgnoreCase("2009")?"selected":"")+">2009</option>  <option "+(year.equalsIgnoreCase("2010")?"selected":"")+">2010</option>  <option "+(year.equalsIgnoreCase("2011")?"selected":"")+">2011</option>  <option "+(year.equalsIgnoreCase("2012")?"selected":"")+">2012</option>  <option "+(year.equalsIgnoreCase("2013")?"selected":"")+">2013</option>  <option "+(year.equalsIgnoreCase("2014")?"selected":"")+">2014</option>  <option "+(year.equalsIgnoreCase("2015")?"selected":"")+">2015</option>  <option "+(year.equalsIgnoreCase("2016")?"selected":"")+">2016</option>  <option "+(year.equalsIgnoreCase("2017")?"selected":"")+">2017</option>  <option "+(year.equalsIgnoreCase("2018")?"selected":"")+">2018</option>  <option "+(year.equalsIgnoreCase("2019")?"selected":"")+">2019</option>  <option "+(year.equalsIgnoreCase("2020")?"selected":"")+">2020</option>  <option "+(year.equalsIgnoreCase("2021")?"selected":"")+">2021</option>  <option "+(year.equalsIgnoreCase("2022")?"selected":"")+">2022</option>  <option "+(year.equalsIgnoreCase("2023")?"selected":"")+">2023</option>  <option "+(year.equalsIgnoreCase("2024")?"selected":"")+">2024</option>  <option "+(year.equalsIgnoreCase("2025")?"selected":"")+">2025</option>  <option "+(year.equalsIgnoreCase("2026")?"selected":"")+">2026</option>  <option "+(year.equalsIgnoreCase("2027")?"selected":"")+">2027</option>  <option "+(year.equalsIgnoreCase("2028")?"selected":"")+">2028</option>  <option "+(year.equalsIgnoreCase("2029")?"selected":"")+">2029</option>  <option "+(year.equalsIgnoreCase("2030")?"selected":"")+">2030</option>  <option "+(year.equalsIgnoreCase("2031")?"selected":"")+">2031</option>  <option "+(year.equalsIgnoreCase("2032")?"selected":"")+">2032</option>  <option "+(year.equalsIgnoreCase("2033")?"selected":"")+">2033</option>  <option "+(year.equalsIgnoreCase("2034")?"selected":"")+">2034</option>  <option "+(year.equalsIgnoreCase("2035")?"selected":"")+">2035</option>  <option "+(year.equalsIgnoreCase("2036")?"selected":"")+">2036</option> </select><div class='customSelectClickQuest disabledDates'>yyyy</div></div></span> </li> </ul> </div></div>";
}

if(questionTypeId.equals("12")){
int i=0;
myContent = "<input class='hidden' name='questionId' type='hidden' value = '"+questionId+"'><div class='boxContainer'><i class='icon-datePicker icons'></i><span class='widgetName'>Date picker</span><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+categoryList+"</li><li></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input id='qt_editBox' class='require' name='qtext' value='"+questionText+"'></div><div class='qt_field_opt qt_boolean_chkbox'><div class='clearfix'><label class='qt_ansOpt'>Answer Option</label></div><input type='hidden' class='submt' name='qId' value='10'><ul>";
if(answerOptionValueList !=null)
for(i = 0; i < answerOptionValueList.size() ; i++){
	
	myContent+="<li class='clearfix'><input class='datepicker' name='ansOpt' value='"+answerOptionValueList.get(i)+"'></li>";
	
}
myContent+="</ul></div></div>";

}
System.out.println("html content "+myContent);
%>

<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<%-- 
<div class="leftpanel">
  <div class="logopanel"> <a href="#"><img src="images/img_logo.png" alt="Partner Integrity" ></a> </div>
  <!-- logopanel -->
  
  <div class="leftpanelinner"> 
    
  <jsp:include page="leftPanel.jsp"></jsp:include>
  <!-- leftpanelinner --> 
</div>
<!-- leftpanel --> --%>




<jsp:include page="header.jsp" />
<%-- <div class="headerbar"> <a class="menutoggle"><i class="fa fa-bars"></i></a>
  <form class="searchform" action="#" method="post">
    	<div class="alert alert-success hidden">
                    <h2 class="text-center"> <strong>${message}!</strong></h2>                    
    </div>
    <input class="form-control" name="keyword" />
  </form>
  <div class="header-right">
    <ul class="headermenu">
      <li>
        <div class="btn-group" >
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <img src="images/photos/loggeduser.png" alt="" /> <%=session.getAttribute("loggedInUser")%> <span class="caret"></span> </button>
          <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
            <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
            <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
            <li>
            <form id="myform" method="post" action="/partnerintegrity/logout">
 												<!--  <a onclick="document.getElementById('myform').submit();"><b>Log Out</b></a> -->
 												<a href="#" onclick="javascript:logout();"><i class="glyphicon glyphicon-log-out"></i> Log Out</a>
											</form>
            </li>
          </ul>
        </div>
      </li>
      <li>
        <div class="btn-group">
          <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown"> <i class="glyphicon glyphicon-bell" style="color:#999999"></i> <span class="badge">1</span> </button>
          <div class="dropdown-menu dropdown-menu-head pull-right">
            <h5 class="title">You Have 1 New Notifications</h5>
            <ul class="dropdown-list gen-list">
              <li class="new"> <a href=""> <span class="thumb"><img src="images/photos/user4.png" alt="" /></span> <span class="desc"> <span class="name">Zaham Sindilmaca <span class="badge badge-success">new</span></span> <span class="msg">is now following you</span> </span> </a> </li>
              <li class="new"><a href="">See All Notifications</a></li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
  </div>

  
</div> --%>
<!-- headerbar -->
  
<div class="container">
 <div class="containerPanel clearfix">
   <h1 class="title">Edit Question</h1>
  
  <div class="setupQuestContainer clearfix">
  <!-- <div class="col-md-4 panels ">
    <ul class="panel-tabs comments">  	
        <li class="active"><a href="#questType">Question Type</a></li>
   </ul>
    <div id="questType" class="tab_content" style="display: block;">
     	<ul class="questTypeSprite">
  	  <li>Textbox<ul>
  	  <li id="single-text-box"><i class="icon-sTxtBox"></i>Single text box</li>
  	  <li id ="multiple-text-box"><i class="icon-mTxtBox"></i>Multiple text box</li>
      <li id ="numeric-box"><i class="icon-nBox"></i>Numeric box</li>
      <li id ="currency-box"><i class="icon-cBox"></i>Currency box</li>
      </ul></li>
  	  <li>Multiple Choice<ul>
  	  <li id="multiple-choice-radio"><i class="icon-radio"></i>Radio</li>
  	  <li id="multiple-choice-dropdown"><i class="icon-dropdown"></i>Dropdown</li>
       </ul></li>
  	  <li>Multiple Select<ul>
  	  <li id="multiple-select-checkbox"><i class="icon-checkBox"></i>Checkbox</li>
  	  <li id="multiple-select-dropdown"><i class="icon-dropdown"></i>Dropdown</li>
       </ul></li>
  	  <li>Boolean<ul>
  	  <li id="boolean-radio"><i class="icon-radio"></i>Radio</li>
  	  <li id="boolean-checkbox"><i class="icon-checkBox"></i>Checkbox</li>
       </ul></li>
  	  <li>Date &amp; Time<ul>
  	  <li id="dt-select"><i class="icon-dateSelection"></i>Date selection box</li>
  	  <li id="dt-picker"><i class="icon-datePicker"></i>Date picker</li>
	    </ul>
        </li>
        </ul>
    </div>
  
  </div> -->
  <form name="submit-questionnaire" id="submit-questionnaire" action="/partnerintegrity/createquestion" method="POST">
  <div class="questContainer">
  <div class="questContainerTabs">
  
     <div class="tab_content blueprint questionContainer current" style="display:block;">
          <div class="errorMsg">Please fill the fields highlighted in red.</div>
     <c:choose>
      <c:when test="${not empty message}">   
        <div id="errBackMsg">${message}</div>
      </c:when>
      <c:otherwise>    
         <div id="errBackMsg">${errormessage}</div>
	  </c:otherwise>
	</c:choose>    
     
     <ul class="questionn">  
       <!-- <div class="dragItemLabel">Drag and drop questions form left</div> -->	
       <li class="ui-draggable ui-draggable-handle canvas-element">
       
      <%--  <c:forEach items="${requestScope.Question}" var="question">
       
       <div class="multipleTxtBox boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li><select><option> Select question Category </option><option> Category 1 </option><option> Category 2 </option></select></li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input class="submt" id="qt_editBox" name="multiTxtBoxQuest" placeholder="Textbox - Multiple Textbox......"></div><div class="qt_field_opt qt_multi clearfix"><div class="clearfix"><label class="qt_ansOpt">Answer Option</label><label class="qt_score">Score</label></div><ol class="qt_multiTxtBoxList widgetsEl" type="a"><li class="clearfix qt_multiTxtBox_row hidden"><input class="qt_ansOpt submt" name="multiAnsOpt"><input class="qt_score submt" name="multiScore"><button class="qt_remove"></button></li><li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt submt" name="multiAnsOpt"><input class="qt_score submt" name="multiScore"></li><li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt submt" name="multiAnsOpt"><input class="qt_score submt" name="multiScore"></li><li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt submt" name="multiAnsOpt"><input class="qt_score submt" name="multiScore"><button class="qt_add"></button></li></ol></div></div>
       
       </c:forEach> --%>
       
       
       
       
         <% out.println(myContent); %>
       </li>
     </ul>
    </div>
    <!-- /Dynamic Tab Contents -->
  
  <!-- contentpanel --> 
</div>  
</div>
<!-- <div style="padding:10px">
<button class="btn btn-xs closer" onclick="closeQues()">Close</button><button class="btn btn-xs fr save">Save</button>
</div> -->

<div class="btns-block getQst">
							<%-- <a href="${pageContext.request.contextPath}/displayquestionbank" class="btn btn-xs">Cancel</a> --%>
							<a onclick="javascript:history.back()" class="btn btn-xs">Cancel</a>
								<%-- <button class="btn btn-xs" data-toggle="modal"
									href="${pageContext.request.contextPath}/createquestion">Create Question</button> --%>
								<!--<button class="btn btn-xs">+ External Organisation</button>-->
   <button class="btn btn-xs fr save">Update</button>
</div>


</form>

</div>
</div>
</div>
</div>
<div class="footer">Copyright &copy; 2014 The Red Flag Group. All rights reserved. </div>

<div class="questPopup">       
    <ul>
      <li>Are yor sure you want to delete the question?</li>
      <li><button type="button" class="btn btn-xs yesBtn closePopup" name="yes">Yes</button>
     <button type="button" class="btn btn-xs noBtn" name="no">No</button></li>
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
<div class="tooltipQst"></div>


<script src="js/jquery-1.10.2.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script>
<script src="js/toggles.min.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/jquery.cookies.js"></script>
<script src="js/bootstrap-switch.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
<script src="js/custom.js"></script> 
<script>
function closeQues()
{
	   alert("in close question");
	   window.open('/partnerintegrity/displayquestionbank','_self');
	}

//Date Picker
jQuery(".datepicker").datepicker({
	dateFormat: "dd/mm/yy",
	showOn: "button",
	changeMonth: true,
	changeYear: true
});

jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-icon">');

jQuery(document).ready(function () {
	jQuery('#single-text-box').draggable({helper: 'clone', cursor: 'move',live:true});
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
			$canvasElement.css({
				position: 'relative'
			});
	
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
			
		
	
	
	jQuery(".customSelect").selectmenu();

      jQuery(".customSelect").selectmenu({
			close: function( event, ui ) {
				jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');}
			
			});	 
	  }
	  
    });
	
    //jQuery( "#container" ).disableSelection();
    
    
    


		

	
    function idPicker(id){
    	//console.log(jQuery(id[0]).attr("id"));
    	var draggableId;
    	switch(jQuery(id[0]).attr("id")){
    	
		case "single-text-box" : return draggableId = '<div class="singleTxtFields boxContainer"> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer Option</label> </div> <ul> <li class="clearfix"><input class="submt hidden" name="qId" value= "1"><input class="qt_ansOpt submt notReq" name="ansOpt"></li> </ul> </div></div>'; break;		
		
		case "multiple-text-box" : return draggableId = '<div class="multipleTxtBox boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input class="submt" id="qt_editBox" name="qtext"></div><div class="qt_field_opt qt_multi clearfix"><div class="clearfix"><label class="qt_ansOpt">Answer Option</label></div><input class="submt hidden" name="qId" value="2"><ol class="qt_multiTxtBoxList widgetsEl" type="a"><li class="clearfix qt_multiTxtBox_row hidden"><input class="qt_ansOpt submt" name="ansOpt"><button class="qt_remove"></button></li><li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt submt" name="ansOpt"></li><li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt submt" name="ansOpt"></li><li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt submt" name="ansOpt"><button class="qt_add"></button></li></ol></div></div>';
		break;
		
		case "numeric-box" : return draggableId = '<div class="textBoxNumeric boxContainer"> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt hidden" name="qId" value= "3"><input class="submt" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer Option</label> </div> <ul> <li class="clearfix"><input class="qt_ansOpt submt" name= "ansOpt"></li> </ul><label class="setRange">Set Range</label> <div class="clearfix"></div> <div class="clearfix"> <label class="col1">From</label><label class="col2">To</label> </div> <ul class="qt_multiTxtBoxList widgetsEl"> <li class="clearfix qt_multiTxtBox_row hidden"><input class="col1" name="rangeOpt1"><input class="col2" name= "rangeOpt2"><button class="qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="col1" name= "rangeOpt1"><input class="col2" name="rangeOpt2"><button class= "qt_add"></button></li> </ul> </div></div>';
		break;
		
		case "currency-box" : return draggableId = '<div class="currencyBox boxContainer"> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title= ""></label><input class="submt hidden" name="qId" value= "4"><input class="submt" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <label class="qt_ansOpt col1">Answer Option</label> </div> <ul> <li class="clearfix"><input class="qt_ansOpt submt" name= "ansOpt"><select name="ansOpt"> <option> USD </option> <option> POUND </option> <option> RUPEE </option> </select></li> </ul><label class="setRange">Set Range</label> <div class="clearfix"></div> <div class="clearfix"> <label class="col1">Min. value</label><label class="col2">Max. value</label><label class="col3"></label> </div> <ul class="qt_multiTxtBoxList widgetsEl"> <li class="clearfix qt_multiTxtBox_row hidden"><input class="col1" name="rangeOpt1"><input class="col2" name= "rangeOpt2"><button class="qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="col1" name= "rangeOpt1"><input class="col2" name="rangeOpt2"><button class= "qt_add"></button></li> </ul> </div></div>';
		break;
		
		case "multiple-choice-radio" : return draggableId = '<div class="mc-radio boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input name="qtext" id="qt_editBox"></div><input class="submt hidden" name="qId" value="5"><div class="qt_field_opt qt_mc_radio qt_multi clearfix widgetsEl customInput customRadio"><div class="clearfix"><span class="qt_ansOpt">Answer Option</span></div><div class="clearfix hidden"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt"><button class="qt_remove"></button></div><div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt"></div><div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt"></div><div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt"></div><div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt"></div><div class="clearfix"><div class="radioWrapQuest"><input class="require" name="multiRadio" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt"><button class="qt_add"></button></div><div class="clearfix"></div></div></div>'; break;
		
		case "multiple-choice-dropdown" :return draggableId = '<div class="mc-dropdown boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input class="multiDropdownQuest" name="qtext" id="qt_editBox"></div><div class="qt_field_opt qt_multiChoice_dd"><ul><li class="clearfix"><div class="multiChoice_dd"><div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div><input class="submt hidden" name="qId" value="6"><div class="mc_dd_opt hide widgetsEl"><label class="bulk">Answer Option</label><div class="clearfix hidden"><input class="submt hidden" name="qId" value="6"><input name="ansOpt" class="bulk"><button class="qt_remove"></button></div><div class="clearfix"><input name="ansOpt" class="bulk"></div><div class="clearfix"><input name="ansOpt" class="bulk"></div><div class="clearfix"><input name="ansOpt" class="bulk"><button class="qt_add"></button></div><div class="clearfix"><input name="ansOpt" class="bulk"><button class="qt_remove"></button></div></div></div></li></ul></div></div>'; break;
		
		case "multiple-select-checkbox" : return draggableId = '<div class="ms-chkbox boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input id="qt_editBox" name="qtext"></div><input class="submt hidden" name="qId" value="7"><div class="qt_field_opt qt_multi clearfix widgetsEl customInput customCheckbox"><div class="clearfix"><span class="qt_ansOpt">Answer Option</span></div><div class="clearfix hidden"><input class="qt_ms_chkbox" id="checkbox123" type="checkbox"><label for="checkbox123"></label><input class="qt_ansOpt" name="ansOpt"><button class="qt_remove"></button></div><div class="clearfix"><label for="checkbox124"></label><input class="qt_ms_chkbox" id="checkbox124" type="checkbox"><input class="qt_ansOpt" name="ansOpt"></div><div class="clearfix"><label for="checkbox125"></label><input class="qt_ms_chkbox" id="checkbox125" type="checkbox"><input class="qt_ansOpt" name="ansOpt"></div><div class="clearfix"><label for="checkbox126"></label><input class="qt_ms_chkbox" id="checkbox126" type="checkbox"><input class="qt_ansOpt" name="ansOpt"><button class="qt_add"></button></div><div class="clearfix"></div></div></div>'; break;
		
		case "multiple-select-dropdown" : return draggableId = '<div class="ms-dropdown boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input name="qtext" id="qt_editBox"></div><div class="qt_field_opt qt_multi clearfix multiChoice_dd"><div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div><input class="submt hidden" name="qId" value="8"><div class="mc_dd_opt hide widgetsEl customInput customCheckbox"><div class="clearfix"><span class="bulk">Answer Option</span></div><div class="clearfix hidden"><label></label><input type="checkbox"><input name="ansOpt" class="bulk"><button class="qt_remove"></button></div><div class="clearfix"><label for="mcheckbox421"></label><input class="checkbox" id="mcheckbox421" type="checkbox"><input name="ansOpt" class="bulk"></div><div class="clearfix"><label for="mcheckbox521"></label><input class="checkbox" id="mcheckbox521" type="checkbox"><input name="ansOpt" class="bulk"></div><div class="clearfix"><label for="mcheckbox621"></label><input class="checkbox" id="mcheckbox621" type="checkbox"><input name="ansOpt" class="bulk"><button class="qt_add"></button></div><div class="clearfix"><label for="mcheckbox721"></label><input class="checkbox" id="mcheckbox721" type="checkbox"><input name="ansOpt" class="bulk"><button class="qt_remove"></button></div><div class="clearfix"></div></div></div></div>'; break;
		
		case "boolean-radio" : return draggableId = '<div class="boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input name="qtext" id="qt_editBox"></div><div class="qt_field_opt qt_boolean_Radio clearfix"><div class="clearfix"><label class="qt_ansOpt">Answer Option</label></div><ul class="customInput customRadio"><li class="clearfix"><div class="radioWrapQuest"><input name="question" type="radio"><div class="radioWrapClickQuest"></div></div><input name="ansOpt" class="qt_ansOpt" name="ansOpt"></li><li><label for="boolRadio2"></label><div class="radioWrapQuest"><input name="question" type="radio"><div class="radioWrapClickQuest"></div></div><input class="submt hidden" name="qId" value="9"><input name="ansOpt" class="qt_ansOpt" name="question"></li></ul></div></div>'; break; 
		
		case "boolean-checkbox" : return draggableId = '<div class="boxContainer"><div class="qt_settings clearfix"><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><label class="qt_editBox" for="qt_editBox" title=""></label><input id="qt_editBox" name="qtext"></div><div class="qt_field_opt qt_boolean_chkbox"><div class="clearfix"><label class="qt_ansOpt">Answer Option</label></div><ul class="customInput customCheckbox"><li class="clearfix"><label for="boolCheckbox"></label><input id="boolCheckbox" name="question" type="checkbox"><input class="submt hidden" name="qId" value="10"><input class="qt_ansOpt" name="ansOpt"></li></ul></div></div>'; break;
		
		case "dt-select" : return draggableId = '<div class="dateSelection boxContainer"> <div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-delete"></span></li> </ul> </div> <div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title=""></label> <input class="submt" id="qt_editBox" name="qtext"> </div> <div class="qt_field_opt clearfix"> <div class="clearfix"><input class="submt hidden" name="qId" value="11"> <label class="qt_ansOpt">Answer Option</label> </div> <ul> <li class="clearfix"><span class="dateSel"> <select name="ansOptDay" class="dd"> <option>dd</option> <option>1</option> <option>2</option> <option>3</option> <option>4</option> <option>5</option> <option>6</option> <option>7</option> <option>8</option> <option>9</option> <option>10</option> <option>11</option> <option>12</option> <option>13</option> <option>14</option> <option>15</option> <option>16</option> <option>17</option> <option>18</option> <option>19</option> <option>20</option> <option>21</option> <option>22</option> <option>23</option> <option>24</option> <option>25</option> <option>26</option> <option>27</option> <option>28</option> <option>29</option> <option>30</option> <option>31</option> </select> <select name="ansOptMon" class="mm"> <option>mm</option> <option>January</option> <option>February</option> <option>March</option> <option>April</option> <option>May</option> <option>June</option> <option>July</option> <option>August</option> <option>September</option> <option>October</option> <option>November</option> <option>December</option> </select> <select name="ansOptYear" class="yy"> <option>yyyy</option> <option>1980</option> <option>1981</option> <option>1982</option> <option>1983</option> <option>1984</option> <option>1985</option> <option>1986</option> <option>1987</option> <option>1988</option> <option>1989</option> <option>1990</option> <option>1991</option> <option>1992</option> <option>1993</option> <option>1994</option> <option>1995</option> <option>1996</option> <option>1997</option> <option>1998</option> <option>1999</option> <option>2000</option> <option>2001</option> <option>2002</option> <option>2003</option> <option>2004</option> <option>2005</option> <option>2006</option> <option>2007</option> <option>2008</option> <option>2009</option> <option>2010</option> <option>2011</option> <option>2012</option> <option>2013</option> <option>2014</option> <option>2015</option> <option>2016</option> <option>2017</option> <option>2018</option> <option>2019</option> <option>2020</option> <option>2021</option> <option>2022</option> <option>2023</option> <option>2024</option> <option>2025</option> <option>2026</option> <option>2027</option> <option>2028</option> <option>2029</option> <option>2030</option> <option>2031</option> <option>2032</option> <option>2033</option> <option>2034</option> <option>2035</option> <option>2036</option> </select></span> </li> </ul> </div></div>'; break;
		
		case "dt-picker" : return draggableId = '<div class="datePicker boxContainer"><div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li> ${categoryValues} </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <label class="qt_editBox" for="qt_editBox" title=""></label> <input class= "submt" id="qt_editBox" name="qtext"></div><div class="qt_field_opt clearfix"> <div class="clearfix"> <label class="qt_ansOpt">Answer Option</label></div> <ul> <li class="clearfix"><input class="datepicker" type= "text"></li> </ul></div></div>'; break;
		
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
		}
		$('.popupBg, .questPopup').hide();
	});
	
});
   function randonNumber(){
	  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
	  return rNum;                             
	}
   

   
   
   function dates() {
	   
	   jQuery('.questContainerTabs').on('change', '#dt-select select', function() {
		   
		   if(jQuery(this).hasClass('mm')){  
			   
			  var mm = jQuery(this)[0].selectedIndex,
			      len =  jQuery('.dd').find('option').length;
			  
			  if (mm==4 || mm==6 || mm==9 || mm==11){
				 if(len < 31){
					 for(var i = len; i < 31; i++){
						  $('<option>'+ (i+1) +'</option>').appendTo('.dd'); 
					  }
			      	 
				 }
				 else {
					 jQuery('.dd').find('option').eq(31).remove();
				 }
				  
			  }
			  
			  else if (mm==1 || mm==3 || mm==5 || mm==7 || mm==8 || mm==10 || mm==12){
				  for(var i = len; i < 32; i++){
					  $('<option>'+i+'</option>').appendTo('.dd'); 
				  }
			  }
			  
			  else {
				    if(isLeapYear(yy) && mm==2) {
					  for(var i = len; i > 29; i--) {
						  jQuery('.dd').find('option').eq(i+1).remove(); 
					  }  
					  }	 
				    if(mm==2 && !isLeapYear(yy)) {
						  for(var i = len; i > 28; i--) {
							  jQuery('.dd').find('option').eq(i+1).remove(); 
						  } 
					
				  }
			  }
			    
		   }   
		   
		   
		    if(jQuery(this).hasClass('yy')) {
		       var yy = jQuery(this).val();
		       if(isLeapYear (yy)){
		    	   $('<option>29</option>').appendTo('.dd');  
		       }
		    }  
	   });
	   
	   $('.save').on('click', function (e) {
	       if ($('.boxContainer').length == 0) {
	           return false;
	       }
	       
	       var len = $('.questContainerTabs').find('.require').length, value = 0;
	       $('.questContainerTabs').find('.require').each(function (index) {
	           if ($(this).closest('li, .clearfix').hasClass('hidden') == false && $(this).val().trim() == '') {
	        	   jQuery(this).addClass('errorInput').val('');
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
	   
	   
	   //alert(n);
   }
   
   function getDaysInMonth(month,year)  {
	   var days;
	   if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12)  days=31;
	   else if (month==4 || month==6 || month==9 || month==11) days=30;
	   else if (month==2)  {
	   if (isLeapYear(year)) { days=29; }
	   else { days=28; }
	   }
	   return (days);
	}
   
   function isLeapYear (Year) {
	   if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
	   return (true);
	   } else { return (false); }
	   }
   
   dates();


   //Allow only numeric values
   jQuery(document).on('keypress focus','input.col1, input.col2, input.col3',function (e) {
               var key = window.e ? e.keyCode : e.which;
               if (e.keyCode == 8 || e.keyCode == 0) {
                               return true;
               }
               else if ( key < 48 || key > 57 ) {                              
                   return false;
               }
               else return true;
            });  

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

jQuery(document).on("click", ".customCheckboxNewQuest, .checkbox", function(){
	if(jQuery(this).is(":checked")){
		jQuery(this).next().css("background-position","-34px 0");
	}else{
		jQuery(this).next().css("background-position","0 0");
	}
});


  
   
</script>


</body>
</html>
