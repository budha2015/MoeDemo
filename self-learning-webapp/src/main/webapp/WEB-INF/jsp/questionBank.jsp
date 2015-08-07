<!DOCTYPE html>

<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
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
   .innerHeading #errMsg {display: none}
   .innerHeading .btns {float: right}
   .redirect {max-width: 250px; text-overflow: ellipsis; overflow:hidden}
   .sorting_asc {max-width: 10px !important}
   .search-recepients {background-position: 104% -79px}
   .ui-autocomplete {max-width: 289px}
   #errMsgEdit {display:none}
  </style> 
</head>

<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">
			<i class="fa fa-spinner fa-spin"></i>
		</div>
	</div>

    <jsp:include page="header.jsp"></jsp:include>
    
   <div class="clr"></div>
	<div class="innerHeading">
	<div id="errMsg" class="status-warn"></div>
		<h1 class="fl">Question Bank</h1>
		<div class="fr new-business-questionnaire">
			<sec:authorize access="hasRole('1-DESIGN')">
			<a href="${pageContext.request.contextPath}/postquestion" class="btn btn-xs">Add question</a>
			</sec:authorize>
		</div>
	<div class="clr"></div>
	</div>
	<div class="clr"></div>
	
		<form name="qbank" action="#">
		
			<!-- container starts here-->
	<div class="container qstBankContainer">
		<div class="dataTableContainer">
			<table id="lmsTable" class="data-display">
			  <thead class="head">
				<tr>
				  <th class="th_border" style="padding-left:10px;"><input type="checkbox" id="selecctall" /><label></label></th>
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
				  <th class="qb_questionType filterHead">Question type <b><span></span>
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
				  <th class="qb_category filterHead">Category <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col3" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div></b>
					 </th>
				  <th class="qb_template filterHead">Template <b><span></span>
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
					</b>
				 </th>
				 <th style="display:none"></th>
				</tr>
			  </thead>
			  <tbody class="data-display-body">
			  <c:if test="${!empty qsttQuestionBank}">
			  <c:forEach items="${qsttQuestionBank}" var="question">
				<tr>
					<td><input type="checkbox" name="Ctemplate"id="${question.questionId}" value="${question.questionId}" class="checkbox1" /><label
													for="${question.questionId}"></label></td>
					<td data-attr="${question.questionId}" class="link redirect" formaction="#"><c:out value="${question.questionText}" /></td>
					<td><c:out value='${question.questionType}'/></td>
					<td><c:out value="${question.categoryName}" /></td>
					<td class="editTemplate link"><c:out value="${question.templateName}" /></td>
					<td style="display:none"><div class="hidden tmpId">${question.templateId}</div>
					<div class="hidden quesId">${question.questionId}</div>
					<div class="hidden tmpdesc">${question.description}</div>
					</td>
				</tr>
				</c:forEach>
				
			  </c:if>	
			  </tbody>
			</table>
			
			<div class="addRemoveTemplate new-business-questionnaire">
			   <a class="btn btn-xs createTemplate">Add to Template</a> 
			   <a class="btn btn-xs" onclick="abc('delete')">Remove from Template</a>
			</div>
			
		</div>
		
	</div>
	
			<div class="questPopup" style="display:none">
				<div id="errMsgSubmit"></div>
				<ul>
					<li>Template name<span class="red"> *</span></li>
					<li><input 
						class="search-recepients clearfix fetchTemplateName ui-autocomplete-input ui-autocomplete-loading"
						autocomplete="off">
					<div class="listtemplateNames"></div></li><br><br>
					<li>Template Description</li>
					<li><input name="tempDesc" type="text" /></li>
					<li class="cancelSubmitBtn"><button type="button" class="btn btn-xs cancel closePopup"
							name="cancelQ">Cancel</button>
						<button type="button" class="btn btn-xs submitQ" name="submitQ">Submit</button></li>
				</ul>

			</div>
			<input type="hidden" name="qlist"> 
			<input type="hidden" name="tempName" class="tempClass"> 
			<input type="hidden" name="id">
			
		</form>

		<c:set var="names" scope="page" value="${templateList}">
		</c:set>
		<div class="popupBg"></div>

		<div class="questPopupEdit" id="editTemplate" style="display:none">
			<div id="errMsgEdit"><font color='red'>Template Name cannot be empty</font></div>
			<c:if test="${not empty errormessage}">    
             <div id="errBackMsg">${errormessage}</div>
             <input class="hidden qstBankPopup" value="${popup}" />
	        </c:if>
			<form id="updTemplate" name="updTemplate" action="${pageContext.request.contextPath}/updatetemplate" method="post">
				<ul>
					<li>Edit Template Name<span class="red"> *</span></li>
					<li><input name="tempName" type="text" id="category_name"></li>
					<li>Edit Template Description</li>
					<li><input name="tempDesc" type="text" id="category_description" value="" /></li>
					<!-- <textarea name="tempDesc" type="text" id="category_description">Description goes here...</textarea></li> -->
				
					<li class="cancelSubmitBtn">
					  <button type="button" class="btn btn-xs cancel fr closePopup" onclick="clearMsg()">Cancel</button>
						<button type="button" class="btn btn-xs fr submitTemp" onclick="updateTemplate()">Submit</button>
						
					</li>
				</ul>
				<input type="hidden" name="tempId" id="tempId">
			</form>

		</div>
     	

	 <jsp:include page="footer.jsp" />
	<!-- contentpanel -->
	 	
<div class="tooltop"></div>

	<!-- mainpanel -->
	
<script src="js/jquery-ui-1.11.0.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/modernizr.min.js"></script> 
<script src="js/jquery.cookies.js"></script> 
<script src="js/jquery.jscrollpane.min.js"></script>
<script src="js/jquery.dataTables.js"></script> 
<script src="js/custom.js"></script> 
<script src="js/quescommon.js"></script>
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>

   
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
    jQuery('.redirect').on('click', function() {
        var s = jQuery(this).attr('data-attr');
      //  alert(s);
      //alert("if id "+jQuery('#editTemplate'))
      var id= jQuery(this).parents('tr').find('.quesId').text();
      qid=id.substr(0, id.indexOf("#"));
      //alert("question id "+id);
        //window.open('/partnerintegrity/getquestion?id='+qid,'_self');
        document.qbank.id.value=qid;
	    document.qbank.method="post";
	    document.qbank.action = "${pageContext.request.contextPath}/getquestion";
	    document.qbank.submit();
      
     });
	
		function updateTemplate() {
			//alert('update template');
			
			var tempName = jQuery('#category_name').val();
			var tempValue = jQuery('#category_description').val();
			var tempId = jQuery('#tempId').text();

			//alert(tempName + ' ' + tempValue + ' ' + tempId);

			if(tempName == ""){
				//jQuery('#errMsg').css('display','block');
				jQuery('#errMsgEdit').show();
				jQuery('#errBackMsg').hide();
				}
			else{
				document.updTemplate.submit();
				}

		}
		
		function abc(type) {
			//alert("in function" + type);

			var selque = "";
			var elements = document.qbank.elements;
			for (var i = 0; i < elements.length; i++) {
				// alert("ele "+elements[i].checked);
				if (elements[i].checked) {
					selque = selque + elements[i].value + ",";
					//alert("val "+elements[i].value);
				}

			}
			document.qbank.qlist.value = selque;
			//alert("qlist" + document.qbank.qlist.value);
			//alert("temp name " + document.qbank.tempName.value);

			if (type == 'create') {
				document.qbank.method = "post";
				document.qbank.action = "${pageContext.request.contextPath}/savequestionbank";
				jQuery('#errMsg').show();
				document.getElementById('errMsg').innerHTML = "<font color='red'>Please Select Question to Add to Template.</font>";
            
				if (selque == '')
					return false;
				else {
					jQuery('#errMsg').hide();
					return true;
				}
			} else {
				//alert("In Else Part");
				document.qbank.method = "post";
				document.qbank.action = "${pageContext.request.contextPath}/deletequestionbank";
				jQuery('#errMsg').show();
				document.getElementById('errMsg').innerHTML = "<font color='red'>Please Select Question to Delete from Existing Template.</font>";
				//alert(selque+'len is '+selque.length);
				//alert("indes "+eval(selque.indexOf("#")+2));
				var arry=selque.split(",");
				//alert("Array Value:"+arry);
				var val="";
				var flag=false;
				for(i=0;i<arry.length;i++){
					val =  arry[i];
					//alert("val value is:"+val);
				if (val != '' && val.length > eval(val.indexOf("#")+1))
					{
					flag=true;
					break;
					}
				}
				if(flag)
					{					
					jQuery('#errMsg').hide();
					document.qbank.submit();					
					}
				else{
						return false;
					}
				
			}

			// alert("submit");
			//document.qbank.submit();
			//document.getElementById("click").action="${pageContext.request.contextPath}/savequestionbank";
		}

		function submitForm() {
			document.qbank.method = "post";
			document.qbank.submit();
		}

		var sNames = "<c:out value="${names}"/>";
		//sNames = sNames.replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;");
		var templateNameList = sNames.split(/,\s*/);

		jQuery(".fetchTemplateName").autocomplete({
			source : templateNameList,

			after : ".listtemplateNames"
		});

		 jQuery('.container').on('mouseenter', '.redirect', function(e){

			 var offset = jQuery(this).offset(),
                 descText = jQuery(this).text();
			 jQuery('.tooltop').text(descText).show();
			 var length = jQuery('.tooltop').height() + 22;
               jQuery('.tooltop').css({'top': offset.top - length +"px", 'left': 60 + "px"});

          });
		 jQuery('.container').on('mouseleave', '.redirect', function(){ 
            jQuery('.tooltop').hide();
          }); 

		 jQuery(".save-template-popup .cancel").click(
					function() {
						jQuery(".save-template-popup").css("display", "none");
						jQuery(".popupBg").css("display","none");
						//(jQuery("#container").html());
					});

			jQuery(".save-template-popup .submitQ").click(
					function() {
						jQuery(".save-template-popup").css(
								"display", "none");
						jQuery(".popupBg").css("display",
								"none");
						//alert(templatename = jQuery(".template-name").val());
						//alert(templatename +"<br>"+templatedata);
					});

			jQuery(".questPopup .submitQ").click(
							function() {
								//alert(templatename = jQuery(".search-recepients").val());
								jQuery('.tempClass').val(jQuery(".search-recepients").val());
								//search-recepients clearfix fetchTemplateName
								if (jQuery(".search-recepients").val() == '') {
									document.getElementById('errMsgSubmit').innerHTML = "<font color='red'>Template Name is Mandatory.</font>";
								} else {
									jQuery('.questPopup').css("display", "none");
									submitForm();
									jQuery(".popupBg").css("display", "none");
									
								}												
							});
			//Popup 	
			jQuery('.createTemplate').on('click', function(e) {
				e.stopPropagation();
				
				if (abc('create')) {
					//alert("in true");
					document.getElementById('errMsgSubmit').innerHTML = "";
					jQuery('.questPopup').show();
					jQuery('.popupBg').show();
				} else {
					//alert("in false");
					jQuery('.questPopup').hide();
					jQuery('.popupBg').hide();
				}
			});

			jQuery('.container').on('click','.editTemplate', function() {
				var $this = jQuery(this);
				//alert("in edit template");
				jQuery('#category_name').val($this.text());
				jQuery('#category_description').val($this.parents('tr').find('.tmpdesc').text().trim());
				jQuery('#tempId').val($this.parents('tr').find('.tmpId').text());
				jQuery('#editTemplate').show();
				jQuery('.popupBg').show();
			});
			
			jQuery('.deleteTemplate').on('click', function() {
				jQuery('#editTemplate').css({
					'opacity' : '0.9'
				});
				jQuery('#deleteTemplate').show();
				jQuery('.popupBg').show();
			});
			
			jQuery('.closePopup, .closeBtn').on('click', function() {
						jQuery('.questPopupEdit, #errBackMsg, #errMsgEdit').hide();
						jQuery('.popupBg').hide();
			});


		 
	</script>
	
	

</body>
</html>
