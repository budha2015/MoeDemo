<!DOCTYPE html>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link rel="stylesheet" href="css/jquery-ui-1.11.0.css" />
<link rel="stylesheet" href="css/questionnaire.css" />
<link type="text/css" href="http://jscrollpane.kelvinluck.com/style/jquery.jscrollpane.css" rel="stylesheet" media="all" />
<link rel="stylesheet" href="css/commonDT.css" />
<link rel="stylesheet" href="css/mainDT.css" />
<link rel="stylesheet" href="css/tprmDT.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dataTablesDT.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<style>
.radio-container {margin-top:20px}
.radio-questionnire label {margin-left: 10px}
.score.link {cursor:pointer}
.data-display-body_dis .body .chk-box input {
	margin: 0 0 0 10px;
}
.nw-quest {
	width: 150px;
}

.search-recepients {
	float: none;
}


.data-display th b {
	padding-left: 4px;
}

.smngr ul li { float: left; display: block; width: 100%;}
.assign-icon {
	background-image: url("./images/icons/assign.png");
	background-repeat: no-repeat;
	background-position: 0 0; 
	width: 18px; 
	height: 18px; 
	display: inline-block;
}
.assign-icon:hover {background-position: -18px 0}
.assign-icon:active {background-position: -37px 0}

.assignTo {
	font-size: 10px;
	padding-bottom: 6px !important
}

.deleteListingPopup button {
	width: 50px;
}
.search-recepients {
	float: none;
}

.data-display th b {
	padding-left: 4px;
}

.dataTableContainer {
	overflow-x: hidden;
}

.abcQuest {
	font-size: 10px;
	color: #000
	font-weight: bold;
}

.responsePopup {
	background: none repeat scroll 0 0 #fff;
	display: none;
	left: 50%;
	margin: -100px 0 0 -100px;
	position: fixed;
	top: 50%;
	width: 350px;
	z-index: 9999;
}

.responseConfirm {
	background: none repeat scroll 0 0 #fff;
	display: none;
	left: 33%;
	margin: -100px 0 0 -100px;
	position: fixed;
	top: 50%;
	width: 900px;
	z-index: 9999;
	font-size: 10px;
	padding: 15px 15px 15px;
}

.publicContainerQues{height: 200px; overflow:auto; padding-right:20px; padding-top:20px;}
.publicContainerQues li{margin-top:10px;}

.responseConfirm td {
	padding: 10px 5px;
}

.responseConfirm .recipientHeader td {
	border-top: 1px solid #aaa;
	border-bottom: 1px solid #aaa;
	color: #000;
}

.responseConfirm table {
	width: 100%
}

.responsePopup input {
	border: 1px solid #d9d9d9;
	color: #000 !important;
	font-size: 11px;
	height: 22px;
	padding-left: 2%;
	width: 99%;
}

.responsePopup ul {
	padding: 0;
	padding-top: 20px;
	margin: 0 auto;
	width: 85%;
	list-style-type: none;
}

.responsePopup ul li {
	padding-bottom: 10px;
}

.responsePopup .submitQ {
	color: #fff;
	float: right;
}

  .submitQst {
	color: #fff;
	float: right;
}

input:focus,textarea:focus {
	border: 1px solid #11b1aa;
}
.innerHeading .new-business-questionnaire, .innerHeading .search-pagination {float:right; clear:both}

.mainpanel {margin-left: 0}
.ui-autocomplete {z-index: 9999; width: 290px !important}
.search-table {background-position: 103% -79px !important}
.linkingName {width: 300px !important}
.mainpanel.TPRM_bg{min-height: initial !important;height: initial !important;max-height: initial !important;}
</style>



</head>

<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

   <jsp:include page="header.jsp"></jsp:include>

<form name="qbank">
	<div class="clr"></div>
	<div class="innerHeading">
		<h1>Data Collection Summary</h1>
		
					<div class="new-business-questionnaire-container">
						<div class="fl new-business-questionnaire">
							<!-- <button class="btn nw-bus-case" type="button">New
								Business case</button> -->
								<a href="${pageContext.request.contextPath}/postquestionnaire" class="btn btn-xs btn-business">Add
								Business case</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/postquestionnaire" class="btn btn-xs">Add
								Questionnaire</a>
							<!-- <button type="button" class="btn btn-xs"></button> -->
							<input class="hidden businessCases" name="businessCase"/>
						</div>
					</div>
					<div class="radio-container">
						<div class="radio-questionnire customInput customRadio">
							<!-- <form action="datacollection"> -->
							<input type="radio" id="qst" name="deftype" class="radioBtn" value="Q~idfef" checked><label for="qst">Questionnaires</label>
							<input type="radio" id="bCase" name="deftype" class="radioBtn" value="B~idfef"><label for="bCase">Business case</label>
						    <input type="radio" id="idRadio" name="deftype" value="all" class="radioBtn"><label for="idRadio">All</label>
						<!-- </form> -->
						</div>
					</div>
					<!-- end radio controllers -->
					<!-- search and pagination -->
					<div class="search-pagination clearfix">
						<div class="pagination-contrainer">
							
							<div>
								<div>
									<!-- <span class="btn btn-xs deleteListPopup" style="display: none">Unlink
										questionnaires</span> <span class="btn btn-xs newLinkPopup"
										style="display: none">Link Questionnaire</span> -->
									<!-- <button class="btn btn-xs disableLink" disabled="disabled">Link/Unlink
										questionnaires</button> -->
								</div>
							</div>
						</div>
						<!-- End search and pagination -->
					</div>
			
		<div class="clr"></div>
	</div>
	<div class="clr"></div>
	
	
<!-- leftpanel -->


			
		<!-- headerbar -->
		
	<!-- container starts here-->
	<div class="container">
		<div class="dataTableContainer">
			<table id="lmsTable" class="data-display">
			<thead class="head">
				<tr>
				<th class="iconHead filterHead"></th>
				<th class="qb_question filterHead th_border">Name <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col1" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
					<!-- <th class="qb_category filterHead">Status <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col1" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th> -->
					<th class="assignto qb_questionType filterHead th_border">Created<b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col2" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
					<th class="comments qb_category  filterHead th_border last_header">Count<b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col3" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
					<th class="hidden"></th>
				</tr>
						</thead>
						
						<tbody class="data-display-body">
							<c:if test="${!empty questionnaireDefs}">
								<c:forEach items="${questionnaireDefs}" var="questionnaireDef">
									<tr>
									  <td class="logoIcon"><span class="<c:out value="${questionnaireDef.defType}" />logo"></span></td>
										<td data-attr="${questionnaireDef.questionnaireDefId}"
											class="score link name questionnaire linkingName"><c:out
												value="${questionnaireDef.name}" /><%-- <span style="display:none" class="qstDescription"><c:out value="${questionnaireDef.description}" /></span> --%></td>
										<%-- <td align="center" class="statusHead"><c:out
												value="${questionnaireDef.status}" /></td> --%>
										<%-- <td class="assignto"><a href="javascript:qrlink('${questionnaireDef.linkId}','${questionnaireDef.name}','${questionnaireDef.defType}')" class="assign-icon"></a></td> --%>
										<td class="statusHead"><c:out
												value="${questionnaireDef.createDate}" /></td>
										<!-- <td class="viewCommentsIcon"><img src="images/icons/commentsview_normal.png" width="16" height="16" class="commentIcon"></td> -->
										<td class="statusHead">
											<c:choose>
											<c:when test="${questionnaireDef.count=='0'}"></c:when>
											<c:otherwise>
											<c:out
												value="${questionnaireDef.count}" />
											</c:otherwise>
											</c:choose>
											</td>
											<td class="hidden"><span class="qstDescription"><c:out value="${questionnaireDef.description}" /></span></td>
										<div class="hidden quesId">${questionnaireDef.linkId}</div>
										<div class="hidden quesnrId">${questionnaireDef.questionnaireDefId}</div>
										
									</tr>
								</c:forEach>
							</c:if>


						</tbody>

			  
			</table>
					<input type="hidden" name="qlist">
					<input type="hidden" name="linkName" class="tempClass">
					<input type="hidden" name="id">
		</div>
		
	</div>
	<!-- container -->	
		
   
     
 </form>   
         
         <jsp:include page="footer.jsp"></jsp:include>
		<!-- contentpanel -->
		
		
	<form id="updTemplate" name="updTemplate"
		action="${pageContext.request.contextPath}/savequestionnairelink"
		method="post">
		<div class="newLinkingPopup questPopup">
			<i class="closeBtn"></i>

			<ul>
				<li class='red' style='display: none;'>Label name cannot be
					empty</li>
				<li>Enter label name</li>
				<li><input name="linkName"
					class="newLabel search-recepients clearfix ui-autocomplete-input ui-autocomplete-loading" /></li>
				<li><button type="button" class="btn btn-xs cancel closePopup"
						name="cancelQ">Cancel</button>
					<button type="button" class="btn btn-xs fr" name="submitQ"
						onclick="addLink();">Submit</button></li>
			</ul>
		</div>
	</form>
		
			<div class="deleteListingPopup questPopup">
		<i class="closeBtn"></i>
		<ul>
			<li>Are you sure want to unlink <b class="namePopup">'jk
					questionnaire'</b> from <b class="label1Popup">'abc label'</b>?
			</li>
			<li>
				
				<button type="button" class="btn btn-xs delete marginLeftYes" name="yes"
					onClick="deleteLink();">Yes</button>
				<button type="button" class="btn btn-xs closePopup fr marginRightNo" name="no">No</button>
			</li>
		</ul>
	</div>
		
		
		
<div class="bg"></div>
	<div class="responsePopup reponses">
		<form action="${pageContext.request.contextPath}/confirmdistribution"
			id="distributeForm" method="post">
		
			<div class="smngr">
				<ul>
				<li><div class="abcQuest">
				<span class="qtName">${questionnaireName}</span> <input
					id="questionnaireName" name="questionnaireName" class="hidden"
					value="${questionnaireName}"> <input id="questionnaireID"
					name="questionnaireID" class="hidden" value="${questionnaireID}">
					<input id="questionnairedefType"
					name="questionnairedefType" class="hidden" value="${questionnairedefType}">
	
			</div></li>
					<li class="search"><input  id="userSearch"
						class="search-table clearfix" style="float: right"></li>
					<li class="assignTo">Assign to</li>
					<li><input class="assignField" type="text" id="userName" /> <input
						class="assignField hidden" type="text" id="userId" name="userID" />
					</li>
					<li class="closeCancelBtn"><button type="button"
							class="btn btn-xs cancel" name="cancelQ">Cancel</button>
						<button type="button" class="btn btn-xs submitQ sQ" name="submitQ"
							disabled="disabled">Assign</button></li>
				</ul>
			</div>
		</form>
	</div>
		

	<form method="post"
		action="${pageContext.request.contextPath}/sendquestionnaireemail"
		class="formSubmit">
		<div class="responseConfirm reponses">
			<div>
				<p class="qtName"><b>${questionnaireName}</b></p> <input
					id="questionnaire_ID" class="hidden" value="${questionnaireID}"
					name="questionnaireID">
					<input
					id="linkId" class="hidden" value="${linkId}"
					name="linkId">
			</div>
			<table>
				<thead class="head">
					<tr class="recipientHeader">
						<td>Recipient name</td>
						<td>Email id</td>
						<td>Organisation</td>
						<td>Last sent on</td>
						<td>Last replied on</td>
						<td>Remove recipients</td>
					</tr>
				</thead>

				<tbody class="data-display-body_dis">

				</tbody>


			</table>
			<ul>
				<li class="closeCancelBtn"><button type="button"
						class="btn btn-xs closePopupDis cancel" name="cancelQ">Cancel</button> <input
					type="submit" class="btn btn-xs submitQst" name="submitQst"
					value="Confirm & Send" /></li>
			</ul>
		</div>
	</form>

<div class="viewCommentsContainer">
  <h2 class="commentDiv">Comments</h2>
  <div class="comments-trail">
	<ul>
	  <li class="firstLi">
		<div class="clearfix comments-contractSummary">
			<span class="commentsNotify">
				<span class="user_prof"></span>
				<span class="prof_init">
					<span class="user_initial">Jonathan Carter</span>
				</span>
			</span>
			<div class="date-time">23-May-2014, 10:12</div>
		  <div class="comments-desc">Hi Joe, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Aenean euismod bibendum laoreet.</div>
		  <button class="btn-recepient btn-xs" style="padding:5px;font-size: 9px;line-height: 1.5;margin-top: 5px;margin-bottom: 20px;"><i class="icon-comments icon-recepient"></i>Recepients</button>
		  <span class="rName-detail"><a href="mailto:john@xyz.com">john@xyz.com</a></span>
		</div>
	  </li>
	  <li>
		<div class="clearfix comments-contractSummary">
			<span class="commentsNotify">
				<span class="user_prof"></span>
				<span class="prof_init">
					<span class="user_initial">Jonathan Carter</span>
				</span>
			</span>
			<div class="date-time">23-May-2014, 10:12</div>
		  <div class="comments-desc">Hi Joe, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Aenean euismod bibendum laoreet.</div>
		  <button class="btn-recepient btn-xs" style="padding:5px;font-size: 9px;line-height: 1.5;margin-top: 5px;margin-bottom: 20px;"><i class="icon-comments icon-recepient"></i>Recepients</button>
		  <span class="rName-detail"><a href="mailto:john@xyz.com">john@xyz.com</a></span>
		</div>
	  </li>
	  <li>
		<div class="clearfix comments-contractSummary">
			<span class="commentsNotify">
				<span class="user_prof"></span>
				<span class="prof_init">
					<span class="user_initial">Jonathan Carter</span>
				</span>
			</span>
			<div class="date-time">23-May-2014, 10:12</div>
		  <div class="comments-desc">Hi Joe, Lorem ipsum dolor sit amet, consectetur adipiscing elit.
			Aenean euismod bibendum laoreet.</div>
		  <button class="btn-recepient btn-xs" style="padding:5px; font-size:9px; line-height:1.5; margin-top:5px;margin-bottom: 20px;"><i class="icon-comments icon-recepient"></i>Recepients</button>
		  <span class="rName-detail"><a href="mailto:john@xyz.com">john@xyz.com</a></span>
		</div>
	  </li>
	</ul>
  </div>
</div>

<div class="popupBg"></div>
<div class="tooltop"></div>
<!-- mainpanel --> 

<script src="js/jquery-ui-1.11.0.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/jquery.dataTables.js"></script> 
<script src="js/custom.js"></script> 
<script src="js/quescommon.js"></script>
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
<script src="js/tprmDT.js"></script> 
  
    <script>

    jQuery(window).load(function(){
    	console.log("window start...");
    	jQuery(".mainpanel.TPRM_bg").css({'height':'833px','max-height':'833px','min-height':'833px'});
    	console.log("window ends...");
    });

    jQuery(document).ready(function () {
    	//starts for view comment 17-12-2014
    	jQuery(document).on("click", ".commentIcon", function(){
    		var comentOffset = jQuery(this).offset();
    		if(jQuery(window).width() < "700"){
    			jQuery(".viewCommentsContainer").show();
    			jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 145, "top":comentOffset.top + 20});
    		}else{
    			jQuery(".viewCommentsContainer").show();
    			jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 230, "top":comentOffset.top + 20});
    			jQuery(".viewCommentsContainer").animate({
    				left:comentOffset.left - 250
    			});
    		}
    	});
    	
    	jQuery(document).mouseup(function(e){
    		var container = jQuery(".viewCommentsContainer");
    		if(!container.is(e.target) && container.has(e.target).length === 0){
    			container.hide();
    		}
    	});
    	//end for view comment 
    	
    /* datatable */
      var table = jQuery('#lmsTable').DataTable({
      "lengthMenu": [[10, 20, 50, 100], [10, 20, 50, 100]],
      //"iDisplayLength": 5,
      "responsive": true,
      "oLanguage": { 
      "sSearch": " ",
      "sLengthMenu": "view _MENU_ items/page",
      "sInfo": " ",
      "sInfoEmpty": " "
    	},
      "pagingType": "full_numbers",
    	  });

    	  
     // jQuery('.chk-box.sorting_1').hide();
      //jQuery('.chk-box.sorting_1,th.chk-box').hide();

    /* sortingStarts */  
    	//table.find("th").off("click.DT");
    	jQuery("th").off("click");
    	
    	
    jQuery('.qb_question .atoz').click(function() {
        table.order([1,'asc']).draw();
    });
    jQuery('.qb_question .ztoa').click(function() {
       table.order([1,'desc']).draw();
    });

    jQuery('.qb_questionType .atoz').click(function() {
        table.order([2,'asc']).draw();
    });
    jQuery('.qb_questionType .ztoa').click(function() {
       table.order([2,'desc']).draw();
    });

    jQuery('.qb_category .atoz').click(function() {
        table.order([3,'asc']).draw();
    });
    jQuery('.qb_category .ztoa').click(function() {
       table.order([3,'desc']).draw();
    });

    jQuery('.qb_template .atoz').click(function() {
        table.order([4,'asc']).draw();
    });
    jQuery('.qb_template .ztoa').click(function() {
       table.order([4,'desc']).draw();
    });

    jQuery('.qb_startDate .atoz').click(function() {
        table.order([5,'asc']).draw();
    });
    jQuery('.qb_startDate .ztoa').click(function() {
       table.order([5,'desc']).draw();
    });

    jQuery('.qb_endDate .atoz').click(function() {
        table.order([6,'asc']).draw();
    });
    jQuery('.qb_endDate .ztoa').click(function() {
       table.order([6,'desc']).draw();
    }); 

    jQuery('.qb_status .atoz').click(function() {
        table.order([7,'asc']).draw();
    });
    jQuery('.qb_status .ztoa').click(function() {
       table.order([7,'desc']).draw();
    });

    jQuery('.qb_statusNew .atoz').click(function() {
        table.order([8,'asc']).draw();
    });
    jQuery('.qb_statusNew .ztoa').click(function() {
       table.order([8,'desc']).draw();
    });

    jQuery('.qb_risklevel .atoz').click(function() {
        table.order([8,'asc']).draw();
    });
    jQuery('.qb_risklevel .ztoa').click(function() {
       table.order([8,'desc']).draw();
    });


     /* sorting ends/
     /* search starts*/
        jQuery(".search-box").keyup(function() {
           table.search( this.value,false,false,true ).draw();
    	});
    /* search ends */
    	/* filter starts */
      jQuery("#lmsTable thead th.filterHead").each(function(i){
       var selectVar="";
          table.column(i).data().unique().sort().each( function ( d, j ) {
        	  if(d == '') { 
                  selectVar+='<div class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>BLANK</div>';
           	 } else {
           		 selectVar+='<div class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>'+d+'</div>'; 
           	 }
           });
           jQuery("#col"+ i).append(selectVar);
                   
        }); 
      
    	
      jQuery(".ok").click(function(){
	      var chkId = '';
	      jQuery(this).closest('.dropdown').find('input:checkbox:checked').each(function() {
	      chkId += jQuery(this).val() + "|";
	      });
	var thiscol = jQuery(this).parents('th').index();
	if(chkId){
	chkId = chkId.substring(0,chkId.length-1)
	      table.column( thiscol ).search("^"+chkId+"$", true, true ).draw();
	               }
	      else{
	      table.column( thiscol).search(chkId, true, false ).draw();
	               }
	    });            
	
	
	jQuery('.cancel').on('click' ,function(){      
	 jQuery(this).closest('.dropdown').find('input:checkbox').each(function() { //loop through each checkbox
	 this.checked = false; //deselect all checkboxes with class "checkbox1" 
	 var chkId = '';
	 jQuery(this).closest('.dropdown').find('input:checkbox:checked').each(function() {
	   chkId += jQuery(this).val() + "|";
	 });
	 chkId = chkId.slice(0,-1);
	
	var thiscol = jQuery(this).parents('th').index();
	
	 var escapeRegex = false;
	 table.column( thiscol )
	             .search(chkId, true, false )
	             .draw();       
	     });
	});
    	
    	
    	

    	// Clear filter for first column
    	    jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
    	
                jQuery('.filter-Chkbox1').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
    					//jQuery(".link-questionnire").css("background","#11b1aa");
                });
            }else{
                jQuery('.filter-Chkbox1').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
    				//jQuery(".link-questionnire").css("background","#CCC");	
        var chkId = '';
            jQuery('.filter-Chkbox1:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 1 )
                        .search(chkId, true, false )
                        .draw();				
                });         
            }
        });
    		// Clear filter for first column
    	    jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
    	
                jQuery('filter-Chkbox2').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox2').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
    		var chkId = '';
            jQuery('.filter-Chkbox2:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 2 )
                        .search(chkId, true, false )
                        .draw();				
                });         
            }
        });
    		// Clear filter for second column
    		
    		
    	// Clear filter for second column
    	    jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
    	
                jQuery('filter-Chkbox3').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox3').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
    		var chkId = '';
            jQuery('.filter-Chkbox3:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 3 )
                        .search(chkId, true, false )
                        .draw();				
                });         
            }
        });
    		// Clear filter for third column
    	    jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
    	
                jQuery('filter-Chkbox4').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox4').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
    		var chkId = '';
            jQuery('.filter-Chkbox4:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 4 )
                        .search(chkId, true, false )
                        .draw();				
                });         
            }
        });
    	// Clear filter for fourth column
    	    jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
    	
                jQuery('filter-Chkbox5').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox5').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
    		var chkId = '';
            jQuery('.filter-Chkbox5:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 5 )
                        .search(chkId, true, false )
                        .draw();				
                });         
            }
        });

            // Clear filter for fifth column
          jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
      
                jQuery('filter-Chkbox6').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox6').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
        var chkId = '';
            jQuery('.filter-Chkbox6:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 6 )
                        .search(chkId, true, false )
                        .draw();        
                });         
            }
        });

                  // Clear filter for sixth column
          jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
      
                jQuery('filter-Chkbox7').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox7').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
        var chkId = '';
            jQuery('.filter-Chkbox7:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 7 )
                        .search(chkId, true, false )
                        .draw();        
                });         
            }
        });
    	
    	// Clear filter for sixth column
          jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
      
                jQuery('filter-Chkbox8').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox8').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
        var chkId = '';
            jQuery('.filter-Chkbox8:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 8 )
                        .search(chkId, true, false )
                        .draw();        
                });         
            }
        });
    	
    	// Clear filter for sixth column
          jQuery('.clear-filter').click(function(event) {  //on click 
            if(this.checked) { // check select status
      
                jQuery('filter-Chkbox9').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.filter-Chkbox9').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"  
        var chkId = '';
            jQuery('.filter-Chkbox9:checked').each(function() {
              chkId += jQuery(this).val() + "|";
            });
            chkId = chkId.slice(0,-1);
            
            var escapeRegex = false;
            table.column( 9 )
                        .search(chkId, true, false )
                        .draw();        
                });         
            }
        });
      
          /* datatable ends */

          jQuery(".head th").on('click', 'span', function(){
      	var $dropdown =  jQuery(this).siblings('.dropdown');
      	jQuery('.dropdown').removeClass('show').addClass('hide');
      	if($dropdown.hasClass("show")){
      		$dropdown.addClass("hide");
      		$dropdown.removeClass("show");		
      	}

      	else {
      		$dropdown.addClass("show");
      		$dropdown.removeClass("hide");
      	}
         });
  
    jQuery('.cancel,.ok').on('click' ,function(){
    	jQuery(this).parents(".dropdown").removeClass('show').addClass('hide');
    /*	if(jQuery(".qb_template .dropdown").hasClass("show")){
    		jQuery(".qb_template .dropdown").addClass("hide");
    		jQuery(".qb_template .dropdown").removeClass("show");		
    	}

    	else {
    	jQuery(".qb_template .dropdown").addClass("show");
    	jQuery(".qb_template .dropdown").removeClass("hide");
    	} */
    });

        jQuery('#selecctall').click(function(event) {  //on click 
            if(this.checked) { // check select status
                jQuery('.checkbox1').each(function() { //loop through each checkbox
                    this.checked = true;  //select all checkboxes with class "checkbox1"
                });
            }else{
                jQuery('.checkbox1').each(function() { //loop through each checkbox
                    this.checked = false; //deselect all checkboxes with class "checkbox1"
                });         
            }
        });
        



    jQuery(".save-template-popup .cancel").click(function(){
    		jQuery(".save-template-popup").css("display","none");
    		jQuery(".popupBg").css("display","none");
    	  //(jQuery("#container").html());
    });

    jQuery(".save-template-popup .submitQ").click(function(){
    		jQuery(".save-template-popup").css("display","none");
    		jQuery(".popupBg").css("display","none");
    		alert(templatename = jQuery(".template-name").val());
    		alert(templatename +"<br>"+templatedata);
    });



    	 //Custom DataTable UI Change
    	 jQuery('.dataTables_length').insertAfter('#lmsTable');
    	 jQuery('.dataTables_length').insertAfter('.dataTables_paginate');
    	 //	jQuery('.dataTables_filter').find('label').html('<input type="search" class=" search-table" placeholder="Search" aria-controls="lmsTable">');
    	 jq(".dataTables_length select").selectmenu({
    				open: function( event, ui ) {
              jq(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');
          },
          close: function( event, ui ) {
            jq(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');
          },
          change:function(event, ui){
            jq(".dataTables_length select").val(ui.item.label).trigger('change');
          }
    	});
    	
    	
    });



    </script>


	<script>
		 

		 jQuery(".linking-parent").on("change",function () {
			 
			 jQuery("body tbody").find("td").each(function(){
				 jQuery(this).find("input.linking").prop('checked', jQuery(".linking-parent").prop('checked'));
				 console.log("checked");
				 });
			});

			
		 

		function linking() {
			flag = true;
			var checkCount = 0;
			var count = 0;
			var elements = document.getElementsByTagName("input");
			//alert("element"+elements);
			for (i = 0; i < elements.length; i++) {
				if (elements[i].type == "checkbox") {
					//  alert("ele "+elements[i].checked);
					if (elements[i].checked) {
						selque = elements[i].value;
						checkCount++;
						//	alert(selque.length + " - "+ (selque.indexOf("$")+1));
						if (selque.length == (selque.indexOf("$") + 1)) {
							flag = false;
						} else {
							count++;
						}
						//alert("val "+elements[i].value);
					}
				}
			}
			// alert(flag);
			if (flag) {
				jQuery('.deleteListPopup').show();
				jQuery('.disableLink, .newLinkPopup').hide();
			} else {
				jQuery('.newLinkPopup').show();
				jQuery('.disableLink, .deleteListPopup').hide();
			}
			//alert(count);
			if (count > 1 || checkCount == 0) {
				jQuery('.disableLink').show();
				jQuery('.deleteListPopup, .newLinkPopup').hide();
			}
		}

		jQuery('.linking').on(
				'click',
				function() {
					var namePopup = jQuery(this).parents('.chk-box').siblings(
							'.name').html();
					var label1Popup = jQuery(this).parents('.chk-box')
							.siblings('.labelHead').html();
					jQuery('.namePopup').html(namePopup);
					jQuery('.label1Popup').html(label1Popup);

				});
		jQuery('.newLinkPopup').on('click', function() {
			jQuery('.newLinkingPopup').show();
			jQuery('.popupBg').show();
		});
		jQuery('.deleteListPopup').on('click', function() {
			jQuery('.deleteListingPopup').show();
			jQuery('.popupBg').show();
		});

		var linkName = jQuery('.tempClass').val();
		var sNames = "<c:out value="${labels}"/>";
		//sNames = sNames.replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;");
		var labelList = sNames.split(/,\s*/);

		function deleteLink() {
			//alert("in function");
			var i;
			var selque = "";
			//var elements = document.qbank.elements;
			var elements = document.getElementsByTagName("input");
			//alert("element"+elements);
			for (i = 0; i < elements.length; i++) {
				if (elements[i].type == "checkbox") {
					//  alert("ele "+elements[i].checked);
					if (elements[i].checked) {
						selque = selque + elements[i].value + ",";
						//alert("val "+elements[i].value);
					}
				}

			}
			document.qbank.qlist.value = selque;
			// alert("qlist"+document.qbank.qlist.value);
			document.qbank.action = "${pageContext.request.contextPath}/deletequestionnairelink";

			document.qbank.submit();

		}

		function addLink() {

			//alert("in function");
			var newLabel = jQuery('.newLabel').val();
			if (newLabel == '') {
				jQuery('.newLinkingPopup .red').css('display', 'block');
			} else {
				var i;
				var selque = "";
				//var elements = document.qbank.elements;
				var elements = document.getElementsByTagName("input");
				//alert("element"+elements);
				for (i = 0; i < elements.length; i++) {
					if (elements[i].type == "checkbox") {
						// alert("ele "+elements[i].checked);
						if (elements[i].checked) {
							selque = selque + elements[i].value + ",";
							//alert("val "+elements[i].value);
						}
					}

				}
				document.qbank.linkName.value = newLabel;
				document.qbank.qlist.value = selque;
				// alert("link name"+document.qbank.linkName.value);
				document.qbank.action = "${pageContext.request.contextPath}/savequestionnairelink";

				document.qbank.submit();
				jQuery('.newLinkingPopup').hide();
			}

		}
		jQuery(document)
				.ready(function() {

							
							// Clear filter for second column

							/* datatable ends */

							// added the class called 'save-as-template' to the save as template button.
							var templatedata;
							var templatename;
							var questname;
							var questdescr;
							jQuery(".save-as-template").click(
									function() {
										if (jQuery("#container").html() != "") {
											jQuery(".save-template-popup").css(
													"display", "block");
											jQuery(".popupBg").css("display",
													"block");
											jQuery(".quest-tabs .active.tab")
													.css("z-index", "0");
											templatedata = jQuery("#container")
													.html(); // storing the html content in a variable when on click on the save template button
										} else
											alert("No questions added");
									});

							jQuery(".search-per-page").click(
									function(e) {
										if (jQuery(".select-per-page")
												.hasClass("show")) {
											jQuery(".select-per-page")
													.addClass("hide");
											jQuery(".select-per-page")
													.removeClass("show");
										} else {
											jQuery(".select-per-page")
													.addClass("show");
											jQuery(".select-per-page")
													.removeClass("hide");
										}

									});

							jQuery(".select-per-page input").click(
									function() {
										//console.log(jQuery(this).val());
										console.log(jQuery(".search-per-page")
												.html());
										jQuery(".search-per-page").html(
												jQuery(this).val());
										if (jQuery(".select-per-page")
												.hasClass("show")) {
											jQuery(".select-per-page")
													.addClass("hide");
											jQuery(".select-per-page")
													.removeClass("show");
										}

									});

/* 							jQuery("th span").click(
									function() {
										if (jQuery(this).siblings('.dropdown')
												.hasClass("show")) {
											jQuery(this).siblings('.dropdown')
													.removeClass("show")
													.addClass("hide");
										}

										else {
											jQuery(this).siblings('.dropdown')
													.removeClass("hide")
													.addClass("show");
										}
									}); */

						

							//New Label Autocomplete
							jQuery(".newLabel").autocomplete({
								source : labelList,
								after : ".listtemplateNames"
							});

							jQuery('.dataTableContainer')
									.on(
											'click',
											'.redirect',
											function() {
												var id = jQuery(this).attr(
														'data-attr');
												//  alert("if id "+jQuery('#editTemplate'))
												//var id= jQuery(this).parents('tr').find('.quesId').text();
												//qid=id.substr(0, id.indexOf("$"));
												// alert("question id "+id);
												document.qbank.id.value = id;
												//  alert("question id "+qid);
												document.qbank.method = "post";
												document.qbank.action = "${pageContext.request.contextPath}/retrieveqsttscoreschemerange";
												document.qbank.submit();
												
												//window.open('/partnerintegrity/retrieveqsttscoreschemerange?id='+id,'_self');
											});

							jQuery('.dataTableContainer')
									.on(
											'click',
											'.questionnaire',
											function() {
												
												var id = jQuery(this).attr(
														'data-attr');
												
												qid = id.substr(0, id
														.indexOf("$"));
												document.qbank.id.value = qid;
												// document.qbank.method=post;
												//  alert("question id "+qid);
												document.qbank.method = "post";
												document.qbank.action = "${pageContext.request.contextPath}/retrievequestionnaire";
												document.qbank.submit();
												//window.open('/partnerintegrity/retrievequestionnaire?id='+qid,'_self');
											});


						});

		jQuery(function() {
		
			jQuery("#userSearch")
					.autocomplete(
							{
								
								source : function(request, response) {
									jq.ajax({
												url : "qsttsearchuser",
												type : "GET",
												data : {
													term : request.term,
													type : jQuery('.responsePopup').find('#questionnairedefType').val()													
												},
												dataType : "json",
												success : function(data) {
													response(jq
															.map(
																	data,
																	function(
																			item) {

																		return {
																			userId : item.id,
																			label : item.name
																					+ " "
																					+ item.emailId,
																			name : item.name,
																			emailId : item.emailId,
																			orgName : item.orgName,
																			orgId : item.organisationId,
																			responsibleId : item.responisblePartyId,
																			responisbleEmailId : item.responsiblePartyEmailId
																		};
																	}));
												},
												/* error : function() {
													alert("Error......");
												} */
											});
								},
								focus : function() {

									return false;
								},
								select : function(event, ui) {

									if (jQuery('#userName').val() == '') {

										jQuery(this).closest('.smngr').find(
												"#userName").val(ui.item.label);

										jQuery(this)
												.closest('.smngr')
												.find('#userId')
												.val(
														ui.item.userId
																+ ","
																+ ui.item.name
																+ ","
																+ ui.item.emailId
																+ ","
																+ ui.item.orgName
																+ ","
																+ ui.item.orgId
																+ ","
																+ ui.item.responsibleId
																+ ","
																+ ui.item.responisbleEmailId);

									} else {
										jQuery('#userName').val(
												jQuery(this).closest('.smngr')
														.find("#userName")
														.val()
														+ "," + ui.item.label);
										jQuery('#userId')
												.val(
														jQuery(this).closest(
																'.smngr').find(
																'#userId')
																.val()
																+ ";"
																+ ui.item.userId
																+ ","
																+ ui.item.name
																+ ","
																+ ui.item.emailId
																+ ","
																+ ui.item.orgName
																+ ","
																+ ui.item.orgId
																+ ","
																+ ui.item.responsibleId
																+ ","
																+ ui.item.responisbleEmailId);

									}
									ui.item.value = '';

									jQuery('.submitQ').removeAttr("disabled");

								}
							});

			jQuery('#userSearch').on('click', function() {
				jQuery(this).val('');
			});

			jQuery('.sQ')
					.on(
							'click',
							function(e) {

								e.stopPropagation();
								e.preventDefault();
								jq
										.post(
												"${pageContext.request.contextPath}/confirmdistribution",
												jQuery('#distributeForm')
														.serialize(),
												function(data) {

													var d = jQuery
															.parseJSON(data);
													var content = '';
													for (var i = 0; i < d.length; i++) {
														content += '<tr><td class="alignLeft name" >'
																+ d[i].recipientName
																+ '</td><td class="alignLeft emailId" width="150px">'
																+ d[i].emailId
																+ '</td>'
																+ '<td class="alignLeft organisation">'
																+ d[i].organisationName
																+ '</td><td class="alignLeft sentOn">'
																+ d[i].strSentOn
																+ '</td>'
																+ '<td class="alignLeft repliedOn">'
																+ d[i].strRepliedOn
																+ '</td><td style="padding-left: 30px;"><div><input class="qstCheckbox" type="checkbox" id="question'+i+'"><label for="question' +i+ '"></label></div></td>'
																+ '<td style="display:none"><input type="text" name="dstContents" value="'+  d[i].userId + ","  + d[i].recipientName + ","+ d[i].emailId + "," + d[i].organisationName + "," + d[i].strSentOn + "," + d[i].strRepliedOn + "," + d[i].orgId + "," + d[i].strRecipient + "," + d[i].id + "," + d[i].recipientEmailId +'"/><input class="dstValues" name="dstValues" value="0"></td></tr>'
													}

													jQuery(content)
															.appendTo(
																	'.data-display-body_dis');
													jQuery('.responsePopup')
															.hide();
													jQuery('.responseConfirm')
															.show();
												});

							});

			jQuery('.cancel, .closeBtn').on('click', function(e) {
				//jQuery('.data-display-body_dis').empty();
				jQuery('#userName').val('');
				jQuery('#userId').val('');
				jQuery('.search-recepients').val('');
				jQuery('.red').hide();
				jQuery('.responseConfirm, .responsePopup, .popupBg').hide();
				jQuery('.newLinkingPopup').hide();
				jQuery('.submitQ').attr('disabled', 'disabled');
				jQuery('#userSearch').val(''); 
			});

			jQuery('.closePopupDis').on('click', function(e) {
				jQuery('.data-display-body_dis').empty();
				jQuery('#userName').val('');
				jQuery('#userId').val('');
				jQuery('.responsePopup, .popupBg').show();
				jQuery('.responseConfirm').hide();
				jQuery('.submitQ').attr('disabled', 'disabled')
			});
		});

		jQuery('.fa-times-circle').on('click', function() {
			jQuery('#userName').val('');
			jQuery('#userId').val('');
			jQuery('.data-display-body_dis').empty();
		});
		jQuery('.assignField').keydown(function() {
			return false;
		});

		jQuery('.responseConfirm').on('click', '.qstCheckbox', function() {
			if (jQuery(this).is(':checked') == true) {
				jQuery(this).closest('tr').find('.dstValues').val('1');
			} else {
				jQuery(this).closest('tr').find('.dstValues').val('0');
			}
		});


               function qrlink(id,name,type){
					jQuery('#questionnaireName').val(name);
					var qrid = id.substr(0, id.indexOf("$"));
					lid = id.substr(id.indexOf("$")+1,id.length - 1);
					console.log('linkid'+lid,'qid'+qrid);
					//var qrId=id.substr(0, id.length - 1);
					jQuery('#questionnaireID, #questionnaire_ID').val(qrid);
					
					jQuery('#questionnairedefType').val(type);
					jQuery('#linkId').val(lid);
					jQuery('.qtName').text(name);
					jQuery('.popupBg, .responsePopup').show();					
				}
               
               
				jQuery('.business-container').on('mouseenter', '.questionnaire', function(){
			         var offset = jQuery(this).offset();
			         var descText = jQuery(this).find('.qstDescription').text();
			         jQuery('.tooltop').css({'top': offset.top - 40 +"px", 'left': 90 + "px"}).text(descText).show();
			       });
					 jQuery('.business-container').on('mouseleave', '.questionnaire', function(){ 
			         jQuery('.tooltop').hide();
			       });
					 
					jQuery('.radioBtn').on('click', function() {
						 
						document.qbank.method = "post";
						document.qbank.action = "${pageContext.request.contextPath}/datacollection";
						document.qbank.submit();
					 })
				      				
				
	</script>



</body>
</html>
