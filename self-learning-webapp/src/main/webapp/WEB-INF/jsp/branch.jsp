<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="com.rfg.tprm.questionnaire.model.QuestionComponent" %>
<%@ page import="com.rfg.tprm.questionnaire.model.MyPojo" %>
<%@ page import="com.rfg.tprm.questionnaire.model.RecordPojo" %>
<%@ page import="com.rfg.tprm.questionnaire.service.BranchingValue" %>
<%@ page import="com.rfg.tprm.questionnaire.service.BranchingPojo" %>
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
<link href="css/common.css" rel="stylesheet">

<link rel="stylesheet" href="css/questionnaire.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-switch.min.css">
<link href="css/main.css" rel="stylesheet">
<link href="css/branching.css" rel="stylesheet">
<link href="css/tprmDT.css" rel="stylesheet" />
<!-- http://jscrollpane.kelvinluck.com/ -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
  .deletedId { display: none;}
</style>
</head>
<body>
<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>




<jsp:include page="header.jsp" />
			
		<!-- headerbar -->
		
<div class="clearfix"></div>		
		
		

<div class="contentPanelContainer contentPanelTop">
  <div class="questHeader clearfix">
  <h1 class="title"><%= ((java.lang.String)session.getAttribute("QuestionnaireName"))%></h1>
  <%
  String message = "";
  
  message = (String) request.getAttribute("Message");
  
  //System.out.println("Message Value Came From Controller is:"+message);
    if(message != null){
    	out.println("<div align='center'><h2>"+message+"</h2></div>"); 
     }
  %>
  </div>
  <div class="setupQuestContainer clearfix">
  <div class="col-md-4 mt">
  <%
  //System.out.println("Scriptlet Starts");
  
  TreeMap<String,Short> tagNamesOrderMap = new TreeMap<String,Short>();
  
  tagNamesOrderMap = (TreeMap<String,Short>)session.getAttribute("AllTagNamesRelatedOrder");
  
  List<QuestionComponent> branchedQuestionComponents = new LinkedList<QuestionComponent>();
  
  if(session.getAttribute("BRANCHED QUESTIONS")!=null){
  branchedQuestionComponents = (List<QuestionComponent>)session.getAttribute("BRANCHED QUESTIONS");
  }
  
  RecordPojo recordPojo = new RecordPojo();
  
if(session.getAttribute("ExistedBranchingInfo")!=null){
	recordPojo = (RecordPojo)session.getAttribute("ExistedBranchingInfo");
}

	BranchingPojo branchingPojo = new BranchingPojo();	

	LinkedHashMap<String,LinkedList<BranchingValue>> branchingMap = new LinkedHashMap<String,LinkedList<BranchingValue>>();
	
	if(session.getAttribute("ExistedBranchingInfoWithGrouping")!=null){
		
	branchingPojo = (BranchingPojo)session.getAttribute("ExistedBranchingInfoWithGrouping");
			
	}

	String selectedTag = "";
	
	if(session.getAttribute("SelectedTag")!=null)
		  selectedTag = (java.lang.String)session.getAttribute("SelectedTag");
  
	//System.out.println("SelectedTagName Selected From branching.jsp is:"+selectedTag);
	
  String leftTagName = "";
  
  if(session.getAttribute("LeftTagName")!=null){
  leftTagName = (java.lang.String)session.getAttribute("LeftTagName");
  System.out.println("Previous Selected LeftTagName Value is:"+leftTagName);
  }
  
  //System.out.println("LeftTagName Selected From branching.jsp is:"+leftTagName);
 
  //System.out.println("Size of QuestionComponents List:"+branchedQuestionComponents.size()); 
  //System.out.println("Scriptlet Next");
  List<String> tagNames = new ArrayList<String>();
  for(QuestionComponent qcc:branchedQuestionComponents){
	  //System.out.println("Question Tag:"+qcc.getQuestionTag());
	  //System.out.println("Question Tag"+qcc.getQuestionTag()+"Question Type Id is:"+qcc.getQuestionTypeId());
	  if(!(qcc.getQuestionTypeId() == 4) && !(qcc.getQuestionTypeId() == 3)){
		  
	  tagNames.add(qcc.getQuestionTag());
	  }
  }
 System.out.println("TagNames List Size :"+tagNames.size());
 System.out.println("TagNames List is :"+tagNames);
  
  int tagNamesSize = tagNames.size();
  
  /* FROM HERE CODE IS DIFFERENT FROM BRANCHING.JSP */
  
 // MyPojo my = (MyPojo) request.getAttribute("new");
  
  MyPojo my = (MyPojo) session.getAttribute("new");
  String questionText = (my.getQuestionText()!=null?my.getQuestionText():"");
  //System.out.println("Question Text Came From Branch JSP of MyPOJO : "+(my.getQuestionText()!=null?my.getQuestionText():""));
  String myContent = "";
  
  
 /*  myContent += "<div class='body branching'><div class='data answer-option'>"+(my.getAnswerOptionValue()).get(0)+"</div><div class='data skip'><input type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select class='customSelect'><option>Select Target</option><option>"+(my.getQuestionTagNames()).get(0)+"</option><option>"+(my.getQuestionTagNames()).get(1)+"</option><option>"+(my.getQuestionTagNames()).get(2)+"</option></select></div><div class='data mandatory'> <input type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment customInput customCheckBox'><input id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div>";

  myContent += "<div class='body branching'><div class='data answer-option'>"+(my.getAnswerOptionValue()).get(1)+"</div><div class='data skip'><input type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select class='customSelect'><option>Select Target</option><option>"+(my.getQuestionTagNames()).get(0)+"</option><option>"+(my.getQuestionTagNames()).get(1)+"</option><option>"+(my.getQuestionTagNames()).get(2)+"</option></select></div><div class='data mandatory'> <input type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment customInput customCheckBox'><input id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div>";
   */
   
    //System.out.println("AnswerOptionIds Displaying is JSP are:");
   
   //System.out.println("AnswerOptionIds List Size in MyPojo is:"+(my.getAnswerOptionIds()).size());
   
   
   //System.out.println("Question Tag Names List Size in JJJJJSSSSSSPPPPPP is:"+(my.getQuestionTagNames()).size());
       
  /*  for(int i=0;i<((my.getAnswerOptionIds()).size());i++){
	  //System.out.println("AOID :"+((my.getAnswerOptionIds()).get(i))); 
   }  */
   
   List<String> allTagNames = (List<String>)session.getAttribute("AllTagNames");
   
   System.out.println("All Tag Names Came From Controller are :"+allTagNames);
   
  /*  for(String s:allTagNames){
	   //System.out.println("All Tag Names Came From Controller are:"+s);
   } */
   
   String mySelect[] = new String[allTagNames.size()];
   
   String forwardNonBranchingTagNamesArray[] = new String[allTagNames.size()];
   
   String forwarddNonBranchingTagNamesString = "";
   
   String forwardBranchingTagNamesArray[] = new String[allTagNames.size()];  
   
   
  for(int i = 0;i<allTagNames.size();i++){
if(!allTagNames.get(i).equals("")&& !allTagNames.get(i).equals(leftTagName)){
//	if(!allTagNames.get(i).equals(null))
	if(tagNamesOrderMap.get(allTagNames.get(i)) > tagNamesOrderMap.get(leftTagName))
		mySelect[i] = "<option>"+allTagNames.get(i)+"</option>";
}
  }  
  System.out.println("MySelect Array is :"+Arrays.deepToString(mySelect));
  for(int i = 0;i<allTagNames.size();i++){
	  if(!allTagNames.get(i).equals("")&& !allTagNames.get(i).equals(leftTagName)){
//	  	if(!allTagNames.get(i).equals(null))
	  forwardNonBranchingTagNamesArray[i] = "<option>"+allTagNames.get(i)+"</option>";
	  }
 }  
  System.out.println("Forward Non-Branching TagNames Array is : "+Arrays.deepToString(forwardNonBranchingTagNamesArray));
  for(int j = 0;j<forwardNonBranchingTagNamesArray.length;j++){
	   //System.out.println("Dynamic Option Values are :"+mySelect[j]);
	   System.out.println("Actual Chosen LeftTagName is : "+leftTagName);
	   System.out.println("LeftTagName Order is:"+tagNamesOrderMap.get(leftTagName));
	   System.out.println("Current TagName Option Forming is :"+allTagNames.get(j));
	   System.out.println("Current TagName Option Order is :"+ tagNamesOrderMap.get(allTagNames.get(j)));
	   if(tagNamesOrderMap.get(allTagNames.get(j)) > tagNamesOrderMap.get(leftTagName))
	   forwarddNonBranchingTagNamesString += forwardNonBranchingTagNamesArray[j];
	   }
  System.out.println("Forward Non-Branching TagNames String is : "+forwarddNonBranchingTagNamesString);
  
	String select = "";
   for(int j = 0;j<mySelect.length;j++){
   //System.out.println("Dynamic Option Values are :"+mySelect[j]);
   select += mySelect[j];
   
   }
   System.out.println("Select Array is :"+(select).toString());
//   String previousSelected = "";
 //  for(int j = 0;j<mySelect.length;j++){
//	   System.out.println("Dynamic Option Values are :"+mySelect[j]);
//	   previousSelected += mySelect[j];
//	   }
   
   
   
   //System.out.println("Final Select is:"+select);
    
   
   
 
	  
	// select = "<select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' class='customSelect'><option value='Select Target' onchange=''>Select Target</option>";
	 
	
	  
	  //TO BE OBSERVED HERE
	  
	  // THIS IS PREVIOUS OUTPUT WITHOUT HAVING PREVIOUS BRANCHING INFORMATION
	  
 /*	  if(my.getQuestionTypeId() == 1 || my.getQuestionTypeId() == 2 || my.getQuestionTypeId() == 11 || my.getQuestionTypeId() == 12){
		  System.out.println("Hai");
	  }
	  int temp = 0;
		 if(my.getQuestionTypeId() == 3 || my.getQuestionTypeId() == 4){
			 temp = 0;
			  System.out.println("Hai");
			  temp++;
		  } 
		 
	myContent += "<form action='./saveinbranchtable' class='branchform' method='post' name = 'branch'>";
		 
	 for(int i = temp; i < (my.getAnswerOptionValue()).size() ; i++){ */
		 
		// THIS IS PREVIOUS OUTPUT WITHOUT HAVING PREVIOUS BRANCHING INFORMATION
			
		 /* myContent += "<form class='branchform'action='./saveinbranchtable' method='post'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'>"+(my.getAnswerOptionValue()).get(i)+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' class='customSelect'><option value='Select Target' onchange=''>Select Target</option><option value='"+(my.getQuestionTagNames()).get(0)+"'>"+(my.getQuestionTagNames()).get(0)+"</option><option value='"+(my.getQuestionTagNames()).get(1)+"'>"+(my.getQuestionTagNames()).get(1)+"</option><option value='"+(my.getQuestionTagNames()).get(2)+"'>"+(my.getQuestionTagNames()).get(2)+"</option></select></div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment customInput customCheckBox'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'>"+(my.getAnswerOptionValue()).get(i)+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' class='customSelect'><option>Select Target</option><option>"+(my.getQuestionTagNames()).get(0)+"</option><option>"+(my.getQuestionTagNames()).get(1)+"</option><option>"+(my.getQuestionTagNames()).get(2)+"</option><option>"+(my.getQuestionTagNames()).get(3)+"</option></select></div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment customInput customCheckBox'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>"; */
				  
	    /*  myContent += "<form class='branchform'action='./saveinbranchtable' method='post'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'>"+(my.getAnswerOptionValue()).get(i)+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' class='customSelect'><option value='Select Target' onchange=''>Select Target</option>"+select+"</div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment customInput customCheckBox'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'>"+(my.getAnswerOptionValue()).get(i)+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' class='customSelect'><option>Select Target</option><option>"+(my.getQuestionTagNames()).get(0)+"</option><option>"+(my.getQuestionTagNames()).get(1)+"</option><option>"+(my.getQuestionTagNames()).get(2)+"</option><option>"+(my.getQuestionTagNames()).get(3)+"</option></select></div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment customInput customCheckBox'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";*/
	    
	    /* THIS IS FOR BACK UP*/		
	    /*myContent += "<form class='branchform'action='./saveinbranchtable' method='post'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'>"+((my.getAnswerOptionValue()).get(i)!=null?(my.getAnswerOptionValue()).get(i):"")+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' ><option value='Select Target' onchange=''>Select Target</option>"+select+"</div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'>"+(my.getAnswerOptionValue()).get(i)+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option value='Select Target' onchange=''>Select Target</option>"+select+"<div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";*/
	    /* THIS IS FOR SECOND BACK UP*/
	    		/*myContent += "<form class='branchform'action='./saveinbranchtable' method='post'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'>"+((my.getAnswerOptionValue()).get(i)!=null?(my.getAnswerOptionValue()).get(i):"")+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' ><option value='Select Target' onchange=''>Select Target</option>"+select+"</select></div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch' value='off'></div><div class='data attachment'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'>"+(my.getAnswerOptionValue()).get(i)+"</div><div class='data skip'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option value='Select Target' onchange=''>Select Target</option>"+select+"</select></div><div class='data mandatory'> <input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' data-off-text='off' data-on-text='on'  data-size='large' class='switch'></div><div class='data attachment'><input name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attach")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' id='question' type='checkbox' name='attachment1'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";*/
	   /* myContent +="<form action='./saveinbranchtable' class='branchform' method='post'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+((my.getAnswerOptionValue()).get(i)!=null?(my.getAnswerOptionValue()).get(i):"")+" </div><div class='data skip'><input type='hidden' class='check' name='skip' value='false'/><input value='false' class='switch' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><input type='hidden' class='check' name='mandatory' value='false'/><input value='false' class='switch' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox'></div><div class='data attachment'><input id='question' name='attachment1' type='checkbox'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+(my.getAnswerOptionValue()).get(i)+" </div><div class='data skip'><input type='hidden' class='check' name='skip' value='false'/><input class='switch' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='0'><input class='switch'  name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' value='0'></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option></select></div><div class='data mandatory'><input class='switch' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='0'><input class='switch' data-off-text='off' data-on-text='on' data-size='large' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox' value='1'></div><div class='data attachment'><input id='question' name='attachment1' type='checkbox'><label for='question'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";*/
			   /*BACK UP HAVING ATTACHMENT NAME WITH DYNAMIC GENERATED VALUES BUT CODE NOT DONE*/
		/* myContent += "<form action='./saveinbranchtable' class='branchform' method='post'name = 'branch'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+((my.getAnswerOptionValue()).get(i)!=null?(my.getAnswerOptionValue()).get(i):"")+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data attachment'><label class='switch-light switch-slider'><input id='question' name='attachment1' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+(my.getAnswerOptionValue()).get(i)+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data attachment'><label class='switch-light switch-slider'><input id='question' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>"; */	   
	    	
		/* BACK UP HAVING ATTACHMENT ONLY WITH NAME BUT NOT WITH FUNCTIONALITY */
		/* myContent += "<form action='./saveinbranchtable' class='branchform' method='post'name = 'branch'><div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+((my.getAnswerOptionValue()).get(i)!=null?(my.getAnswerOptionValue()).get(i):"")+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data attachment'><label class='switch-light switch-slider'><input id='question' name='attachment1' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+(my.getAnswerOptionValue()).get(i)+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data attachment'><label class='switch-light switch-slider'><input id='question' name='attachment1' type='checkbox'><span><span>No</span><span>Yes</span></span><a></a></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>"; */
		
		/*HERE WE IMPLEMENTED ATTACHMENT RELATED CODE AT TWO PLACES WITH DYNAMIC OPTIONS THIS FORM TAG IS WORKING FINE EVEN IF WE SELECT ATTACHMENT RELATED SLIDERS*/
		
		// THIS IS PREVIOUS OUTPUT WITHOUT HAVING PREVIOUS BRANCHING INFORMATION
		
/*		myContent += "<div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+((my.getAnswerOptionValue()).get(i)!=null?(my.getAnswerOptionValue()).get(i):"")+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data attachment'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' value='false'><input type='checkbox' value='false'></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+(my.getAnswerOptionValue()).get(i)+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data attachment'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat(((my.getAnswerOptionValue()).get(i)))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString((my.getAnswerOptionIds()).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";
	    	
	      System.out.println("MYCONTENT VALUE AFTER ONE ITERATION:"+myContent);
				  
		// TO BE OBSERVED HERE	  
			
		}
	 
	 System.out.println("After First Loop:"+myContent); */
	 
	 // I COMMENTED THE OUTPUT CODE OF SECOND ONE THAT IS WITH UNGROUPING OF INFORMATION
	 
/* 	 temp = 0;	 
	 
	 if((recordPojo.getQuestionTypeId()).get(selectedTag) == 3 || (recordPojo.getQuestionTypeId()).get(selectedTag) == 4){
		 temp = 0;
		  System.out.println("Hai for Second Time");
		  temp++;
	  } 
	 
	
String previousSelect = "";
 
 String val = "";
	  
	 for(int i = temp; i < ((recordPojo.getAnswerOptionValues()).get(selectedTag)).size(); i++){
		 


int flag = 0;
		 

			for(int k = 0;k<allTagNames.size();k++){
				System.out.println("+++"+allTagNames.get(k));
				System.out.println("---"+ (((recordPojo.getDestinationQuestionTagNames()).get(selectedTag))).get(i)  ) ;
				if(!(allTagNames.get(k).equals( (((recordPojo.getDestinationQuestionTagNames()).get(selectedTag))).get(i)) )){
			 if(!allTagNames.get(k).equals("")&& !allTagNames.get(k).equals(leftTagName)){
			 mySelect[k] = "<option value="+allTagNames.get(k)+">"+allTagNames.get(k)+"</option>";
			 flag = 1;
			 }
				}
			 else{
				 if(!allTagNames.get(k).equals("")&& !allTagNames.get(k).equals(leftTagName)){
				 val = "selected";
				 mySelect[k] = "<option value="+allTagNames.get(k)+" "+val+">"+allTagNames.get(k)+"</option>";
				 }
			 }
			 
			   }  

			    for(int j = 0;j<mySelect.length;j++){
			    System.out.println("Dynamic Option Values are :"+mySelect[j]);
			    previousSelect += mySelect[j];
			    }
			    
myContent += "<div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+(((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i))+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' type='hidden' name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data attachment'><input class='check' type='hidden' name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"' value='false'><input type='checkbox' value='false'></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+(((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i))+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"' type='hidden' value='true'><input type='checkbox' value='true' "+((((recordPojo.getIsSkip()).get(selectedTag)).get(i))!=false?"checked":"")+"><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"' type='hidden' value='true'><input type='checkbox' value='true' "+((((recordPojo.getIsMandatory()).get(selectedTag)).get(i))!=false?"checked":"")+"><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data attachment'><input class='check' name='"+((((((((selectedTag).concat("$")).concat((((recordPojo.getAnswerOptionValues()).get(selectedTag)).get(i)))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(((recordPojo.getAnswerOptionIds()).get(selectedTag)).get(i)))+"' type='hidden' value='true'><input type='checkbox' value='true' "+((((recordPojo.getIsAttachment()).get(selectedTag)).get(i))!=false?"checked":"")+"></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";

		 System.out.println("MYCONTENT VALUE AFTER ONE ITERATION:"+myContent);
		 previousSelect = "";
	 }
	 
	 
	 System.out.println("After Second Loop:"+myContent); */
      
  
	// I COMMENTED THE OUTPUT CODE OF SECOND ONE THAT IS WITH UNGROUPING OF INFORMATION
	
  
  // myContent += "<div class='branch-footer'><div class='footer-right'><button class='btn branch-close' type='button'>Close</button></div><div class='footer-left'><button class='btn branch-left' type='submit'>Save</button><form class='branchform'action='./branchPreview' method='post'><button class='btn branch-left' type='submit'>Branch Preview</button></div></div></form></form>";
  
  // THIS STATEMENT IS ACTUAL STATEMENT BUT FOR TIME BEING WE ARE REMOVING CLOSE BUTTON
   //  myContent += "<div class='branch-footer'><div class='footer-right'><button class='btn branch-close' type='button'>Close</button></div><div class='branchPreview'><button class='btn branch-left' type='button' onclick='branchPreview("+(branchedQuestionComponents.get(0)).getQuestionnaireId()+")'>Branch Preview</button></div><div class='footer-left'><button class='btn branch-left' type='submit'>Save</button></div></form></div>";
 
 // i commented for checking of grouping  
 //    myContent += "<div class='branch-footer'><div class='footer-right'><button class='btn' type='button' onclick='retrieveQuestionnaire("+(branchedQuestionComponents.get(0)).getQuestionnaireId()+")'>Close</button></div><div class='branchPreview'><button class='btn branch-left' type='submit' onclick='branchPreview("+(branchedQuestionComponents.get(0)).getQuestionnaireId()+")'>Branch Preview</button></div><div class='footer-left'><button class='btn branch-left' type='submit'>Save</button></div></form></div>";
     
     	
 
     // FROM HERE NEW CODE STARTS
     
     branchingMap = branchingPojo.getBranchingMap();
 	
/*  	 if(my.getQuestionTypeId() == 1 || my.getQuestionTypeId() == 2 || my.getQuestionTypeId() == 11 || my.getQuestionTypeId() == 12){
		  System.out.println("Hai");
	  }
int  temp = 0;
		 if(my.getQuestionTypeId() == 3 || my.getQuestionTypeId() == 4){
			 temp = 0;
			  System.out.println("Hai");
			  temp++;
		  } */ 
		 
		 	
		 	int size = branchingPojo.count;
		  
		  	boolean flag = branchingPojo.flag;
		 	
		 	//System.out.println("Count Value is:"+size);
		 
	myContent += "<form action='./saveinbranchtable' class='branchform' method='post' id='bform' name = 'branch'>";
		 
	// for(int s = 0; s < size ; s++){		 
		 
	//	 System.out.println("Value of S is:"+s);
		 
		 Set<Map.Entry<String,LinkedList<BranchingValue>>> mE = branchingMap.entrySet();
		 
		 Iterator iterator = mE.iterator();
		 
	//	 int d = temp;
		 
//		 for(int i = temp;i < (my.getAnswerOptionValue()).size() ; i++){
	
//	while( d < (my.getAnswerOptionValue()).size()){
		
//	int i = temp;
			 
	//		 System.out.println("Value of I is:"+i);
	
	int i = 0;
	
	
	 String oldName = "";
	 String newName = "";
		 
		 while(iterator.hasNext()){
			 
//		for(int i = temp;i < (my.getAnswerOptionValue()).size() ; i++){
			 
			//			 System.out.println("Value of I is:"+i);			 
			 
			 Map.Entry<String,LinkedList<BranchingValue>> entry = (Map.Entry<String,LinkedList<BranchingValue>>)iterator.next();
			 
			 String skipTag = "";
			 
			 String mandatoryTag = "";
			 
			 String attachmentTag = "";			 
			 
			 String selected = "";
			 
			 String previousSelect = "";
			 
			 LinkedList<BranchingValue> bValue = (LinkedList<BranchingValue>) entry.getValue();
			 
			 
			 
			 for(int k = 0;k < bValue.size(); k++){
				 
				
				 
				
			 
				 
				 //System.out.println("Value of K is:"+k);
				 
				 BranchingValue branchValue = (BranchingValue) bValue.get(k); 
				 
				 int temp = 0;
				 
	 			 if(branchValue.getQuestionTypeId() == 3 || branchValue.getQuestionTypeId() == 4){
					 temp = 0;
					 temp++;
				 }
				 
				 i = temp; 
				 
				 //System.out.println("Key is:"+ entry.getKey());
				 
				 if(branchValue.isSkip()){
					 skipTag = "<input type='checkbox' id='sk" + k + "' value='true' "+(branchValue.isSkip()?"checked":"")+"><label for='sk"+ k +"'></label>";
				 }
				 else{
					 skipTag = "<input type='checkbox' id='sk" + k + "' value='false'><label for='sk"+ k +"'></label>";
				 }
				 if(branchValue.isMandatory()){
					 mandatoryTag = "<input type='checkbox' id='md" + k + "' value='true' "+(branchValue.isMandatory()?"checked":"")+"><label for='md"+ k +"'></label>";
				 }
				 else{
					 mandatoryTag = "<input type='checkbox' id='md" + k + "' value='false'><label for='md"+ k +"'></label>";
				 }
				 if(branchValue.isAttachment()){
					 attachmentTag = "<input type='checkbox' id='at" + k + "' value='true' "+(branchValue.isAttachment()?"checked":"")+"><label for='at"+ k +"'></label>";
				 }
				 else{
					 attachmentTag = "<input type='checkbox' id='at" + k + "' value='false'><label for='at"+ k +"'></label>";
				 }
				 if(!branchValue.getDestinationTagName().equals("None")){
					 
					 // CODE TO GET PREVIOUS SELECTED SELECT BOX VALUE
					 
					  System.out.println("All Tag Names Came From Controller are :"+allTagNames);
					 
					 for(int l = 0;l<allTagNames.size();l++){
							//System.out.println("+++"+allTagNames.get(l));
							System.out.println("---"+ branchValue.getDestinationTagName()  ) ;
							if(!(allTagNames.get(l).equals( branchValue.getDestinationTagName() ))){
						 if(!allTagNames.get(l).equals("") && !allTagNames.get(l).equals(leftTagName) && !allTagNames.get(l).equals(null)){							 
							// To Display All Destination Targets If for that AnswerOption no Branching has done.
							System.out.println("Actual Chosen LeftTagName is : "+leftTagName);
							System.out.println("LeftTagName Order is:"+tagNamesOrderMap.get(leftTagName));
							System.out.println("Current TagName Option Forming is :"+allTagNames.get(l));
							System.out.println("Current TagName Option Order is :"+ tagNamesOrderMap.get(allTagNames.get(l)));
							if(tagNamesOrderMap.get(allTagNames.get(l)) > tagNamesOrderMap.get(leftTagName))
								forwardBranchingTagNamesArray[l] = "<option value='"+allTagNames.get(l)+"'>"+allTagNames.get(l)+"</option>";						 
						 }
							}
						 else{	 
						 // To Display Specific Destination Target If for that AnswerOption already Branching had done.
							 if(!allTagNames.get(l).equals("") && !allTagNames.get(l).equals(leftTagName) && !allTagNames.get(l).equals(null)){
							 selected = "selected";
							 forwardBranchingTagNamesArray[l] = "<option value='"+allTagNames.get(l)+"' "+selected+">"+allTagNames.get(l)+"</option>";
							 }
						 }
							
							System.out.println("Select Destination Targets Finally for that AnswerOption If branching is Done or Not Done are :"+Arrays.deepToString(mySelect));
						 }  

						    for(int j = 0;j<forwardBranchingTagNamesArray.length;j++){
						    //System.out.println("Dynamic Option Values are :"+mySelect[j]);
						    previousSelect += forwardBranchingTagNamesArray[j];
						    }	
						    System.out.println("Final Targets for Branched Question:"+previousSelect);
				 }
				 else{
	//				 forwardNonBranchingTagNamesArray	 
				 
					 previousSelect = forwarddNonBranchingTagNamesString;
	System.out.println("Previous Select For Non-Branching is :"+previousSelect);
				 }
		/* 		 else{
					 
					 for(int m = 0;m<allTagNames.size();m++){
						 if(!allTagNames.get(m).equals("")&& !allTagNames.get(m).equals(leftTagName))
						 mySelect[m] = "<option>"+allTagNames.get(m)+"</option>";
						   }  
						 	select = "";
						    for(int j = 0;j<mySelect.length;j++){
						    System.out.println("Dynamic Option Values are :"+mySelect[j]);
						    select += mySelect[j];
						    }					 
				 } */
				 
				 long branchId = 0L;
				 
				 branchId = branchValue.getBranchId();
				 
				 System.out.println("BranchId is :"+branchId);
				 
				 long hiddenBranchId = 0L;
				 
				 while(previousSelect.contains("null")){
						int pos = previousSelect.indexOf("null");
						System.out.println("Position is:"+pos);
						StringBuffer sb = new StringBuffer(previousSelect).delete(pos,pos+4);
						previousSelect = sb.toString();			
						System.out.println("New String is:"+previousSelect);
					}
				System.out.println("New Previous Select is :"+previousSelect); 
				
			 if(!(entry.getKey().equals(" "))){ 
				 
				 newName = entry.getKey();
				 
				 System.out.println("Old Name is:"+oldName);
				 
				 System.out.println("New Name is:"+newName);
				 
				 if(newName.equalsIgnoreCase(oldName) == false)
				  myContent += "<div class='branchingHead'><div class='body branching hidden'><div class='data  answer-option displayHidden'> "+(entry.getKey()!=null?entry.getKey():"")+" </div><div class='data skip'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' value='false'><input type='checkbox' id='z"+ k +"' value='false'><label for='z" + k + "'></label></div><div class='data target-question'><select class='branchform' name='"+((((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))).concat("$")).concat(branchValue.getBranchId().toString())+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='false'><input type='checkbox' id='y" + k +"' value='false'><label for='y" + k +"'></label></div><div class='data attachment'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' value='false'><input type='checkbox' id='b"+ k +"' value='false'><label for='b" + k +"'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span><span class='hidden deletedId'>"+hiddenBranchId+"</span></div></div>";
			     
				 
				 if(flag){ 
			 
//				 if(!((k+1)==bValue.size()))
	       
	    		  if(k==0)
			 
//			 myContent += "<div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+(entry.getKey()!=null?entry.getKey():"")+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='false'><input type='checkbox' value='false'><span><span>Off</span><span>On</span></span><a></a></label></div><div class='data attachment'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' value='false'><input type='checkbox' value='false'></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+(entry.getKey()!=null?entry.getKey():"")+" </div><div class='data skip'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='false'>"+skipTag+"<span><span>Off</span><span>On</span></span><a></a></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><label class='switch-light switch-slider'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='false'>"+mandatoryTag+"<span><span>Off</span><span>On</span></span><a></a></label></div><div class='data attachment'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='false'>"+attachmentTag+"</div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div></div>";

			 myContent += "<div class='body branching'><div class='data answer-option'> "+((entry.getKey()!=null&&(k==0))?entry.getKey():"&nbsp;")+" </div><div class='data skip'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isSkip()?"true":"false") +"'><input type='checkbox' id='sk"+ k +"' value='true' "+(branchValue.isSkip()?"checked":"")+"><label for=sk'" + k + "'></label></div><div class='data target-question'><select name='"+((((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))).concat("$")).concat(branchValue.getBranchId().toString())+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isMandatory()?"true":"false") +"'><input type='checkbox' id='md"+ k +"' value='true' "+(branchValue.isMandatory()?"checked":"")+"><label for='md"+k+"'></label></div><div class='data attachment'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isAttachment()?"true":"false") +"'><input type='checkbox' id='at"+k+"' value='true' "+(branchValue.isAttachment()?"checked":"")+"><label for='at"+k+"'></label></div><div class='data add-target'><span class='addElement'></span><span class='hidden deletedId'>"+branchId+"</span></div></div>";
			 else
				 myContent += "<div class='body branching'><div class='data answer-option'> "+((entry.getKey()!=null&&!(oldName.equals(newName)))?entry.getKey():"&nbsp;")+" </div><div class='data skip'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isSkip()?"true":"false") +"'><input type='checkbox' id='sk"+ k +"' value='true' "+(branchValue.isSkip()?"checked":"")+"><label for=sk'" + k + "'></label></div><div class='data target-question'><select name='"+((((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))).concat("$")).concat(branchValue.getBranchId().toString())+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isMandatory()?"true":"false") +"'><input type='checkbox' id='md"+ k +"' value='true' "+(branchValue.isMandatory()?"checked":"")+"><label for='md"+k+"'></label></div><div class='data attachment'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isAttachment()?"true":"false") +"'><input type='checkbox' id='at"+k+"' value='true' "+(branchValue.isAttachment()?"checked":"")+"><label for='at"+k+"'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'><span class='hidden deletedId'>"+branchId+"</span></div></div>";
				 
			 }
				 
			 else
				 myContent += "<div class='body branching'><div class='data answer-option'> "+((entry.getKey()!=null&&!(entry.getKey().startsWith("Repeated")))?entry.getKey():"&nbsp;")+" </div><div class='data skip'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isSkip()?"true":"false") +"'><input type='checkbox' id='sk"+ k +"' value='true' "+(branchValue.isSkip()?"checked":"")+"><label for=sk'" + k + "'></label></div><div class='data target-question'><select name='"+((((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))).concat("$")).concat(branchValue.getBranchId().toString())+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isMandatory()?"true":"false") +"'><input type='checkbox' id='md"+ k +"' value='true' "+(branchValue.isMandatory()?"checked":"")+"><label for='md"+k+"'></label></div><div class='data attachment'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isAttachment()?"true":"false") +"'><input type='checkbox' id='at"+k+"' value='true' "+(branchValue.isAttachment()?"checked":"")+"><label for='at"+k+"'></label></div><div class='data add-target'><span class='addElement'></span><span class='hidden deletedId'>"+branchId+"</span></div></div>";
			 }
					 
//			 else{
	//			 if(!(entry.getKey().equals(" ")))
			 
//					 myContent += "<div class='branchingHead'><div class='body branching hidden'><div class='data answer-option displayHidden'> "+(entry.getKey()!=null?entry.getKey():"")+" </div><div class='data skip'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' value='false'><input type='checkbox' id='z"+ k +"' value='false'><label for='z" + k + "'></label></div><div class='data target-question'><select class='branchform' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"'><option onchange='' value='Select Target'> Select Target </option>"+select+"</select></div><div class='data mandatory'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='false'><input type='checkbox' id='y" + k +"' value='false'><label for='y" + k +"'></label></div><div class='data attachment'><input class='check' type='hidden' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' value='false'><input type='checkbox' id='b"+ k +"' value='false'><label for='b" + k +"'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></span></div></div><div class='body branching'><div class='data answer-option'> "+((entry.getKey()!=null&&!(entry.getKey().startsWith("Repeated")))?entry.getKey():"&nbsp;")+" </div><div class='data skip'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("skip")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isSkip()?"true":"false") +"'><input type='checkbox' id='sk"+ k +"' value='true' "+(branchValue.isSkip()?"checked":"")+"><label for=sk'" + k + "'></label></div><div class='data target-question'><select name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("select")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"'><option onchange='' value='Select Target'> Select Target </option>"+previousSelect+"</select></div><div class='data mandatory'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("mandatory")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isMandatory()?"true":"false") +"'><input type='checkbox' id='md"+ k +"' value='true' "+(branchValue.isMandatory()?"checked":"")+"><label for='md"+k+"'></label></div><div class='data attachment'><input class='check' name='"+((((((((my.getThisQuestionTagName()).concat("$")).concat((entry.getKey()!=null?entry.getKey():""))).concat("$")).concat("attachment")).concat("$")).concat(Integer.toString(i))).concat("$")).concat(Long.toString(branchValue.getAnswerOptionId()))+"' type='hidden' value='"+ (branchValue.isAttachment()?"true":"false") +"'><input type='checkbox' id='at"+k+"' value='true' "+(branchValue.isAttachment()?"checked":"")+"><label for='at"+k+"'></label></div><div class='data add-target'><span class='addElement'></span><span class='removeElement'></div></div></div>";
	//		 }
			 
			 previousSelect = "";
			 
			 System.out.println("Final My Content:"+myContent);
			 
	//		 i = i + 1;
	oldName = newName;
			 }
			 
			 myContent += "</div>";
			 
			 i = i + 1;
			 
	//	 } //inner for loop
			 
		 }	// while loop	
		 
		
	 
	// } // outer for loop
	 
	 
 myContent += "<div class='branch-footer'><input class='hidden brPre' value='"+ (branchedQuestionComponents.get(0)).getQuestionnaireId() +"'><div class='branchPreview'><button class='btn branch-left'>Branch Preview</button></div><div class='footer-left'><button class='btn branch-right' type='submit'>Save</button><button class='btn' type='button' onclick='retrieveQuestionnaire("+(branchedQuestionComponents.get(0)).getQuestionnaireId()+")'>Cancel</button></div><input type='hidden' name='removeBranchingIdsList' class='removeBranchingIdsList' value=''/><input type='hidden' name='updateBranchingIdsList' class='updateBranchingIdsList' value=''/><input type='hidden' name='targetQuestions' class='targetQuestions' value=''/></form></div>";
    
     System.out.println("Final My Content:"+myContent);	 
  
     
  
	%>  
	
	<form name="preview">
	<input type="hidden" name="id" />
	</form>
  
  
  <!-- CHANGE DONE FROM # TO ./getbranchedquestionoftag OF ACTION ATTRIBUTE OF FORM TAG-->
	<form class="branchform" method="post" action="./getbranchedquestionoftag">
	
		<p class="branching-select">Select Source Question Tag</p>
		<div class="search-dropdown">
      	<% 
		String leftSelectBox = "";
		leftSelectBox = "<select class='addBranch' name='tags'><option value='Select'>Select</option>";
		
		String value = "";
		
		for(int k = 0;k<tagNames.size();k++){
			if((tagNames.get(k)).equals(leftTagName)){
				value = "selected";
				if(!tagNames.get(k).equals(""))
			leftSelectBox += "<option value='"+tagNames.get(k)+"' "+value+">"+tagNames.get(k)+"</option>";
			}
			else{
				if(!tagNames.get(k).equals(""))
				leftSelectBox += "<option value='"+tagNames.get(k)+"'>"+tagNames.get(k)+"</option>";	
			}
		}
		
		leftSelectBox += "</select>";
		
		out.println(leftSelectBox);
		
		session.setAttribute("qrId",(branchedQuestionComponents.get(0)).getQuestionnaireId());
		
		%>
         
         <input class="hidden leftTagName" name="leftTagName">
                
		</div>	
		<input type="submit" class="btn btn-xs fr mt" name="submit" value="Add new branch" disabled="disabled" /></form>
	
	
	
  </div>
  
  
   <!-- RIGHT SIDE PANEL -->  
  
  
  <div class="col-md-8 questContainer"> 
 
  <div class="branch-container clearfix target1-sel">
  
    
	<div class="branch-info">
	<!-- <p class="branching-select">Source Question</p><p class="branching-select">Actions</p>	 -->
	</div>  
	
	<div class="branch-static-text"><p><%= questionText %></p></div>
	
	<div class="data-display">
		<div class="head">
			<div class="header answer-option">Answer option</div>
			<div class="header skip">Skip</div>
			<div class="header target-question">Target question</div>
			<div class="header mandatory">Mandatory</div>
			<div class="header attachment">Allow attachment</div>
			<div class="header add-target">Add target</div>
		</div>
	</div>
		
	<div class="data-display-body">
	
	<% out.println(myContent);
	
	%>
	
	<!-- STATIC CONTENT GIVEN BY THEM -->
	
   <!-- 
   
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
		<div class="data attachment customInput customCheckBox"><input id="question" type="checkbox" name="attachment1"><label for="question"></label></div>
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
		<div class="data attachment customInput customCheckBox"><input id="question" type="checkbox" name="attachment1"><label for="question"></label></div>
		<div class="data add-target"><span class="addElement"></span></div>
	</div>  
	
	-->
	
	<!-- STATIC CONTENT GIVEN BY THEM -->
   
</div>

</div>

</div>

</div>
</div>
 <%-- <form name="branch">
<input type="hidden" name="brId">
</form> --%>

<!-- <div class="branch-footer"> 
  <div class="footer-right"><button class="btn branch-close" type="button">Close</button></div>
  <div class="footer-left"><button class="btn branch-left" type="button">Save</button><button class="btn branch-left" type="button">Branch Preview</button></div>
</div> -->

<div class="branchResponse"></div>
  <div class="popupBg"></div>

		<!-- contentpanel -->

 <div id="branchSelect"></div>
 <div id="targetSelect"></div>
</div>
<jsp:include page="footer.jsp" />


<!--  RIGHT SIDE PANEL -->

<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery-ui-1.11.0.min.js"></script>
<script src="js/common.js"></script> 
<script src="js/custom.js"></script> 
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>



<script>
jQuery(document).ready(function(){


		
		

 // Score Schema Ends 
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

	  //jQuery('.switch').bootstrapSwitch();
	//Score Schema ends		
		
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



/* 	
jQuery('.branch-container').on('click','.attachment input[type="checkbox"]',function() {
	if(jQuery(this).is(':checked')) {
	  //      alert("1");
	       jQuery(this).siblings('.check').val('true'); 
	    }
	    else  {
	   //     alert("2");
	        jQuery(this).siblings('.check').val('false'); 
	        }

}); */




		//jQuery('.attachment input').uniform();
		
	});	
	
function getCustomSelect() {

	jQuery("body .addBranch").selectmenu({
			  select: function(event, data) {
			   var textEl = data.item.value;
			   console.log("textEl" + textEl);
			   jQuery('.leftTagName').val(textEl);
				if(textEl == ('Select').trim()) {
					console.log(textEl);
					jQuery('.fr').attr('disabled', 'disabled');
			   }
				else {
					jQuery('.fr').removeAttr('disabled');
					}
			  },
			  appendTo: '#branchSelect'
			});
	
}

getCustomSelect();

jQuery('.branch-left').on('click', function(e) {
	e.preventDefault();
	e.stopPropagation();
	branchValues();
		
	jQuery.post('/partnerintegrity/branchpreview', jQuery('#bform').serialize(), function(response) {	 
		jQuery('.branchResponse').html(response);
		jQuery('.branchResponse, .popupBg').show();
	});	
	
});
function branchValues(){
var branch_arry = new Array();
jQuery('.branchingHead').each(function(){
	jQuery(this).find('.branching').each(function(i,val){
		if(jQuery(this).is(':visible'))
			{
			if(i == 1)
				{
				console.log(jQuery(this).find('.answer-option').text())
				branch_arry.push(jQuery(this).find('.answer-option').text());
				console.log('Branch Array is:'+branch_arry)
				}
				branch_arry.push(jQuery(this).find('.target-question').children('.ui-selectmenu-button').find('.ui-selectmenu-text').text());
			}
	})
})
		
var branch_string = branch_arry.toString();
console.log('Branch String is:'+branch_string);
jQuery('.targetQuestions').attr('value',branch_string);
}
		
	
function branchPreview(link)
{
	
//alert("In BranchPreview Method"+link);
	//window.open("/partnerintegrity/branchPreview?id="+link,"_self");
    document.preview.id.value=link;
 //     alert("ID Value is:"+brId);
       document.preview.method="post";
       document.preview.action = "/partnerintegrity/branchpreview";
       document.preview.submit();
}

jQuery('.branch-container').on('click','.data input[type="checkbox"]',function() {
	if(jQuery(this).is(':checked')) {
	     //alert("1");
	       jQuery(this).siblings('.check').val('true'); 
	    }
	    else  {
	     //alert("2");
	        jQuery(this).siblings('.check').val('false'); 
	        }

});

jQuery('.branch-right').on('click', function() {
	branchValues();
	jQuery('.branchform').submit();   
});



function retrieveQuestionnaire(link)
{
//	alert("In JQUery Method");
	//window.open("/partnerintegrity/branchPreview?id="+link,"_self");
   // document.retrieve.brId.value=link;
    //   alert("ID Value is:"+brId);
    document.preview.id.value=link;
      document.preview.method="post";
     document.preview.action = "/partnerintegrity/retrievequestionnaire";
       document.preview.submit();
} 

	var question1 = ["this is the first answer", "this is the first skip", "this is the first man", "this is the first attach"];
	var question2 = ["this is the sec answer", "this is the sec skip", "this is the sec man", "this is the sec attach"];
	var branch = [0,question1,1,question2];

		  jQuery('.branch-container').show();
		  jQuery('.add-new').click(function(){
			jQuery('.branch-container').show();
			});
			jQuery(".selected").css("display","block");

   jQuery('.branchingHead').each(function() {
	  	  jQuery('.branchingHead .branching').each(function() {
	           if(jQuery(this).hasClass('hidden') == false) {
	            jQuery(this).find('select').addClass('customSelect');
	              }
	        });    
	      }); 
	

  



	//jQuery(".data").data({ data: function(event, data)});
	
	
</script>
<script>
		 if(jQuery('.branchPreview').find('tr td:first-child').html() != ''){
				jQuery('.branchPreview').find('tr td:first-child').parents('tr').find('td').css({'background':'#f4f5f5'});				
				} 
		
		jQuery('.branchPreview').find('td:empty').parents('tr').addClass('emptyRow');
		
	</script>
	<script>
/* 	function goBack() {
     window.history.back();
 } */
	// JQUERY FUNCTION ADDED 
	jQuery('body').on('click', '.qstSubmitEdit', function() {
		
		jQuery('.branchResponse, .popupBg').hide();
		//alert("My JQuery Method Called");    
	//	var khName = "";
	//	var khId = "";
   // $.post('./closebranchingpreview',{'questionnaireName' : khName , 'questionnaireId' : khId}); 
	//	window.open('/partnerintegrity/closebranchingpreview','_self');
		//window.history.back();
});
// JQUERY FUNCTION ADDED
/*   jQuery('.branchResponse').on('mouseenter', '.sourceQuestion', function(){
         var offset = jQuery(this).offset();
         var descText = jQuery(this).find('span').text();
         jQuery('.tooltop').css({'top': offset.top - 220 +"px", 'left': offset.left - 150 + "px"}).text(descText).show();
       });
		 jQuery('.branchResponse').on('mouseleave', '.sourceQuestion', function(){ 
         jQuery('.tooltop').hide();
       }); */


		 
	</script>


</body>
</html>
