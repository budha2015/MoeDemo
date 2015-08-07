<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.png" type="image/png">
<title>Partner Integrity</title>
<link rel="stylesheet" href="css/jquery-ui-1.11.0.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dataTablesDT.css">
<link rel="stylesheet" href="css/commonDT.css" />
<link rel="stylesheet" href="css/mainDT.css" />
<link rel="stylesheet" href="css/tprmDT.css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <style>
  /* .tableGrid { top: 0; background:#fff; padding-top: 10px;}
  .dataTableContainer { top: 35px;}
  .dataTables_wrapper .dataTables_filter { margin-left: 10px; }
  .questHeader .customInput label { margin-right: 5px;}
#myTable_info {display: none;}
  .questHeader{ padding:0.5em 0.5em 1em;background: #fff;
border-bottom: #e0e2e9 1px solid;}
  .dataTables_wrapper { }
  .dataTables_wrapper .dataTables_filter {
    float: left;
    position: absolute;
    text-align: right;
    top: 4px;
	left: 0;
}
table.dataTable {
	background: none; border-radius: 10px;}
	table.dataTable th,table.dataTable td{ white-space: nowrap}
.dataTableContainer {width: 100%; overflow-x: hidden;
    overflow-y: scroll; height: 360px; position: relative; top: 40px }
    .ib_question .dropdown:before {left: 20px}
    .frPad {clear: both; position: relative; margin-right: 27px; float:left; top:47px; left:10px}
    .even {background-color: #f2f0f1 !important;}
    .questionTxt {max-width: 555px;overflow: hidden;text-overflow: ellipsis;} */
    .questionTxt {max-width: 500px; text-overflow: ellipsis; overflow:hidden}
  </style>
</head>

<body>

<!-- Preloader -->
<div id="preloader">
  <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>

<jsp:include page="header.jsp" />

<form name="qbank" action="#"> 
  <div class="clr"></div>
	<div class="innerHeading">
	<div id="errMsg" class="status-warn" style="display: none;"><font color="red">Please Select Question to Add Question(s).</font></div> 
		<h1>Insert from bank</h1>
		<div class="fr frPad">
			<div class="buttonRow">
				<button class="btn btn-xs" type="button" onclick="abc(<%=((Long)request.getAttribute("QuestionnaireId"))%>)">Add Question(s)</button>
			</div>
		</div>
	<div class="clr"></div>
	</div>
	<div class="clr"></div>
	
	
			<!-- container starts here-->
	<div class="container">
	
		<div class="dataTableContainer">
		 
			<table id="lmsTable" class="data-display">
			  <thead class="head">
				<tr>
				  <th class="th_border" style="padding-left:10px; width: 10px"><input type="checkbox" id="selecctall" /><label></label></th>
				  <th class="qb_question filterHead th_border">Question <b><span></span>
                  <div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col1" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div></b>
					 </th>
				  <th class="qb_questionType filterHead">Category <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col2" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div></b>
					</th>
				</tr>
			  </thead>
			  <tbody class="data-display-body">
           <c:forEach items="${QuestionBank}" var="question">
           <tr>
			<td><span><input class="checkbox1"
				type="checkbox" name="Ctemplate"
				id="${question.questionId}" value="${question.questionId}" /><label
				for="${question.questionId}"></label></span></td>
            <td class="questionTxt">${question.questionText}</td>
            <td>${question.categoryName}</td>
            </tr>		
	  </c:forEach> 
   
           </tbody>
			</table>
			<form name="qbank">
			<input type="hidden" name="id" /> 
			</form>
			
<div class="cancelBtn">
  <!--  <button class="btn back" onclick="javascript:history.back()">Close</button> -->
   <button class="btn back ifrmBank"  onclick='retrieveQuestionnaire(<%=((Long)request.getAttribute("QuestionnaireId"))%>)'>Close</button>
</div>			
<input type="hidden" class="qlist" name="qlist">
<input type="hidden" name="questionnaireId" />
		</div>
	
	</div>
  <!-- container --> 
 </form>	 
  
  
  <jsp:include page="footer.jsp"></jsp:include>
		<!-- contentpanel -->
  
  

<div class="questPopup">   
 <i class="fa fa-times-circle closeBtn"></i> 
    <ul>
      <li>Enter Template name</li>
      <li><input  class="search-recepients clearfix fetchTemplateName ui-autocomplete-input ui-autocomplete-loading" autocomplete="off"><div class="listtemplateNames"></div></li>
      <li><button type="button" class="btn btn-xs cancel closePopup" name="cancelQ">Cancel</button>
     <button type="button" class="btn btn-xs submitQ" name="submitQ">Submit</button></li>
    </ul>   
    
</div>

 
<div class="popupBg"></div>
<!-- mainpanel --> 
<script src="js/jquery-ui-1.11.0.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.cookies.js"></script>
<script src="js/jquery.dataTables.js"></script> 
<script src="js/custom.js"></script> 
<script src="js/quescommon.js"></script>


   
<script>

// THIS METHOD ADDED NOW

function retrieveQuestionnaire(link)
{
// 	alert("In BRANCHING JSP JQUery Method"+link);
	//window.open("/partnerintegrity/branchPreview?id="+link,"_self");
   // document.retrieve.brId.value=link;
    //   alert("ID Value is:"+brId);
      document.qbank.method="post";
      document.qbank.id.value = link;      
  //   document.qbank.action = "/partnerintegrity/retrievequestionnaire?id="+link;
   document.qbank.action = "${pageContext.request.contextPath}/retrievequestionnaire";
       document.qbank.submit();
} 

//THIS METHOD ADDED NOW
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
    table.order([1,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
    jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_question .ztoa').click(function() {
   table.order([1,'desc']).draw();
   jQuery('.dropdown').addClass('hide');
   jQuery('.dropdown').removeClass('show');
});

jQuery('.qb_questionType .atoz').click(function() {
    table.order([2,'asc']).draw();
    jQuery('.dropdown').addClass('hide');
    jQuery('.dropdown').removeClass('show');
});
jQuery('.qb_questionType .ztoa').click(function() {
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



 /* sorting ends/
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
 
	/* filter starts */
  jQuery("#lmsTable thead th.filterHead").each(function(i){
   var selectVar="";
   i++;
  sortVal = table.column( i ).data().unique().sort(function(a,b){
   
	var alc = a.toLowerCase(), blc = b.toLowerCase();
    return alc > blc ? 1 : alc < blc ? -1 : 0;
});
      sortVal.each( function ( d, j ) {
    	  if(d == '') { 
              selectVar+='<div title="'+d+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>BLANK</div>';
        	  } else {
        		  selectVar+='<div title="'+d+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>'+ d + '</div>';
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
	
	
	
	
/* 	    jQuery('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"
            });         
        }
    }); */
  
	
/* datatable ends */

jQuery(".qb_question span").click(function(){
	if(jQuery(".qb_question .dropdown").hasClass("show")){
		jQuery(".qb_question .dropdown").addClass("hide");
		jQuery(".qb_question .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_question .dropdown").addClass("show");
	jQuery(".qb_question .dropdown").removeClass("hide");
	}
});


jQuery(".qb_questionType span").click(function(){
	if(jQuery(".qb_questionType .dropdown").hasClass("show")){
		jQuery(".qb_questionType .dropdown").addClass("hide");
		jQuery(".qb_questionType .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_questionType .dropdown").addClass("show");
	jQuery(".qb_questionType .dropdown").removeClass("hide");
	}
});

jQuery(".qb_category span").click(function(){
	if(jQuery(".qb_category .dropdown").hasClass("show")){
		jQuery(".qb_category .dropdown").addClass("hide");
		jQuery(".qb_category .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_category .dropdown").addClass("show");
	jQuery(".qb_category .dropdown").removeClass("hide");
	}
});

jQuery(".qb_template span").click(function(){
	if(jQuery(".qb_template .dropdown").hasClass("show")){
		jQuery(".qb_template .dropdown").addClass("hide");
		jQuery(".qb_template .dropdown").removeClass("show");		
	}

	else {
	jQuery(".qb_template .dropdown").addClass("show");
	jQuery(".qb_template .dropdown").removeClass("hide");
	}
});

jQuery(".qb_startDate span").click(function(){
  if(jQuery(".qb_startDate .dropdown").hasClass("show")){
    jQuery(".qb_startDate .dropdown").addClass("hide");
    jQuery(".qb_startDate .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_startDate .dropdown").addClass("show");
  jQuery(".qb_startDate .dropdown").removeClass("hide");
  }
});

jQuery(".qb_endDate span").click(function(){
  if(jQuery(".qb_endDate .dropdown").hasClass("show")){
    jQuery(".qb_endDate .dropdown").addClass("hide");
    jQuery(".qb_endDate .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_endDate .dropdown").addClass("show");
  jQuery(".qb_endDate .dropdown").removeClass("hide");
  }
});

jQuery(".qb_status span").click(function(){
  if(jQuery(".qb_status .dropdown").hasClass("show")){
    jQuery(".qb_status .dropdown").addClass("hide");
    jQuery(".qb_status .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_status .dropdown").addClass("show");
  jQuery(".qb_status .dropdown").removeClass("hide");
  }
});

jQuery(".qb_statusNew span").click(function(){
  if(jQuery(".qb_statusNew .dropdown").hasClass("show")){
    jQuery(".qb_statusNew .dropdown").addClass("hide");
    jQuery(".qb_statusNew .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_statusNew .dropdown").addClass("show");
  jQuery(".qb_statusNew .dropdown").removeClass("hide");
  }
});

jQuery(".qb_risklevel span").click(function(){
  if(jQuery(".qb_risklevel .dropdown").hasClass("show")){
    jQuery(".qb_risklevel .dropdown").addClass("hide");
    jQuery(".qb_risklevel .dropdown").removeClass("show");   
  }

  else {
  jQuery(".qb_risklevel .dropdown").addClass("show");
  jQuery(".qb_risklevel .dropdown").removeClass("hide");
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

/*     jQuery('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"
            });
        }else{
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"
            });         
        }
    }); */
    



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

jQuery('body').on('click','.checkbox1', function() {
	  console.log("clicked");
	  var el = jQuery('.qlist').val();
	  if(jQuery(this).is(":checked")) {
	    console.log("checked");
	    el += jQuery(this).val() + ",";
	    jQuery('.qlist').val(el);
	  } else {
	    var list = jQuery('.qlist').val().replace(jQuery(this).val() + ",", "");
	    jQuery('.qlist').val(list);
	  }
	});


function abc(type) {
	//alert("in function" + type);

    


	/* var selque = "";
	
	var elements = document.qbank.elements; */
	
/* 	for (var i = 0; i < elements.length; i++) {
		
		if (elements[i].checked && (elements[i].name == 'Ctemplate')) {
			//alert("ele "+elements[i].name);
			selque = selque +elements[i].value+ ",";
			////alert("val "+elements[i].value);
		}
	} */
	/* document.qbank.qlist.value = selque; */
	document.qbank.questionnaireId.value = type; 
	
	if (jQuery('.qlist').val() == ''){
		jQuery('#errMsg').show();
		return false;

       }
	else {
		//alert(type);
		jQuery('#errMsg').hide();
		document.qbank.id.value=type;
		document.qbank.method="post";
		document.qbank.action  ="/partnerintegrity/bankrelatedquestions";
		document.qbank.submit();
		return true;
	}

	//alert( document.qbank.qlist.value);
	////alert("temp name " + document.qbank.tempName.value);
	
	}


jQuery(document).ready(function () {

jQuery(".comments").parents('td').css({'position': 'relative', 'text-align': 'center'});
jQuery(".comments").on('click' , function(){
	if(jQuery(this).siblings('.commentsContainer').hasClass("show")){
		jQuery(this).siblings('.commentsContainer').removeClass("show").addClass("hide");	
	}

	else {
	jQuery(this).siblings('.commentsContainer').removeClass("hide").addClass("show");	
	}
});


    jQuery('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
        	var qlist = jQuery('.qlist').val();
        	jQuery('.checkbox1').each(function() { //loop through each checkbox
        		if(this.checked == false) {
        			this.checked = true; 
        			qlist += jQuery(this).val() + ",";
                    jQuery('.qlist').val(qlist);
        		}   
				jQuery(".link-questionnire").css("background","#11b1aa");
            });
        }else{
            jQuery('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"  
				jQuery(".link-questionnire").css("background","#CCC");	
				var list = jQuery('.qlist').val().replace(jQuery(this).val() + ",", "");
			    jQuery('.qlist').val(list);
                
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

    

jQuery(".save-template-popup .cancel").click(function(){
		jQuery(".save-template-popup").css("display","none");
		jQuery(".popupBg").css("display","none");
	  //(jQuery("#container").html());
});

jQuery(".save-template-popup .submitQ").click(function(){
		jQuery(".save-template-popup").css("display","none");
		jQuery(".popupBg").css("display","none");
		//alert(templatename = jQuery(".template-name").val());
		//alert(templatename +"<br>"+templatedata);
});


jQuery(".questPopup .submitQ").click(function(){
		jQuery(".quest-tabs .active.tab").css("z-index","0");
		jQuery(".questPopup").css("display","none");
		jQuery(".popupBg").css("display","none");
});


			//jQuery('.dataTable').wrap('<div class="dataTableContainer"></div>');
			jQuery('.frPad').appendTo('#myTable_wrapper');
			
	    	jQuery(document).mouseup(function(e){
	    		var container = jQuery(".dropdown");
	    		if(!container.is(e.target) && container.has(e.target).length === 0){
	    			container.each(function() {
	    			  if(jQuery(this).hasClass('show')) {
	    				  jQuery(this).addClass('hide');
	    				  jQuery(this).removeClass('show')
	    			  }	
	    			});
	    		}
	    	});
			
});


</script>

</body>
</html>
