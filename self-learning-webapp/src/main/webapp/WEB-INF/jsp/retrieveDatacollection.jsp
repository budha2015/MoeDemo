<!DOCTYPE html>
<%@ page import="com.rfg.tprm.questionnaire.model.QuestionComponent" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link href="css/tprm.css" rel="stylesheet">

<link rel="stylesheet" href="css/questionnaire.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-switch.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
<link rel="stylesheet" href="css/questionnaire/qr-common.css" />
<link href="css/qrmain.css" rel="stylesheet">
<link rel="stylesheet" href="css/mainDT.css" />
<link rel="stylesheet" type="text/css" href="css/slider.css">

<!--
<link type="text/css" href="http://jscrollpane.kelvinluck.com/style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 http://jscrollpane.kelvinluck.com/ -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
#single-text-box.ui-widget-content { color: #636e7b; }
select {
	border:1px solid #e1e3eb;
	border-radius:3px;
}

.settings-panel table{ border-bottom:#e1e3eb 1px solid; margin-bottom: 1em;}
td{ padding: 5px}
.settings-panel tr > td:first-child {
    text-align: right;
	width: 80%;
}
.tag { width: 50px;}
.questionn>li{ border-bottom:#e1e3eb 1px solid;}
.questionn>li:last-child{ border:none;}
.selectall {display: inline-block;
    margin-right: 1em;
    position: relative;
    top: 1em;}

.setupQuestContainer{
	float:left;width:100%;padding: 0
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
.quesDesc {width: 100%;
height: 50px;
padding: 5px;}
.leftpanel {
    background: none repeat scroll 0 0 #3b3b3b;
    left: 0;
    position: absolute;
    top: 0;
    width: 240px;
    z-index: 100;
    height: 830px;
}
.questionContainer {
/* 
height:auto!important; 
height:651px; */
min-height:647px;
background:transparent;
position:relative;
vertical-align:middle;
padding:10px;
border:1px solid #e1e3eb;
overflow-y: auto;
overflow-x: hidden;
}
.questionContainer li.canvas-element{
width:99%;
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
    color: #000 !important;
    font-size: 11px;
    height: 22px;
    padding-left: 2%;
    width: 100%;
}
.save-template-popup .submitQ {
    float: right;
    border: 1px solid #19b5a3;
    color: #19b5a3;
	background:none;
}
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
.save-template-popup .submitQ:hover{
background:#19b5a3;
color:#FFF;
}
.select-category{border-radius:5px;border:1px solid #11b1aa; border-top:0;padding:2px 5px; width:200px;position:absolute}
.select-category input{width:100%; margin:2px 0; cursor:pointer;}
.select-category.hide{display:none}
.select-category.show{display:block;z-index:1}
#multiple-select-dropdown .mc_dd_opt.show{position:relative; display:inline-block}
.dragItemLabel{margin:0}
.saveTmpError {display:none; color:red}

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
.setRange {color: #000; font-size: 12px; font-weight: normal; height: 20px}
.multiChoice_dd {width: 380px; float:left}
.mc_dd_opt {width: 395px}
.mc_dd_opt .bulk, .mc_dd_opt label.bulk {width: 60% !important}
.mc_dd_opt .score, .mc_dd_opt label.score, .mc_dd_opt .qt_score, .mc_dd_opt label.qt_score {float:left; margin-left:8px; width: 15%; margin-right: 10px;}
.qt_field_opt button {float:left; margin-right: 30px}
.dateSel select {float:left; margin-right: 20px}
.dateSel {width: 50%; display:inline-block; float:left}
.multiChoice_dd_select {width: 395px}
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

.yesBtn, .noBtn{width: 75px; margin-top:10px;}
.yesBtn {margin-right: 20px; margin-left: 25px}
.yesBtn:hover {background: #d9534f}
.noBtn {float:right;}
.leftpanel {
    background: none repeat scroll 0 0 #3b3b3b;
    left: 0;
    position: absolute;
    top: 0;
    width: 240px;
    z-index: 100;
    height: 830px;
}
.btn-block { margin-top: 1em; clear:both; overflow:hidden; padding: 20px 3px}
.preview { margin-right: 1em;}
.settings-panel tr > td:first-child {
    text-align: right;
}

.ui-widget-content { border:none;}
.nolist { list-style: none;}
.icon-settings, .icon-delete { cursor: pointer;}
.settings-panel td { vertical-align: top;}
.ques input[type="text"] { width: 95%;}
.errorInput {border: 1px solid red !important}
.errorMsg {background: #ccc; display:none;font-size: 14px;padding:10px; margin:auto;width:100%; color:red; text-align:center}
.mc_dd_opt {max-height: 200px; overflow-y: auto}
.boxContainer {padding: 20px 0;}
.datepicker {margin-right: 0}
.dateSelector .qtscore {margin-left:30px}
.qt_field_opt button {margin-right: 2px}
.questErrMsg {color: red; font-weight: bold; display:none; padding: 10px 20px 0 10px}
.btns-fr {float:right}
.pipeline { display: inline-block; width: 2px; margin: 0 1.5em; border-right: #ccc 1px solid; height: 32px; vertical-align: middle;}
.save-template-popup {height: auto !important}
.singleTxtFields ul .qt_ansOpt, .multipleTxtBox ol .qt_ansOpt, .multipleTxtBox ol .qt_score, #multiple-text-box ol .qt_ansOpt, #multiple-text-box ol .qt_score, #single-text-box ul .qt_ansOpt {opacity: 0.2; border: 1px solid #000;}
.ms-dropdown .mc_dd_opt, .qt_field_opt .mc_dd_opt {position: relative !important; }
.checkWrapQuest, .checkWrapQuest1{float:left; height:16px; margin-top:10px; width:16px; position:relative;}
.checkWrapQuest1{margin-right:10px; margin-top:6px;}
.checkWrapClickQuest{background:url(images/icons/form_set.png) 0 0 no-repeat; position:absolute; left:0; top:0; height:16px; width:16px; z-index:99;}
.customCheckboxNewQuest, .checkbox{height: auto; position:absolute; left:0; top:0; opacity:0; filter:alpha(opacity=0); outline:none; z-index:999;}
.qt_field_opt input[type="checkbox"]{margin-left:0 !important;}
.removePopup .toRemove {text-align:center}
.qt_field_opt {list-style-type:none} 
.mc_dd_opt {padding: 1em 1em 1em 3em}
.dateSelector .qt_score {margin-left:110px}
/* For New Custom Select by Ravi */

.customSelectWrapperQuest{float:left; height:25px; position:relative;width: 195px}
.qtCat, .qtCatCurrency{height:25px; position:absolute; left:0; top:0; opacity:0; filter: alpha(opacity=0); z-index:999; width: 195px}

#numeric-box .qt_ansOpt{width:50%}
.questPopup {width: 365px}
.mainpanel {min-height: 100% !important}
.bussinessCase {width: 100%; padding: 20px;}
.bussinessCase table {width: 100%}
.bussinessCase .bleft {text-align:right; padding-right: 20px}
.bussinessCase .bright {color: #000}
#numeric-box .qt_score, #currency-box .qt_score, #numeric-box .qt_field_opt, .currencydiv,.setRange,.col1,.col2,.score {display: none}
.mainpanel {margin-left: 0 !important}
/*Button CSS Starts*/
button[disabled] {
	background: #d2d3d5;
	color: #b3b3b3
}
/*Button CSS Ends*/
.icon-plus {   color: rgb(48, 91, 127); }
.tab .sectionInput:hover {   border: 0}
#questType ul li ul li:hover { color: rgb(48, 91, 127);}
.questHeader .questTitleEdit {color: rgb(48, 91, 127);}
.questHeader {background: #fff}
.ui-state-default .ui-icon {background: rgb(48, 91, 127) url("images/blue_dd.png") no-repeat 0 0 !important; width:24px; }
.ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-header .ui-state-focus {border: #17a2d6 1px solid !important;}
.questPopup { border-radius: 0;}
.questContainer {width:100%; padding: 0}
.tooltipQst {left: -21px !important; min-width: 135px; }
</style>
</head>

<body>

<%
/* List<QuestionComponent> retrieveQuestionnaireComponents = (List<QuestionComponent>)session.getAttribute("RETRIEVE QUESTIONNAIRE");

//System.out.println("Size of retrieveQuestionnaireComponents Size is:"+retrieveQuestionnaireComponents.size()); */

Map<Long,String> categoryList = (Map<Long,String>)request.getAttribute("categoryList");

//System.out.println("Map Size Came to the JSP is:"+categoryList.size());

//System.out.println("Category Name is:"+categoryList);

Long questionnaireId = 0L;
 
String questionnaireName = ""; // (retrieveQuestionnaireComponents.get(0)).getQuestionnaireName();

String questionnaireDescription = ""; //(retrieveQuestionnaireComponents.get(0)).getDescription();

//String displayName = "";

String myContent="";

String sectionNameBasedLiContent = "";

String divContent = "";

String sectionTitle = "";

String businessContent = "";

//String defButton = "";

int st = 10;
List<QuestionComponent> retrieveQuestionnaireComponents = null;

 // TreeMap<String,LinkedList<QuestionComponent>> sectionMap = (TreeMap<String,LinkedList<QuestionComponent>>) request.getAttribute("SectionBasedQuestionnaireComponents");
 
 LinkedHashMap<String,LinkedList<QuestionComponent>> sectionMap = (LinkedHashMap<String,LinkedList<QuestionComponent>>) request.getAttribute("SectionBasedQuestionnaireComponents");
 
 //System.out.println("SectionMap Size Came to the JSP Related to Section Based QuestionnaireComponents is:"+ sectionMap.size());
 
 
 
Set<Map.Entry<String,LinkedList<QuestionComponent>>> set = sectionMap.entrySet();
 
 Iterator iterator = set.iterator();
 
 Collection<LinkedList<QuestionComponent>> retQuestionnaireComponents = null;
 
 String sectionName = (String)request.getAttribute("sectionName");
 
 String insert = (String)request.getAttribute("insert");
 String secName = "";
 
 /* if(sectionMap.size() == 0){
 
 retQuestionnaireComponents = (Collection<LinkedList<QuestionComponent>>)sectionMap.values();
 
 //System.out.println("Size of retQuestionnaireComponents : "+retQuestionnaireComponents);
 
 } */
 
 
 while(iterator.hasNext()){
	 
	 myContent ="";
	 
	 Map.Entry<String,LinkedList<QuestionComponent>> mEntry = (Map.Entry<String,LinkedList<QuestionComponent>>) iterator.next();
	 
	 retrieveQuestionnaireComponents = (LinkedList<QuestionComponent>) mEntry.getValue();
	 secName = (retrieveQuestionnaireComponents.get(0)).getSectionLabel();
	 questionnaireName = (retrieveQuestionnaireComponents.get(0)).getQuestionnaireName();
	 questionnaireDescription = (retrieveQuestionnaireComponents.get(0)).getDescription();
	 if(st == 10 && insert==null)
	 sectionNameBasedLiContent += "<li class='tab active' data-link='sectionTitle"+st+"'><input name='sectionTitle"+st+"51' class='sectionInput' id='sectionTitle"+st+"51' value='"+(mEntry.getKey()!=null?mEntry.getKey():"")+"' readonly><input name='questionnaireId' class='sectionQuestionnaire hidden' value='"+(((mEntry.getValue()).get(0)).getQuestionnaireId()!=null?((mEntry.getValue()).get(0)).getQuestionnaireId():0)+"'></li>";
	 else if(((secName != null) && (secName.equals(sectionName))))
	 sectionNameBasedLiContent += "<li class='tab active' data-link='sectionTitle"+st+"'><input name='sectionTitle"+st+"51' class='sectionInput' id='sectionTitle"+st+"51' value='"+(mEntry.getKey()!=null?mEntry.getKey():"")+"' readonly><input name='questionnaireId' class='sectionQuestionnaire hidden' value='"+(((mEntry.getValue()).get(0)).getQuestionnaireId()!=null?((mEntry.getValue()).get(0)).getQuestionnaireId():0)+"'></li>";
	 else
		 sectionNameBasedLiContent += "<li class='tab' data-link='sectionTitle"+st+"'><input name='sectionTitle"+st+"51' class='sectionInput' id='sectionTitle"+st+"51' value='"+(mEntry.getKey()!=null?mEntry.getKey():"")+"' readonly><input name='questionnaireId' class='sectionQuestionnaire hidden' value='"+(((mEntry.getValue()).get(0)).getQuestionnaireId()!=null?((mEntry.getValue()).get(0)).getQuestionnaireId():0)+"'></li>";
	 
	 //System.out.println("Size of LinkedList<QuestionComponent> is:"+retrieveQuestionnaireComponents.size()); 

for(QuestionComponent qc:retrieveQuestionnaireComponents){
	//outer for loop
	
String questionText= qc.getQuestionText();
String questionTypeId= qc.getQuestionTypeId()+"";
Long questionId = qc.getQuestionId();
List<Long> answerOptionId = qc.getAnswerOptionId();

questionnaireId = qc.getQuestionnaireId();

questionnaireName = questionnaireName.equalsIgnoreCase("")?qc.getQuestionnaireName():questionnaireName;

questionnaireDescription = questionnaireDescription.equalsIgnoreCase("")?qc.getDescription():questionnaireDescription;

/* String defType =  qc.getDeftype();
if(!(defType.equalsIgnoreCase(""))){
	 
	 defButton = qc.getDeftype();
	 if(defButton.equalsIgnoreCase("Q")){
			
		  defButton = "Delete Questionnaire";
			
	 } else{
		 defButton = "Delete Business Case";
	 }
} */

/* if(qc.getDeftype() != null){
	if(qc.getDeftype().equalsIgnoreCase("Q")){
		displayName = "Questionnaire";
	}
} */

//System.out.println("QuestionText From UI is:"+questionText);
List<Long> answerOptionIdList = qc.getAnswerOptionId();
//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
List<String> answerOptionValueList = new ArrayList<String>();
answerOptionValueList=qc.getAnswerOptionValue();  
//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
//System.out.println("questionTypeId is:"+questionTypeId);
//System.out.println("Question Id is: "+questionId);

List<Short> answerOptionScoreValueList = qc.getAnswerOptionScore();
//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());



String sele = "";
String qidText ="";

if(!(qc.getSource().equalsIgnoreCase("bank"))){
	qidText="<input Class='hidden' name='qid' type='text' value = '"+qc.getQuestionId()+"'>";
}
else{
	qidText="";
}

if(questionTypeId.equals("13")){
	  businessContent += "<div class='bussinessCase'><table><tr><td class='bleft'>Business case name</td><td class='bright'>"+ questionnaireName +"</td></tr>"; 
	  businessContent += "<tr><td class='bleft'>Company's full legal name</td><td class='bright'><input type='text' class='search-table' value='"+ (qc.getLegalName() != null?qc.getLegalName():"") +"' readonly/>";  
	  businessContent += "<input class='hidden' name='q1' value='Company&#39s full legal name'/><input class='hidden hiddenId' name='a1' value='"+answerOptionValueList.get(0)+"' /><input class='hidden' name='qid1' value='"+questionId+"'/</td></tr></table></div>"; 
	    
	}

if(questionTypeId.equals("1")){
	
	/* My Code */
	
	//System.out.println("********Single Text Box************");
	
	//System.out.println("Question Id is: "+questionId);
	//System.out.println("QuestionText From UI is:"+questionText);
	//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
	//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
	//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
	//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
	//System.out.println(qc.getQuestionMandatory()==true?"Yes":"No");
	//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
	//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*	Iterator iter = answerOptionValueList.iterator();
	while(iter.hasNext()){
		//System.out.println("AOP Value is:"+(String)iter.next());
	}
	Iterator itera = answerOptionScoreValueList.iterator();
	while(itera.hasNext()){
		//System.out.println("AOS Value is:"+(Short)itera.next());
	}*/
	
	
	/* My Code */
	
	//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
	//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}
	
	//System.out.println("AnswerOptionScoreValueList Size In This Category is:"+answerOptionScoreValueList.size());
	//System.out.println("AnswerOptionScoreValue :"+answerOptionScoreValueList.get(0));
	
	//System.out.println("((qc.getQuestionAttachment()).booleanValue()======"+((qc.getQuestionAttachment()).booleanValue()));
	
	//System.out.println("(qc.getQuestionAttachment())============"+(Boolean)(qc.getQuestionAttachment()));
	
/*	if((((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true"))){
		
		//System.out.println("true");
		
	}else{
		//System.out.println("false");
	}
	
if((((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true"))){
		
		//System.out.println("true");
		
	}else{
		//System.out.println("false");
	}*/


	
	
//System.out.println("((qc.getQuestionAttachment()).booleanValue()==true======"+((qc.getQuestionMandatory()).booleanValue()));
	
	//System.out.println("(qc.getQuestionAttachment())============"+(Boolean)(qc.getQuestionMandatory()));
	
	try{
	
	myContent+="<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='singleTxtFields boxContainer'><div class='qt_settings clearfix'><i class='icon-sTxtBox icons'></i><span class='widgetName'>Single Text Box</span></div><div class='clearfix'>	<div class='quesCheckbox'> <label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label> <span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer</label></div><ul><li class='clearfix'><input class='hidden' name='qt' type='text' value='1'>";
			int i = 0;
			
	//for(int i = 0; i < answerOptionValueList.size() ; i++){
			
			myContent+="<input type='hidden' name='optionid' type='text' value = '"+qc.getAnswerOptionId().get(i)+"'><input class='qt_ansOpt submt' name='a' type='text' readOnly='true' value='"+(answerOptionValueList.get(i)==null?"":answerOptionValueList.get(i))+"'></li></ul></div></div>";
			
	//	}
	myContent+="</li>";
	}
	catch(Exception e1){
		e1.printStackTrace();
	}
}
if(questionTypeId.equals("2")){
	
/* My Code */

//System.out.println("********Multiple Text Box************");
	
	//System.out.println("Question Id is: "+questionId);
	//System.out.println("QuestionText From UI is:"+questionText);
	//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
	//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
	//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
	//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
	//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
	//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*	Iterator iter = answerOptionValueList.iterator();
	while(iter.hasNext()){
		//System.out.println("AOP Value is:"+(String)iter.next());
	}
	Iterator itera = answerOptionScoreValueList.iterator();
	while(itera.hasNext()){
		//System.out.println("AOS Value is:"+(Short)itera.next());
	}*/
	
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}
	
	
	/* My Code */
	
	
	int i=0;
	
	//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
	//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}
	
	try{
	
	myContent+=	"<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='multipleTxtBox boxContainer'><div class='qt_settings clearfix'><i class='icon-mTxtBox icons'></i><span class='widgetName'>Multi text box</span><ul class='controlPanel clearfix'> <li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li> </ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answers</label></div><input class='hidden' name='qt' type='text' value='2'><ol class='qt_multiTxtBoxList widgetsEl' type='a'><li class='clearfix qt_multiTxtBox_row hidden'><input class='qt_ansOpt submt' name='a' type='text' value=''></li>";
	for(i = 0; i < answerOptionValueList.size()-1 ; i++){
			
			myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='qt_ansOpt submt' name='a' type='text' value='"+(i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"")+"' readonly='true'></li>";
			
		//	System.out.println("qc.getAnswerOptionId().get(i)====="+qc.getAnswerOptionId().get(i));
		//	System.out.println("answerOptionValueList.get(i)====="+answerOptionValueList.get(i));
			
		}
	myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='qt_ansOpt submt' name='a' type='text' value='"+(i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"")+"' readonly='true'></li></ol></div></div>";
//	System.out.println("qc.getAnswerOptionId().get(i)====="+qc.getAnswerOptionId().get(i));
//	System.out.println("answerOptionValueList.get(i)====="+answerOptionValueList.get(i));
	
	myContent+="</li>";
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
if(questionTypeId.equals("3")){
	/* My Code */

	//System.out.println("********Numeric Text Box************");
		
		//System.out.println("Question Id is: "+questionId);
		//System.out.println("QuestionText From UI is:"+questionText);
		//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
		//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
		//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
		//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
		//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
		//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*		Iterator iter = answerOptionValueList.iterator();
		while(iter.hasNext()){
			//System.out.println("AOP Value is:"+(String)iter.next());
		}
		Iterator itera = answerOptionScoreValueList.iterator();
		while(itera.hasNext()){
			//System.out.println("AOS Value is:"+(Short)itera.next());
		}*/
		
		
		
		
		/* My Code */
		
		
		//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
		//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
		if(categoryList.get(qc.getQuestionId())!=null){
			//System.out.println("Inside If Condition");
			sele = categoryList.get(qc.getQuestionId());
			//System.out.println("For First One we are checking:"+sele);
		}
		
/* 		for(int i = 0;i<answerOptionValueList.size();i++){
			//System.out.println("Something  :::::::::::"+answerOptionValueList.get(i));
		} */
		
		/* int i=0;
		try{
		myContent+= "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='textBoxNumeric boxContainer'><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+sele+"</li><li><span class='qt_each_settings icon-sort'></span></li> <li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><span class='qt_each_settings icon-delete'></span><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul> </div> <div class='clearfix'><div class='quesCheckbox'> <input name='question' type='checkbox' class='customCheckboxNewQuest'><label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden' name='qt' type='text' value='3'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' /></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><span class='qt_ansOpt'>Answer</span></div>";
		if(answerOptionValueList !=null)
			myContent+="<ul><li class='clearfix'><input class='qt_ansOpt submt' name='a' type='text' readonly='true' value='"+(answerOptionValueList.get(0)!=null?answerOptionValueList.get(0):"")+"'></li></ul>";
		myContent+="<label class='setRange'>Set range</label><div class='clearfix'></div><div class='clearfix'><span class='col1'>From</span><span class='col2'>To</span><span class='col2'>Score</span></div><ul class='qt_multiTxtBoxList widgetsEl'><li class='clearfix qt_multiTxtBox_row hidden'><input class='col1 require' name='from' type='text'><input class='col2 require' name='to' type='text'><input class='qt_score submt' name='s' maxlength=5 type='text' value='' ><button class='qt_add'><button class='qt_remove'></button></li>";
		myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1' name='from' type='text' value='"+(answerOptionValueList.get(1).substring(0,answerOptionValueList.get(1).indexOf("to"))!=null?answerOptionValueList.get(1).substring(0,answerOptionValueList.get(1).indexOf("to")):"")+"'><input class='col2' name='to' type='text' value='"+answerOptionValueList.get(1).substring(answerOptionValueList.get(1).indexOf("to")+2,answerOptionValueList.get(1).length())+"'><input class='col3' id='nb-s' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(1)==0?"":answerOptionScoreValueList.get(1))+"'><button class='qt_add'></li>";
		for(i = 2; i < answerOptionValueList.size() ; i++){
			
			myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='hidden' name='optionid' type='hidden' value = '"+qc.getAnswerOptionId().get(i)+"~"+qc.getQuestionId()+"'><input class='col1' name='from' type='text' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2' name='to' type='text' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><input class='col3' id='nb-s' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'><button class='qt_remove'></button></li>";
			//System.out.println("qc.getAnswerOptionId().get(i)===="+qc.getAnswerOptionId().get(i));
			
		}
		//myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1' name='from' type='text' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2' name='to' type='text' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><input class='col3' name='s' type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'></button></li></ul></div></div></li>";
		myContent+="</li></ul></div></div></li>";
		}
		catch(Exception e){
			e.printStackTrace();
		} */
		
		try{
			
			myContent+="<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='singleTxtFields boxContainer'><div class='qt_settings clearfix'><i class='icon-nBox icons'></i><span class='widgetName'>Numeric box</span><ul class='controlPanel clearfix'><li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div> </li> <li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'>	<div class='quesCheckbox'> <label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label> <span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer</label></div><ul><li class='clearfix'><input class='hidden' name='qt' type='text' value='1'>";
					int i = 0;
					
			//for(int i = 0; i < answerOptionValueList.size() ; i++){
					
					myContent+="</input><input type='hidden' name='optionid' type='text' value = '"+qc.getAnswerOptionId().get(i)+"'><input class='qt_ansOpt submt' name='a' type='text' readOnly='true' value='"+(answerOptionValueList.get(i)==null?"":answerOptionValueList.get(i))+"'></li></ul></div></div>";
					
			//	}
			myContent+="</li>";
			}
			catch(Exception e1){
				e1.printStackTrace();
			}
}
if(questionTypeId.equals("4")){
	/* My Code */

	//System.out.println("********Currency Box************");
		
		//System.out.println("Question Id is: "+questionId);
		//System.out.println("QuestionText From UI is:"+questionText);
		//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
		//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
		//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
		//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
		//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
		//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*		Iterator iter = answerOptionValueList.iterator();
		while(iter.hasNext()){
			//System.out.println("AOP Value is:"+(String)iter.next());
		}
		Iterator itera = answerOptionScoreValueList.iterator();
		while(itera.hasNext()){
			//System.out.println("AOS Value is:"+(Short)itera.next());
		}*/
		
		
		
		
		/* My Code */
		
		
		
		//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
		//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
		if(categoryList.get(qc.getQuestionId())!=null){
			//System.out.println("Inside If Condition");
			sele = categoryList.get(qc.getQuestionId());
			//System.out.println("For First One we are checking:"+sele);
		}
		
		String[] currencyVlues = null;
		String amount = "";
		String currency = "";

		if(answerOptionValueList !=null)
			currency=answerOptionValueList.get(0).toString().trim();
		//System.out.println("currency======"+currency);
			/* if((answerOptionValueList.get(0).toString()).contains(" ")){
		currencyVlues = (answerOptionValueList.get(0).toString()).split(" ");
		 amount=currencyVlues[0];
		 currency=currencyVlues[1];
			} */
		
		int i=0;
			try{
		myContent += "<li id='currency-box' class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='currencyBox boxContainer'><div class='qt_settings clearfix'><i class='icon-cBox icons'></i><span class='widgetName'>Currency box</span><ul class='controlPanel clearfix'><li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'></span><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li> </ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden' name='qt' type='text' value='4'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt col1'>Answer</label></div><div class='clearfix'>";
		if(answerOptionValueList !=null)
		myContent+="<div class='customSelectWrapperQuest'><select class= 'qtCatCurrency currency' name='a'><option "+(currency.equalsIgnoreCase("USD")?"selected":"")+">USD</option><option "+(currency.equalsIgnoreCase("POUND")?"selected":"")+">POUND</option> <option "+(currency.equalsIgnoreCase("RUPEE")?"selected":"")+">RUPEE</option> </select><div class='customSelectClickQuest'>"+ currency +"</div></div><input class='qt_ansOpt submt currencyInput' name='a' readonly='true' type='text' value='"+amount+"'></div><label class='setRange'>Set range</label><div class='clearfix'></div><div class='clearfix'><label class='col1'>Min. value</label><label class='col2'>Max. value</label><label class='col3 qt_score'>Score</label></div><ul class='qt_multiTxtBoxList widgetsEl'><li class='clearfix qt_multiTxtBox_row hidden'><input class='col1' name='from' type='text'><input class='col2' name='to' type='text'><input class='qt_score submt' name='s' maxlength=5 type='text' value='' ><button class='qt_add'><button class='qt_remove'></button></li>";
		/* myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1 require' name='from' type='text' value='"+answerOptionValueList.get(1).substring(0,answerOptionValueList.get(1).indexOf("to"))+"'><input class='col2 require' name='to' type='text' value='"+answerOptionValueList.get(1).substring(answerOptionValueList.get(1).indexOf("to")+2,answerOptionValueList.get(1).length())+"'><input id='cb-s' class='col3' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(1)==0?"":answerOptionScoreValueList.get(1))+"'><button class='qt_add'></li>";
		for(i = 2; i < answerOptionValueList.size() ; i++){
			
			myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='hidden' name='optionid' type='hidden' value = '"+qc.getAnswerOptionId().get(i)+"~"+qc.getQuestionId()+"'><input class='col1 require' name='from' type='text' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2 require' name='to' type='text' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><input id='cb-s' class='col3' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'><button class='qt_remove'></button></li>";
			
		} */
		//myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='col1' name='from' type='text' value='"+answerOptionValueList.get(i).substring(0,answerOptionValueList.get(i).indexOf("to"))+"'><input class='col2' name='to' type='text' value='"+answerOptionValueList.get(i).substring(answerOptionValueList.get(i).indexOf("to")+2,answerOptionValueList.get(i).length())+"'><input id='cb-s' class='col3' name='s' type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'></button></li></ul></div></div></li>";
			}
			catch(Exception e){
				e.printStackTrace();
			}
			myContent+="</li></ul></div></div></li>";
}

if(questionTypeId.equals("5")){
	/* My Code */

	//System.out.println("********Multiple Choice Radio Box************");
		
		//System.out.println("Question Id is: "+questionId);
		//System.out.println("QuestionText From UI is:"+questionText);
		//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
		//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
		//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
		//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
		//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
		//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
	/*	Iterator iter = answerOptionValueList.iterator();
		while(iter.hasNext()){
			//System.out.println("AOP Value is:"+(String)iter.next());
		}
		Iterator itera = answerOptionScoreValueList.iterator();
		while(itera.hasNext()){
			//System.out.println("AOS Value is:"+(Short)itera.next());
		}*/
		
		
		
		
		/* My Code */
		
		
		int i=0;
		
		try{
		
		//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
		//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
		if(categoryList.get(qc.getQuestionId())!=null){
			//System.out.println("Inside If Condition");
			sele = categoryList.get(qc.getQuestionId());
			//System.out.println("For First One we are checking:"+sele);
		}
		
		
		myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='mc-radio boxContainer'><div class='qt_settings clearfix'><i class='icon-radio icons'></i><span class='widgetName'>Multiple choice radio</span><ul class='controlPanel clearfix'><li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li> </ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><input class='hidden' name='qt' type='text' value='5'><label class='qt_ansOpt'>Answer Option</label><label class='qt_score'>Score</label></div><ul class='qt_field_opt qt_mc_radio qt_multi clearfix widgetsEl'><li class='clearfix hidden'><label for='radio12'></label><input id='radio12' name='multiRadio' type='radio'><input name='a' type='text' class='qt_ansOpt require'><input class='qt_score submt' name='s' maxlength=5 type='text' value='' ></li>";
		if(answerOptionValueList !=null)
			myContent+="<li class='clearfix'><label for='radio13'></label><input id='radio13' name='multiRadio' type='radio'><input name='a' type='text' class='qt_ansOpt' value='"+answerOptionValueList.get(0)+"' readonly><input type='text' id='mcr-s' class='qt_score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(0)==0?"":answerOptionScoreValueList.get(0))+"'></li>";
		myContent+="<li class='clearfix'><label for='radio13'></label><input id='radio13' name='multiRadio' type='radio'><input name='a' type='text' class='qt_ansOpt' value='"+answerOptionValueList.get(1)+"' readonly><input type='text' id='mcr-s' class='qt_score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(1)==0?"":answerOptionScoreValueList.get(1))+"'></li>";
		myContent+="<li class='clearfix'><label for='radio13'></label><input id='radio13' name='multiRadio' type='radio'><input name='a' type='text' class='qt_ansOpt' value='"+answerOptionValueList.get(2)+"' readonly><input type='text' id='mcr-s' class='qt_score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(2)==0?"":answerOptionScoreValueList.get(2))+"'></li>";
		for(i = 3; i < answerOptionValueList.size() ; i++){
			
			myContent+="<li class='clearfix'><label for='radio13'></label><input class='hidden' name='optionid' type='hidden' value = '"+qc.getAnswerOptionId().get(i)+"~"+qc.getQuestionId()+"'><input id='radio13' name='multiRadio' type='radio'><input name='a' type='text' class='qt_ansOpt' value='"+(i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"")+"' readonly><input type='text' id='mcr-s' class='qt_score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'></li>";
			
		}
		//myContent+="<li class='clearfix'><label for='radio13'></label><input id='radio13' name='multiRadio' type='radio'><input name='a' type='text' class='qt_ansOpt' value='"+answerOptionValueList.get(i)+"'><input type='text' id='mcr-s' class='qt_score' name='s' type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'></button></li><div class='clearfix'></ul></div></div></li>";
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		myContent+="</li></ul></div></div></li>";
}




if(questionTypeId.equals("6")){
	/* My Code */

	//System.out.println("********Multiple Choice DropDown Box************");
		
		//System.out.println("Question Id is: "+questionId);
		//System.out.println("QuestionText From UI is:"+questionText);
		//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
		//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
		//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
		//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
		//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
		//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*		Iterator iter = answerOptionValueList.iterator();
		while(iter.hasNext()){
			//System.out.println("AOP Value is:"+(String)iter.next());
		}
		Iterator itera = answerOptionScoreValueList.iterator();
		while(itera.hasNext()){
			//System.out.println("AOS Value is:"+(Short)itera.next());
		}*/
		
		
		
		
		/* My Code */
		
		
	int i=0;
try{
	//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
	//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}

	/*myContent += "<div class='mc-dropdown boxContainer'><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li><span class='qt_each_settings icon-delete'></span></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='multiDropdownQuest' name='qtext' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt qt_multiChoice_dd'><ul><li class='clearfix'><div class='multiChoice_dd'><div class='mc-dropdown-select multiChoice_dd_select'> Select Answer Option </div><div class='mc_dd_opt hide widgetsEl'><label class='bulk'>Answer Option</label><input type='hidden' class='submt' name='qId' value='6'><div class='clearfix hidden'><input name='ansOpt' class='bulk'><button class='qt_remove'></button></div>";*/
	myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer multiple-choice-dropdown clearfix'><div class='qt_settings clearfix'> <i class='icon-dropdown icons'></i><span class='widgetName'>Multiple choice dropdown</span><ul class='controlPanel clearfix'><div class='bulk-answer-panel dd'> Bulk answer <textarea></textarea><button class='btn btn-xs cancel' type='button'>Cancel</button><button class='btn btn-xs save-bulkanswer' type='button'>Save</button> </div> </li> <li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><span class='qt_No'></span><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden' name='qt' type='text' value='6'><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value= '"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_multiChoice_dd'> <ul> <li class='clearfix'> <div class='multiChoice_dd'> <div class='mc-dropdown-select multiChoice_dd_select'> Select Answer</div> <ul class='mc_dd_opt hide widgetsEl'><li><label class='bulk'>Answer</label><label class= 'score'>Score</label></li><li class='clearfix hidden'><input class='bulk require' name='a' type='text'><input class='score' name='s' maxlength=5 type='text'></li>";
	myContent += "<li class='clearfix'><input class='bulk' name='a' type='text' value='"+ answerOptionValueList.get(0) +"' readonly> <input class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(0)==0?"":answerOptionScoreValueList.get(0))+"'></li>";
	myContent += "<li class='clearfix'><input class='bulk' name='a' type='text' value='"+ answerOptionValueList.get(1) +"' readonly> <input class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(1)==0?"":answerOptionScoreValueList.get(1))+"'></li>";
	myContent += "<li class='clearfix'><input class='bulk' name='a' type='text' value='"+ answerOptionValueList.get(2) +"' readonly> <input class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(2)==0?"":answerOptionScoreValueList.get(2))+"'></li>";
	if(answerOptionValueList !=null)
	for(i = 3; i < answerOptionValueList.size() ; i++){
		         
		myContent += "<li class='clearfix'><input class='hidden' name='optionid' type='hidden' value = '"+qc.getAnswerOptionId().get(i)+"~"+qc.getQuestionId()+"'><input class='bulk' name='a' type='text' value='"+ (i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"") +"' readonly> <input class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'></li>";
		
	}

	//NEWLY ADDED CODE
	// myContent+="<div class='clearfix'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(i)+"'> <input class='score' name='s' type='text' value='"+ (answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i)) +"'></div>";
	//i++;
	//myContent+="<div class='clearfix'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(i)+"'> <input class='score' name='s' type='text' value='"+ (answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'></button></div>"; 
	// NEWLY ADDED CODE

	 
}
catch(Exception e){
	e.printStackTrace();
}
myContent+="<div class='clearfix'></div></div></div></div></li>";
}
//multi select checkbox
if(questionTypeId.equals("7")){
	
	/* My Code */

	//System.out.println("********Multiple Select Check Box************");
		
		//System.out.println("Question Id is: "+questionId);
		//System.out.println("QuestionText From UI is:"+questionText);
		//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
		//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
		//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
		//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
		//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
		//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
	/*	Iterator iter = answerOptionValueList.iterator();
		while(iter.hasNext()){
			//System.out.println("AOP Value is:"+(String)iter.next());
		}
		Iterator itera = answerOptionScoreValueList.iterator();
		while(itera.hasNext()){
			//System.out.println("AOS Value is:"+(Short)itera.next());
		}*/
		
		
		
		
		/* My Code */
		
		
		
		
	int i=0;
try{
	//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
	//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}

	myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='ms-chkbox boxContainer'><div class='qt_settings clearfix'><i class='icon-checkBox icons'></i><span class='widgetName'>Multiple select checkbox</span> <ul class='controlPanel clearfix'><li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li> <li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer</label><label class='qt_score'>Score</label></div><input class='hidden' name='qt' type='text' value='7'><ul class='qt_multiTxtBoxList widgetsEl'><li class='clearfix qt_multiTxtBox_row hidden'><label for='checkbox124'><input name='s1' class='qt_ms_chkbox customCheckboxNewQuest' id='checkbox124' type='checkbox'></label><input class='qt_ansOpt submt' name='a' type='text' value=''><input class='qt_score submt' name='s' maxlength=5 type='text' value='' ></li>";
	myContent+="<li class='clearfix'><label for='checkbox124'><input name='s1' class='qt_ms_chkbox customCheckboxNewQuest' id='checkbox124' type='checkbox'></label><input class='qt_ansOpt submt' name='a' type='text' value='"+answerOptionValueList.get(0)+"' readonly><input class='qt_score submt' name='s' maxlength=5 type='text' value='"+((answerOptionScoreValueList.get(0))==0?"":(answerOptionScoreValueList.get(0)))+"'></li>";
	myContent+="<li class='clearfix'><label for='checkbox124'><input name='s1' class='qt_ms_chkbox customCheckboxNewQuest' id='checkbox124' type='checkbox'></label><input class='qt_ansOpt submt' name='a' type='text' value='"+answerOptionValueList.get(1)+"' readonly><input class='qt_score submt' name='s' maxlength=5 type='text' value='"+((answerOptionScoreValueList.get(1))==0?"":(answerOptionScoreValueList.get(1)))+"'></li>";
	myContent+="<li class='clearfix'><label for='checkbox124'><input name='s1' class='qt_ms_chkbox customCheckboxNewQuest' id='checkbox124' type='checkbox'></label><input class='qt_ansOpt submt' name='a' type='text' value='"+answerOptionValueList.get(2)+"' readonly><input class='qt_score submt' name='s' maxlength=5 type='text' value='"+((answerOptionScoreValueList.get(2))==0?"":(answerOptionScoreValueList.get(2)))+"'></li>";
	for(i = 3; i < answerOptionValueList.size() ; i++){
		
		myContent+="<li class='clearfix'><label for='checkbox124'><input class='hidden' name='optionid' type='hidden' value = '"+qc.getAnswerOptionId().get(i)+"~"+qc.getQuestionId()+"'><input name='s1' class='qt_ms_chkbox customCheckboxNewQuest' id='checkbox124' type='checkbox'></label><input class='qt_ansOpt submt' name='a' type='text' value='"+(i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"")+"' readonly><input class='qt_score submt' name='s' maxlength=5 type='text' value='"+((answerOptionScoreValueList.get(i))==0?"":(answerOptionScoreValueList.get(i)))+"'></li>";
		
//		//System.out.println("qc.getAnswerOptionId().get(i)====="+qc.getAnswerOptionId().get(i));
	//	System.out.println("answerOptionValueList.get(i)====="+answerOptionValueList.get(i));
		
	}
	//myContent+="<li class='clearfix'><label for='checkbox124'><input class='qt_ms_chkbox' id='checkbox124' name='s1'  type='checkbox'></label><input class='qt_ansOpt submt' name='a' type='text' value='"+answerOptionValueList.get(i)+"'><input class='qt_score submt' name='s' type='text' value='"+((answerOptionScoreValueList.get(i))!=0?(answerOptionScoreValueList.get(i)):"")+"'><button class='qt_add'></button></li></ol></div></div>";


	
}
catch(Exception e){
	e.printStackTrace();
}
myContent+="</li></ul></div></div></li>";
}
//multi select drop down
if(questionTypeId.equals("8")){
	
	/* My Code */

	//System.out.println("********Multiple Select Drop Down  Box************");
		
		//System.out.println("Question Id is: "+questionId);
		//System.out.println("QuestionText From UI is:"+questionText);
		//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
		//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
		//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
		//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
		//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
		//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*		Iterator iter = answerOptionValueList.iterator();
		while(iter.hasNext()){
			//System.out.println("AOP Value is:"+(String)iter.next());
		}
		Iterator itera = answerOptionScoreValueList.iterator();
		while(itera.hasNext()){
			//System.out.println("AOS Value is:"+(Short)itera.next());
		}*/
		
		
		
		
		/* My Code */
		
		
		
	int i=0;
		
		try{

	//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
	//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}


	myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='ms-dropdown boxContainer multiple-select-dropdown clearfix'><div class='qt_settings clearfix'><i class='icon-dropdown icons'></i><span class='widgetName'>Multiple select dropdown</span> <input class='hidden' name='qt' type='text' value='8'><ul class='controlPanel clearfix'><li> <div class='bulk-answer-panel dd'> Bulk answer <textarea></textarea><button class='btnbtn-xs cancel' type='button'>Cancel</button><button class='btn btn-xs save-bulkanswer' type='button'>Save</button> </div> <li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_multi clearfix multiChoice_dd'><div class='mc-dropdown-select multiChoice_dd_select'> Select Answer</div><div class='mc_dd_opt hide widgetsEl'><div class='clearfix'><label class='qt_ansOpt'>Answer</label><label class='qt_score'>Score</label></div><div class='clearfix hidden'><label></label><input name='s1' type='checkbox' class='customCheckboxNewQuest'><input name='a' type='text' class='bulk'><input type='text' id='msd-s' class='score' name='s' maxlength=5 value='' /></div>";
	if(answerOptionValueList !=null)
		myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' name='mcheckbox421' id='mcheckbox421' type='checkbox'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(0)+"' readonly><input type='text' id='msd-s' class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(0)==0?"":answerOptionScoreValueList.get(0))+"'></div>";
		myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' name='mcheckbox421' id='mcheckbox421' type='checkbox'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(1)+"' readonly><input type='text' id='msd-s' class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(1)==0?"":answerOptionScoreValueList.get(1))+"'></div>";
		myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' name='mcheckbox421' id='mcheckbox421' type='checkbox'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(2)+"' readonly><input type='text' id='msd-s' class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(2)==0?"":answerOptionScoreValueList.get(2))+"'></div>";
		for(i = 3; i < answerOptionValueList.size() ; i++){
		
		myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='hidden' name='optionid' type='hidden' value = '"+qc.getAnswerOptionId().get(i)+"~"+qc.getQuestionId()+"'><input class='checkbox' name='s1' id='mcheckbox421' type='checkbox' readonly='true'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(i)+"' readonly><input type='text' id='msd-s' class='score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'></div>";
		
	}
	//myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' id='mcheckbox421' name='s1' type='checkbox'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(i)+"'><input type='text' id='msd-s' class='score' name='s' type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'></div>";
			//i++;
			//myContent+="<div class='clearfix'><label for='mcheckbox421'></label><input class='checkbox' name='s1' id='mcheckbox421' type='checkbox'><input name='a' type='text' class='bulk' value='"+answerOptionValueList.get(i)+"'><input type='text' id='msd-s' class='score' name='s' type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'><button class='qt_add'><button class='qt_remove'></div><div class='clearfix'></div></div></div></div></li>";
	myContent+="<div class='clearfix'></div></div></div></div></li>";
		}
		catch(Exception e){
			e.printStackTrace();
		}
}

//boolean Radio

if(questionTypeId.equals("9")){
	
/* My Code */

//System.out.println("********Boolean Radio Box************");
	
	//System.out.println("Question Id is: "+questionId);
	//System.out.println("QuestionText From UI is:"+questionText);
	//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
	//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
	//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
	//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
	//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
	//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*	Iterator iter = answerOptionValueList.iterator();
	while(iter.hasNext()){
		//System.out.println("AOP Value is:"+(String)iter.next());
	}
	Iterator itera = answerOptionScoreValueList.iterator();
	while(itera.hasNext()){
		//System.out.println("AOS Value is:"+(Short)itera.next());
	}*/
	
	
	
	
	/* My Code */
	
	
int i=0;
try{
//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
if(categoryList.get(qc.getQuestionId())!=null){
	//System.out.println("Inside If Condition");
	sele = categoryList.get(qc.getQuestionId());
	//System.out.println("For First One we are checking:"+sele);
}


myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer'><div class='qt_settings clearfix'><i class='icon-radio icons'></i><span class='widgetName'>Boolean radio</span> <ul class='controlPanel clearfix'><li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <div class='checkWrapQuest'><div class='checkWrapClickQuest'></div></div><label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_boolean_Radio clearfix'><div class='clearfix'><label class='qt_ansOpt'>Answer</label><label class='qt_score'>Score</label></div><input class='hidden' name='qt' type='text' value='9'><ul>";
if(answerOptionValueList !=null)
for(i = 0; i < answerOptionValueList.size() ; i++){
	
	myContent+="<li class='clearfix'><input type='radio'><input name='a' type='text' class='qt_ansOpt' type='text' value='"+(i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"")+"' readonly><input type='text' id='br-first-s' class='qt_score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'></li>";
	
}
myContent+="</ul></div></div></li>";
}
catch(Exception e){
	e.printStackTrace();
}

}

//boolean checkbox

if(questionTypeId.equals("10")){
	
/* My Code */

//System.out.println("********Boolean Check Box************");
	
	//System.out.println("Question Id is: "+questionId);
	//System.out.println("QuestionText From UI is:"+questionText);
	//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
	//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
	//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
	//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
	//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
	//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*	Iterator iter = answerOptionValueList.iterator();
	while(iter.hasNext()){
		//System.out.println("AOP Value is:"+(String)iter.next());
	}
	Iterator itera = answerOptionScoreValueList.iterator();
	while(itera.hasNext()){
		//System.out.println("AOS Value is:"+(Short)itera.next());
	}*/
	
	
	
	
	/* My Code */
	
	
	
int i=0;
try{
//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
if(categoryList.get(qc.getQuestionId())!=null){
	//System.out.println("Inside If Condition");
	sele = categoryList.get(qc.getQuestionId());
	//System.out.println("For First One we are checking:"+sele);
}


myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer'><div class='qt_settings clearfix'><i class='icon-checkBox icons'></i><span class='widgetName'>Boolean checkbox</span> <ul class='controlPanel clearfix'><li> <div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <div class='checkWrapQuest'><div class='checkWrapClickQuest'></div></div><label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='hidden' name='qt' type='text' value='10'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/></div><div class='qt_field_opt qt_boolean_chkbox'><div class='clearfix'><label class='qt_ansOpt'>Answer</label><label class='qt_score'>Score</label></div><ul>";
if(answerOptionValueList !=null)
for(i = 0; i < answerOptionValueList.size() ; i++){
	
	myContent+="<li class='clearfix'><div class='checkWrapQuest1'><input name='qstion' type='checkbox' class='customCheckboxNewQuest'><div class='checkWrapClickQuest'></div></div><input class='qt_ansOpt' name='a' type='text' value='"+(i<=answerOptionValueList.size()-1?answerOptionValueList.get(i):"")+"' readonly><input type='text' id='bc-s' class='qt_score' name='s' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(i)==0?"":answerOptionScoreValueList.get(i))+"'></li>";
	
}
myContent+="</ul></div></div></li>";
}
catch(Exception e){
	e.printStackTrace();
}

}

//date select

if(questionTypeId.equals("11")){
	
/* My Code */

//System.out.println("********Date Selection Box************");
	
	
	//System.out.println("Question Id is: "+questionId);
	//System.out.println("QuestionText From UI is:"+questionText);
	//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
	//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
	//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
	//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
	//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
	//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*	Iterator iter = answerOptionValueList.iterator();
	while(iter.hasNext()){
		//System.out.println("AOP Value is:"+(String)iter.next());
	}
	Iterator itera = answerOptionScoreValueList.iterator();
	while(itera.hasNext()){
		//System.out.println("AOS Value is:"+(Short)itera.next());
	}*/
	
	/*newly added */
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}
	
	
	
	/* My Code */
	
	try{
	

String[] date = null;
	String day = "";
	String mon = "";
	String year = "";

if(answerOptionValueList.size() !=0){
date = (answerOptionValueList.get(0).toString()).split("-");
//System.out.println("Array Size of date:"+date.length);
day=date[0];
//System.out.println("day value is:"+day);
mon=date[1];
year=date[2];
}
	
//out.println(day.equalsIgnoreCase("5")?"select":"");

myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='dateSelection boxContainer'> <div class='qt_settings clearfix'><i class='icon-dateSelection icons'></i><span class='widgetName'>Date selection box</span> <ul class='controlPanel clearfix'><li><div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div> <label class='qt_editBox' for='qt_editBox' title=''></label> </input> <span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'/> </div> <div class='qt_field_opt clearfix'> <div class='clearfix'><input class='hidden' name='qt' type='text' value='11'><label class='qt_ansOpt'>Answer</label> <label class='qt_score'>Score</label></div> <ul> <li class='clearfix'><span class='dateSel'>";

myContent+="<div class='customSelectWrapperQuest disabledDates'> <select> <option> dd </option> </select> <div class='customSelectClickQuest disabledDates'>dd</div></div>";

myContent+="<div class='customSelectWrapperQuest disabledDates'> <select> <option> mm </option> </select> <div class='customSelectClickQuest disabledDates'>mm</div></div>";

myContent+="<div class='customSelectWrapperQuest disabledDates'> <select> <option> yyyy </option> </select> <div class='customSelectClickQuest disabledDates'>yyyy</div></div>    </span>    <input name='s' class='qt_score' maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(0)==0?"":answerOptionScoreValueList.get(0))+"'>  </li>     </ul> </div></div></li>";
	}
	catch(Exception e){
		e.printStackTrace();
	}
}

if(questionTypeId.equals("12")){
	
/* My Code */

//System.out.println("********Date Picker************");
	
	//System.out.println("Question Id is: "+questionId);
	//System.out.println("QuestionText From UI is:"+questionText);
	//System.out.println("AnswerOptionIdList Size from UI is:"+answerOptionIdList.size());
	//System.out.println("AnswerOptionValueList Size from UI is:"+answerOptionValueList.size());
	//System.out.println("Answer Option Score List Size is:"+answerOptionScoreValueList.size());
	//System.out.println("Mandatory of this Question is:"+qc.getQuestionMandatory());
	//System.out.println("Attachment of this Question is:"+qc.getQuestionAttachment());
	//System.out.println("Tag Name of this Question is:"+qc.getQuestionTag());
/*	Iterator iter = answerOptionValueList.iterator();
	while(iter.hasNext()){
		//System.out.println("AOP Value is:"+(String)iter.next());
	}
	Iterator itera = answerOptionScoreValueList.iterator();
	while(itera.hasNext()){
		//System.out.println("AOS Value is:"+(Short)itera.next());
	}*/
	
	
	
	
	/* My Code */
	
	try{
	
	//System.out.println("Question Id.. in If condition"+qc.getQuestionId());
	//System.out.println("Select Tag Kept in Map is:"+categoryList.get(qc.getQuestionId()));
	if(categoryList.get(qc.getQuestionId())!=null){
		//System.out.println("Inside If Condition");
		sele = categoryList.get(qc.getQuestionId());
		//System.out.println("For First One we are checking:"+sele);
	}
	
	
	String date = null;
	
	if(answerOptionValueList !=null){
		date=(answerOptionValueList.get(0).toString());
		//System.out.println("Hero");
		
	}
	
	//System.out.println("Date Value is:"+date);
	
	
	myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer dateSelector'><div class='qt_settings clearfix'><i class='icon-datePicker icons'></i><span class='widgetName'>Date picker</span>  <ul class='controlPanel clearfix'><li><div class='settings-panel dd'><table><tr><td><span class=redTxt>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input "+(((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true")?"checked":"unchecked")+" name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= '"+(qc.getQuestionTag()==null?"":qc.getQuestionTag())+"'></td> </tr> </table><button class='btn btn-xs cancel' type='button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button></div></li><li>"+qidText+"<input type='hidden' class='quesid' value = '"+qc.getQuestionId()+"'><input type='hidden' class='qrid' name='qrid' type='text' value = '"+qc.getQuestionnaireId()+"'></li></ul></div><div class='clearfix'><div class='quesCheckbox'> <label for='question'></label> </div><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden' name='qt' type='text' value='12'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"+ st +"51'><input class='q require' name='q' type='text' value='"+questionText+"' readonly style='border: none'></div><div class='qt_field_opt clearfix qt_dp'> <div class='clearfix'> <span class='qt_ansOpt'>Answer</span><span class= 'qt_score qtscore'>Score</span> </div> <ul> <li class='clearfix'><input class='datepicker' placeholder='dd/mm/yyyy' type='text' name='a' value='"+answerOptionValueList.get(0)+"'><input class='qt_score submt'  name='s'  maxlength=5 type='text' value='"+(answerOptionScoreValueList.get(0)==0?"":answerOptionScoreValueList.get(0))+"'></li> </ul></div></div></li>";
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
}


//System.out.println("html content "+myContent);

sele = "";
}//outer for loop

//if(st == 11) {
	if(secName.equals(sectionName) || (null == sectionName && st == 10)){
    divContent += "<div class='tab_content questionContainer current' id='sectionTitle"+st+"' style='display: block;''><ul class='questionn sortable'>"+myContent+"</ul></div>";
	} else {
		 divContent += "<div class='tab_content questionContainer' id='sectionTitle"+st+"' style='display: none;''><ul class='questionn sortable'>"+myContent+"</ul></div>";
		
	}
	//System.out.println("Divistion Based Inner Content is:"+divContent); 
	
	st++;

} // outer while loop related to Iterator


//System.out.println("Section Name Based Li Content is:"+ sectionNameBasedLiContent);

//System.out.println("Divistion Based Outer Content is:"+divContent);

%>


 <!-- <label class='switch-light switch-slider'><input checked name='mCheck' type='checkbox' value='"+(qc.getQuestionMandatory()==true?"Yes":"No")+"' /><span><span>No</span><span>Yes</span></span><a></a></label> -->

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
  <!-- leftpanelinner --> 
</div>
<!-- leftpanel --> --%>

<div class="mainpanel">



<jsp:include page="header.jsp"></jsp:include>
			
		<!-- headerbar -->
		
		
		
		
		
<%-- <h2 class="text-center"> <strong>${msg}!</strong></h2> --%>
   <%
   String value = "";
   /* if(!((java.lang.String)session.getAttribute("msg")).equals("")) */
  if(null !=  session.getAttribute("msg")){
 
   value = (java.lang.String)session.getAttribute("msg");
   %>
    <div class="status-warn"><%=value %></div>
   <%
  session.removeAttribute("msg");
  }
  else{
	  value = "";
  }	   
   %>  
   <%! Long questId; %>
   
   <%! String questName; %>
   
   <%! String questDescription; %>
   
   <%
   if(request.getAttribute("QRId")!=null && request.getAttribute("QRName")!=null && request.getAttribute("QRDesc")!=null){
	   questId = (Long)request.getAttribute("QRId");
	   questName = (String)request.getAttribute("QRName");
	   questDescription = (String)request.getAttribute("QRDesc");
	   }else if(sectionMap.size() > 0){
	   questId = questionnaireId;
	   questName = questionnaireName;
	   questDescription = questionnaireDescription;
   }
   
   %>
   
<div class="container qstContainer">
 <div class="containerPanel clearfix">
 <div class="questHeader clearfix">
 
  <h2 class="col-md-3"><span class="qrName"><%=questName %></span><!-- <a class="questTitleEdit" href="#"></a> --></h2>
  <div class="col-md-9 questBtnGlobal clearfix">
 <!-- <div class="fl"><span class="customInput customCheckBox selectall"><input type="checkbox" id="selectAll" style="display: none"><label for="selectAll">Select All</label></span></div><div class="fr"><button class="btn btn-xs" type="button">Scoring</button><form action="./getbranchedquestions?id=1"><button class="btn btn-xs" type="submit">Branching</button></form></div> -->
  <div class="fr"><!-- <button class="btn btn-xs addBank save1" type="button" disabled="disabled">Add to bank</button><button class="btn btn-xs insertBank save1" type="button">Insert from Bank</button> --><button class="btn btn-xs something" type="button">Branch Preview</button></div>
  <div class="hidden quesId"><%=questId%></div>
 
  </div>
  
  </div>
 <div class="setupQuestContainer clearfix">

<!-- 
 <form name="submit-questionnaire" id="submit-questionnaire" action="./setupquestionnaire" method="POST">
  <div class="questContainer col-md-8">
  <div class="status-warn">All fields are Mandatory</div> 
     <div class="questContainerTabs">
        <ul class="quest-tabs">
            <li class="active tab blueprintTab hidden" >
                <input class="sectionInput"  placeholder="untitled"/>
            </li>  	
            <li class="active tab" data-link='dTab1'>
                <input id="sectionTitle122" class="sectionInput"  placeholder="untitled"/>
            </li>
             <li class="addSection"><span class="icon-plus"><i class="fa fa-plus"></i></span>new Section</li>
       </ul>
 	 </div>     
    <div class="tab_content questionContainer current" id="dTab1" style="display: block;">
       <ul class="questionn sortable">      
    <%--    <% out.println(myContent); %>    --%>
       </ul>
      </div>
</div>
<input type="hidden" name="qrid" value = "<%-- <%=questionnaireId%> --%>"/>
<div class="btn-block"><!-- <button class="btn closer delete">Delete Questionnaire</button> --><!-- <button class="btn fr save">Save</button><button class="btn fr preview">Preview</button></div>
</form> -->

<form name="submitquestionnaire" id="submit-questionnaire" method="POST">
  <div class="questContainer">
  <div class="errorMsg status-warn"  style="display:none">Please fill the fields highlighted in red.</div>
  <div class="duplicate status-warn" style="display:none">Duplicate Names, Please give different name.</div>
  <div class="duplicateQst status-warn" style="display:none">Question already exists.</div>
  <!-- Dynamic Tabs -->
   <c:choose>
		<c:when  test="${empty businessCase}">
     <div class="questContainerTabs">
        <ul class="quest-tabs">
            <li class="active tab blueprintTab hidden" >
                <input class="sectionInput" />
                <span class="deleteQst"></span>
            </li> 
            
            <!-- <li class="active tab" data-link='sectionTitle10'>
                <input name="sectionTitle1051" id="sectionTitle1051" class="sectionInput"  placeholder="untitled"/>
                <span class="deleteQst">+</span>
            </li>  -->
            
            <!-- HERE IAM ADDING CODE RELATED TO MAINTAIN SECTIONS -->
            
            <% out.println(sectionNameBasedLiContent);%>
            
            <!-- HERE IAM ADDING CODE RELATED TO MAINTAIN SECTIONS -->
            
            
             <!-- <li class="addSection"><span class="icon-plus">+</span>new Section</li> -->
       </ul>
 	 </div>  
 	  	  	 </c:when>
</c:choose>
<c:choose>
		<c:when  test="${!empty businessCaseTemplate}">
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
<!--      <div class="tab_content hidden blueprint questionContainer" >
     <ul class="questionn sortable">       
     </ul>
     	<div class="dragItemLabel">Drag and drop questions form left</div>
    </div>  --> 
    <div class="tab_content hidden blueprint questionContainer" >
     <ul class="questionn sortable">       
     </ul>
     	<div class="dragItemLabel">Drag and drop questions form left</div>
    </div>
     <!-- OUTPUT SHOULD BE DISPLAYED HERE -->
	  <% out.println(businessContent); %>
      <% out.println(divContent); %>  
       <!-- OUTPUT SHOULD BE DISPLAYED HERE -->
</div>
<input type="hidden" name="qrid" value = "<%=questId%>"/>
<input type="hidden" name="qrbank" value = "No"/>
<input type="hidden" name="insertBank" value="">
<input type="hidden" name="sectionName" value="">
<input type="hidden" name="tmpName" class="tmpName" value = "No"/>
</form>


<div class="btn-block">
<!-- <div class="fl paddingleft"><button class="btn saveAsTemplate" disabled="">Save as template</button></div> -->

<div class="btns-fr"><form class="deleteFunction" method="post" action="./deletequestionnaire"><input type="hidden" class="quesId" name="questionnaireId" value="<%=questId%>" /><button class="btn closer delete" onclick="javascript:history.back()">Close</button> </form><!-- <span class="pipeline"></span> --><!-- <button class="btn fr save1">Save</button> --></div>



</div>
</div>
</div></div>


 <jsp:include page="footer.jsp"></jsp:include>
		<!-- contentpanel -->
		
		
		
		
</div>

<!-- mainpanel -->
<!-- DELETE QUESTION RELATED DIV  -->
<div class="deleteQuestion questPopup">        
    <ul>
      <li style="text-align:center">Are you sure you want to delete this <span class="qstText">question</span>?</li>
     <li> <input type="hidden" class="querId" name="questionnaireId" value="<%=questId%>" /></li>
     <li>
     <button type="button" class="btn btn-xs noBtn" name="no">Cancel</button>
     <button type="button" class="btn btn-xs yesBtn closePopup" name="yes">Ok</button>
     </li>
    </ul>    
</div>
<!-- DELETE QUESTION RELATED DIV  -->
<div class="popupBg"></div>



<div class="editQuestName questPopup">       
     <div class="questErrMsg">${displayName} cannot be empty</div>
     <div class="red">${message}</div>
     <div id="boolResult" class="red"></div>
     
    <ul>
      <li>${displayName}<span class="red"> *</span></li>
      <li><input class="quesName" name="questionnairename" maxlength="44" value=<%=questName %> /><input type="hidden" class="quesId" name="questionnaireId" value="<%=questId%>" /></li>
       <li>${displayDesc}</li>
      <li><textarea class="quesDesc" name="description" maxlength="255"><%=questDescription%></textarea><input type="hidden" class="quesDescription" name="questionnaireDescription" value="<%=questDescription%>" /></li>     
 <li><input class="hidden leftTagName" name="leftTagName" value="0" /></li>  
      <li class="cancelSubmitBtn"><button type="button" class="btn btn-xs closePopup cancel" >Cancel</button>
     <button type="submit" class="btn btn-xs fr qstSubmitEdit" >Submit</button></li>
     
    </ul>    
</div>
<div class="tooltop"></div>

<form name="branch">
<input type="hidden" name="brId">
<input class="hidden" name="dataCollection" value="true" />
<input class="hidden" name="qrName" value=<%=questName %> />
</form>
 <div class="popupBgDelete"></div>
<div class="save-template-popup questPopup">  
	 <!-- <i class="closeBtn"></i>   -->     
    <ul>
       <li class="saveTmpError">Template Name cannot be empty</li>
      <li>Enter template name</li>
      <li><input class="template-name" name="tempName" ></li>
      <li class="cancelSubmitBtn">
        <button class="btn btn-xs cancel closePopup" name="cancelQ">Cancel</button>
        <button class="btn btn-xs fr saveTemplate save1" name="submitQ">Submit</button>
        
      </li>
    </ul>  
</div>

 <div class="removePopup questPopup">
	 <!-- <i class="closeBtn"></i>     -->   
    <ul>
      <li class="toRemove">Are you sure you want to delete option?</li>
      <li><button type="button" class="btn btn-xs yesBtn remove" name="cancelQ">Yes</button>
     <button type="button" class="btn btn-xs closePopup noBtn fr" name="submitQ">No</button></li>
    </ul>    
</div>

<div class="tooltipQst"></div>

<script src="js/jquery-1.10.2.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
<script src="js/bootstrap-switch.min.js"></script> 
<script src="js/jquery.uniform.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>


<script>

var global=0;
var insert=0;

//NEW JQUERY METHOD FOR DELETE QUESTIONNAIRE

jQuery(document).on('keyup','.qt_score',function(){

	console.log("clicked...");

	var UpNum = /(?=.*[0-9])/;
	var inputVal = $(this).val();

	if(inputVal.match(UpNum)){
	console.log("number");
	}

	else{
		console.log("alphabet");
		$(this).val('');
		}


	});

jQuery('.mainpanel').on('click', '.delete',function() {
    var id = jQuery(this).siblings('.quesId').val();
    console.log(id);
  //  $.post('./deletequestionnaire', {'questionnaireId': id}); 
    $('.deleteFunction').submit();
    //window.open('/partnerintegrity/deletequestionnaire?id='+id,'_self');
  });

//NEW JQUERY METHOD FOR DELETE QUESTIONNAIRE

/* jQuery('.insertBank').on('click',function() {
	  // //alert("In Something Method");
	//   global =1;
	var sectionName = $('.questContainerTabs').find('.active input').val();
	document.submitquestionnaire.sectionName.value = sectionName;
	  document.submitquestionnaire.insertBank.value="insert"; 
	  return true;
	  
 	 }); */

jQuery('.addBank').on('click',function() {
	document.submitquestionnaire.qrbank.value = "Yes";
 });
jQuery('.qstSubmit').on('click', function(){
	   if(jQuery('.quesName').val() == '') {

         jQuery('.questErrMsg').show();
	    }
	   else {
		   document.questionnaire.action = "${pageContext.request.contextPath}/createquestionnaire";
		 	document.questionnaire.submit();
		 	
		   //jQuery('#submit-questionnaire').submit();
          return true;
		   }
    
	});

//Dynamic Question number ordering
$(window).load(function(){
var $lis = jQuery('.questionn').find('li.canvas-element');
////alert($lis.html());
//assigning question numbers
	setInterval(function(){
		$lis.each(function() {
		var $li = jQuery(this);
		var newVal = jQuery(this).index();
		jQuery(this).find('.qt_No').html(newVal+1+' )');	
		var newVal = parseInt(newVal) +1;				
					
		});	
	},10);//setTimeout
});



jQuery('.closeBtn, .closePopup').click(function(){
	jQuery('.questPopup, .save-template-popup').hide();
	jQuery('.popupBg, .popupBgDelete').hide();
});

/* $('.questTitleEdit').click(function(){
    $('.editQuestName').show();
    $('.popupBgDelete').show();
}); */

//THIS IS THE CODE ADDED BY SATYA




jQuery('.something').on('click',function() {
   // var id = jQuery(this).attr('data-attr');
    ////alert("coming");
   // var newLabel = jQuery('.newLabel').val();
   
    //  //alert(s);
    ////alert("if id "+jQuery('#editTemplate'))
    var id= jQuery(this).parents('div').find('.quesId').text();
    //qid=id.substr(0, id.indexOf("$"));
   // //alert("question id "+id);
     // window.open('/partnerintegrity/getedQuestions?id='+id,'_self');

    document.branch.brId.value=id;
 //   //alert("ID Value is:"+brId);
    document.branch.method="post";
    document.branch.action = "/partnerintegrity/branchpreview";
    document.branch.submit(); 
 });


//THIS IS THE CODE ADDED BY SATYA

jQuery(document).ready(function () {
	
/*jQuery(".datepicker").datepicker({
	showOn: "button",
	changeMonth: true,
	changeYear: true
});*/
	jQuery('#single-text-box').draggable({helper: 'clone', cursor: 'move',live:true,  start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#multiple-text-box').draggable({helper: 'clone', cursor: 'move',  start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#numeric-box').draggable({helper: 'clone', cursor: 'move',  start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#currency-box').draggable({helper: 'clone', cursor: 'move',  start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#multiple-choice-radio').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#multiple-choice-dropdown').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#multiple-select-checkbox').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#multiple-select-dropdown').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#boolean-radio').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#boolean-checkbox').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#dt-select').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});
	jQuery('#dt-picker').draggable({helper: 'clone', cursor: 'move', start: function(){jQuery(this).addClass('qstType') }, stop: function(){jQuery(this).removeClass('qstType') }});

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
		            var el = $(this).closest('.questionContainer').attr('id');
		            var parts = $(htmlpart).find('.hq').attr('value', el+'51').end().find('.hq').attr('name', 'section'+ (m++)).end();
					$canvasElement = jQuery($canvasElement).html(parts);
					$('#submit-questionnaire').find('.current .questionn').append($canvasElement);
					$('.dragItemLabel').hide();
					$canvasElement.css({
						position: 'relative'
					});	
					$('body').animate({scrollTop: $('.questionContainer.current .questionn').height()}, 1000);
		        }
				var $lis = jQuery(this).find('li.canvas-element');
				//assigning question numbers
					setTimeout(function(){
						$lis.each(function() {
						var $li = jQuery(this);
						var newVal = jQuery(this).index();
						jQuery(this).find('.qt_No').html(newVal+1+' )');	
						var newVal = parseInt(newVal) +1;				
									
						});	
					},10);//setTimeout	


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
		  //Allow only numeric values
		       jQuery('.questionContainer').on('keypress focus','input.col1, input.col2', function (e){
		                   var key = window.e ? e.keyCode : e.which;
		                   if (e.keyCode == 8 ||e.keyCode == 0) {
		                                   return true;
		                   }
		                   else if ( key < 48 || key > 57 ) {        
		                       return false;
		                   }
		                   else return true;
		                });  
		        	

		    jQuery(".datepicker").datepicker({
		        dateFormat: "dd/mm/yy",
		        defaultDate: date,
				showOn: "button",
				changeMonth: true,
				changeYear: true,
		        onSelect: function () {
		            selectedDate = jQuery.datepicker.formatDate("dd/mm/yy", jQuery(this).datepicker('getDate'));
					jQuery(".datepicker").val(selectedDate);
		        }
		    });

		   // jQuery(".datepicker").datepicker("setDate", date);

			//jQuery('input[type="checkbox"], input[type="radio"]').uniform();
			 
			jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-icon">');

			
		  	//Dropdown hiding
			jQuery('.cancel, button.save, .save-bulkanswer').on('click', function(){
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
		 }
		//Drop function ends	  
		});
		  //Sorting questions panel
		   	jQuery('.sortable').sortable({
				connectWith: ".qt_settings",
				handle: ".icon-sort"
			});
		  }
          
		  dropMe();

		 
		//Dynamic Tab	
			(function(){
				 var uid = ($('.questContainerTabs').find('.tab').length - 1) + 10;
				jQuery('.addSection').on('click', function(){
				   if($('.tab').length <= 15 ) {
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
			       dropMe();
				   //console.log(jQuery(this).attr());
				   //console.log(this);
			    });
			 })();
		  
	
function idPicker(id){
//console.log(jQuery(id[0]).attr("id"));
var draggableId;
	switch(jQuery(id[0]).attr("id")){
	
case "single-text-box" : return draggableId = "<div class='qt_settings clearfix'><i class='icon-sTxtBox icons'></i><span class='widgetName'>Single Text Box</span> <ul class='controlPanel clearfix'> <li>${categoryValues}</li> <li><span class='qt_each_settings icon-sort'></span></li> <li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input name='aCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= ''></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div> </li> <li><span class='qt_each_settings icon-delete'></span></li> </ul></div><div class='clearfix ques'> <div class='quesCheckbox'> <input name='question' type='checkbox' class='customCheckboxNewQuest'><label for='question'></label> </div><span class='qt_No'></span><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden' name='qt' type='text' value= '1'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix'> <div class='clearfix'> <span class='qt_ansOpt'>Answer</span> </div> <ul> <li class='clearfix'><input class='qt_ansOpt' name='a' type= 'text' readOnly='true'></li> </ul></div>"; break;		
	
case "multiple-text-box" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-mTxtBox icons"></i><span class="widgetName">Multi text box</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "2"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answers</span></div> <ol class="qt_multiTxtBoxList widgetsEl" type="a">  <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"></li> </ol></div>';
break; 

	/* case "multiple-text-box" : return draggableId = '<div class="qt_settings clearfix"> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" checked /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "2"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answer option</span><span class= "qt_score">Score</span> </div> <ol class="qt_multiTxtBoxList widgetsEl" type="a"> <li class="clearfix qt_multiTxtBox_row hidden"><input class="qt_ansOpt" name="a" type="text" readOnly="true"><input class="qt_score" name="s" type= "text" readOnly="true"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"><input class="qt_score" name="s" type="text" readOnly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"><input class="qt_score" name="s" type="text" readOnly="true"></li> <li class="clearfix qt_multiTxtBox_row"><input class="qt_ansOpt" name= "a" type="text" readOnly="true"><input class="qt_score" name="s" type= "text" readOnly="true"><button class="qt_add"></button></li> </ol></div>';
	break; */
	
	case "numeric-box" : return draggableId = '<div class="qt_settings clearfix"> <i class="icon-nBox icons"></i><span class="widgetName">Numeric box</span><ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "3"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_ansOpt clearfix" style="padding:10px 10px 0 45px"> Answer</div><div class="clearfix" style="padding:10px 10px 0 45px"> <input class="qt_ansOpt" name="a" type="text" readonly="true"></div><div class="qt_field_opt qt_multi clearfix"> <label class="setRange">Set range</label> <div class="clearfix"></div> <div class="clearfix"> <span class="col1">From</span><span class="col2">To</span><span class= "col3 qt_score">Score</span> </div> <ul class="qt_multiTxtBoxList widgetsEl"> <li class="clearfix qt_multiTxtBox_row hidden"><input class= "col1" name="from" type="text"><input class="col2" name="to" type="text"><input class="col3 qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="col1" name="from" type="text"><input class="col2" name="to" type= "text"><input class="col3 qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button></li> </ul></div>';
	break;
	
	case "currency-box" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-cBox icons"></i><span class="widgetName">Currency box</span>  <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input class="tag" type="text" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "4"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix"> <div class="clearfix"> <span class="qt_ansOpt"></span><span class="qt_ansOpt pleft col1">Answer</span> </div> <div class="clearfix"> <select class= "qtCatCurrency currency" name="a"> <option value="USD">USD</option> <option value="POUND">POUND</option> <option value="RUPEE">RUPEE</option> </select><input class="qt_ansOpt mleft currencyInput" name="a" type="text" readonly="true"> </div><label class="setRange">Set range</label> <div class="clearfix"></div> <div class="clearfix"> <span class="col1">Min. value</span><span class="col2">Max. value</span><span class="col3 qt_score">Score</span> </div> <ul class="qt_multiTxtBoxList widgetsEl"> <li class="clearfix qt_multiTxtBox_row hidden"><input class= "col1" name="from" type="text"><input class="col2" name="to" type="text"><input class="col3 qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix qt_multiTxtBox_row"><input class="col1" name="from" type="text"><input class="col2" name="to" type= "text"><input class="col3 qt_score" name="s" maxlength=5 type="text"></li> </ul></div>';
	break;
	
	case "multiple-choice-radio" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-radio icons"></i><span class="widgetName">Multiple choice radio</span><ul class="controlPanel clearfix"><li>${categoryValues}</li><li><span class="qt_each_settings icon-sort"></span></li><li><span class="qt_each_settings icon-settings"></span><div class="settings-panel dd"><table><tr><td><span class="redTxt">*</span> Mandatory</td><td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox"><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr><td>Allow Attachment</td><td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr><td>Tag</td><td><input class="tag" name="tag" type="text" value=""></td></tr></table><button class="btn btn-xs cancel" type="button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button></div></li><li><span class="qt_each_settings icon-delete"></span></li></ul></div><div class="clearfix"><div class="quesCheckbox"><input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label></div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value="5"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><ul class="qt_field_opt qt_mc_radio qt_multi clearfix widgetsEl nolist"><li class="clearfix"><span class="qt_ansOpt">Answer Option</span><span class="qt_score">Score</span></li><li class="clearfix hidden"><input name="multiRadio" type="radio"><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"><button class="qt_add"></button><button class="qt_remove"></button></li><li class="clearfix"><input name="multiRadio" type="radio"><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li><li class="clearfix"><input name="multiRadio" type="radio"><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li><li class="clearfix"><input name="multiRadio" type="radio"><label for="radio17"></label><input class="qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"><button class="qt_add"></button></li></ul><div class="clearfix"></div>'; break;
	
	case "multiple-choice-dropdown" :return draggableId = '<div class="ms-dropdown boxContainer multiple-choice-dropdown clearfix"><div class="qt_settings clearfix"><i class="icon-dropdown icons"></i><span class="widgetName">Multiple choice dropdown</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li> <button class="btn btn-xs bulk-answer" type="button">Bulk Answer</button> <div class="bulk-answer-panel dd"> Bulk answer <textarea></textarea><button class="btn btn-xs cancel" type="button">Cancel</button><button class="btn btn-xs save-bulkanswer" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox"><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "6"><input class="hidden hq" name="section1" value=""><input class="multiDropdownQuest q require" name="q" type="text"></div><div class="qt_field_opt qt_multiChoice_dd"> <ul> <li class="clearfix"> <div class="multiChoice_dd"> <div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div> <ul class="mc_dd_opt hide widgetsEl"> <li><label class="bulk">Answer Option</label><label class= "score">Score</label></li> <li class="clearfix hidden"><input class="bulk require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button><button class= "qt_remove"></button></li> <li class="clearfix"><input class="bulk require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><input class="bulk require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><input class="bulk require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button></li> </ul> </div> </li> </ul></div></div>'; break;
	
	case "multiple-select-checkbox" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-checkBox icons"></i><span class="widgetName">Multiple select checkbox</span>  <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "7"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><ul class="qt_field_opt qt_multi clearfix widgetsEl nolist"> <li class="clearfix"><span class="qt_ansOpt">Answer Option</span><span class="qt_score">Score</span></li> <li class="clearfix hidden"><label for="checkbox123"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" name="checkbox123" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button><button class="qt_remove"></button></li> <li class="clearfix"><label for="checkbox124"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" name="s1" id="checkbox124" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="checkbox125"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" name="s1" id="checkbox125" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="checkbox126"></label><input class= "qt_ms_chkbox customCheckboxNewQuest" name="s1" id="checkbox126" type= "checkbox"><label></label><input class="qt_ansOpt require" name="a" type= "text"><input class="qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button></li> <li style="list-style: none; display: inline"> <div class="clearfix"></div> </li></ul>'; break;
	
	case "multiple-select-dropdown" : return draggableId = '<div class="ms-dropdown boxContainer multiple-select-dropdown clearfix"><div class="qt_settings clearfix"><i class="icon-dropdown icons"></i><span class="widgetName">Multiple select dropdown</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li> <button class="btn btn-xs bulk-answer" type="button">Bulk Answer</button> <div class="bulk-answer-panel dd"> Bulk answer <textarea></textarea><button class="btn btn-xs cancel" type="button">Cancel</button><button class="btn btn-xs save-bulkanswer" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox"><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <input name="question" type="checkbox" class="customCheckboxNewQuest"><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "8"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type="text"></div><div class="qt_field_opt qt_multi clearfix multiChoice_dd"> <div class="mc-dropdown-select multiChoice_dd_select"> Select Answer Option </div> <ul class="mc_dd_opt hide widgetsEl"> <li class="clearfix"><label class="bulk">Answer Option</label><label class="score">Score</label></li> <li class="clearfix hidden"><label></label><input type= "checkbox" name="mcheckbox421" class="customCheckboxNewQuest"><input class="bulk require" name="a" type="text"><input class= "qt_score" name="s" maxlength=5 type="text"><button class= "qt_add"></button><button class="qt_remove"></button></li> <li class="clearfix"><label for="mcheckbox421"></label><input class= "checkbox" id="mcheckbox421" type="checkbox" name="s1"><input class="bulk require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="mcheckbox521"></label><input class= "checkbox" id="mcheckbox521" type="checkbox" name="s1"><input class="bulk require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li> <li class="clearfix"><label for="mcheckbox621"></label><input class= "checkbox" id="mcheckbox621" type="checkbox" name="s1"><input class="bulk require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type= "text"><button class="qt_add"></button></li> </ul> </div><div class="clearfix"></div></div>'; break;
	
	case "boolean-radio" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-radio icons"></i><span class="widgetName">Boolean radio</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"><div class="quesCheckbox"> <div class="checkWrapQuest"><input name="question" type="checkbox" class="customCheckboxNewQuest"><div class="checkWrapClickQuest"></div></div><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "9"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type= "text"></div><div class="qt_field_opt qt_boolean_Radio clearfix"> <div class="clearfix"> <span class="qt_ansOpt">Answer Option</span><span class= "qt_score">Score</span> </div> <ul> <li class="clearfix"><input type="radio"><input class= "qt_ansOpt require" name="a" type="text"><input class="qt_score" name="s" maxlength=5 type= "text"></li> <li><input type="radio"><input class="qt_ansOpt require" name= "a" type="text"><input class="qt_score" name="s" maxlength=5 type="text"></li> </ul></div>'; break; 
	
	case "boolean-checkbox" : return draggableId = '<div class="qt_settings clearfix"><i class="icon-checkBox icons"></i><span class="widgetName">Boolean checkbox</span> <ul class="controlPanel clearfix"> <li>${categoryValues}</li> <li><span class="qt_each_settings icon-sort"></span></li> <li> <span class="qt_each_settings icon-settings"></span> <div class="settings-panel dd"> <table> <tr> <td><span class="redTxt">*</span> Mandatory</td> <td><label class="switch-light switch-slider"><input name="mCheck" type="checkbox" /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class="switch-light switch-slider"><input name="aCheck" type="checkbox"><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type="text" class="tag" name="tag" value= ""></td> </tr> </table><button class="btn btn-xs cancel" type= "button">Cancel</button><button class="btn btn-xs save fr" type="button">Save</button> </div> </li> <li><span class="qt_each_settings icon-delete"></span></li> </ul></div><div class="clearfix"> <div class="quesCheckbox"> <div class="checkWrapQuest"><input name="question" type="checkbox" class="customCheckboxNewQuest"><div class="checkWrapClickQuest"></div></div><label for="question"></label> </div><span class="qt_No"></span><label class="qt_editBox" for="qt_editBox" title=""></label><input class="hidden" name="qt" type="text" value= "10"><input class="hidden hq" name="section1" value=""><input class="q require" name="q" type= "text"></div><div class="qt_field_opt qt_boolean_chkbox"> <div class="clearfix"> <span class="qt_ansOpt">Answer</span><span class= "qt_score">Score</span> </div> <ul> <li class="clearfix"><input type="checkbox" class="customCheckboxNewQuest"><input class="qt_ansOpt require" name="a" type="text"><input class= "qt_score" name="s" maxlength=5 type="text"></li> </ul></div>'; break;
	
	/* case "dt-select" : return draggableId = "<div class='qt_settings clearfix'> <ul class='controlPanel clearfix'> <li>${categoryValues}</li> <li><span class='qt_each_settings icon-sort'></span></li> <li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><input class='switch' data-off-text='No' data-on-text='Yes' data-size='large' name='aCheck' type='checkbox'></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= ''></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div> </li> <li><span class='qt_each_settings icon-delete'></span></li> </ul></div><div class='clearfix'> <div class='quesCheckbox'> <input name='question' type='checkbox' class='customCheckboxNewQuest'><label for='question'></label> </div><span class='qt_No'></span> <label class='qt_editBox' for= 'qt_editBox' title=''></label> <input class='hidden' name='qt' type='text' value='11'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix'> <div class='clearfix'> <span class='qt_ansOpt'>Answer Option</span><span class= 'qt_score'>Score</span> </div> <ul> <li class='clearfix'><span class='dateSel'><select class= 'dd Select' name='d'> <option> dd </option> <option> 1 </option> <option> 2 </option> <option> 3 </option> <option> 4 </option> <option> 5 </option> <option> 6 </option> <option> 7 </option> <option> 8 </option> <option> 9 </option> <option> 10 </option> <option> 11 </option> <option> 12 </option> <option> 13 </option> <option> 14 </option> <option> 15 </option> <option> 16 </option> <option> 17 </option> <option> 18 </option> <option> 19 </option> <option> 20 </option> <option> 21 </option> <option> 22 </option> <option> 23 </option> <option> 24 </option> <option> 25 </option> <option> 26 </option> <option> 27 </option> <option> 28 </option> <option> 29 </option> <option> 30 </option> <option> 31 </option> </select> <select class='mm Select' name='m'> <option> mm </option> <option> January </option> <option> February </option> <option> March </option> <option> April </option> <option> May </option> <option> June </option> <option> July </option> <option> August </option> <option> September </option> <option> October </option> <option> November </option> <option> December </option> </select> <select class='yy Select' name='y'> <option> yyyy </option> <option> 1980 </option> <option> 1981 </option> <option> 1982 </option> <option> 1983 </option> <option> 1984 </option> <option> 1985 </option> <option> 1986 </option> <option> 1987 </option> <option> 1988 </option> <option> 1989 </option> <option> 1990 </option> <option> 1991 </option> <option> 1992 </option> <option> 1993 </option> <option> 1994 </option> <option> 1995 </option> <option> 1996 </option> <option> 1997 </option> <option> 1998 </option> <option> 1999 </option> <option> 2000 </option> <option> 2001 </option> <option> 2002 </option> <option> 2003 </option> <option> 2004 </option> <option> 2005 </option> <option> 2006 </option> <option> 2007 </option> <option> 2008 </option> <option> 2009 </option> <option> 2010 </option> <option> 2011 </option> <option> 2012 </option> <option> 2013 </option> <option> 2014 </option> <option> 2015 </option> <option> 2016 </option> <option> 2017 </option> <option> 2018 </option> <option> 2019 </option> <option> 2020 </option> <option> 2021 </option> <option> 2022 </option> <option> 2023 </option> <option> 2024 </option> <option> 2025 </option> <option> 2026 </option> <option> 2027 </option> <option> 2028 </option> <option> 2029 </option> <option> 2030 </option> <option> 2031 </option> <option> 2032 </option> <option> 2033 </option> <option> 2034 </option> <option> 2035 </option> <option> 2036 </option> </select></span> <input class='qt_score' name='s' type='text'></li> </ul></div>"; break; */
	
	case "dt-select" : return draggableId = "<div class='qt_settings clearfix'> <i class='icon-dateSelection icons'></i><span class='widgetName'>Date selection box</span> <ul class='controlPanel clearfix'> <li>${categoryValues}</li><li><span class='qt_each_settings icon-sort'></span></li><li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td><td><label class='switch-light switch-slider'><input class='customCheckboxNewQuest' name='mCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr> <td>Allow Attachment</td><td><label class='switch-light switch-slider'><input class='customCheckboxNewQuest' name='aCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td></tr><tr> <td>Tag</td><td><input class='tag' name='tag' type='text' value=''></td></tr></table><button class='btn btn-xs cancel' type='button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div></li><li><span class='qt_each_settings icon-delete'></span></li></ul></div><div class='clearfix'> <div class='quesCheckbox'> <input class='customCheckboxNewQuest' name='question' type='checkbox'><label for='question'></label> </div><span class='qt_No'></span> <label class='qt_editBox' for='qt_editBox' title=''></label> <input class='hidden' name='qt' type='text' value='11'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix'> <div class='clearfix'> <span class='qt_ansOpt'>Answer</span><span class='qt_score'>Score</span> </div><ul> <li class='clearfix'><span class='dateSel'> <div class='customSelectWrapperQuest disabledDates'> <select> <option> dd </option> </select> <div class='customSelectClickQuest disabledDates'>dd</div></div><div class='customSelectWrapperQuest disabledDates'> <select> <option> mm </option> </select> <div class='customSelectClickQuest disabledDates'>mm</div></div><div class='customSelectWrapperQuest disabledDates'> <select> <option> yyyy </option> </select> <div class='customSelectClickQuest disabledDates'>yyyy</div></div></span> <input class='qt_score' maxlength='5' name='s' type='text'></li></ul></div>"; break;
	
	case "dt-picker" : return draggableId = "<div class='qt_settings clearfix'><i class='icon-datePicker icons'></i><span class='widgetName'>Date picker</span> <ul class='controlPanel clearfix'> <li>${categoryValues}</li> <li><span class='qt_each_settings icon-sort'></span></li> <li> <span class='qt_each_settings icon-settings'></span> <div class='settings-panel dd'> <table> <tr> <td><span class='redTxt'>*</span> Mandatory</td> <td><label class='switch-light switch-slider'><input name='mCheck' type='checkbox' /><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Allow Attachment</td> <td><label class='switch-light switch-slider'><input name='aCheck' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></td> </tr> <tr> <td>Tag</td> <td><input type='text' class='tag' name='tag' value= ''></td> </tr> </table><button class='btn btn-xs cancel' type= 'button'>Cancel</button><button class='btn btn-xs save fr' type='button'>Save</button> </div> </li> <li><span class='qt_each_settings icon-delete'></span></li> </ul></div><div class='clearfix'> <div class='quesCheckbox'> <input name='question' type='checkbox' class='customCheckboxNewQuest'><label for='question'></label> </div><span class='qt_No'>1)</span> <label class='qt_editBox' for= 'qt_editBox' title=''></label><input class='hidden' name='qt' type= 'text' value='12'><input class='hidden hq' name='section1' value=''><input class='q require' name='q' type='text'></div><div class='qt_field_opt clearfix qt_dp dateSelector'> <div class='clearfix'> <span class='qt_ansOpt'>Answer Option</span><span class= 'qt_score'>Score</span> </div> <ul> <li class='clearfix'><input class='datepicker' placeholder='dd/mm/yyyy' name='a' type= 'text'><input class='qt_score' name='s' maxlength=5 type='text'></li> </ul></div>"; break;

	default : draggableId = "<div>Failed..Dragging please try again</div>";
		
	}
}

});

// THIS IS THE CODE I ADDED FOR QUESTIONNAIRE NAME

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
//	$('#boolResult').html( 'Questionnaire Name and Description cannot be empty' );
	return false;	
}
$('.qrName, .bussinessCase .bright:first').text(khName);  
  // Send the data using post
//alert("Hello");
 $.post( './editquestionnairename', {'questionnaireName' : khName , 'questionnaireId' : khId, 'questionnaireDescription' : khDesc }, function(data) {
	// alert("--------FIRST SUCCESS--------");
	 
	 console.log("Result Came From Server is" + data);
//	 $('#boolResult').html( data );
var res = data;
var msg = '';
console.log("Resultant Data is:"+res);

//	 $('.boolResult').html(data);
	 if(res == '"true"') {
         console.log("Damodar");
         msg = '${displayName} already exists';
         $('#boolResult').html( msg );
 	//  console.log($('.boolResult').val() == true);
 //   $('.editQuestName, .popupBgDelete').hide();
 } 
	 else{
		 console.log("In Else Block");
	//	 $('.editQuestName, .popupBgDelete').hide();
		 $('.editQuestName, .popupBg, .popupBgDelete').hide();
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

$('.questTitleEdit').on('click',function(e){
	 e.preventDefault();
	 $('.editQuestName .quesName').val($('.qrName').text());
});


//THIS IS THE CODE I ADDED FOR EDIT QUESTIONNAIRE NAME

//Sorting questions panel
   	jQuery('.sortable').sortable({
		connectWith: ".qt_settings",
		handle: ".icon-sort"
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
	  // e.stopPropagation();
	 //  e.preventDefault();
	   //jQuery('.removePopup').show();
	   var tr = jQuery(this).closest('.clearfix');
	   tr.remove();
	  /* jQuery('.removePopup').show();
	  // jQuery('.popupBg').show();
	   jQuery('.removePopup').on('click', '.remove' , function(){
		 //  jQuery('.removePopup').hide();
		  // jQuery('.popupBg').hide();
					
			   }); */
	   
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
//CODE TO DELETE THE QUESTION
jQuery('#submit-questionnaire').on('click', '.icon-delete', function(e) {
  e.stopPropagation();
	var $this = $(this);
	$('.qstText').text("question");
	jQuery('.popupBg, .deleteQuestion').show();
	jQuery('body').on('click', '.btn ',function(e) {
		if(jQuery(this).hasClass('yesBtn')){
           
			if(jQuery('#submit-questionnaire').find('ul li.ui-draggable').length <= 1) {
				jQuery('.addBank').prop('disabled', 'disabled');
			}
			var deletedQuesId = $this.siblings('.quesid').val(),
			deletedQuestionnaireId = $this.siblings('.qrid').val();
			$.post('./removequestion', {'questionId' : deletedQuesId , 'questionnaireId' : deletedQuestionnaireId});  
			$this.closest('.ui-draggable').remove();
		}
		$('.popupBg, .deleteQuestion, .errorMsg').hide();
		   
        jQuery('#submit-questionnaire').find('.qt_No').each(function(index) {
              jQuery(this).text(index+1 + " )");
        }); 
	});	
});

// CODE TO DELETE THE QUESTION


//Date Picker

jQuery(".datepicker").datepicker({
    dateFormat: "dd/mm/yy",
	showOn: "button",
	changeMonth: true,
	changeYear: true,
    onSelect: function () {
        selectedDate = jQuery.datepicker.formatDate("dd/mm/yy", jQuery(this).datepicker('getDate'));
		jQuery(".datepicker").val(selectedDate);
    }
});


//jQuery('input[type="checkbox"], input[type="radio"]').uniform();
 
jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-icon">');
// Switch Yes/No 
	jQuery('input.switch').bootstrapSwitch();	

	//Dropdown hiding
jQuery('.cancel, .save, .save-bulkanswer').on('click', function(){
		jQuery(this).parents('.dd').hide();
});
	
   function randonNumber(){
	  var rNum = Math.floor((Math.random() + 1) * 0x1000000000).toString(36).substring(1);                             
	  return rNum;                             
	}
   
 
   
   $('.saveTemplate').on('click', function(e) {
	   var tmp =  $(this).closest('.save-template-popup').find('.template-name').val();
	   $('.tmpName').val(tmp);
	   if($('.template-name').val().trim() == '') {
  	    $('.saveTmpError').show();
  	    global = 1;
  	    return false;
  	   }
	   else {
        global = 0;
	   }
 	  
 	//$.post('./setupquestionnaire', $('#submit-questionnaire').serialize());
 	   
   });
   /* jQuery('#submit-questionnaire').on('click', '.saveTemp',function (e) {
	   e.stopPropagation();
	   e.preventDefault();
       if (jQuery('.ui-draggable').length == 0) {
           return false;
       }
       
       var len = jQuery('.questionContainer').find('.require').length, value = 0;
       jQuery('.questionContainer').find('.require').each(function (index) {
           if (jQuery(this).closest('li').hasClass('hidden') == false && jQuery(this).val() == '') {
               jQuery(this).addClass('errorInput');
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
       
       
       if (len > value || jQuery('.mm')[0].selectedIndex == 0 || jQuery('.dd')[0].selectedIndex == 0 || jQuery('.yy')[0].selectedIndex == 0) {

            jQuery('.errorMsg').show();
           return false;
       }
       else {
           return true;
       }
       jQuery(".datepicker").datepicker({
           dateFormat: "dd/mm/yy",
           defaultDate: date,
   		showOn: "button",
   		changeMonth: true,
   		changeYear: true,
           onSelect: function () {
               selectedDate = jQuery.datepicker.formatDate("dd/mm/yy", jQuery(this).datepicker('getDate'));
   			jQuery(".datepicker").val(selectedDate);
           }
       });

       jQuery(".datepicker").datepicker("setDate", date);

   	//jQuery('input[type="checkbox"], input[type="radio"]').uniform();
   	 
   	jQuery(".ui-datepicker-trigger").empty().html('<i class="dp-icon">');
   }); */

   //jQuery('#submit-questionnaire .btn-block').on('click', '.save', function(){

	      jQuery('.insertBank').on('click',function() {
	    	  var sectionName = $('.questContainerTabs').find('.active .sectionInput').val();
	    		document.submitquestionnaire.sectionName.value = sectionName;
	 // global = 1;
	  insert = 1;
	  document.submitquestionnaire.insertBank.value="insert"; 
	  return true;
  	  
   	 });
	   
	   
	      jQuery('.save1').on('click', function(){ 
	  		//  //alert("2nd coming");
	  	   //	//alert(jQuery('.questionn>li.canvas-element').index()+1);
	  	  // var i = jQuery('.questionn li.canvas-element').length/2;	
	  	  //Dynamic ID generation for Questionnaire
	  			 var startNum = $('.bussinessCase').length;
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
/* 	  		   jQuery(this).find(".dateSel select").attr('name', function(i, v){
	  				return v.replace(/[0-9]/g, '')+el; 
	  			}); */
	  		  jQuery(this).find('.widgetsEl li input[type="text"]').attr('name', function(i,v){
	  						return v.replace(/[0-9]/g, '')+el;
	  			});	
	  		
	   		});
	  ////alert("1");
	  			if (jQuery('.questionContainer').find('.ui-draggable').length == 0) {
		  			// here i changed global to insert
	  				if(insert < 1 )
	  			           return false;
	  			// here i changed global to insert
	  		         
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
	  		     //  ////alert("2");
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
	  		       //alert("3");
	  		       var m =  $('.questContainerTabs').find('.sectionInput').length;	
	  		       $('.questContainerTabs').find('.sectionInput').each(function(index) { 
	  			             	   
	  		    	     if(!$(this).closest('.tab').hasClass('hidden') && $(this).val().trim() == '') {    
	  		    	            $(this).addClass('errorInput').val('');  	    		    	                 		    	  
	  		    	      }	 
	  		    	     else {
	  		    	    	    $(this).removeClass('errorInput');  
	  		    	    	    m--;
	  			    	     }  
	  		    	  });
	  		       //alert("4");
	  		       var arr = [], duplicate = true;

	  		       jQuery('.questContainerTabs').find('.sectionInput').each(function(index) {
	  		           arr.push(jQuery(this).val());   
	  		       });
	  		       //alert("5");
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
	  		       //alert("6");       
	  		       if (len > value || lenSel > 0 || m > 0) {	
	  		    	 jQuery('.duplicate, .duplicateQst').hide();
	  		        	jQuery('.errorMsg').show();
	  		            return false;
	  		       }
	  		       else if(duplicate == false){
	  		    	 jQuery('.duplicateQst, .errorMsg').hide();
	  			       jQuery('.duplicate').show();
	  		           return false;
	  		       }
	  		       else if(duplicateQst() == true) {
	  		    	 jQuery('.duplicate, .errorMsg').hide();
	  		    	   jQuery('.duplicateQst').show();
	  		       }
	  		       else {
	  			        if(global < 1 ){
	  			        	document.submitquestionnaire.action="./setupquestionnaire";
	  			        	document.submitquestionnaire.submit();
	  			        }
	  	                   return true;
	  			       }

	  	   });
	      
	      function duplicateQst() {
	      	var duplicateQst = false;
	      	var len = jQuery('.container').find('.q').length;
	      	var el = jQuery('.container').find('.q');
	      	for(var i = 0; i<len-1; i++) {
	      		for(var j = i+1; j < len; j++) {;	
	      		   if(el.eq(i).val() == el.eq(j).val()) {
	      			   el.eq(i).addClass('errorInput');
	      			   el.eq(j).addClass('errorInput');
	      			   duplicateQst = true;
	      		   } else {
	      			   el.eq(i).removeClass('errorInput');
	      			   el.eq(j).removeClass('errorInput');
	      		   }
	      		}
	      	}
	      	return duplicateQst;
	      }

	  
   
   $('.questContainer').on('click', '.deleteQst', function(){
	   var secName = $(this).siblings('.sectionInput').val();
	   //alert("Active Section Name is:"+secName);
	//   var questionnaireId = jQuery(this).closest('.sectionRelatedQuestionnaireId').find('.quesId').val()
	var questionnaireId = $('.questContainerTabs').find('.active .sectionQuestionnaire').val();
	   //alert("Questionnaire Id is:"+questionnaireId);
	//	document.submitquestionnaire.sectionName.value = sectionName;

	   $.post( './deletesection', {'sectionName' : secName, 'questionnaireId' : questionnaireId}, function(data) {
			// alert("--------FIRST SUCCESS--------");
			 
			 console.log("Result Came From Server is" + data);
		var res = data;
		var msg = '';
		console.log("Resultant Data is:"+res);
			 if(res == '"true"') {
		         console.log("Damodar");
		         msg = '${displayName} already exists';
		         $('#boolResult').html( msg );		 
		 } 
			 else{
				 console.log("In Else Block");
				 $('.editQuestName, .popupBg, .popupBgDelete').hide();
				 } 			
		}).done(function() {
		   console.log( "--------SECOND SUCCESS--------" );
		}).fail(function() {
		       //alert("FAIL");
				});
   	var els = $(this).closest('li').attr('data-link');
   	$(this).closest('li').remove();
   	$('#' + els).remove();
   });

   $('.questTitleEdit').on('click',function(e){
	//   alert("In questTitleEdit JQuery Function");
	   e.preventDefault();
	   document.getElementById('boolResult').innerHTML = "";
	   jQuery('.questErrMsg').hide();
	   $('.editQuestName').show();
       $('.popupBg').show();
   });

   jQuery('.closeBtn, .closePopup').click(function(){
		jQuery('.questPopup').hide();
		jQuery('.popupBg').hide();
	});

	$(".saveAsTemplate").attr("disabled","disabled");
	
	$("#submit-questionnaire").on('click', "input[name^=question]", function(){
      $('li.canvas-element').each(function(){
                      if($('input[name^=question]').is(':checked')) {    
                                      $(".saveAsTemplate").removeAttr("disabled");
                                      $(".addBank").removeAttr("disabled");
                      }
                      else if($('input[name^=question]').not(':checked')) { 
                                      $(".saveAsTemplate").attr("disabled","disabled");  
                                      $(".addBank").attr("disabled","disabled");           
                      }    
                                                            
      });
  });



  $('.mainpanel').on('click', '.saveAsTemplate', function(e){
    	e.stopPropagation();
        $('.save-template-popup').show();
        $('.popupBgDelete').show();
    });

//Allow only numeric values
  jQuery(document).on('keypress focus','input.col1, input.col2, input.col3, input.qt_score, input.score',function (e) {
              var key = window.e ? e.keyCode : e.which;
              if (e.keyCode == 8 ||e.keyCode == 0) {
                              return true;
              }
              else if ( key < 48 || key > 57 ) {                              
                  return false;
              }
              else return true;
           });  

//for checkbox design
	 var checkElm = jQuery(".customCheckboxNewQuest").parent(".quesCheckbox"),
	 		checkElmRetrive = jQuery(".customCheckboxNewQuest").parent("label"),
			checkElmInner = jQuery(".customCheckboxNewQuest, .checkbox").parent("li"),
			checkElmInner1 = jQuery(".customCheckboxNewQuest, .checkbox").parent("div.clearfix");
		
	 	checkElmRetrive.each(function(){
			jQuery(this).find("input[type='checkbox']").wrap("<div class='checkWrapQuest1'></div>");
			jQuery(this).find("input[type='checkbox']").after("<div class='checkWrapClickQuest'></div>");
		});

		checkElmInner.each(function(){
			jQuery(this).find("input[type='checkbox']").wrap("<div class='checkWrapQuest1'></div>");
			jQuery(this).find("input[type='checkbox']").after("<div class='checkWrapClickQuest'></div>");
		});
		
		checkElmInner1.each(function(){
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

        
 jQuery('.qt_remove').on('click', function() {
        
      var id = jQuery(this).parent('.clearfix').find('input.hidden').attr('value');
     
      jQuery('.remove').on('click', function() {
        
           //jQuery.post('./deleteansweroption', {'optionId' : id});      
      });
 });
	
		
	 jQuery('.qt_remove').on('click', function() {
		 
	     var id = jQuery(this).parent('.clearfix').find('input.hidden').attr('value');
	    
	     jQuery('.remove').on('click', function() {
	    	
	          //jQuery.post('./deleteansweroption', {'optionId' : id});      
	     });
	 });

     jQuery('.deleteFunction').on('click', function(e) {
         e.preventDefault();
         e.stopPropagation();
         jQuery('.qstText').text('questionnaire');
         //jQuery('.deleteQuestion,  .popupBg').show();
         jQuery('.yesBtn').on('click', function() {
         jQuery('.deleteFunction').submit(); 
       });
         
         jQuery('.noBtn').on('click', function(e) {
        	 jQuery('.deleteQuestion,  .popupBg').hide();  
         });
     });
     


       
</script>
<script src="js/custom.js"></script> 

</body>
</html>
 