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
<script src="js/jquery-1.10.2.min.js"></script> 

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <style>
    .mainpanelHeight {height: 100% !important}
    .dataTableContainer {margin-bottom: 25px}
    .redirect {cursor: pointer}
    .questHeader { background: none;}
    .RM_datatable_tab {border-bottom: 1px solid #ccc;padding: 0px 0 35px; margin: 0 0 10px;}
	.RM_datatable_tab span {display: inline-block;float: left;font-size: 12px; padding:10px;text-align: center; margin-left:15px;cursor:pointer;background-color:#ccc;border:1px solid #ccc;border-bottom:#ccc; color:#000;}
	.active_tab{color:#000 !important; background:#fff !important; border-bottom: 1px solid #fff !important;}
    .redirect {text-overflow: ellipsis; overflow:hidden}
  </style>
</head>

<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<jsp:include page="header.jsp"></jsp:include>

	<div class="clr"></div>
	<div class="innerHeading">
		<h1>Data Collection Response</h1>
		
		<div class="questHeader clearfix"> 
		<form action="/partnerintegrity/responsedatacollection" method="post">
		  <c:choose>
		    <c:when test="${deftype  eq 'Q'}">

		     <div class="fl customInput customRadio"><input type="radio"  checked="checked" id="questionnaires" name="dataCollection" autocomplete="off"><label for="questionnaires">Questionnaires</label> <input type="radio" id="bzCase" name="dataCollection" autocomplete="off"><label for="bzCase">Business Case</label> <input type="radio" id="all" name="dataCollection" autocomplete="off"><label for="all">All</label></div>  
		    </c:when>
		    <c:when test="${deftype  eq 'B'}">

		     <div class="fl customInput customRadio"><input type="radio" id="questionnaires" name="dataCollection" autocomplete="off"><label for="questionnaires">Questionnaires</label> <input type="radio" id="bzCase"  checked="checked" name="dataCollection" autocomplete="off"><label for="bzCase">Business Case</label> <input type="radio" id="all" name="dataCollection" autocomplete="off"><label for="all">All</label></div>  
		    </c:when>
		    <c:otherwise>

		     <div class="fl customInput customRadio"><input type="radio" id="questionnaires" name="dataCollection" autocomplete="off"><label for="questionnaires">Questionnaires</label> <input type="radio" id="bzCase" name="dataCollection" autocomplete="off"><label for="bzCase">Business Case</label> <input type="radio" id="all" checked="checked" name="dataCollection" autocomplete="off"><label for="all">All</label></div>  
		    </c:otherwise>
		  </c:choose>
		 
          </form>
		   <div class="fr frPad">
		   

          <div class="buttonRow">
            <button class="btn btn-xs" data-toggle="modal" href="#createQuestion">Send Reminder</button>
           <!--<button class="btn btn-xs">+ External Organisation</button>-->
          </div>
		  
		  </div>
          </div>
			
		<div class="clr"></div>
	</div>
	<div class="clr"></div>
	
	
<!-- leftpanel -->


			
		<!-- headerbar -->
		
	<!-- container starts here-->
	<div class="container datacollection_container">
		<div class="row">
			   <div class="RM_datatable_tab">			
				<form id="displayrecievedtaskform" method="post" action="/partnerintegrity/assigndatacollection">
					<span id="rec_task" onclick="document.getElementById('displayrecievedtaskform').submit();">Data Collection Assign</span>
				</form>
				
				<form id="displaysenttask" method="post" action="/partnerintegrity/responsedatacollection">
					<span id="send_task" class="active_tab" onclick="document.getElementById('displaysenttask').submit();">Data Collection Response</span>
				</form>
			</div>
		</div>
		<div class="dataTableContainer">
		
		 <form name="collection" class="dataCollections">  
			<table id="lmsTable" class="data-display responseDT_table">
			  <thead class="head">
				<tr>
				  <th class="th_border filterHead" style="padding-left:10px;"><input type="checkbox" id="selecctall" /><label></label></th>
				  <th class="iconHead filterHead"></th>
				  <th class="qb_question filterHead th_border">Name <b><span></span>
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
					</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				  <th class="qb_category filterHead">Recipient <b><span></span>
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
				  <th class="qb_template filterHead">Date sent <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col4" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
				  <th class="qb_startDate filterHead">Date completed <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col5" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
				  <th class="qb_endDate filterHead">Responsible party <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col6" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
				  <th class="qb_status filterHead">Bussiness unit <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col7" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
					<th class="qb_statusNew filterHead last_header">Status <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col8" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
					<th>Comments</th>
				</tr>
			  </thead>
			  <tbody class="data-display-body">
				<c:if test="${!empty dataCollectionList}"> 
           
   <c:forEach items="${dataCollectionList}" var="dataCollection" > 
           
          <tr>
          <td><input type="checkbox" id="${dataCollection.questionnaireId}" value="${dataCollection.questionnaireId}~${dataCollection.recipientFirstName} ${dataCollection.recipientLastName}~${dataCollection.recipient}" name="chkbox" class="checkbox1" /><label></label></td>
				<td class="logoIcon"><span class="<c:out value="${dataCollection.defType}" />logo"></span></td>
				<td data-attr="${dataCollection.questionnaireId}" class="score link name redirect" ><c:out value="${dataCollection.questionnaireDefname}"/></td>
				 <td>${dataCollection.recipient}</td>

				

				 <td><fmt:formatDate type="date" value="${dataCollection.dateSent}" pattern="dd/MM/yyyy" /></td>

				

				 <td><fmt:formatDate type="date" value="${dataCollection.dateCompleted}" pattern="dd/MM/yyyy" /></td>

				

				 <td>${dataCollection.userName}</td>

				

				 <td>${dataCollection.responsibleParty}</td>

				

				  <td class="statusHead"><c:out value="${dataCollection.status}"/></td>

				

				  <%-- <td><c:out value="${dataCollection.riskLevel}"/></td> --%>

				
				
            <td class="viewCommentsIcon"><img src="images/icons/commentsview_normal.png" width="16" height="16" class="commentIcon">
            <input type="hidden" name="contractId" id="contractId${dataCollection.questionnaireId}" class="contractId" value="${dataCollection.questionnaireId}"/>
            </td>
          </tr> 
    </c:forEach>  
  </c:if>
			
			  </tbody>
			</table>
		    <input type="hidden" name="qlist">
           	<input type="hidden" name="id"> 
		 </form>
		</div>
		
	</div>
	<!-- container -->	
		
   
     
         
         
         <jsp:include page="footer.jsp" />
		<!-- contentpanel -->
		

<div class="questPopup">   
 <i class="fa fa-times-circle closeBtn"></i> 
    <ul>
      <li>Enter Template name</li>
      <li><input class="search-recepients clearfix fetchTemplateName ui-autocomplete-input ui-autocomplete-loading" autocomplete="off"><div class="listtemplateNames"></div></li>
      <li><button type="button" class="btn btn-xs cancel closePopup" name="cancelQ">Cancel</button>
     <button type="button" class="btn btn-xs submitQ" name="submitQ">Submit</button></li>
    </ul>   
    
</div>

<div class="viewCommentsContainer">
  <div class="commentDiv">
	<span class="comentsTab comentsTabActive" data="tab-1">Public</span>
	<span class="comentsTab" data="tab-2">Private</span>
	<div class="clr"></div>
  </div>
  <div class="comments-trail">
	<div class="tabContainer" id="tab-1">
		<input type="text" class="commentEmail" value="All approvers/reviewers" disabled="disabled" />
		<textarea class="commentTextarea" placeholder="Start typing..."></textarea>
		<input type="text" class="currentPage hidden" value="questionnaire" />
		<input type="text" class="contractIdHidden hidden" />
		
		<div class="send-TP">
	      <!-- <input id="sendToTP" class="sendToTPChecked" type="checkbox" name="sendToTP" value="1">  -->
	      <input id="sendToTP" class="sendToTPChecked" type="checkbox" name="sendToTP"> 
	      <label for="sendToTP">Send to third party</label>
        </div>
		
		<input type="button" value="Post" name="submit" disabled="disabled" class="commentBtn" />
		<div class="clr"></div>
		<ul>
		  
		</ul>
	</div><!-- //publicContainer -->
	<div class="tabContainer" id="tab-2">
		<input type="text" class="commentEmailPrivate"/>
		<textarea class="commentTextareaPrivate" placeholder="Start typing..."></textarea>
		<input type="button" value="Post" name="submit" disabled="disabled" class="commentBtnPrivate" />
		<input type="text" class="currentPagePrivate hidden" value="questionnaire" />
		<input type="text" class="contractIdPrivateHidden hidden" />
		<input type="text" class="emailIdValue hidden" />
		<div class="clr"></div>
		<ul>
		  
		</ul>
	</div><!-- //privateContainer -->
  </div>
</div>

<div class="popupBg"></div>
<!-- mainpanel --> 

<script src="js/jquery-ui-1.11.0.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/jquery.jscrollpane.min.js"></script>
<script src="js/jquery.dataTables.js"></script> 
<script src="js/custom.js"></script> 
<script src="js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>

<script>
jQuery(document).ready(function(){
	 var checkState;
	jQuery(document).on("change","#sendToTP", function(){
	checkState = jQuery(this).is(":checked");
	if(checkState==true){
		jQuery("#sendToTP").val(true);
		console.log("In side if from datacollection.jsp page" + jQuery("#sendToTP").val());
	}else{
		jQuery("#sendToTP").val(false);
		console.log("In side else from datacollection.jsp page" + jQuery("#sendToTP").val());
	}
	console.log(checkState);
	});
});	
</script>

<script>
jQuery(window).load(function(){
	console.log("window start...");
	jQuery(".mainpanel.TPRM_bg").css({'height':'833px','max-height':'833px','min-height':'833px'});
	console.log("window ends...");
});

jQuery(document).ready(function () {
	//starts for view comment 17-12-2014
	jQuery(document).on("click", ".commentIcon", function(e){
		var comentOffset = jQuery(this).offset();
		jQuery('.commentEmailPrivate').val('');
	    jQuery('.comentsTab').eq(0).trigger('click');
 	    var top_offset;
 	    
		if(jQuery(window).width() < "700"){
			jQuery(".viewCommentsContainer").show();
			jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 145, "top":comentOffset.top + 200});
		} else{
			if(comentOffset.top > '450') {
				console.log('inside if');
				top_offset = comentOffset.top/2;
				jQuery(".viewCommentsContainer").show();
				jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 230, "top":comentOffset.top - 200});
				jQuery(".viewCommentsContainer").animate({
					left:comentOffset.left - 250
				});
				jQuery("body").scrollTop(jQuery('body').height() - 30);
			}
			else {
				jQuery(".viewCommentsContainer").show();
				jQuery(".viewCommentsContainer").css({"left":comentOffset.left - 230, "top":comentOffset.top - 60});
				jQuery(".viewCommentsContainer").animate({
					left:comentOffset.left - 250
				});
				jQuery("body").scrollTop(jQuery('body').height() - 30);
			}
			
			
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
	    "sSearch" :" ",
	    "oPaginate": {"sFirst": "F","sPrevious": "P","sNext": "N","sLast": "L"},
	    "sLengthMenu": "view _MENU_ items/page",
	    "sInfo": " ",
	    "sInfoEmpty": " "
	  	},
  "pagingType": "full_numbers",
	  });

	  
  jQuery('.chk-box.sorting_1').hide();
  jQuery('.chk-box.sorting_1,th.chk-box').hide();

/* sortingStarts */  
	//table.find("th").off("click.DT");
	jQuery("th").off("click");
	
	
	jQuery('.qb_question .atoz').click(function() {
        table.order([2,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_question .ztoa').click(function() {
       table.order([2,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });

    jQuery('.qb_category .atoz').click(function() {
        table.order([3,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_category .ztoa').click(function() {
       table.order([3,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });

    jQuery('.qb_template .atoz').click(function() {
        table.order([4,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_template .ztoa').click(function() {
       table.order([4,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });

    jQuery('.qb_startDate .atoz').click(function() {
        table.order([5,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_startDate .ztoa').click(function() {
       table.order([5,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });

    jQuery('.qb_endDate .atoz').click(function() {
        table.order([6,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_endDate .ztoa').click(function() {
       table.order([6,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    }); 

    jQuery('.qb_status .atoz').click(function() {
        table.order([7,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_status .ztoa').click(function() {
       table.order([7,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });

    jQuery('.qb_statusNew .atoz').click(function() {
        table.order([8,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_statusNew .ztoa').click(function() {
       table.order([8,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });

    jQuery('.qb_risklevel .atoz').click(function() {
        table.order([8,'asc']).draw();
        jQuery('.dropdown').addClass('hide');
        jQuery('.dropdown').removeClass('show');
    });
    jQuery('.qb_risklevel .ztoa').click(function() {
       table.order([8,'desc']).draw();
       jQuery('.dropdown').addClass('hide');
       jQuery('.dropdown').removeClass('show');
    });


 /* sorting ends/
 /* search starts*/
/*Global Search - Match only words starts with searched keyword */
jQuery.fn.dataTable.ext.search.push( function (settings, searchData) {
    var currSearchRegex = new RegExp("^" + jQuery("div.dataTables_filter input").val(), 'i');

    for(i in searchData) {
        if(currSearchRegex.test(searchData[i])){
            return true;
        }
    }
    return false;
});
/* search ends */
 
 
	/* filter starts */
  jQuery("#lmsTable thead th.filterHead").each(function(i){
   var selectVar="";
  sortVal = table.column( i ).data().unique().sort(function(a,b){
   
	var alc = a.toLowerCase(), blc = b.toLowerCase();
    return alc > blc ? 1 : alc < blc ? -1 : 0;
});
      sortVal.each( function ( d, j ) {
    	  if(d == '') { 
            selectVar+='<div title="'+d+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>BLANK</div>';
    	  } else {
    		  selectVar+='<div title="'+d+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>'+d+'</div>';
    	  }
		 
        } ); 
       jQuery("#col"+i).append(selectVar);
               
    });
	
	  
	  
  jQuery(".ok").click(function(){
      var chkId = '';
      jQuery(this).closest('.dropdown').find('input:checkbox:checked').each(function() {
      chkId += "^"+jQuery(this).val() + "$|";
  });
var thiscol = jQuery(this).parents('th').index();
if(chkId){
chkId = chkId.substring(0,chkId.length-1)
      table.column( thiscol ).search(chkId, true, false ).draw();
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
	
	

	// Clear filter starts
	jQuery('.clear-filter').click(function(event) {

	       jQuery(this).next(".list-item").find('input[type="checkbox"]').each(function(){
	       this.checked = false;
	       table.column(jQuery(this).parents('th').index()).search("", true, false ).draw();
	       jQuery('.dropdown').addClass('hide');
	       jQuery('.dropdown').removeClass('show');
	   })
	});
	// Clear filter ends
  
	
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
	 jQuery(".dataTables_length select").selectmenu({
				open: function( event, ui ) {
          jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').addClass('active');
      },
      close: function( event, ui ) {
        jQuery(this).siblings('.ui-selectmenu-button').children('.ui-icon').removeClass('active');
      },
      change:function(event, ui){
        jQuery(".dataTables_length select").val(ui.item.label).trigger('change');
      }
	});
	
	
});

</script>

<script>



function abc(type) {
	//alert("in function" + type);

	var selque = "";
	var elements = document.collection.elements;
	for (var i = 0; i < elements.length; i++) {
		// alert("ele "+elements[i].checked);
		if (elements[i].checked) {
			selque = selque + elements[i].value + ",";
			//alert("val "+elements[i].value);
		}

	}
	document.collection.qlist.value = selque;
	alert(document.collection.qlist.value);
	
}



jQuery(document).ready(function () {
/* datatable */

	
/* datatable ends */

jQuery('.container').find('.dropFilter').on('click', function() {
	jQuery('.container').find('.dropdown').addClass('hide').removeClass('show');
	   jQuery(this).siblings('.dropdown').removeClass('hide').addClass('show');
	});
	
jQuery(".comments").parents('td').css({'position': 'relative', 'text-align': 'center'});
jQuery(".comments").on('click' , function(){
	if(jQuery(this).siblings('.commentsContainer').hasClass("show")){
		jQuery(this).siblings('.commentsContainer').removeClass("show").addClass("hide");	
	}

	else {
	jQuery(this).siblings('.commentsContainer').removeClass("hide").addClass("show");	
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


jQuery(".questPopup .submitQ").click(function(){
		jQuery(".quest-tabs .active.tab").css("z-index","0");
		jQuery(".questPopup").css("display","none");
		jQuery(".popupBg").css("display","none");
});

	jQuery('.dataTables_length').insertAfter('#lmsTable');
	 jQuery('.dataTables_length').insertAfter('.dataTables_paginate');


});

jQuery('body').on('click', '.redirect',function() {
    var s = jQuery(this).attr('data-attr');
  
 		document.collection.id.value = s;
 		document.collection.method = "post";
 		document.collection.action = "${pageContext.request.contextPath}/retrievequestionnairedistribution";
 		document.collection.submit();
 
 });

//jQuery('.data-display-body input[type=checkbox]').trigger('click');



function adjustMPHeight(){
	var mainpanelHeight = jQuery(".tableGrid").height();
	jQuery('.mainpanel').css('min-height',mainpanelHeight);
}
adjustMPHeight();
jQuery('.tableGrid').on('click' , function(){
      adjustMPHeight();
 });

jQuery('.questHeader .customRadio').on('click', 'label', function() {
    var el = jQuery(this).attr('for'), $this = jQuery(this);
    if(el == 'bzCase') {
      $("<input class='hidden' name='deftype' value='B'>").insertAfter($this);
    } else if(el == 'questionnaires') {
     $("<input class='hidden' name='deftype' value='Q'>").insertAfter($this);
    } else {
     $("<input class='hidden' name='deftype' value='all'>").insertAfter($this);
    }
    $this.closest('form').submit();
});

	jQuery('.frPad').on('click', '.btn', function() {
	   jQuery.get('/partnerintegrity/sendquestionnaireemail', jQuery('.dataCollections').serialize());
	});

</script>





</body>
</html>
