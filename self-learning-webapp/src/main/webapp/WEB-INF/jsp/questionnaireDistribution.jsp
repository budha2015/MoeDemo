<!DOCTYPE html>
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page import="com.rfg.tprm.questionnaire.model.QuestionComponent"%>
<%-- <%@ page import="com.rfg.tprm.questionnaire.model.UploadedImagesInfo"%> --%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link href="css/common.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="css/bootstrap-switch.min.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/mainDT.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="css/questionnaire/qr-common.css">

<!--
<link type="text/css" href="http://jscrollpane.kelvinluck.com/style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 http://jscrollpane.kelvinluck.com/ -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
.container {
	width: 100%;
	float: none;
}

.top_menu {
	display: none !important
}

select {
	border: 1px solid #e1e3eb;
}

.settings-panel table {
	border-bottom: #e1e3eb 1px solid;
	margin-bottom: 1em;
}

td {
	padding: 5px
}

.settings-panel tr>td:first-child {
	text-align: right;
	width: 80%;
}

.tag {
	width: 50px;
}

.questionn>li {
	border-bottom: #e1e3eb 1px solid;
}

.questionn>li:last-child {
	border: none;
}

.selectall {
	display: inline-block;
	font-style: italic;
	margin-right: 1em;
	position: relative;
	top: 1em;
}

.setupQuestContainer {
	float: left;
	width: 100%;
}

.questionContainer.current {
	border: 1px solid #e1e3eb;
}

.deleteQst {
	position: absolute;
	top: 0;
	right: 2px;
	cursor: pointer;
}

.questionContainer {
	width: 100%;
	min-height: 600px;
	height: auto !important;
	height: 600px;
	background: transparent;
	position: relative;
	vertical-align: middle;
	padding: 10px;
	border: 1px solid #e1e3eb;
	border-width: 0px 1px 1px;
}

.questionContainer li.canvas-element {
	display: inline-block;
	display: block;
	list-style-type: none;
	height: auto;
	padding-top: 10px;
	margin: 10px
}

.questContainer {
	width: 100%;
	overflow-y: scroll;
	min-height: 510px;
	height: 510px
}

.questionContainer .ui-draggable .customCheckBox label {
	top: 4px
}

.qt_editBox {
	margin: 0
}

.qt_currency_label {
	font-weight: normal;
	padding: 5px 20px 5px 0;
}

#multiple-choice-dropdown .mc_dd_opt {
	display: inline-block;
	position: relative;
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
	background: none;
}

.save-template-popup .submitQ:hover {
	background: #19b5a3;
	color: #FFF;
}

.multiChoice_dd {
	float: left
}

.select-category {
	border-radius: 5px;
	border: 1px solid #11b1aa;
	border-top: 0;
	padding: 2px 5px;
	width: 200px;
	position: absolute
}

.select-category input {
	width: 100%;
	margin: 2px 0;
	cursor: pointer;
}

.select-category.hide {
	display: none
}

.select-category.show {
	display: block;
	z-index: 1
}

#multiple-select-dropdown .mc_dd_opt.show {
	position: relative;
	display: inline-block
}

.dragItemLabel {
	margin: 0
}

.nbdr {
	border: none
}

.panel-tabs {
	border-bottom: 1px solid #e1e3eb;
	padding: 10px;
}

.controlPanel li {
	padding-left: 3px
}

.qt_settings {
	padding-bottom: 10px
}

#qt_editBox {
	border: 1px solid #e1e3eb
}

.col1,.col2,.col3 {
	font-style: italic;
	display: inline-block;
	padding-bottom: 5px;
}

.col1,.col2 {
	margin-right: 1em;
	width: 30%;
}

.col3 {
	width: 6%;
	margin-right: 10px
}

.setRange {
	color: #000;
	font-size: 12px;
	font-weight: normal;
	height: 20px
}

.multiChoice_dd {
	width: 380px
}

.mc_dd_opt {
	width: 100%
}

.mc_dd_opt .bulk,.mc_dd_opt label.bulk {
	width: 60% !important
}

.mc_dd_opt .score,.mc_dd_opt label.score,.mc_dd_opt .qt_score,.mc_dd_opt label.qt_score
	{
	float: left;
	margin-left: 8px;
	width: 15%;
	margin-right: 10px;
}

.qt_field_opt button {
	float: left;
}

select {
	height: 25px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
	z-index: 999;
}

.multiChoice_dd_select {
	width: 380px
}

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

.questPopup ul {
	text-align: center
}

.yesBtn,.noBtn {
	width: 75px;
	margin-top: 10px
}

.yesBtn {
	margin-right: 20px;
	background: #d9534f
}

.yesBtn:hover {
	background: #d9534f
}

.questPopup ul {
	padding: 36px 0 0
}

.btn-block {
	margin-top: 1em;
	clear: both
}

.preview {
	margin-right: 1em;
}

.settings-panel tr>td:first-child {
	text-align: right;
}

.settings-panel {
	right: -8px
}

.mc-dropdown-select.toggle {
	border: #11b1aa 1px solid
}

.ui-widget-content {
	border: none;
}

.nolist {
	list-style: none;
}

.icon-settings,.icon-delete {
	cursor: pointer;
}

.settings-panel td {
	vertical-align: top;
}

.ques input[type="text"] {
	width: 95%;
}

.errorInput {
	border: 1px solid red !important
}

.errorMsg {
	background: #ccc;
	display: none;
	font-size: 14px;
	padding: 10px;
	margin: auto;
	width: 100%;
	color: red;
	text-align: center
}

.mc_dd_opt {
	max-height: 200px;
	overflow-y: auto
}

.boxContainer {
	padding: 20px 0;
	border-bottom: 1px solid #e1e3eb;
}

.datepicker {
	margin-right: 0
}

.dateSelector .qtscore {
	margin-left: 30px
}

.ms-dropdown {
	min-height: 200px
}

.status-warn {
	display: none
}

.qt_field_opt button {
	margin-right: 2px
}

.mainpanel {
	margin-left: 0 !important
}

.Qheading {
	text-align: center;
	font-size: 16px;
	margin: 10px 0;
	float: left;
	font-weight: bold
}

.qt_field_opt input[type="radio"] {
	margin-left: 0 !important;
}

.qt_field_opt .qt_ansOpt {
	padding-bottom: 0 !important
}

.qt_mc_radio .multiRadio {
	margin-left: 0 !important;
	height: 15px;
	margin-top: -14px !important
}

.qt_mc_radio li {
	height: 18px
}

.multiLabel {
	margin-left: 30px;
	margin-top: 1px;
	display: block;
	margin-right: 10px
}

.BoolRadioLabel {
	margin-top: 2px;
	float: left
}

.saveAsDraft {
	float: left
}

.btn-block {
	overflow: hidden;
	padding: 10px
}

.questPopup .closePopup {
	width: 80px
}

.slider {
	height: 45px;
	border-radius: 5px;
	width: 600px;
	font-size: 13px;
	position: relative;
	float: right
}

.sliderLeft {
	width: 25%;
	float: left;
	height: 100%;
	text-align: center;
	background: #595d6a;
	color: #fff;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px
}

.sliderLeft span {
	padding-top: 5px;
	display: block
}

.sliderRight {
	width: 75%;
	float: left;
	height: 100%;
	background: #d6d4d3;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px
}

.statusBar {
	height: 10px;
	width: 100%;
	border-radius: 5px;
	background: #44bd9b;
}

.toolTip {
	width: 140px;
	position: absolute;
	top: -20px;
	border-radius: 5px;
	text-align: center;
	padding: 5px;
	left: 25%;
	z-index: 999;
}

.tooltipArrow {
	border-style: solid;
	position: absolute;
	bottom: 0;
	left: 50%;
	margin-left: -5px;
	border-width: 5px 5px 0;
	border-top-color: #595d6a;
	border-right-color: transparent;
	border-left-color: transparent;
}

.tooltipInner {
	width: 100%;
	background: #595d6a;
	height: 25px;
	line-height: 1.8;
	border-radius: 5px;
	color: #fff;
}

.respHeader {
	background: #fff;
	padding: 30px 20px;
	overflow: hidden
}

.statusBarWhite {
	background: #fff;
	width: 90%;
	margin: auto;
	border-radius: 5px;
	margin-top: 18px;
}

.container .footer {
	margin-top: 10px
}

.ui-datepicker-calendar {
	background: #fff !important
}

.q {
	border: none;
	width: 96%
}

.fileBrowse {
	border: 0 !important
}

.qstDst {
	padding: 20px;
	width: 100%;
}

.qstDst table {
	width: 100%
}

.qstDst table .bleft {
	float: right
}

.qstDst table .bright {
	color: #000;
	padding-left: 25px
}

.TPRM_header b.dms_upload {
	float: right;
	margin: 11px 13px 0 0;
	background: rgb(48, 91, 127);
	padding: 8px 20px;
	color: #fff;
	font-weight: normal;
	cursor: pointer;
}

input[type="checkbox"]:checked+label:before {
	background-position: -36px 0
}

.radiochk li {
	margin-bottom: 10px;
}

.imageContent {
	padding: 10px 0;
}

.imgName {
	margin: 4px 10px 0 0;
	word-wrap: break-word;
}

.img_del {
	margin: 0 0 0 10px;
}

.cancelDraft {
	margin-left: 15px
}

.dwnldImg {
	color: #17a2d6 !important;
}

.noBorder {
	border: 0
}

.files_p {
	width: 100%;
	float: left;
	margin: 5px 0;
}

.files_p a {
	float: left;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.qt_field_opt {
	padding-left: 23px !important
}

.customInput label {
	left: 0 !important
}

.qt_No {
	width: 22px
}

ol.widgetsEl {
	margin-left: 18px
}

.questionContainer .q {
	display: none
}

.questionContainer .questText {
	min-width: 1%;
	max-width: 99%;
	float: left;
	padding-top: 5px;
	padding-right: 5px
}

.dms_upload_cancel_popup_btn {
	padding: 5px 15px !important;
}

.customSelectWrapperQuest {
	float: left;
	height: 25px;
	position: relative;
	width: 56px;
	margin-right: 15px;
}

.dd {
	width: 56px !important
}

.mm {
	width: 106px !important
}

.yy {
	width: 67px !important
}

.ui-widget-content {
	border: 0 !important
}

:focus {
	outline: none
}

.greyout {
	opacity: .6
}

select {
	width: 195px;
	height: 24px
}
</style>
</head>
<body>


	<%
		List<QuestionComponent> retrieveQuestionnaireComponentsForSection = null;
		String myContent="";
		String sectionNameBasedLiContent = "";
		String divContent = "";
		String sectionTitle = "";
		int st = 10;	 
		String questionnaireName = null;
		String defType = null;
		String status = null;
		Long responsibleUserName = null;
		String businessCase = null;
		Long questionnaireDefId = 0L;
		Long questionnaireId = 0L;
		int indexs =1;
		
		LinkedHashMap<String,LinkedList<QuestionComponent>> sectionMap = (LinkedHashMap<String,LinkedList<QuestionComponent>>) request.getAttribute("SectionBasedQuestionnaireComponents");
		
		TreeMap<Long,LinkedList<String>> uploadedImagesInfoMap = new TreeMap<Long,LinkedList<String>>();
		
		uploadedImagesInfoMap = (TreeMap<Long,LinkedList<String>>)request.getAttribute("UploadedImagesInfo"); 
			
		Set<Map.Entry<String,LinkedList<QuestionComponent>>> set = sectionMap.entrySet();
		 
		 Iterator iterator = set.iterator();
		 int k =0; 
		 while(iterator.hasNext()){

			 myContent ="";
			 
			 Map.Entry<String,LinkedList<QuestionComponent>> mEntry = (Map.Entry<String,LinkedList<QuestionComponent>>) iterator.next();
			 sectionNameBasedLiContent += "<li class='tab active' data-link='sectionTitle"+st+"'><input readonly name='sectionTitle"+st+"51' class='sectionInput' id='sectionTitle"+st+"51' value='"+mEntry.getKey()+"'></li>";
			 
			 retrieveQuestionnaireComponentsForSection = (LinkedList<QuestionComponent>) mEntry.getValue();
			 
			
			 
			 System.out.println("size is "+ retrieveQuestionnaireComponentsForSection.size());
			 
			 questionnaireName = retrieveQuestionnaireComponentsForSection.get(0).getQuestionnaireName();
			 status = retrieveQuestionnaireComponentsForSection.get(0).getStatus();
			 questionnaireDefId = retrieveQuestionnaireComponentsForSection.get(0).getQuestionnaireDefId();
			 questionnaireId = retrieveQuestionnaireComponentsForSection.get(0).getQuestionnaireId();
			 // This code added to sent status of Questionnaire towards TenantDMSController
		//	 session.setAttribute("QuestionnaireStatus",status);
			 System.out.println("QuestionnaireDefId Setting in the Session is <<<<<<<<<>>>>>>>>>"+questionnaireDefId);
			 session.setAttribute("CancelledQuestionnaireDefId",questionnaireDefId);
			 session.setAttribute("CancelledQuestionnaireId",questionnaireId);
			 System.out.println("QuestionnaireDefId Setting in the Session is <<<<<<<<<>>>>>>>>>"+questionnaireDefId);
			// This code added to sent status of Questionnaire towards TenantDMSController
			 defType = retrieveQuestionnaireComponentsForSection.get(0).getDeftype();
			 if(defType != null && !(defType.equalsIgnoreCase("")) && defType.equals("B")){
		 businessCase = "businessCase";
		 session.setAttribute("businessCase", businessCase);
		 session.setAttribute("questionnaireName", questionnaireName);
		 session.setAttribute("defType", defType);
			 }else{
		 //businessCase = "questionnair";
		 session.removeAttribute("businessCase");
		 session.removeAttribute("questionnaireName");
		 session.removeAttribute("defType");
			 }
			 
		for(QuestionComponent qc:retrieveQuestionnaireComponentsForSection){
			//outer for loop
		String questionText= qc.getQuestionText();
		String questionTypeId= qc.getQuestionTypeId()+"";
		Long questionId = qc.getQuestionId();
		List<Long> answerOptionId = qc.getAnswerOptionId();
		List<Long> answerOptionIdList = qc.getAnswerOptionId();
		List<String> answerOptionValueList = new ArrayList<String>();
		List<Long> qsttAnswerIdList = new ArrayList<Long>();
		answerOptionValueList=qc.getAnswerOptionValue(); 
		List<String> answerWordList = new ArrayList<String>();
		List<String> multiTextAnswerWordList = new ArrayList<String>();
		answerWordList = qc.getAnswerWord();
		qsttAnswerIdList =  qc.getAnswerId();
		questionnaireId = qc.getQuestionnaireId();
		questionnaireDefId = qc.getQuestionnaireDefId();
		String sele = "";
		String legalNanme = qc.getLegalName();
		String linkedQuestionnares = qc.getLinkedQuestionnaires();
		Date createDate = qc.getCreateDate();
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String create_Date = formatter.format(createDate);
				String authorName = qc.getCreatedBy();

				responsibleUserName = qc.getUserId();
				if (linkedQuestionnares != null
						&& !((linkedQuestionnares.equalsIgnoreCase("")))) {
					request.setAttribute("linkedQuestionnaire",
							linkedQuestionnares);
				}
				if (legalNanme != null
						&& !(legalNanme.equalsIgnoreCase(""))
						&& defType != null
						&& !(defType.equalsIgnoreCase(""))
						&& defType.equals("B")) {
					request.setAttribute("legalNanme", legalNanme);
					request.setAttribute("createDate", create_Date);
					request.setAttribute("authorName", authorName);
				}
				String readOnlyOrNot = "";
				String hiddenEl = "";
				String disabledOrNot = "";
				String border = "";
				if (!(status.equalsIgnoreCase("submitted"))
						&& session.getAttribute("userId") == responsibleUserName) {
					readOnlyOrNot = "";
				} else if (status.equalsIgnoreCase("submitted")
						&& session.getAttribute("userId") == responsibleUserName) {
					border = "noBorder";
					readOnlyOrNot = "readonly";
					hiddenEl = "hidden";
					disabledOrNot = "disabled";

				} else {
					readOnlyOrNot = "readonly";
					hiddenEl = "hidden";
					disabledOrNot = "disabled";
				}

				if ((readOnlyOrNot.equalsIgnoreCase("readonly"))) {
					myContent += "<input type='text' class='mandatoryField hidden' value='true' />";
				}

				if (questionTypeId.equals("1")) {

					/* My Code */

					//System.out.println("********Single Text Box************");		

					/* My Code */

					/*		if((((qc.getQuestionMandatory()).toString()).equalsIgnoreCase("true"))){
					
					//System.out.println("true");
					
					}else{
					//System.out.println("false");
					}
					
					if((((qc.getQuestionAttachment()).toString()).equalsIgnoreCase("true"))){
					o
					//System.out.println("true");
					
					}else{
					//System.out.println("false");
					}	*/

					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='singleTxtFields boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label> <span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt clearfix'><div class='clearfix'></div><input class='hidden qtQstner' name='qt' type='text' value='1'>";
					for (int i = 0; i < answerOptionValueList.size(); i++) {

						myContent += "</input><input class='hidden' name='qaid' type='text' value = '"
								+ (qsttAnswerIdList.get(i) == null ? 0
										: qsttAnswerIdList.get(i))
								+ "'><input class='hidden' name='optionid' type='text' value = '"
								+ qc.getAnswerOptionId().get(i)
								+ "'><input class='qt_ansOpt submt "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "require"
										: "")
								+ " "
								+ border
								+ "'  name='a' type='text' "
								+ readOnlyOrNot
								+ " value='"
								+ (answerWordList.get(i) == null ? ""
										: answerWordList.get(i))
								+ "'></div>";
						break;
					}
					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}
					myContent += "</div></li>";
				}

				if (questionTypeId.equals("2")) {

					/* My Code */

					//System.out.println("********Multiple Text Box************");	

					/* My Code */

					String aWordStrng = answerWordList.get(0);
					String array[] = aWordStrng.split(",");
					for (int i = 0; i < array.length; i++) {
						multiTextAnswerWordList.add(array[i]);
					}

					int i = 0;
					int size = multiTextAnswerWordList.size() < 2 ? 2
							: multiTextAnswerWordList.size();

					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='multipleTxtBox boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><div class='clearfix'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q ' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'></div><input class='hidden qtQstner' name='qt' type='text' value='2'><ol class='qt_multiTxtBoxList widgetsEl' type='ans'>";
					System.out.println("Mandatory Q2: "
							+ (qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"));
					System.out.println("ReadOnly Q2: "
							+ (readOnlyOrNot.equalsIgnoreCase("")));
					System.out
							.println("Ans Q2: "
									+ ((qc.getQuestionMandatory()
											.toString())
											.equalsIgnoreCase("true") && (readOnlyOrNot
											.equalsIgnoreCase(""))));
					for (i = 0; i < size; i++) {
						if (i == 0) {
							myContent += "<input class='hidden' name='qaid' type='text' value = '"
									+ qsttAnswerIdList.get(0)
									+ "'><input class='hidden' name='optionid' type='text' value = '"
									+ qc.getAnswerOptionId().get(0)
									+ "'><input class='qt_ansOpt submt "
									+ (((qc.getQuestionMandatory()
											.toString())
											.equalsIgnoreCase("true")) ? "require"
											: "")
									+ ""
									+ border
									+ "' name='ans'  "
									+ readOnlyOrNot
									+ " value='"
									+ (multiTextAnswerWordList.size() > i ? multiTextAnswerWordList
											.get(i) : "") + "'>";
						} else if (i == 1) {

							myContent += " <input class='hidden' name='qaid' type='text' value = '"
									+ qsttAnswerIdList.get(0)
									+ "'><input class='hidden' name='optionid' type='text' value = '"
									+ qc.getAnswerOptionId().get(0)
									+ "'> <input class='qt_ansOpt submt "
									+ (((qc.getQuestionMandatory()
											.toString())
											.equalsIgnoreCase("true")) ? "require"
											: "")
									+ ""
									+ border
									+ "' name='ans'  "
									+ readOnlyOrNot
									+ " value='"
									+ (multiTextAnswerWordList.size() > i ? multiTextAnswerWordList
											.get(i) : "")
									+ "'><button class='qt_add "
									+ hiddenEl
									+ "'></button><button class='qt_remove hidden'></button>";
						} else {
							myContent += "<input class='hidden' name='qaid' type='text' value = '"
									+ qsttAnswerIdList.get(0)
									+ "'><input class='hidden' name='optionid' type='text' value = '"
									+ qc.getAnswerOptionId().get(0)
									+ "'><input class='qt_ansOpt submt "
									+ (((qc.getQuestionMandatory()
											.toString())
											.equalsIgnoreCase("true")) ? "require"
											: "")
									+ ""
									+ border
									+ "' name='ans'  "
									+ readOnlyOrNot
									+ " value='"
									+ (multiTextAnswerWordList.size() > i ? multiTextAnswerWordList
											.get(i) : "")
									+ "'><input type='text' class='hidden incIndex' value='"
									+ (i - 1)
									+ "'><button class='qt_add "
									+ hiddenEl
									+ "'></button><button class='qt_remove "
									+ hiddenEl + "'></button>";

						}
					}
					//myContent+="<li class='clearfix qt_multiTxtBox_row'><input class='hidden' name='qaid' type='text' value = '"+((i<=qsttAnswerIdList.size() && qsttAnswerIdList.get(i)!=null)?qsttAnswerIdList.get(i):0)+"'><input class='hidden' name='optionid' type='text' value = '"+(i<=qc.getAnswerOptionId().size()?qc.getAnswerOptionId().get(i):0)+"'><input class='qt_ansOpt submt " + (((qc.getQuestionMandatory().toString()).equalsIgnoreCase("true")) ? "require" : "") + "' name='a' type='text' value='"+((i<=answerWordList.size() && answerWordList.get(i)!=null)?answerWordList.get(i):"")+"'></li>
					myContent += "</ol></div>";

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}
					myContent += "</div></li>";
				}
				if (questionTypeId.equals("3")) {

					/* My Code */
					//System.out.println("********Numeric Text Box************");		

					/* My Code */

					int i = 0;
					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='textBoxNumeric boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden qtQstner' name='qt' type='text' value='3'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'></div>";

					if (answerOptionValueList != null)
						myContent += "<ul><li class='clearfix'><input class='hidden' name='qaid' type='text' value = '"
								+ ((i <= qsttAnswerIdList.size() && qsttAnswerIdList
										.get(i) != null) ? qsttAnswerIdList
										.get(i) : 0)
								+ "'><input class='hidden' name='optionid' type='text' value = '"
								+ (i <= qc.getAnswerOptionId().size() ? qc
										.getAnswerOptionId().get(i) : 0)
								+ "'><input class='qt_ansOpt col4 submt "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "require"
										: "")
								+ " "
								+ border
								+ "' name='a' "
								+ readOnlyOrNot
								+ "  type='text'  value='"
								+ ((i <= answerWordList.size() && answerWordList
										.get(i) != null) ? answerWordList
										.get(i) : "") + " '></li></ul>";

					myContent += "</div>";
					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}
					/* if(status.equals("saved")){
						
					} */

					myContent += "</div></li>";
				}
				if (questionTypeId.equals("4")) {

					/* My Code */

					//System.out.println("********Currency Box************");		

					/* My Code */

					int i = 0;
					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='currencyBox boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden qtQstner' name='qt' type='text' value='4'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'></div><ul><li class='clearfix'>";

					System.out.println("Mandatory Q4: "
							+ (qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"));
					System.out.println("ReadOnly Q4: "
							+ (readOnlyOrNot.equalsIgnoreCase("")));
					System.out
							.println("Ans Q4: "
									+ ((qc.getQuestionMandatory()
											.toString())
											.equalsIgnoreCase("true") && (readOnlyOrNot
											.equalsIgnoreCase(""))));

					if (answerOptionValueList != null)

						myContent += "<label class ='qt_currency_label' for='qt_editBox' title=''>"
								+ answerOptionValueList.get(i)
								+ "</label><input class='hidden' name='qaid' type='text' value = '"
								+ ((i <= qsttAnswerIdList.size() && qsttAnswerIdList
										.get(i) != null) ? qsttAnswerIdList
										.get(i) : 0)
								+ "'><input class='hidden' name='optionid' type='text' value = '"
								+ (i <= qc.getAnswerOptionId().size() ? qc
										.getAnswerOptionId().get(i) : 0)
								+ "'><input class='qt_ansOpt col4 submt "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "require"
										: "")
								+ ""
								+ border
								+ "' name='a' type='text'   "
								+ readOnlyOrNot
								+ "   value='"
								+ ((i <= answerWordList.size() && answerWordList
										.get(i) != null) ? answerWordList
										.get(i) : "")
								+ "'></li></ul></div>";

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}
					myContent += "</div></li>";
				}

				if (questionTypeId.equals("5")) {

					/* My Code */

					//System.out.println("********Multiple Choice Radio Box************");

					/* My Code */

					int i = 0;

					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='mc-radio boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q "
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "requireRadioCheck"
									: "")
							+ "' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'><input class='hidden qtQstner' name='qt' type='text' value='5'></div><ul class='qt_mc_radio qt_multi top15 clearfix widgetsEl radiochk customInput customRadio'>";
					Long ansId = 0l;
					if (answerOptionValueList != null) {

						for (i = 0; i < answerOptionValueList.size(); i++) {
							if (qsttAnswerIdList.get(i) != 0) {
								ansId = qsttAnswerIdList.get(i);

							}
						}
						for (i = 0; i < answerOptionValueList.size() - 1; i++) {

							myContent += "<li class='clearfix'><input name='"
									+ qc.getQuestionId()
									+ "' class='multiRadio radioQst rRequire "
									+ (disabledOrNot
											.equalsIgnoreCase("disabled") ? "readOnlyRadtio"
											: "")
									+ "' id='mRadio"
									+ ++indexs
									+ "' type='radio' "
									+ disabledOrNot
									+ " value = '"
									+ (i <= qc.getAnswerOptionId().size() ? qc
											.getAnswerOptionId().get(i) : 0)
									+ "$"
									+ answerOptionValueList.get(i)
									+ "~"
									+ ansId
									+ "' "
									+ (answerOptionValueList.get(i).equals(
											answerWordList.get(i)) ? "checked"
											: "")
									+ "><label for='mRadio"
									+ indexs
									+ "'></label><span class='multiLabel'>"
									+ answerOptionValueList.get(i)
									+ "</span></li>";

						}
						myContent += "<li class='clearfix'><input name='"
								+ qc.getQuestionId()
								+ "' class='multiRadio radioQst rRequire "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "readOnlyRadtio"
										: "")
								+ "' id='mRadio"
								+ ++indexs
								+ "' type='radio' "
								+ disabledOrNot
								+ " value = '"
								+ (i <= qc.getAnswerOptionId().size() ? qc
										.getAnswerOptionId().get(i) : 0)
								+ "$"
								+ answerOptionValueList.get(i)
								+ "~"
								+ ansId
								+ "' "
								+ (answerOptionValueList.get(i).equals(
										answerWordList.get(i)) ? "checked"
										: "") + "><label for='mRadio"
								+ indexs
								+ "'></label><span class='multiLabel'>"
								+ answerOptionValueList.get(i)
								+ "</span></li>";
					}

					myContent += "</ul></div>";

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";

				}

				if (questionTypeId.equals("6")) {

					/* My Code */

					//System.out.println("********Multiple Choice DropDown Box************");
					/* My Code */

					int i = 0;

					/*myContent += "<div class='mc-dropdown boxContainer'><div class='qt_settings clearfix'><ul class='controlPanel clearfix'><li>"+sele+"</li><li><span class='qt_each_settings icon-delete'></span></li></ul></div><div class='clearfix'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='multiDropdownQuest' name='qtext' id='qt_editBox' value='"+questionText+"'></div><div class='qt_field_opt qt_multiChoice_dd'><ul><li class='clearfix'><div class='multiChoice_dd'><div class='mc-dropdown-select multiChoice_dd_select'> Select Answer Option </div><div class='mc_dd_opt hide widgetsEl'><label class='bulk'>Answer Option</label><input type='hidden' class='submt' name='qId' value='6'><div class='clearfix hidden'><input name='ansOpt' class='bulk'><button class='qt_remove'></button></div>";*/
					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer'><div class='clearfix'> <div class=''> <input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label for='question'></label> </div><span class='qt_No'></span><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden qtQstner' name='qt' type='text' value='6'><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q' name='q' type='text' readonly value= '"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multiChoice_dd'> <ul> <li class='clearfix'> <div class='multiChoice_dd'><input class='hidden' name='qaid' type='text' value = '"
							+ (qsttAnswerIdList.get(i) == null ? 0
									: qsttAnswerIdList.get(i))
							+ "'><div class='customSelectWrapperQuest "
							+ (disabledOrNot.equalsIgnoreCase("disabled") ? "greyout"
									: "")
							+ "'><select class='selectedVal "
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "requireSelect"
									: "")
							+ "' name='"
							+ qc.getQuestionId()
							+ "' "
							+ disabledOrNot
							+ "><option value='"
							+ qc.getAnswerOptionId().get(i)
							+ "$ ~"
							+ qsttAnswerIdList.get(i) + "'>Select</option>";
					Long ansId = 0l;
					if (answerOptionValueList != null) {

						for (i = 0; i < answerOptionValueList.size(); i++) {
							if (qsttAnswerIdList.get(i) != 0) {
								ansId = qsttAnswerIdList.get(i);
							}
						}

						String selectedElement = "Select";

						for (i = 0; i < answerOptionValueList.size(); i++) {

							myContent += "<option class='bulk nbdr' value = '"
									+ (i <= qc.getAnswerOptionId().size() ? qc
											.getAnswerOptionId().get(i) : 0)
									+ "$"
									+ answerOptionValueList.get(i)
									+ "~"
									+ ansId
									+ "'   "
									+ (answerOptionValueList.get(i)
											.equalsIgnoreCase(
													answerWordList.get(i)) ? "selected"
											: "")
									+ "  >"
									+ answerOptionValueList.get(i)
									+ "</option>";

							if (answerOptionValueList
									.get(i)
									.equalsIgnoreCase(answerWordList.get(i))) {
								selectedElement = answerWordList.get(i);
							}
						}

						//NEWLY ADDED CODE
						//myContent+="<option type='hidden'  type='text' value = '"+qc.getAnswerOptionId().get(i)+"' >"+answerOptionValueList.get(i)+"</option>";
						//i++;
						//myContent+="<option type='hidden'  type='text' value = '"+qc.getAnswerOptionId().get(i)+"' >"+answerOptionValueList.get(i)+"</option>"; 
						// NEWLY ADDED CODE
						myContent += "</select><div class='customSelectClickQuest'>"
								+ selectedElement
								+ "</div></div></div></li></ul></div>";
					}
					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";
				}
				//multi select checkbox
				if (questionTypeId.equals("7")) {

					/* My Code */

					//System.out.println("********Multiple Select Check Box************");

					/* My Code */

					int i = 0;

					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='ms-chkbox boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q "
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "requireRadioCheck"
									: "")
							+ "' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multi clearfix'><div class='clearfix'></div><input class='hidden qtQstner' name='qt' type='text' value='7'><ul class='qt_multiTxtBoxList widgetsEl radiochk'>";

					for (i = 0; i < answerOptionValueList.size() - 1; i++) {

						myContent += "<li class='clearfix'><div class='customInput customCheckbox'><input class='hidden' name='qaid' type='text' value = '"
								+ qsttAnswerIdList.get(i)
								+ "'><input class='submt' name='c'  type='hidden' value = '"
								+ (i <= qc.getAnswerOptionId().size() ? qc
										.getAnswerOptionId().get(i) : 0)
								+ "$"
								+ answerOptionValueList.get(i)
								+ "' "
								+ (answerOptionValueList.get(i).equals(
										answerWordList.get(i)) ? "checked"
										: "")
								+ "><input name='p"
								+ i
								+ "' class='qt_ms_chkbox checkboxQst chkBoxMantry rRequire "
								+ ((disabledOrNot == "disabled") ? "readonlyCheck"
										+ "' disabled"
										: "'")
								+ " id='checkbox124"
								+ ++indexs
								+ "' type='checkbox' value = '"
								+ (i <= qc.getAnswerOptionId().size() ? qc
										.getAnswerOptionId().get(i) : 0)
								+ "$"
								+ answerOptionValueList.get(i)
								+ "' "
								+ (answerOptionValueList.get(i).equals(
										answerWordList.get(i)) ? "checked"
										: "")
								+ "><label for='checkbox124"
								+ indexs
								+ "'></label></div>"
								+ answerOptionValueList.get(i) + "</li>";

					}
					myContent += "<li class='clearfix'><div class='customInput customCheckbox'><input class='hidden' name='qaid' type='text' value = '"
							+ qsttAnswerIdList.get(i)
							+ "'>   <input class='submt' name='c' type='hidden'  value = '"
							+ (i <= qc.getAnswerOptionId().size() ? qc
									.getAnswerOptionId().get(i) : 0)
							+ "$"
							+ answerOptionValueList.get(i)
							+ "' "
							+ (answerOptionValueList.get(i).equals(
									answerWordList.get(i)) ? "checked" : "")
							+ ">       <input class='qt_ms_chkbox checkboxQst chkBoxMantry rRequire "
							+ ((disabledOrNot == "disabled") ? "readonlyCheck"
									+ "' disabled"
									: "'")
							+ " id='checkbox124"
							+ ++indexs
							+ "' name='p"
							+ i
							+ "'  type='checkbox' value = '"
							+ (i <= qc.getAnswerOptionId().size() ? qc
									.getAnswerOptionId().get(i) : 0)
							+ "$"
							+ answerOptionValueList.get(i)
							+ "' "
							+ (answerOptionValueList.get(i).equals(
									answerWordList.get(i)) ? "checked" : "")
							+ "><label for='checkbox124"
							+ indexs
							+ "'></label></div>"
							+ answerOptionValueList.get(i) + "</li>";

					myContent += "</ol></div>";

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";

				}
				//multi select drop down
				if (questionTypeId.equals("8")) {

					/* My Code */

					//System.out.println("********Multiple Select Drop Down  Box************");
					/* My Code */

					int i = 0;
					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='ms-dropdown boxContainer'><div class='qt_settings clearfix'><input class='hidden qtQstner' name='qt' type='text' value='8'></div><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_multi clearfix multiChoice_dd multiChoice_dropdown'><div class='clearfix hidden'><label></label><input name='a' type='text' class='bulk'><input type='text' id='msd-s' class='score hidden' name='s' value='' /></div><input class='hidden' name='qaid' type='text' value = '"
							+ (qsttAnswerIdList.get(i) == null ? 0
									: qsttAnswerIdList.get(i))
							+ "'><div class='customSelectWrapperQuest "
							+ (disabledOrNot.equalsIgnoreCase("disabled") ? "greyout"
									: "")
							+ "'><select class='selectedVal "
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "requireSelect"
									: "")
							+ "' name='"
							+ qc.getQuestionId()
							+ "' "
							+ disabledOrNot
							+ "><option value='"
							+ qc.getAnswerOptionId().get(i)
							+ "$ ~"
							+ qsttAnswerIdList.get(i) + "'>Select</option>";
					Long ansId = 0l;
					if (answerOptionValueList != null) {

						for (i = 0; i < answerOptionValueList.size(); i++) {
							if (qsttAnswerIdList.get(i) != 0) {
								ansId = qsttAnswerIdList.get(i);
							}
						}

						String selectedElement = "Select";
						for (i = 0; i < answerOptionValueList.size(); i++) {

							myContent += "<option  class='bulk nbdr'  value = '"
									+ (i <= qc.getAnswerOptionId().size() ? qc
											.getAnswerOptionId().get(i) : 0)
									+ "$"
									+ answerOptionValueList.get(i)
									+ "~"
									+ ansId
									+ "' "
									+ (answerOptionValueList.get(i)
											.equalsIgnoreCase(
													answerWordList.get(i)) ? "selected"
											: "")
									+ "  >"
									+ answerOptionValueList.get(i)
									+ "</option>";

							if (answerOptionValueList
									.get(i)
									.equalsIgnoreCase(answerWordList.get(i)))
								selectedElement = answerWordList.get(i);
						}

						myContent += "</select><div class='customSelectClickQuest'>"
								+ selectedElement
								+ "</div></div><div class='clearfix'></div><div class='clearfix'></div></div>";
					}

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";

				}

				//boolean Radio

				if (questionTypeId.equals("9")) {

					/* My Code */

					//System.out.println("********Boolean Radio Box************");

					/* My Code */

					int i = 0;
					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q "
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "requireRadioCheck"
									: "")
							+ "' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_boolean_Radio clearfix'><div class='clearfix'></div><input class='hidden qtQstner' name='qt' type='text' value='9'><ul class='radiochk customInput customRadio'>";
					Long ansId = 0l;
					if (answerOptionValueList != null) {

						for (i = 0; i < answerOptionValueList.size(); i++) {
							if (qsttAnswerIdList.get(i) != 0) {
								ansId = qsttAnswerIdList.get(i);
							}
						}

						for (i = 0; i < answerOptionValueList.size(); i++) {

							myContent += "<li class='clearfix'><input class='hidden' name='qaid' type='text' value = '"
									+ (i <= qsttAnswerIdList.size()
											&& qsttAnswerIdList.get(i) != null ? qsttAnswerIdList
											.get(i) : 0)
									+ "'><input name='"
									+ qc.getQuestionId()
									+ "' class='booleanRadio radioQst rRequire "
									+ (disabledOrNot
											.equalsIgnoreCase("disabled") ? "readOnlyRadtio"
											: "")
									+ "' id='bRadio"
									+ ++indexs
									+ "' type='radio' "
									+ disabledOrNot
									+ " value = '"
									+ (i <= qc.getAnswerOptionId().size() ? qc
											.getAnswerOptionId().get(i) : 0)
									+ "$"
									+ answerOptionValueList.get(i)
									+ "~"
									+ ansId
									+ "' "
									+ (answerOptionValueList.get(i).equals(
											answerWordList.get(i)) ? "checked"
											: "")
									+ "><label for='bRadio"
									+ indexs
									+ "'></label><span class='BoolRadioLabel'>"
									+ answerOptionValueList.get(i)
									+ "</span></li>";

						}

						myContent += "</ul></div>";

						if ((((qc.getQuestionAttachment()).toString())
								.equalsIgnoreCase("true"))) {
							LinkedList<String> imageNames = new LinkedList<String>();
							if (uploadedImagesInfoMap.get(qc
									.getQuestionId()) != null) {
								imageNames = uploadedImagesInfoMap.get(qc
										.getQuestionId());
							}

							if (status.equals("new")) {
								myContent += "<div class='TPRM_header "
										+ hiddenEl + "'>";
								myContent += "<b class='dms_upload'>Upload</b></div>";
								myContent += "<div class='imagesName'></div>";
							} else if (status.equals("saved")) {
								myContent += "<div class='TPRM_header "
										+ hiddenEl + "'>";
								myContent += "<b class='dms_upload'>Upload</b></div>";
								myContent += "<div class='imagesName'>";
								if (imageNames != null) {
									myContent += "<form></form>";
									for (int s = 0; s < imageNames.size(); s++)
										//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
										myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
												+ questionnaireId
												+ "_"
												+ qc.getQuestionId()
												+ "' /><input name='imageName' class='hidden' value='"
												+ imageNames.get(s)
												+ "'><a class='imgName dwnldImg fl'>"
												+ imageNames.get(s)
												+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
								}
								myContent += "</div>";
							} else {
								myContent += "<div class='TPRM_header hidden'>";
								myContent += "<b class='dms_upload'>Upload</b></div>";
								myContent += "<div class='imagesName'>";
								if (imageNames != null) {
									myContent += "<form></form>";
									for (int s = 0; s < imageNames.size(); s++)
										//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
										myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
												+ questionnaireId
												+ "_"
												+ qc.getQuestionId()
												+ "' /><input name='imageName' class='hidden' value='"
												+ imageNames.get(s)
												+ "'><a class='imgName dwnldImg fl'>"
												+ imageNames.get(s)
												+ "</a><span class='fl'></span></form></div>";
								}
								myContent += "</div>";
							}
						}

						myContent += "</div></li>";

					}
				}

				//boolean checkbox

				if (questionTypeId.equals("10")) {

					/* My Code */

					//System.out.println("********Boolean Check Box************");

					/* My Code */

					int i = 0;

					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer'><div class='clearfix'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='hidden qtQstner' name='qt' type='text' value='10'><input class='q "
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true")) ? "requireRadioCheck"
									: "")
							+ "' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ "</div><div class='qt_field_opt qt_boolean_chkbox'><div class='clearfix'></div><ul class='radiochk'>";
					if (answerOptionValueList != null)
						for (i = 0; i < answerOptionValueList.size(); i++) {

							myContent += "<li class='clearfix'><div class='customInput customCheckbox'><input class='hidden' name='qaid' type='text' value = '"
									+ (i <= qsttAnswerIdList.size()
											&& qsttAnswerIdList.get(i) != null ? qsttAnswerIdList
											.get(i) : 0)
									+ "'><input class='hidden' name='optionid' type='text' value = '"
									+ (i <= qc.getAnswerOptionId().size() ? qc
											.getAnswerOptionId().get(i) : 0)
									+ "'>      <input name='a' class='qt_ms_chkbox nbdr rRequire "
									+ ((disabledOrNot == "disabled") ? "readonlyCheck"
											+ "' disabled"
											: "'")
									+ " type='checkbox' id='r"
									+ ++indexs
									+ "' value = '"
									+ (i <= qc.getAnswerOptionId().size() ? qc
											.getAnswerOptionId().get(i) : 0)
									+ "$"
									+ answerOptionValueList.get(i)
									+ "' "
									+ (answerOptionValueList.get(i).equals(
											answerWordList.get(i)) ? "checked"
											: "")
									+ "><label for='r"
									+ indexs
									+ "'></label></div>"
									+ answerOptionValueList.get(i)
									+ "</li>";

						}

					myContent += "</ul></div>";

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";

				}

				//date select

				if (questionTypeId.equals("11")) {

					/* My Code */

					//System.out.println("********Date Selection Box************");

					/* My Code */

					String[] date = null;
					String day = "";
					String mon = "";
					String year = "";
					/* if(answerWordList!=null){
					date = (answerOptionValueList.get(0).toString()).split("-");
					System.out.println("Array Size of date:"+date.length);
					day=date[0];
					System.out.println("day value is:"+day);
					mon=date[1];
					year=date[2];
					}  */
					String dt = "";
					if (answerWordList != null && answerWordList.size() > 0) {
						dt = answerWordList.get(0).toString();
						if (null != dt && !dt.equals("")) {
							date = (answerWordList.get(0).toString())
									.split("-");
							//System.out.println("Array Size of date:"+date.length);
							day = date[0];
							//System.out.println("day value is:"+day);
							mon = date[1];
							year = date[2];
						}
					}
					/*  else {
					date = (answerWordList.get(0).toString()).split("-");
					System.out.println("Array Size of date:"+date.length);
					day=date[0];
					System.out.println("day value is:"+day);
					mon=date[1];
					year=date[2];
					      } */

					//out.println(day.equalsIgnoreCase("5")?"select":"");

					myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='dateSelection boxContainer'>   <div class='clearfix "
							+ ((disabledOrNot.equalsIgnoreCase("readonly")) ? "greyout"
									: "")
							+ "'> <input class='hidden' name='optionid' type='text' value = '"
							+ qc.getAnswerOptionId().get(0)
							+ "'><input class='hidden' name='qaid' type='text' value = '"
							+ (qsttAnswerIdList.get(0) == null ? 0
									: qsttAnswerIdList.get(0))
							+ "'><input class='hidden qIds "
							+ qc.getQuestionId()
							+ "' name='qid' type='text' value = '"
							+ qc.getQuestionId()
							+ "'><label class='qt_editBox' for='qt_editBox' title=''></label> </input> <span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
							+ st
							+ "51'><input class='q' name='q' type='text' readonly value='"
							+ questionText
							+ "' /><div class='questText'>"
							+ questionText
							+ "</div>"
							+ (((qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"))
									&& (readOnlyOrNot.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
									: "<span class='redTxt hidden'>*</span>")
							+ " </div> <div class='qt_field_opt clearfix'> <div class='clearfix'><input class='hidden qtQstner' name='qt' type='text' value='11'> </div> <ul> <li class='clearfix'>";

					if (day.equals("null") || day.equals("")) {
						myContent += "<div class='customSelectWrapperQuest dd "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "greyout"
										: "")
								+ "'><select name='d' "
								+ disabledOrNot
								+ " class='date dd "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "requireSelect"
										: "")
								+ " '> <option >dd</option> <option "
								+ (day.equalsIgnoreCase("1") ? "selected"
										: " ")
								+ ">1</option> <option "
								+ (day.equalsIgnoreCase("2") ? "selected"
										: "")
								+ ">2<option "
								+ (day.equalsIgnoreCase("3") ? "selected"
										: "")
								+ ">3<option "
								+ (day.equalsIgnoreCase("4") ? "selected"
										: "")
								+ ">4<option "
								+ (day.equalsIgnoreCase("5") ? "selected"
										: "")
								+ ">5</option> <option "
								+ (day.equalsIgnoreCase("6") ? "selected"
										: "")
								+ ">6</option> <option "
								+ (day.equalsIgnoreCase("7") ? "selected"
										: "")
								+ ">7<option "
								+ (day.equalsIgnoreCase("8") ? "selected"
										: "")
								+ ">8<option "
								+ (day.equalsIgnoreCase("9") ? "selected"
										: "")
								+ ">9</option> <option "
								+ (day.equalsIgnoreCase("10") ? "selected"
										: "")
								+ ">10</option> <option "
								+ (day.equalsIgnoreCase("11") ? "selected"
										: "")
								+ ">11</option> <option "
								+ (day.equalsIgnoreCase("12") ? "selected"
										: "")
								+ ">12</option> <option "
								+ (day.equalsIgnoreCase("13") ? "selected"
										: "")
								+ ">13<option "
								+ (day.equalsIgnoreCase("14") ? "selected"
										: "")
								+ ">14</option> <option "
								+ (day.equalsIgnoreCase("15") ? "selected"
										: "")
								+ ">15</option> <option "
								+ (day.equalsIgnoreCase("16") ? "selected"
										: "")
								+ ">16</option> <option "
								+ (day.equalsIgnoreCase("17") ? "selected"
										: "")
								+ ">17</option> <option "
								+ (day.equalsIgnoreCase("18") ? "selected"
										: "")
								+ ">18</option> <option "
								+ (day.equalsIgnoreCase("19") ? "selected"
										: "")
								+ ">19</option> <option "
								+ (day.equalsIgnoreCase("20") ? "selected"
										: "")
								+ ">20</option> <option "
								+ (day.equalsIgnoreCase("21") ? "selected"
										: "")
								+ ">21<option "
								+ (day.equalsIgnoreCase("22") ? "selected"
										: "")
								+ ">22</option> <option "
								+ (day.equalsIgnoreCase("23") ? "selected"
										: "")
								+ ">23</option> <option "
								+ (day.equalsIgnoreCase("24") ? "selected"
										: "")
								+ ">24</option> <option "
								+ (day.equalsIgnoreCase("25") ? "selected"
										: "")
								+ ">25</option> <option "
								+ (day.equalsIgnoreCase("26") ? "selected"
										: "")
								+ ">26</option> <option "
								+ (day.equalsIgnoreCase("27") ? "selected"
										: "")
								+ ">27</option> <option "
								+ (day.equalsIgnoreCase("28") ? "selected"
										: "")
								+ ">28</option> <option "
								+ (day.equalsIgnoreCase("29") ? "selected"
										: "")
								+ ">29</option> <option "
								+ (day.equalsIgnoreCase("30") ? "selected"
										: "")
								+ ">30</option> <option "
								+ (day.equalsIgnoreCase("31") ? "selected"
										: "")
								+ ">31</option> </select><div class='customSelectClickQuest dd'>dd</div></div>";

					} else {
						myContent += "<div class='customSelectWrapperQuest dd "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "greyout"
										: "")
								+ "'><select name='d' "
								+ disabledOrNot
								+ " class='date dd "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "requireSelect"
										: "")
								+ " '> <option >dd</option> <option "
								+ (day.equalsIgnoreCase("1") ? "selected"
										: " ")
								+ ">1</option> <option "
								+ (day.equalsIgnoreCase("2") ? "selected"
										: "")
								+ ">2<option "
								+ (day.equalsIgnoreCase("3") ? "selected"
										: "")
								+ ">3<option "
								+ (day.equalsIgnoreCase("4") ? "selected"
										: "")
								+ ">4<option "
								+ (day.equalsIgnoreCase("5") ? "selected"
										: "")
								+ ">5</option> <option "
								+ (day.equalsIgnoreCase("6") ? "selected"
										: "")
								+ ">6</option> <option "
								+ (day.equalsIgnoreCase("7") ? "selected"
										: "")
								+ ">7<option "
								+ (day.equalsIgnoreCase("8") ? "selected"
										: "")
								+ ">8<option "
								+ (day.equalsIgnoreCase("9") ? "selected"
										: "")
								+ ">9</option> <option "
								+ (day.equalsIgnoreCase("10") ? "selected"
										: "")
								+ ">10</option> <option "
								+ (day.equalsIgnoreCase("11") ? "selected"
										: "")
								+ ">11</option> <option "
								+ (day.equalsIgnoreCase("12") ? "selected"
										: "")
								+ ">12</option> <option "
								+ (day.equalsIgnoreCase("13") ? "selected"
										: "")
								+ ">13<option "
								+ (day.equalsIgnoreCase("14") ? "selected"
										: "")
								+ ">14</option> <option "
								+ (day.equalsIgnoreCase("15") ? "selected"
										: "")
								+ ">15</option> <option "
								+ (day.equalsIgnoreCase("16") ? "selected"
										: "")
								+ ">16</option> <option "
								+ (day.equalsIgnoreCase("17") ? "selected"
										: "")
								+ ">17</option> <option "
								+ (day.equalsIgnoreCase("18") ? "selected"
										: "")
								+ ">18</option> <option "
								+ (day.equalsIgnoreCase("19") ? "selected"
										: "")
								+ ">19</option> <option "
								+ (day.equalsIgnoreCase("20") ? "selected"
										: "")
								+ ">20</option> <option "
								+ (day.equalsIgnoreCase("21") ? "selected"
										: "")
								+ ">21<option "
								+ (day.equalsIgnoreCase("22") ? "selected"
										: "")
								+ ">22</option> <option "
								+ (day.equalsIgnoreCase("23") ? "selected"
										: "")
								+ ">23</option> <option "
								+ (day.equalsIgnoreCase("24") ? "selected"
										: "")
								+ ">24</option> <option "
								+ (day.equalsIgnoreCase("25") ? "selected"
										: "")
								+ ">25</option> <option "
								+ (day.equalsIgnoreCase("26") ? "selected"
										: "")
								+ ">26</option> <option "
								+ (day.equalsIgnoreCase("27") ? "selected"
										: "")
								+ ">27</option> <option "
								+ (day.equalsIgnoreCase("28") ? "selected"
										: "")
								+ ">28</option> <option "
								+ (day.equalsIgnoreCase("29") ? "selected"
										: "")
								+ ">29</option> <option "
								+ (day.equalsIgnoreCase("30") ? "selected"
										: "")
								+ ">30</option> <option "
								+ (day.equalsIgnoreCase("31") ? "selected"
										: "")
								+ ">31</option> </select><div class='customSelectClickQuest dd'>"
								+ day + "</div></div>";
					}

					if (mon.equals("null") || day.equals("")) {
						myContent += "<div class='customSelectWrapperQuest mm "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "greyout"
										: "")
								+ "'><select name='m' "
								+ disabledOrNot
								+ " class='month mm "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "requireSelect"
										: "")
								+ " '> <option >mm</option> <option "
								+ (mon.equalsIgnoreCase("January") ? "selected"
										: " ")
								+ ">January</option> <option "
								+ (mon.equalsIgnoreCase("February") ? "selected"
										: "")
								+ ">February</option> <option "
								+ (mon.equalsIgnoreCase("March") ? "selected"
										: "")
								+ ">March</option> <option "
								+ (mon.equalsIgnoreCase("April") ? "selected"
										: "")
								+ ">April</option> <option "
								+ (mon.equalsIgnoreCase("May") ? "selected"
										: "")
								+ ">May</option> <option "
								+ (mon.equalsIgnoreCase("June") ? "selected"
										: "")
								+ ">June</option> <option "
								+ (mon.equalsIgnoreCase("July") ? "selected"
										: "")
								+ ">July</option> <option "
								+ (mon.equalsIgnoreCase("August") ? "selected"
										: "")
								+ ">August</option> <option "
								+ (mon.equalsIgnoreCase("September") ? "selected"
										: "")
								+ ">September</option> <option "
								+ (mon.equalsIgnoreCase("October") ? "selected"
										: "")
								+ ">October</option> <option "
								+ (mon.equalsIgnoreCase("November") ? "selected"
										: "")
								+ ">November</option> <option "
								+ (mon.equalsIgnoreCase("December") ? "selected"
										: "")
								+ ">December</option> </select><div class='customSelectClickQuest mm'>mm</div></div>";
					} else {
						myContent += "<div class='customSelectWrapperQuest mm "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "greyout"
										: "")
								+ "'><select name='m' "
								+ disabledOrNot
								+ " class='month mm "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "requireSelect"
										: "")
								+ " '> <option >mm</option> <option "
								+ (mon.equalsIgnoreCase("January") ? "selected"
										: " ")
								+ ">January</option> <option "
								+ (mon.equalsIgnoreCase("February") ? "selected"
										: "")
								+ ">February</option> <option "
								+ (mon.equalsIgnoreCase("March") ? "selected"
										: "")
								+ ">March</option> <option "
								+ (mon.equalsIgnoreCase("April") ? "selected"
										: "")
								+ ">April</option> <option "
								+ (mon.equalsIgnoreCase("May") ? "selected"
										: "")
								+ ">May</option> <option "
								+ (mon.equalsIgnoreCase("June") ? "selected"
										: "")
								+ ">June</option> <option "
								+ (mon.equalsIgnoreCase("July") ? "selected"
										: "")
								+ ">July</option> <option "
								+ (mon.equalsIgnoreCase("August") ? "selected"
										: "")
								+ ">August</option> <option "
								+ (mon.equalsIgnoreCase("September") ? "selected"
										: "")
								+ ">September</option> <option "
								+ (mon.equalsIgnoreCase("October") ? "selected"
										: "")
								+ ">October</option> <option "
								+ (mon.equalsIgnoreCase("November") ? "selected"
										: "")
								+ ">November</option> <option "
								+ (mon.equalsIgnoreCase("December") ? "selected"
										: "")
								+ ">December</option> </select><div class='customSelectClickQuest mm'>"
								+ mon + "</div></div>";

					}
					if (year.equals("null") || day.equals("")) {
						myContent += "<div class='customSelectWrapperQuest yy "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "greyout"
										: "")
								+ "'><select name='y' "
								+ disabledOrNot
								+ " class='year yy "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "requireSelect"
										: "")
								+ " '> <option >yyyy</option> <option "
								+ (year.equalsIgnoreCase("1980") ? "selected"
										: " ")
								+ ">1980</option> <option "
								+ (year.equalsIgnoreCase("1981") ? "selected"
										: "")
								+ ">1981</option> <option "
								+ (year.equalsIgnoreCase("1982") ? "selected"
										: "")
								+ ">1982</option> <option "
								+ (year.equalsIgnoreCase("1983") ? "selected"
										: "")
								+ ">1983</option> <option "
								+ (year.equalsIgnoreCase("1984") ? "selected"
										: "")
								+ ">1984</option> <option "
								+ (year.equalsIgnoreCase("1985") ? "selected"
										: "")
								+ ">1985</option> <option "
								+ (year.equalsIgnoreCase("1986") ? "selected"
										: "")
								+ ">1986</option> <option "
								+ (year.equalsIgnoreCase("1987") ? "selected"
										: "")
								+ ">1987</option> <option "
								+ (year.equalsIgnoreCase("1988") ? "selected"
										: "")
								+ ">1988</option>  <option "
								+ (year.equalsIgnoreCase("1989") ? "selected"
										: "")
								+ ">1989</option>  <option "
								+ (year.equalsIgnoreCase("1990") ? "selected"
										: "")
								+ ">1990</option>  <option "
								+ (year.equalsIgnoreCase("1991") ? "selected"
										: "")
								+ ">1991</option>  <option "
								+ (year.equalsIgnoreCase("1992") ? "selected"
										: "")
								+ ">1992</option>  <option "
								+ (year.equalsIgnoreCase("1993") ? "selected"
										: "")
								+ ">1993</option>  <option "
								+ (year.equalsIgnoreCase("1994") ? "selected"
										: "")
								+ ">1994</option>  <option "
								+ (year.equalsIgnoreCase("1995") ? "selected"
										: "")
								+ ">1995</option>  <option "
								+ (year.equalsIgnoreCase("1996") ? "selected"
										: "")
								+ ">1996</option>  <option "
								+ (year.equalsIgnoreCase("1997") ? "selected"
										: "")
								+ ">1997</option>  <option "
								+ (year.equalsIgnoreCase("1998") ? "selected"
										: "")
								+ ">1998</option>  <option "
								+ (year.equalsIgnoreCase("1999") ? "selected"
										: "")
								+ ">1999</option>  <option "
								+ (year.equalsIgnoreCase("2000") ? "selected"
										: "")
								+ ">2000</option>  <option "
								+ (year.equalsIgnoreCase("2001") ? "selected"
										: "")
								+ ">2001</option>  <option "
								+ (year.equalsIgnoreCase("2002") ? "selected"
										: "")
								+ ">2002</option>  <option "
								+ (year.equalsIgnoreCase("2003") ? "selected"
										: "")
								+ ">2003</option>  <option "
								+ (year.equalsIgnoreCase("2004") ? "selected"
										: "")
								+ ">2004</option>  <option "
								+ (year.equalsIgnoreCase("2005") ? "selected"
										: "")
								+ ">2005</option>  <option "
								+ (year.equalsIgnoreCase("2006") ? "selected"
										: "")
								+ ">2006</option>  <option "
								+ (year.equalsIgnoreCase("2007") ? "selected"
										: "")
								+ ">2007</option>  <option "
								+ (year.equalsIgnoreCase("2008") ? "selected"
										: "")
								+ ">2008</option>  <option "
								+ (year.equalsIgnoreCase("2009") ? "selected"
										: "")
								+ ">2009</option>  <option "
								+ (year.equalsIgnoreCase("2010") ? "selected"
										: "")
								+ ">2010</option>  <option "
								+ (year.equalsIgnoreCase("2011") ? "selected"
										: "")
								+ ">2011</option>  <option "
								+ (year.equalsIgnoreCase("2012") ? "selected"
										: "")
								+ ">2012</option>  <option "
								+ (year.equalsIgnoreCase("2013") ? "selected"
										: "")
								+ ">2013</option>  <option "
								+ (year.equalsIgnoreCase("2014") ? "selected"
										: "")
								+ ">2014</option>  <option "
								+ (year.equalsIgnoreCase("2015") ? "selected"
										: "")
								+ ">2015</option>  <option "
								+ (year.equalsIgnoreCase("2016") ? "selected"
										: "")
								+ ">2016</option>  <option "
								+ (year.equalsIgnoreCase("2017") ? "selected"
										: "")
								+ ">2017</option>  <option "
								+ (year.equalsIgnoreCase("2018") ? "selected"
										: "")
								+ ">2018</option>  <option "
								+ (year.equalsIgnoreCase("2019") ? "selected"
										: "")
								+ ">2019</option>  <option "
								+ (year.equalsIgnoreCase("2020") ? "selected"
										: "")
								+ ">2020</option>  <option "
								+ (year.equalsIgnoreCase("2021") ? "selected"
										: "")
								+ ">2021</option>  <option "
								+ (year.equalsIgnoreCase("2022") ? "selected"
										: "")
								+ ">2022</option>  <option "
								+ (year.equalsIgnoreCase("2023") ? "selected"
										: "")
								+ ">2023</option>  <option "
								+ (year.equalsIgnoreCase("2024") ? "selected"
										: "")
								+ ">2024</option>  <option "
								+ (year.equalsIgnoreCase("2025") ? "selected"
										: "")
								+ ">2025</option>  <option "
								+ (year.equalsIgnoreCase("2026") ? "selected"
										: "")
								+ ">2026</option>  <option "
								+ (year.equalsIgnoreCase("2027") ? "selected"
										: "")
								+ ">2027</option>  <option "
								+ (year.equalsIgnoreCase("2028") ? "selected"
										: "")
								+ ">2028</option>  <option "
								+ (year.equalsIgnoreCase("2029") ? "selected"
										: "")
								+ ">2029</option>  <option "
								+ (year.equalsIgnoreCase("2030") ? "selected"
										: "")
								+ ">2030</option>  <option "
								+ (year.equalsIgnoreCase("2031") ? "selected"
										: "")
								+ ">2031</option>  <option "
								+ (year.equalsIgnoreCase("2032") ? "selected"
										: "")
								+ ">2032</option>  <option "
								+ (year.equalsIgnoreCase("2033") ? "selected"
										: "")
								+ ">2033</option>  <option "
								+ (year.equalsIgnoreCase("2034") ? "selected"
										: "")
								+ ">2034</option>  <option "
								+ (year.equalsIgnoreCase("2035") ? "selected"
										: "")
								+ ">2035</option>  <option "
								+ (year.equalsIgnoreCase("2036") ? "selected"
										: "")
								+ ">2036</option> </select><div class='customSelectClickQuest yy'>yyyy</div></div>   </li>     </ul> </div>";
					} else {
						myContent += "<div class='customSelectWrapperQuest yy "
								+ (disabledOrNot
										.equalsIgnoreCase("disabled") ? "greyout"
										: "")
								+ "'><select name='y' "
								+ disabledOrNot
								+ " class='year yy "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "requireSelect"
										: "")
								+ " '> <option >yyyy</option> <option "
								+ (year.equalsIgnoreCase("1980") ? "selected"
										: " ")
								+ ">1980</option> <option "
								+ (year.equalsIgnoreCase("1981") ? "selected"
										: "")
								+ ">1981</option> <option "
								+ (year.equalsIgnoreCase("1982") ? "selected"
										: "")
								+ ">1982</option> <option "
								+ (year.equalsIgnoreCase("1983") ? "selected"
										: "")
								+ ">1983</option> <option "
								+ (year.equalsIgnoreCase("1984") ? "selected"
										: "")
								+ ">1984</option> <option "
								+ (year.equalsIgnoreCase("1985") ? "selected"
										: "")
								+ ">1985</option> <option "
								+ (year.equalsIgnoreCase("1986") ? "selected"
										: "")
								+ ">1986</option> <option "
								+ (year.equalsIgnoreCase("1987") ? "selected"
										: "")
								+ ">1987</option> <option "
								+ (year.equalsIgnoreCase("1988") ? "selected"
										: "")
								+ ">1988</option>  <option "
								+ (year.equalsIgnoreCase("1989") ? "selected"
										: "")
								+ ">1989</option>  <option "
								+ (year.equalsIgnoreCase("1990") ? "selected"
										: "")
								+ ">1990</option>  <option "
								+ (year.equalsIgnoreCase("1991") ? "selected"
										: "")
								+ ">1991</option>  <option "
								+ (year.equalsIgnoreCase("1992") ? "selected"
										: "")
								+ ">1992</option>  <option "
								+ (year.equalsIgnoreCase("1993") ? "selected"
										: "")
								+ ">1993</option>  <option "
								+ (year.equalsIgnoreCase("1994") ? "selected"
										: "")
								+ ">1994</option>  <option "
								+ (year.equalsIgnoreCase("1995") ? "selected"
										: "")
								+ ">1995</option>  <option "
								+ (year.equalsIgnoreCase("1996") ? "selected"
										: "")
								+ ">1996</option>  <option "
								+ (year.equalsIgnoreCase("1997") ? "selected"
										: "")
								+ ">1997</option>  <option "
								+ (year.equalsIgnoreCase("1998") ? "selected"
										: "")
								+ ">1998</option>  <option "
								+ (year.equalsIgnoreCase("1999") ? "selected"
										: "")
								+ ">1999</option>  <option "
								+ (year.equalsIgnoreCase("2000") ? "selected"
										: "")
								+ ">2000</option>  <option "
								+ (year.equalsIgnoreCase("2001") ? "selected"
										: "")
								+ ">2001</option>  <option "
								+ (year.equalsIgnoreCase("2002") ? "selected"
										: "")
								+ ">2002</option>  <option "
								+ (year.equalsIgnoreCase("2003") ? "selected"
										: "")
								+ ">2003</option>  <option "
								+ (year.equalsIgnoreCase("2004") ? "selected"
										: "")
								+ ">2004</option>  <option "
								+ (year.equalsIgnoreCase("2005") ? "selected"
										: "")
								+ ">2005</option>  <option "
								+ (year.equalsIgnoreCase("2006") ? "selected"
										: "")
								+ ">2006</option>  <option "
								+ (year.equalsIgnoreCase("2007") ? "selected"
										: "")
								+ ">2007</option>  <option "
								+ (year.equalsIgnoreCase("2008") ? "selected"
										: "")
								+ ">2008</option>  <option "
								+ (year.equalsIgnoreCase("2009") ? "selected"
										: "")
								+ ">2009</option>  <option "
								+ (year.equalsIgnoreCase("2010") ? "selected"
										: "")
								+ ">2010</option>  <option "
								+ (year.equalsIgnoreCase("2011") ? "selected"
										: "")
								+ ">2011</option>  <option "
								+ (year.equalsIgnoreCase("2012") ? "selected"
										: "")
								+ ">2012</option>  <option "
								+ (year.equalsIgnoreCase("2013") ? "selected"
										: "")
								+ ">2013</option>  <option "
								+ (year.equalsIgnoreCase("2014") ? "selected"
										: "")
								+ ">2014</option>  <option "
								+ (year.equalsIgnoreCase("2015") ? "selected"
										: "")
								+ ">2015</option>  <option "
								+ (year.equalsIgnoreCase("2016") ? "selected"
										: "")
								+ ">2016</option>  <option "
								+ (year.equalsIgnoreCase("2017") ? "selected"
										: "")
								+ ">2017</option>  <option "
								+ (year.equalsIgnoreCase("2018") ? "selected"
										: "")
								+ ">2018</option>  <option "
								+ (year.equalsIgnoreCase("2019") ? "selected"
										: "")
								+ ">2019</option>  <option "
								+ (year.equalsIgnoreCase("2020") ? "selected"
										: "")
								+ ">2020</option>  <option "
								+ (year.equalsIgnoreCase("2021") ? "selected"
										: "")
								+ ">2021</option>  <option "
								+ (year.equalsIgnoreCase("2022") ? "selected"
										: "")
								+ ">2022</option>  <option "
								+ (year.equalsIgnoreCase("2023") ? "selected"
										: "")
								+ ">2023</option>  <option "
								+ (year.equalsIgnoreCase("2024") ? "selected"
										: "")
								+ ">2024</option>  <option "
								+ (year.equalsIgnoreCase("2025") ? "selected"
										: "")
								+ ">2025</option>  <option "
								+ (year.equalsIgnoreCase("2026") ? "selected"
										: "")
								+ ">2026</option>  <option "
								+ (year.equalsIgnoreCase("2027") ? "selected"
										: "")
								+ ">2027</option>  <option "
								+ (year.equalsIgnoreCase("2028") ? "selected"
										: "")
								+ ">2028</option>  <option "
								+ (year.equalsIgnoreCase("2029") ? "selected"
										: "")
								+ ">2029</option>  <option "
								+ (year.equalsIgnoreCase("2030") ? "selected"
										: "")
								+ ">2030</option>  <option "
								+ (year.equalsIgnoreCase("2031") ? "selected"
										: "")
								+ ">2031</option>  <option "
								+ (year.equalsIgnoreCase("2032") ? "selected"
										: "")
								+ ">2032</option>  <option "
								+ (year.equalsIgnoreCase("2033") ? "selected"
										: "")
								+ ">2033</option>  <option "
								+ (year.equalsIgnoreCase("2034") ? "selected"
										: "")
								+ ">2034</option>  <option "
								+ (year.equalsIgnoreCase("2035") ? "selected"
										: "")
								+ ">2035</option>  <option "
								+ (year.equalsIgnoreCase("2036") ? "selected"
										: "")
								+ ">2036</option> </select><div class='customSelectClickQuest yy'>"
								+ year
								+ "</div></div>   </li>     </ul> </div>";

					}
					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";

				}

				if (questionTypeId.equals("12")) {

					/* My Code */

					//System.out.println("********Date Picker************");
					/* My Code */

					System.out.println("Mandatory Q12: "
							+ (qc.getQuestionMandatory().toString())
									.equalsIgnoreCase("true"));
					System.out.println("ReadOnly Q12: "
							+ (readOnlyOrNot.equalsIgnoreCase("")));
					System.out
							.println("Ans Q12: "
									+ ((qc.getQuestionMandatory()
											.toString())
											.equalsIgnoreCase("true") && (readOnlyOrNot
											.equalsIgnoreCase(""))));

					String date = null;

					if (answerOptionValueList != null) {
						date = (answerWordList.get(0).toString());
						//System.out.println("Hero");

					}

					//System.out.println("Date Value is:"+date);

					if (hiddenEl.equalsIgnoreCase("hidden")) {
						myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer dateSelector'><div class='clearfix'><input class='hidden' name='qaid' type='text' value = '"
								+ (qsttAnswerIdList.get(0) == null ? 0
										: qsttAnswerIdList.get(0))
								+ "'><input class='hidden' name='optionid' type='text' value = '"
								+ qc.getAnswerOptionId().get(0)
								+ "'><input class='hidden qIds "
								+ qc.getQuestionId()
								+ "' name='qid' type='text' value = '"
								+ qc.getQuestionId()
								+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden qtQstner' name='qt' type='text' value='12'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
								+ st
								+ "51'><input class='q' name='q' type='text' readonly value='"
								+ questionText
								+ "'><div class='questText'>"
								+ questionText
								+ "</div>"
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true"))
										&& (readOnlyOrNot
												.equalsIgnoreCase("")) ? "<span class='redTxt'>*</span>"
										: "<span class='redTxt hidden'>*</span>")
								+ "</div><div class='qt_field_opt clearfix qt_dp'> <div class='clearfix'>  </div> <ul> <li class='clearfix'><input class='"
								+ border
								+ " "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "require"
										: "")
								+ "'  "
								+ readOnlyOrNot
								+ ""
								+ (readOnlyOrNot
										.equalsIgnoreCase("readonly") ? ""
										: " placeholder='dd/mm/yyyy'")
								+ " type='text' name='a' value='"
								+ date
								+ "'></li> </ul></div>";
					} else {
						myContent += "<li class='ui-widget-content ui-draggable ui-draggable-handle canvas-element'><div class='boxContainer dateSelector'><div class='clearfix'><input class='hidden' name='qaid' type='text' value = '"
								+ (qsttAnswerIdList.get(0) == null ? 0
										: qsttAnswerIdList.get(0))
								+ "'><input class='hidden' name='optionid' type='text' value = '"
								+ qc.getAnswerOptionId().get(0)
								+ "'><input class='hidden qIds "
								+ qc.getQuestionId()
								+ "' name='qid' type='text' value = '"
								+ qc.getQuestionId()
								+ "'><label class='qt_editBox' for='qt_editBox' title=''></label><input class='hidden qtQstner' name='qt' type='text' value='12'><span class='qt_No'></span><input class='hidden hq' name='section1' value='sectionTitle"
								+ st
								+ "51'><input class='q' name='q' type='text' readonly value='"
								+ questionText
								+ "'><div class='questText'>"
								+ questionText
								+ "</div>"
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "<span class='redTxt'>*</span>"
										: "<span class='redTxt hidden'>*</span>")
								+ "</div><div class='qt_field_opt clearfix qt_dp'> <div class='clearfix'>  </div> <ul> <li class='clearfix'><input class='datepicker "
								+ (((qc.getQuestionMandatory().toString())
										.equalsIgnoreCase("true")) ? "require"
										: "")
								+ "'  "
								+ readOnlyOrNot
								+ ""
								+ (readOnlyOrNot
										.equalsIgnoreCase("readonly") ? ""
										: " placeholder='dd/mm/yyyy'")
								+ " type='text' name='a' value='"
								+ date
								+ "'></li> </ul></div>";
					}

					if ((((qc.getQuestionAttachment()).toString())
							.equalsIgnoreCase("true"))) {
						LinkedList<String> imageNames = new LinkedList<String>();
						if (uploadedImagesInfoMap.get(qc.getQuestionId()) != null) {
							imageNames = uploadedImagesInfoMap.get(qc
									.getQuestionId());
						}

						if (status.equals("new")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'></div>";
						} else if (status.equals("saved")) {
							myContent += "<div class='TPRM_header "
									+ hiddenEl + "'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form><span class='dms_rem_img fl img_del' onclick='remImage(this);'></span> </div>";
							}
							myContent += "</div>";
						} else {
							myContent += "<div class='TPRM_header hidden'>";
							myContent += "<b class='dms_upload'>Upload</b></div>";
							myContent += "<div class='imagesName'>";
							if (imageNames != null) {
								myContent += "<form></form>";
								for (int s = 0; s < imageNames.size(); s++)
									//myContent+="<div><b>"+imageNames.get(s)+"</b><div>";
									myContent += "<div class='imageContent clearfix'><form name='tenantDms' id='tenantDms' action='./downloadUploadedDocument' method='get'><input class='qsstId hidden' name='entityKey' value='"
											+ questionnaireId
											+ "_"
											+ qc.getQuestionId()
											+ "' /><input name='imageName' class='hidden' value='"
											+ imageNames.get(s)
											+ "'><a class='imgName dwnldImg fl'>"
											+ imageNames.get(s)
											+ "</a><span class='fl'></span></form></div>";
							}
							myContent += "</div>";
						}
					}

					myContent += "</div></li>";
				}

				//System.out.println("html content "+myContent);

				sele = "";
				if (!questionTypeId.equals("0"))
					k++;
			}//outer for loop

			if (st == 10) {
				
				divContent += "<div class='tab_content questionContainer current' id='sectionTitle"
						+ st
						+ "' style='display: block;><ul class='questionn sortable'>"
						+ myContent + "</ul> <a id='next'>next</a><a id='prev'>prev</a></div>";
			} else {
				divContent += "<div class='tab_content questionContainer' id='sectionTitle"
						+ st
						+ "' style='display: none;><ul class='questionn sortable'>"
						+ myContent + "</ul><a id='next'>next</a><a id='prev'>prev</a></div>";

			}
			//System.out.println("Divistion Based Inner Content is:"+divContent); 

			st++;

		} // outer while loop related to Iterator

		//System.out.println("Section Name Based Li Content is:"+ sectionNameBasedLiContent);

		//System.out.println("Divistion Based Outer Content is:"+divContent);

		questionnaireDefId = retrieveQuestionnaireComponentsForSection.get(
				0).getQuestionnaireDefId();
		//System.out.println("questionnaireDefId121212121212121212121==="+questionnaireDefId);
		questionnaireId = retrieveQuestionnaireComponentsForSection.get(0)
				.getQuestionnaireId();
		//System.out.println("questionnaireId==="+questionnaireId);
	%>
	console.log("Content"+myContent);
	<%!Long questionnaireId;
	Long questionnaireDefId;%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="mainpanel">

		<div class="container">

			<div class="respHeader">
				<div class="Qheading"><%=questionnaireName%>
				</div>
				<div class="slider">
					<div class="sliderLeft">
						<c:choose>
							<c:when test="${defType == 'B'}">
								<span>Business Case completion</span>
							</c:when>
							<c:otherwise>
								<span>Questionnaire completion</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="sliderRight">
						<div class="statusBarWhite">
							<div class="statusBar"></div>
						</div>
					</div>
					<div class="toolTip">
						<div class="tooltipArrow"></div>
						<div class="tooltipInner">
							<span>0</span>% Complete
						</div>
					</div>
				</div>
			</div>

			<div class="containerPanel clearfix">
				<div class="setupQuestContainer clearfix">

					<form name="submitquestionnaire" id="submit-questionnaire"
						action="savequestionnairerespose" method="POST">
						<div class="questContainer">
							<div class="errorMsg status-warn" style="display: none">Please
								fill the mandatory questions.</div>
							<div class="duplicate status-warn" style="display: none">Please
								give different section name.</div>
							<!-- Dynamic Tabs -->
							<div class="questContainerTabs">
								<c:choose>
									<c:when test="${!empty businessCase}">
										<div class="qstDst">
											<table>
												<tbody>
													<tr>
														<td class="bleft">Business case name</td>
														<td class="bright">${questionnaireName}</td>
													</tr>
													<tr>
														<td class="bleft">Company's full legal name</td>
														<td class="bright">${legalNanme}</td>
													</tr>
													<tr>
														<td class="bleft">Approvers</td>
														<td class="bright">Approver 1, Approver 2</td>
													</tr>
													<%-- <tr>
							         <td class="bleft">Linked questionnaire</td>
							         <td class="bright">${linkedQuestionnaire}</td>
							       </tr> --%>
													<tr>
														<td class="bleft">Date Created</td>
														<td class="bright">${createDate}</td>
													</tr>
													<tr>
														<td class="bleft">Author</td>
														<td class="bright">${authorName}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</c:when>
								</c:choose>
								<ul class="quest-tabs">
									<li class="active tab blueprintTab hidden"><input
										class="sectionInput" /> <span class="deleteQst">+</span></li>

									<!-- <li class="active tab" data-link='sectionTitle10'>
                <input name="sectionTitle1051" id="sectionTitle1051" class="sectionInput"  placeholder="untitled"/>
                <span class="deleteQst">+</span>
            </li>  -->

									<!-- HERE IAM ADDING CODE RELATED TO MAINTAIN SECTIONS -->
									<c:choose>
										<c:when test="${empty businessCase}">
											<%
												out.println(sectionNameBasedLiContent);
											%>
										</c:when>
									</c:choose>

									<!-- HERE IAM ADDING CODE RELATED TO MAINTAIN SECTIONS -->
								</ul>
							</div>

							<%
								out.println(divContent);
							%>
							

							
							<!-- OUTPUT SHOULD BE DISPLAYED HERE -->

							<input type="hidden" name="qrdefid"
								value="<%=questionnaireDefId%>" /> <input type="hidden"
								name="qrid" class="qstDefId" value="<%=questionnaireId%>" /> <input
								type="hidden" name="qrbank" value="No" /> <input type="hidden"
								name="insertBank" value="">

							<%
								if(!(status.equalsIgnoreCase("submitted")) && session.getAttribute("userId")==responsibleUserName){
							%>
							<div class="btn-block">
								<!-- <button class="btn closer delete">Delete Questionnaire</button> -->
								<button class="btn fr saveAsDraft">Save as draft</button>
								<div class="btnRight">
									<button class="btn fr cancelDraft">Cancel</button>
									<button class="btn fr save">Submit</button>
								</div>
								<!-- <button class="btn fr preview">Preview</button> -->
							</div>

							<%
								}else{
							%>
							<div class="btn-block">
								<div class="btnRight">
									<button type="button" class="btn btn-xs" onclick="closeRes()">Close</button>
								</div>
							</div>
							<%
								}
							%>
							<input type='hidden' name='actionType' value='save'>
						</div>
					</form>
				</div>
			</div>

		</div>


		<div class="footer">Copyright © 2014 The Red Flag Group. All
			rights reserved.</div>

		<!-- mainpanel -->
		<div class="questPopup draftPopup">
			<ul>
				<li>Your answer have been saved<br> You have completed <span
					class="totalAns"></span> out of <span class="totalQuest"></span>
					questions
				</li>
				<li><button type="button" class="btn btn-xs closePopup"
						name="yes">Ok</button>
			</ul>
		</div>

		<div class="questPopup savePopup">
			<ul>
				<li class="savedText">Your answer for &lsquo;<%=questionnaireName%>&rsquo;
					has been submitted successfully. Thank You!
				</li>
				<li><button type="button" class="btn btn-xs closePopup"
						name="yes">Ok</button>
			</ul>
		</div>

		<div class="dms_upload_popup" style="padding: 15px 15px 25px;">
			<div id="errMsgSubmit" class="errMsgSubmit"></div>
			<!-- 			<h2 class="dms_popup_heading">Upload</h2> -->
			<!--<span class="dms_upload_close_popup"></span>-->
			<div class="clr"></div>
			<form action="./uploadMultipleFile" class="uploadQuestionnairePhoto"
				method="post" enctype="multipart/form-data" target="falseFrame">
				<input type="hidden" name="moduleName" value="Questionnaire">
				<input type="hidden" name="moduleId" value="1">
				<div class="uploadErrorMsg"></div>
				<div class="file_for_upload"></div>
				<!-- <div class="">Add another file</div>-->
				<div class="clr"></div>
				<button type="submit" value="Upload"
					class="btn btn-sm dms_upload_btn">Upload</button>
				<input name="QuestionnaireIdPlusQuestionId"
					id="questionnaireid_questionid" type="text"
					class="hidden qstDefIdHidden" />
				<!-- <input type="text" class="hidden moduleName" value="Questionnaire"/>  -->
			</form>
			<iframe name="falseFrame" id="falseFrame" height="0" width="0"
				style="display: none"></iframe>
			<button class="btn btn-sm dms_upload_cancel_popup_btn">Cancel</button>
		</div>

		<div class="dms_overlay"></div>

		<div class="popupBg"></div>

		<form name="branch">
			<input type="hidden" name="brId">
		</form>
		<script>
             var jsonOutput = '${JSON}';
        </script>

		<script src="js/jquery-1.10.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery-ui-1.11.0.min.js"></script>

		<script
			src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
		<script src="${pageContext.request.contextPath}/js/qstDistribution.js"></script>




		<script> 
   
   
            
   $('#submit-questionnaire').on('click', '.save' , function(e) {
	   
			if (jQuery('.questionContainer').find('.ui-draggable').length == 0) {
				if(global < 1 )	
			           return false;
		         
		       }
		       
		       var len = jQuery('.questContainer').find('.require').length, value = 0;

		       jQuery('.questContainer').find('.require').each(function (index) {
		           if (jQuery(this).val() == '' && jQuery(this).closest('.ui-widget-content').hasClass('hidden') == false && jQuery(this).closest('.ui-widget-content').hasClass('skipVal') == false) {
		               jQuery(this).closest('.boxContainer').find('.q').addClass('errorInput');
		               return;
		           }
		           else {
		        	   console.log('contains value');
		        	   jQuery(this).closest('.boxContainer').find('.q').removeClass('errorInput');
		               --len;
		           }
		       });
		     //  ////alert("2");
		               
		       var lenSel = jQuery('.questContainer').find('.requireSelect').length;
		       
		       jQuery('.questContainer').find('.requireSelect').each(function (index) {
		           if (jQuery('.questionContainer .requireSelect')[index].selectedIndex == 0 && jQuery(this).closest('.ui-widget-content').hasClass('hidden') == false && jQuery(this).closest('.ui-widget-content').hasClass('skipVal') == false) {
		        	   jQuery('.questionContainer .requireSelect').eq(index).closest('.boxContainer').find('.q').addClass('errorInput');
		           }
		           else {
		        	  // jQuery('.questionContainer .requireSelect').eq(index).closest('.boxContainer').find('.q').addClass('errorInput');
		              jQuery(this).closest('.boxContainer').find('.q').removeClass('errorInput');
		        	  --lenSel;
		           }
		       });
		       //alert("Len : " + len + "Sel : " + lenSel);
		       
		       var check = jQuery('.questContainer').find('.requireRadioCheck').length;
		       
		       jQuery('.questContainer').find('.requireRadioCheck').each(function(index) {
		    	   var checked = false;
		    	   jQuery(this).closest('.boxContainer').find('.rRequire').each(function() {
		    		  if(jQuery(this).is(':checked')) {
		    			  --check;
		    			  checked = true;
		    			  return;
		    		  }
		    	  });
		    	   
		    	   if(checked == false && jQuery(this).closest('.ui-widget-content').hasClass('hidden') == false && jQuery(this).closest('.ui-widget-content').hasClass('skipVal') == false) {
		    		   jQuery(this).addClass('errorInput');
		    	   }
		    	   else {
		    		   jQuery(this).removeClass('errorInput');
		    	   }
		       });
		      		       
		       var saveData = jQuery('.questionContainer').find('.errorInput').length;
		       
		       
		       if (saveData > 0) {	   
		        	jQuery('.errorMsg').show();
		            return false;
		       }
		       else {
		    	   
			       $('.savePopup, .popupBg').show();
			       $('.errorMsg').hide();
			       //return false;
			       e.stopPropagation();
		    	   e.preventDefault();
		     
		       $('.savePopup').on('click','.closePopup', function(e) {
		    	      document.submitquestionnaire.actionType.value='submit';
			    	  document.submitquestionnaire.submit();   
			       }); 
		       }



			
	   });
   
   $('.questContainer').on('click', '.deleteQst', function(){
   	var els = $(this).closest('li').attr('data-link');
   	$(this).closest('li').remove();
   	$('#' + els).remove();
   });

   jQuery('.questContainer').on('click', '.mc-dropdown-select',function(){
	   jQuery(this).toggleClass('toggle').next('.mc_dd_opt').toggleClass('hide');
	  
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
   
   
/*    
   //Auto Save
   setTimeout(function(){jQuery('.save').trigger('click');}, 10000); */
   
   
		$('.setupQuestContainer').on('click', '.qt_add', function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).closest('.qt_multiTxtBox_row').clone().find('.qt_ansOpt').val('').end().find('.qt_remove').removeClass('hidden').end().appendTo($(this).closest('ol'));
		});
   
        $('.setupQuestContainer').on('click', '.qt_remove', function(e) {
        	e.stopPropagation();
			e.preventDefault();
			$(this).closest('.qt_multiTxtBox_row').remove();
        });


		  function closeRes()
		  {
			 history.back();
		}

		  //Allow only numeric values
		    jQuery(document).on('keypress focus','input.col4, input.qt_score',function (e) {
		                var key = window.e ? e.keyCode : e.which;
		                if (e.keyCode == 8 ||e.keyCode == 0) {
		                   return true;
		                         }
		                else if ( key < 48 || key > 57 ) {                              
		                    return false;
		                }
		                else return true;
		             });  


		    jQuery(document).ready(function() {
            	/* The below jquery code for delete operation */
            	
            	var documentNameValue;
            	var moduleName;
            	jQuery(".dms_delete_btn").on("click", function(){
            		jQuery("div.dms_delete_popup_confirmation").show();
            		jQuery("div.dms_overlay").show();
            		
            		dmsRowId = jQuery(this).closest("tr").attr("id");
            	    documentNameValue=jQuery(this).closest("tr").attr("name");
            		rowFileName = jQuery(this).closest("tr").find("td.sorting_1").html(),
            		rowFileExt = jQuery(this).closest("tr").find("td.sorting_1").next().html();
            		moduleName = jQuery(this).parents("tr").find("td:nth-child(3)").text();
            		
            		//console.log("moduleName "+moduleName);
            		document.tenantDms.dmsPath.value = rowPath;
            		document.tenantDms.rowFileName.value = rowFileName;
            		document.tenantDms.rowFileExt.value = rowFileExt;
            		
            	});

            	/*Below jquery method for delete selected document*/
            	jQuery(".dms_delete_conf_btn").on("click",function(){
            		
            		
            		document.tenantDms.action= "./dmsDeleteVersion?checkedDocName="+dmsRowId+"&rowFileName="+rowFileName+"&rowFileExt="+rowFileExt+"&documentNameValue="+documentNameValue;
            		document.tenantDms.submit();
            	});

            	/*Below jquery method for upload operation*/
            	jQuery(document).on("click", ".dms_upload", function(){
            		
            			
            		
            		append_img = jQuery(this).parent('.TPRM_header').next('.imagesName');
            		
            		jQuery(".dms_upload_popup").show();
            		jQuery("div.dms_overlay").show();
            		
            		jQuery(".browseFile").prop("disabled", true).addClass("addFileDisable");
            		jQuery(".dms_upload_btn").prop("disabled", true);
            		var defId = jQuery('.qstDefId').val() + "_" + jQuery(this).closest('.ui-draggable').find('.qIds').val();
            		questionId = jQuery(this).parents('.boxContainer').find('.clearfix').find('.qIds').val();
            		jQuery('.qstDefIdHidden').val(defId);
            		jQuery('.moduleName').val("questionnaire");
            		jQuery(".file_for_upload").html("");
            		jQuery(".file_for_upload").prepend("<div class='files'><input class='file_uploaded' id='file_id' type='file' name='fileUpload'/></div>");
  //          		alert("In JQuery Function");
            		
            	});
            	
            	
            	var validExtensions = {
            			tiff:true,
            			gif:true,
            			bpm:true,
            			jpeg:true,
            			mpt:true,
            			mpp:true,
            			vtx:true,
            			vsx:true,
            			vdx:true,
            			vst:true,
            			vss:true,
            			vsd:true,
            			ppsm:true,
            			ppsx:true,
            			potm:true,
            			potx:true,
            			pptm:true,
            			pps:true,
            			xltm:true,
            			xltx:true,
            			xlsm:true,
            			csv:true,
            			dotm:true,
            			dotx:true,
            			docm:true,
            			pdf:true,
        				exe: false,
        				bss: false,
        				sys: false,
        				zip: false,
        				"7z": false,
        				jar: false,
        				rar: false,
        				tar: false,
        				gz: false,
        				tgz: false,
        				tar: false,
        				Z: false,
        				tlz: false,
        				war: false,
        				zipx: false,
        				zz: false,
        				"3g2": false,
        				"3gp": false,
        				asf: false,
        				avi: true,
        				drc: false,
        				flv: true,
        				m4v: false,
        				mkv: true,
        				mng: false,
        				mov: false,
        				qt: false,
        				mp4: true,
        				m4p: false,
        				m4v: false,
        				mpg: false,
        				mp2: false,
        				mpeg: false,
        				mpe: false,
        				mpv: false,        				
        				m2v: false,
        				mxf: false,
        				nsv: false,
        				rm: false,
        				rmvb: false,
        				roq: false,
        				svi: false,
        				webm: true,
        				wmv: true,
        				yuv: false,
        				aac: false,
        				act: false,
        				aiff: false,
        				amr: false,
        				au: false,
        				awb: false,
        				dct: false,
        				dss: false,
        				dvf: false,
        				flac: false,
        				gsm: false,
        				iklax: false,
        				ivs: false,
        				m4a: false,
        				m4p: false,
        				mmf: false,
        				mp3: false,
        				mpc: false,
        				msv: false,
        				ogg: false,
        				oga: false,
        				opus: false,
        				ra: false,
        				rm: false,
        				raw: false,
        				sln: false,
        				tta: false,
        				vox: false,
        				wav: false,
        				wma: false,
        				wv: false,
        				jpg:true,
        				doc:true,
        				ppt:true,
        				xls:true,
        				pptx:true,
        				docx:true,
        				xlsx:true,
        				txt:false,
        				rtf:false,
        				png:true
        			};
            	
				jQuery(document).on("change",".file_uploaded", function(){
					
					
					var file_name = jQuery(this).val();
					var img_name = file_name.substring(file_name.lastIndexOf('\\')+1,file_name.length);
					var file_size = (jQuery(this)[0].files[0].size / 1048576);
					var filesdiv = jQuery("<div class='files'><p class='files_p'><a>"+img_name+"</a><input type='hidden' class='file_size_val' value='"+file_size+"' /><span class='remove_file'>Remove</span></p></div>")
					
					//alert(file_size / 1024);
					if(validExtensions[img_name.substr(img_name.lastIndexOf('.')+1)])
						{
	//					console.log("Selected File is Less Than 15 MB")
						filesdiv.append(jQuery("#file_id").removeAttr("id").addClass("hidden"));
						jQuery(".file_for_upload").append(filesdiv);
						jQuery(".files").eq(0).append("<input class='file_uploaded' id='file_id' type='file' name='fileUpload'/>");
						
						}
					else{
	//					alert("Please choose a file less than 15 MB");
						jQuery(".file_for_upload").append("<div class='files'><input class='file_uploaded' id='file_id' type='file' name='fileUpload'/></div>");
						jQuery(this).val("");
						jQuery(".uploadErrorMsg").show();
        				jQuery(".uploadErrorMsg").html("Can not upload " + img_name.substr(img_name.lastIndexOf('.')+1) + " file");
					}
					//jQuery("#file_id").val("");
					//jQuery(this).val("");
					
					
            			console.log("File Name Uploaded is:"+img_name);
            			console.log("Extension Value is:"+img_name.substr(img_name.lastIndexOf('.')+1));
            			console.log('file extension boolean'+ validExtensions[img_name.substr(img_name.lastIndexOf('.')+1)]);
            			/* if (!validExtensions[img_name.substr(img_name.lastIndexOf('.')+1)]) {
            				jQuery(this).val("");
            				//console.log("%c Can not upload " + filename.substr(filename.lastIndexOf('.')+1) + " file ", "background:yellow; border-radius:20px; color: #f00; font-size:30px;");
            				jQuery(".uploadErrorMsg").show();
            				jQuery(".uploadErrorMsg").html("Can not upload " + img_name.substr(img_name.lastIndexOf('.')+1) + " file");
            				
            			} */
					
					
				})
				jQuery(document).on("click", ".dms_upload_btn", function(){
					
					
				/*jQuery(this).prevAll(".file_for_upload").find(".files_p").each(function(){
					console.log(jQuery(this).find("a").text().length)
						if(jQuery(this).find("a").text().length > 30)
						{
						console.log('greater')
						jQuery(".imgName").css('width','40%');
						}
				})*/
				});
					
				
										
				
            	jQuery(document).on("click", ".browseFile", function(){
            		//alert('hi')
            		jQuery(".dms_upload_btn").prop("disabled", true);
            		var fileValue = jQuery("div.files input").val();
            		console.log(fileValue +"_file value")
            		if(fileValue == ""){
            			jQuery(".uploadErrorMsg").show();
            			jQuery(".uploadErrorMsg").html("Please select the file first");
            		}else{
            			jQuery(".uploadErrorMsg").hide();
            			jQuery(".file_for_upload").prepend("<div class='files'><input type='file' name='fileUpload'/><span class='remove_file'></span> </div>");
            			//jQuery(".file_for_upload .files").prepend("");
            			
            		}
            	});

            	jQuery(document).on("change", "div.files input", function(){
            		if(jQuery(this).val() ==  ""){
            			jQuery(".browseFile").prop("disabled", true).addClass("addFileDisable");
            			jQuery(".dms_upload_btn").prop("disabled", true);
            			jQuery(".uploadErrorMsg").show();
            		}else{
            			jQuery(".uploadErrorMsg").hide();
            			jQuery(".browseFile").prop("disabled", false).removeClass("addFileDisable");
            			jQuery(".dms_upload_btn").prop("disabled", false);
            		}

            			
            			
            	});

            	jQuery(".dms_upload_close_popup, .dms_upload_cancel_popup_btn").on("click", function(){
            		jQuery(this).closest("div.dms_upload_popup").hide();
            		jQuery("div.dms_overlay").hide();
            		jQuery(".file_for_upload").html("");
            		jQuery(".uploadErrorMsg").hide();
            	});

            	jQuery(document).on("click", ".remove_file", function(){
            		jQuery(this).closest(".files").remove();
            		jQuery(".dms_upload_btn").prop("disabled", false);
            		jQuery(".uploadErrorMsg").hide();
            		
            		if(jQuery(".remove_file").length == 0)
            			{
            			jQuery(".dms_upload_btn").prop("disabled", true);
            			jQuery(".browseFile").removeClass('addFileDisable');
            			jQuery(".browseFile").prop("disabled", false);
            			
            			}
            	});           

				jQuery(".uploadQuestionnairePhoto").submit(function(e){
					
					var total_size = 0;
					jQuery('.file_size_val').each(function(){
						console.log("Each File Size is:"+ jQuery(this).val())
						total_size+=parseInt(jQuery(this).val())
						
					})
					console.log("Total Size is :"+total_size)
					if(total_size > 50){
						jQuery(".uploadErrorMsg").show();
        				jQuery(".uploadErrorMsg").html("File(s) Size Exceeded Limit");
						
						return false
					}
					else{
						
						jQuery(".uploadErrorMsg").hide();
					}
	//				alert("In Upload Method");
					jQuery(".files").eq(0).remove();
					var fileValue = jQuery("div.files .file_uploaded").val();
					 // console.log(fileValue) 
            		//if(fileValue == ""){
            			//jQuery(".uploadErrorMsg").show();
            			//jQuery(".uploadErrorMsg").html("Please select the file first");
            			//return false;
            	//	}
            		
            		var arr = [];
            		jQuery(".file_for_upload .files .file_uploaded").each(function(){            			
            			
							arr.push(jQuery(this).val());           			
            			
            		});
            		
            		//console.log("arr" + arr);
            		
            		var sortArray = arr.sort();
					var index_name_arr = [];
					var result = [];
					
					var uploaded_imgs = [];
					jQuery(append_img).find('.imgName').each(function(){
						
						uploaded_imgs.push(jQuery(this).text().replace(/ *\([^)]*\) */g, ""));
						
					});
				
					
					//console.log(uploaded_imgs+"_oldImgs")
					//console.log(uploaded_imgs[0]+"_1st")
            		//console.log(sortArray.length+"_sortArray");
            		
             		for(var i=0; i< sortArray.length; i++) {
						  
                		  var indexNameArr = sortArray[i].substring(sortArray[i].lastIndexOf('\\')+1,sortArray[i].length);
						  
						  index_name_arr.push(indexNameArr)
             		}
             		if(uploaded_imgs.length > 0)
             			{
             			index_name_arr = index_name_arr.concat(uploaded_imgs);
             			index_name_arr.sort();
             			}
             		
						  //console.log(index_name_arr.length+"_arrary")
						  for ( var j = 0; j < index_name_arr.length; j++ ) {
							  
  						  		var word = index_name_arr[j], int = 1;
  								while ( strArr(word, result) >= 0 ) 
								word = (index_name_arr[j].substr(0,index_name_arr[j].indexOf(".")) + "(" + int++ +")")+(index_name_arr[j].substr(index_name_arr[j].indexOf(".")))
  								
								result.push(word);
  								//console.log(word+"word")
  								//console.log(result+"_result")
								}
							function strArr(s,a){
 						 for ( var k = 0; k < a.length; k++ )
    					if ( a[ k ] == s ) return k;
  						return -1;
								}
						  
                		// console.log(indexName);
                		//  console.log(jQuery(this).closest('.ui-widget-content').html());

                		  
       jQuery(append_img).empty();           	
	for(var m=0;m<result.length;m++){	
		console.log(result+"_final")
		
 jQuery(append_img).append(jQuery('<div class="imageContent clearfix"><form name="tenantDms" id="tenantDms" action="./downloadUploadedDocument" method="get"><input type="text" class="qsstId hidden" name="entityKey" value="' + jQuery('.qstDefId').val() + "_"+ questionId + '" /><input type="text" name="imageName" class="hidden" value="'  + result[m] + '"><a class="imgName dwnldImg fl">'+ result[m] +'</a><span class=" fl"></span></form><span class="dms_rem_img fl img_del" onclick="remImage(this);"></span> </div>'));

	}
	     		
            	/*	var arrDuplicate = [];
            		for (var i = 0; i < sortArray.length - 1; i++) {
            			if (sortArray[i + 1] == sortArray[i]) {
            				arrDuplicate.push(sortArray[i]);
            			}
            		} */
            		
            		jQuery('.dms_upload_popup, .dms_overlay').hide();
            		
            		/*if(arrDuplicate.length === 0){
            			
            			return true;
            		}else{
            			jQuery(".uploadErrorMsg").html("Can't select same file");
            			jQuery(".uploadErrorMsg").show();
            			return false;
            		} */
            		
					
				});

             }); 
		    
		    function downloadImage(obj){
		    	
		    	var QuestionnaireId = jQuery('.qstDefId').val();
		//    	alert("QuestionnaireId:"+QuestionnaireId);
		    	
		    	var imageName = jQuery(obj).prev('.imgName').text();
		    	console.log(QuestionnaireId);
		    //	alert(questionId);
		    	console.log(questionId);
		    	jQuery.ajax({
		    		url: "./downloadUploadedDocument",
		    		contentType: "image/jpeg",
		    		data: {questionID:QuestionnaireId+"_"+questionId,imageName:imageName},
		    		success:function(data){
		    			console.log("DATA CAME FROM CONTROLLER IS:"+data);
		    		}
		    	});
		    }
			function remImage(obj){
		    	var moduleName;
		    	var QuestionnaireId = jQuery('.qstDefId').val();		    	
		    	var imageName = jQuery(obj).prev('form').find('.imgName').text();
		    	console.log(imageName)
		    	var questionDelId = jQuery(obj).parents('.boxContainer').find('.clearfix').find('.qIds').val();
		    	console.log(QuestionnaireId);
		    	moduleName = jQuery(obj).parents("tr").find("td:nth-child(3)").text();
		    	//alert(moduleName);
		 //   	alert(questionId);
		    	console.log(questionDelId);
		    	jQuery.ajax({
		    		url: "./deleteUploadedDocument",
		    		contentType: "text/plain",
		    		data: {entityKey:QuestionnaireId+"_"+questionDelId,imageName:imageName,moduleName:moduleName},
		    		success:function(response){
		    			console.log('deleted');
		    			jQuery(obj).parents('.imageContent').remove();
		    		}
		    	});
		    }      
 
 /* For download below jquery used */
	jQuery("body").on("click",'.dwnldImg', function(){
		jQuery(this).closest('form').submit();
	});
 
	jQuery('.cancelDraft').on('click', function(e) {
		//history.back(); commented according to the discussion with Sridhar
		 e.preventDefault();
		 document.location.href="/partnerintegrity/myactivities";
	 });

	jQuery(document).on("change", "select", function(){
		jQuery(this).next().html(jQuery(this).find('option:selected').text());
	});

         
   
</script>

 <script type="text/javascript">

jQuery(document).ready(function(){
	jQuery(".tab_content li").each(function(e) {
        if (e != 0)
        	jQuery(this).hide();
    });
	var a = jQuery(".tab_content").length;
    console.log("Legth of divs"+a);
	jQuery("#next").click(function(){
		console.log("next clicked");
        if (jQuery(".tab_content li:visible").next().length != 0)
        	jQuery(".tab_content li:visible").next().show().prev().hide();
        else {
        	jQuery(".tab_content li:visible").hide();
        	jQuery(".tab_content li:first").show();
        }
        return false;
    });

	jQuery("#prev").click(function(){
		console.log("previous clicked");
        if (jQuery(".tab_content li:visible").prev().length != 0)
        	jQuery(".tab_content li:visible").prev().show().next().hide();
        else {
        	jQuery(".tab_content li:visible").hide();
        	jQuery(".tab_content li:last").show();
        }
        return false;
    });
});



</script> -->

		<!-- the jScrollPane script -->
</body>
</html>
