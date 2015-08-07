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

         #errMsg {
         height: 28px;
         border: 1px solid #ccc;
         overflow: hidden;
         width: 300px;
         background: lightgrey;
         margin: auto;
         text-align: center;
         padding-top: 6px;
         color:red;
         font-size: 12px
         }
         #errMsgCreate {margin-bottom: 15px; margin-left: 20px}
         .frPad {position: absolute;
         right: 10px;
         top: 10px;
         z-index: 999;}
         /* .footer {position: relative !important; width: 82.2%; margin-left: 240px} */
         .cNameView {margin-bottom: 10px}
         .modal-dialog {margin: 15% auto}
         .category_description {width: 100%; height: 40px; padding: 5px;}
         .even {background-color: #f2f0f1 !important}
         .dropdown .atoz, .dropdown .ztoa, .dropdown input {cursor: pointer}
         :focus {outline: none !important}
         .deleteCat {width: 310px; overflow: hidden; text-align:center;display:none;
         position: absolute; top:140%; left: 39%; background:#fff; z-index: 99999; padding: 10px
         }
         .deleteCat div {line-height: 17px;
         font-size: 11px;
         font-family: verdana;
         text-align: left;
         margin-top: 6%;
         margin-left: 8%;
         margin-bottom: 11px}
         .deleteOk {display:block; width: 70px; float:right; margin-right: 15px}
         .popupBg {z-index: 9999}
         .atoz, .ztoa {cursor: pointer}
         .categoryHead {border-bottom: 1px solid #ccc}
         .clear-filter {cursor:pointer}
         .container .questHeader .col-md-4 {z-index: 999}  
         #category_description {padding: 5px}
         .modal-header{overflow:hidden}
         .modal-body {padding: 0 20px 0 20px}
         .editCategory {
background-color: transparent;
background-image: url("images/icons/edit_normal.png");
background-repeat: no-repeat;
border: medium none;
cursor: pointer;
display: inline-block;
height: 18px;
margin: 0;
vertical-align: middle;
width: 18px;
}

.modal-ontop {
display: none;
overflow: auto;
overflow-y: hidden;
position: fixed;
top: 50px;
right: 0;
bottom: 0;
left: 0;
z-index: 1050;
-webkit-overflow-scrolling: touch;
outline: 0;
}
.dialog-width-sm {
width: 250px;
}
form .form-group:last-child {
margin-bottom: 0;
}
/* .btn {
transition: all 5s ease 0s;
} */
.btn-xs {
padding: 2px 5px;
}
form .form-group:last-child {
margin-bottom: 0;
}

.fr {
float: right;
}
.modal-header-custom {
min-height: 10.4286px;
border: 0;
padding: 0;
}
.form-group {
margin-bottom: 15px;
}
.input-large {
width: 320px !important;
}
.input-large {
width: 320px !important;
}
textarea {
resize: none;
}
input, select, textarea {
font-family: 'LatoRegular', 'Lucida Grande', 'Lucida Sans Unicode', Helvetica, sans-serif !important;
}
.dialog-width {
width: 360px;
}
.modal {overflow-y: hidden}
.mainpanel.TPRM_bg{min-height: initial !important;height: initial !important;max-height: initial !important;}
.catName {width: 45% !important}
table.dataTable thead th, table.dataTable thead td, table.dataTable tbody th, table.dataTable tbody td {padding: 10px 35px !important}
      </style>
   </head>
   
   <body>
      <!-- Preloader -->
      <div id="preloader">
         <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
      </div>

         <jsp:include page="header.jsp"></jsp:include>
         <!-- headerbar -->
         
   <div class="clr"></div>
	<div class="innerHeading">
   <%--  <c:if test="${not empty errormessage}">
        <div id="errBackMsg">${errormessage}</div>
     </c:if> --%>
		<h1 class="fl">Question Category </h1>
		<div class="fr buttonRow">
			<sec:authorize access="hasRole('1-DESIGN')">
             <a data-keyboard="false"  data-toggle="modal" data-backdrop="static"  href="#createCategory"><button class="btn btn-xs"> Add Category </button></a>
             </sec:authorize>
         </div>
	<div class="clr"></div>
	</div>
	<div class="clr"></div>
         
         
         <div class="container">
		<div class="dataTableContainer">
			<table id="lmsTable" class="data-display">
			  <thead class="head">
				<tr>
				  <!-- <th class="th_border" style="padding-left:10px;width: 10px"><input type="checkbox" id="selecctall" /><label></label></th> -->
					<th class="qb_question filterHead th_border">Category <b><span></span>
					<div class="dropdown hide">
					  <div class="atoz"><span></span> Sort A to Z</div>
					  <div class="ztoa"><span></span> Sort Z to A</div>
					  <div class="clear-filter"><span></span>Clear filter</div>
					  <div id="col0" class="list-item"></div>
					  <div class="btns">
						<button type="button" class="btn btn-xs cancel">Cancel</button>
						<button type="button" class="btn btn-xs ok">Ok</button>
					  </div>
					</div>
					</b> </th>
				     <th class="blr">Question Count </th>
                     <th></th>
				</tr>
			  </thead>
			  <tbody class="data-display-body">
			     <c:forEach items="${categoryList}" var="category" varStatus="loopCounter">
                        <jsp:useBean id="loopCounter" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
                        <c:choose>
                           <c:when test="<%=loopCounter.getCount()%2==0%>">
                              <tr>
                                 <!-- <td><input type="checkbox" name="Ctemplate" class="checkbox1" /><label></label></td> -->
                                 <td class="name catName link">${category.name}</td>
                                 <td class="qstCount">${category.categoryQuestionCount}</td>
                                 <td><a data-toggle="modal" data-backdrop="static" data-keyboard="false"  href="#editCategory" class="editCategory" >
                                    <button type="button" class="editCategory"></button></a> 
                                    <span class="categoryId hidden">${category.id}</span>
                                 </td>
                                 <input type="hidden" class="catVal" value="${category.description}" />
                              </tr>
                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <!-- <td><input type="checkbox" name="Ctemplate" class="checkbox1" /><label></label></td> -->
                                 <td class="name catName link">${category.name}</td>
                                 <td class="alignCenter qstCount">${category.categoryQuestionCount}</td>
                                 <td class="alignCenter"><a data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#editCategory" class="editCategory" >
                                    <button type="button"class="editCategory"></button></a> 
                                    <span class="categoryId hidden">${category.id}</span> 
                                 </td>
                                 <input type="hidden" class="catVal" value="${category.description}" />
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>	
			  </tbody>
			</table>
		</div>
		
	</div>
         <!-- container --> 

      
      
      <!-- create catgeory modal starts --->
      <div class="modal" id="createCategory" tabindex="-1"  aria-hidden="true">

         <div class="modal-dialog dialog-width" >
            <div class="modal-content">
              <c:if test="${not empty errormessage}">
        				<div id="errMsgSubmit"><font color="red">${errormessage}</font></div>
        				<input class='hidden categorypopup' value='${popup}' />
    		  </c:if>
               <div class="modal-header modal-header-custom" >
<!--                   <div class="fr">
                     <button type="button" class="popupClose" data-dismiss="modal" aria-hidden="true" onclick="clearMsg()"></button>
                  </div> -->
               </div>
               <div id="errMsgCreate"></div>
               <div class="modal-body">
                  <form id="category_create" name="categoryCreate" action="${pageContext.request.contextPath}/createquestioncategory" method="post">
                     <div class="form-body">
                        <div class="form-group">
                           <label>Category Name <span class="red"> *</span></label>
                           <input type="text" id="category_name" name="categoryName" maxlength="35"  class="input-large">
                        </div>
                        <div class="form-group">
                           <label>Category Description</label>
                           <textarea id="category_description" name="categoryDesc" maxlength="50" class="input-large" ></textarea>
                           <input class="qCount hidden" value="" />
                           <!--<input type="text" id="category_name" placeholder="Description goes here...." class="form-control">-->
                        </div>
                        <div class="clearfix">
                           <div class="fl">
                              <!-- style="float:left"-->
                              
                           </div>
                           <div class="fr">
                              <!-- style="float:right;"  -->
                              <button type="button" class="btn btn-xs cancel" data-dismiss="modal" onclick="clearMsg()">Cancel</button>
                              <button type="button" class="btn btn-xs" onclick="submitCategory(this.form)" formaction="${pageContext.request.contextPath}/createquestioncategory">Submit</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      <!-- create category modal end -->
      <!-- edit category modal start -->
      <div class="modal" id="editCategory" tabindex="-1"  aria-hidden="true">
         <div class="modal-dialog dialog-width" >
            <div class="modal-content">
               <div class="modal-header modal-header-custom" >
<!--                   <div class="fr">
                     <button type="button" class="popupClose " data-dismiss="modal" aria-hidden="true" onclick="clearMsg()"></button>
                  </div> -->
               </div>
               <div id="errMsgEdit"></div>
               <form id="categoryEdit" name="editCategory" action="${pageContext.request.contextPath}/updatequestioncategory" method="post">
                  <div class="modal-body">
                  <c:if test="${not empty errormessage}">
        				<div id="errMsgSubmit"><font color="red">${errormessage}</font></div>
        				<input class='hidden categorypopup' value='${popup}' />
    		       </c:if>
                     <div class="form-body">
                        <div class="form-group">
                           <label>Edit Category Name</label>
                           <input name="categoryID"  class="category_ID" type="hidden" value="${category.id}">
                           <input class="hidden quesCount" value ="" />
                           <input name="categoryName" maxlength="35" class="input-large category_name_edit"  value="${category.name}">
                        </div>
                        <div class="form-group">
                           <label>Edit Category Description</label>
                           <textarea name="categoryDesc" class="category_description" maxlength="50" class="input-large">${category.description}</textarea>
                           <!--<input type="text" id="category_name" placeholder="Description goes here...." class="form-control">-->
                        </div>
                        <div class="form-group clearfix">
                           <div style="float:left">
                    
                              <button type="button" class="btn btn-xs delete deletefrom_edit" data-backdrop="static" data-keyboard="false"  data-toggle="modal" >Delete</button>
                           </div>
                           <div style="float:right;">
                                     <button type="button" class="btn btn-xs cancel" data-dismiss="modal" onclick="clearMsg()">Cancel</button>
                              <button type="button" class="btn btn-xs" onclick="submitCategory(this.form)" formaction="${pageContext.request.contextPath}/updatequestioncategory">Submit</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </form>
            </div>
            <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      <!-- edit category modal end -->
      <div class="modal" id="editCategory" tabindex="-1"  aria-hidden="true">
         <!-- edit category with delete warn modal start -->
         <div class="modal-dialog dialog-width" >
            <div class="modal-content">
               <div class="modal-header modal-header-custom" >
                  <div class="fr">
                     <button type="button" class="popupClose " data-dismiss="modal" aria-hidden="true"></button>
                     <!--	<h4 class="modal-title">Modal Title</h4>-->
                  </div>
               </div>
               <div class="modal-body">
                  <form id="categoryDel" name="delCategory">
                     <div class="form-body">
                        <div class="form-group">
                           <label>Edit Category Name</label>
                           <input name="categoryName" type="text" id="category_name" maxlength="30"  class="input-large">
                           <input class="hidden quesCount" />
                        </div>
                        <div name="categoryDesc" class="form-group">
                           <label>Edit Category Description</label>
                           <textarea id="category_description" class="input-large">Description goes here...</textarea>
                           <!--<input type="text" id="category_name" placeholder="Description goes here...." class="form-control">-->
                        </div>
                        <div class="form-group clearfix">
                           <div style="float:left">
                           </div>
                           <div style="float:right;">
                              <button type="button" class="btn btn-xs cancel" data-dismiss="modal">Cancel</button>
                              <button type="button" class="btn btn-xs" onClick="submitCategory(this.form)">Submit</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      <!-- edit category with deletewarn modal end -->   
      <!-- view catgeory modal starts --->
      <div class="questPopup" id="viewCategory">
         <i class="fa fa-times-circle closeBtn"></i> 
         <form>
            <ul>
               <li>Category Name</li>
               <li class="cNameView"><label class="catNameView"></label><input name="categoryName" type="text" id="category_name" class="hidden"></li>
               <li>Category Description</li>
               <li class="cNameView"><label class="catValView"></label></li>
               <li class="alignCenter"><button type="button" class="btn btn-xs closePopup">Ok</button>	</li>
            </ul>
         </form>
      </div>
      <!-- view category modal end -->	
      <!-- delete catgeory confirm modal starts --->
      <div class="modal-ontop" id="deleteCategory" tabindex="-1"  aria-hidden="true">
         <div class="modal-dialog" >
            <div class="modal-content">
               <div class="modal-body">
                  <form action="${pageContext.request.contextPath}/deletecategory" method="post" name="deleteCat">
                     <div class="form-body">
                        <div class="form-group">
                           Are you sure you want to delete the category?<br><br>
                           <%-- <label class="status-warn">${errormessage}</label> --%>
                           <input name="categoryID"  class="category_ID_delete" type="hidden" >
                           <div class="clearfix alignCenter" >
                              <button type="button" class="btn btn-xs cancel" data-dismiss="modal">Cancel</button>
                              <button type="button" class="btn btn-xs" data-dismiss="modal"  onclick="submitCategory(this.form);" formaction="${pageContext.request.contextPath}/deletecategory">Ok</button>                            
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- /.modal -->
      <!-- delete category confirm modal end -->	  
      <!-- delete catgeory warn info modal starts --->
      <div class="modal-ontop" id="deleteCategoryWarn" tabindex="-1"  aria-hidden="true">
         <div class="modal-dialog dialog-width-sm" >
            <div class="modal-content">
               <div class="modal-body">
                  <form>
                     <div class="form-body">
                        <div class="form-group">
                           You can't able to delete.Questions are still associated with this category.<br><br>
                           <div class="clearfix alignCenter" >
                              <button type="button" class="btn btn-xs" data-dismiss="modal">Ok</button>
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      <!-- delete category warn info modal end --> 
      <!-- mainpanel --> 
      <jsp:include page="footer.jsp" />
      <!-- contentpanel -->
      
      <div class="tooltop"></div>
      <div class="deleteCat">
         <div> <span class="catN"></span> cannot be deleted!<br>
            <span class="questCount">1</span> assigned to this category.
         </div>
         <button class="btn btn-xs deleteOk">Ok</button>
      </div>
      <script src="js/jquery-ui-1.11.0.min.js"></script> 
      <script src="js/bootstrap.min.js"></script> 
      <script src="js/modernizr.min.js"></script> 
      <script src="js/jquery.cookies.js"></script> 
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
    		
    		// alphanumeric sorting 

 

jQuery.fn.dataTableExt.oSort['mysort-asc']  = function(a,b) {

  var re = new RegExp("^([a-zA-Z]*)(.*)");

  var x = re.exec(a);

  var y = re.exec(b);

  if (x[1].toLowerCase() > y[1].toLowerCase()) return 1;

  if (x[1].toLowerCase() < y[1].toLowerCase()) return -1;

  x[2] = parseInt(x[2]);

  y[2] = parseInt(y[2]);

  return ((x[2] < y[2]) ? -1 : ((x[2] > y[2]) ?  1 : 0));

};

  

jQuery.fn.dataTableExt.oSort['mysort-desc'] = function(a,b) {

  var re = new RegExp("^([a-zA-Z]*)(.*)");

  var x = re.exec(a);

  var y = re.exec(b);

  if (x[1].toLowerCase() > y[1].toLowerCase()) return -1;

  if (x[1].toLowerCase() < y[1].toLowerCase()) return 1;

  x[2] = parseInt(x[2]);

  y[2] = parseInt(y[2]);

 

   return ((x[2] < y[2]) ?  1 : ((x[2] > y[2]) ? -1 : 0));

};


    		
    		      
    		
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
    	  	"aoColumns": [

    	  	           { "sType": "mysort" },

    	  	            { "sType": "mysort" },  

    	  	            null
    	  	        ] 

    	 });

    		  
    	  jQuery('.chk-box.sorting_1').hide();
    	  jQuery('.chk-box.sorting_1,th.chk-box').hide();

    	/* sortingStarts */  
    		//table.find("th").off("click.DT");
    		
    	jQuery('.qb_question .atoz').click(function() {
    	    table.order([0,'asc']).draw();
    	    jQuery('.dropdown').addClass('hide');
            jQuery('.dropdown').removeClass('show');
    	});
    	jQuery('.qb_question .ztoa').click(function() {
    	   table.order([0,'desc']).draw();
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
/* search ends */
    		/* filter starts */
  jQuery("#lmsTable thead th.filterHead").each(function(i){
   var selectVar="";
  sortVal = table.column( i ).data().unique().sort(function(a,b){
   
		var alc = a.toLowerCase(), blc = b.toLowerCase();
	    return alc > blc ? 1 : alc < blc ? -1 : 0;
    });
      sortVal.each( function ( d, j ) {
          selectVar+='<div title="'+d+'" class="filter-item'+i+'"><input type="checkbox" class="filter-Chkbox'+i+'" value="'+d+'"><label></label>'+d+'</div>';
		  
		 
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
	    		if(jQuery(".qb_category .dropdown").hasClass("hide")) {
	    			jQuery(".qb_category .dropdown").removeClass("hide");
	    			jQuery(".qb_category .dropdown").addClass("show");		
	    		}
	    		else {
	    			jQuery(".qb_category .dropdown").addClass("hide");
	    			jQuery(".qb_category .dropdown").removeClass("show");
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
    		
    		 jQuery("th").off("click");
    		
    	});


    	     
      </script>
      
      <script>
         
         jQuery(".save-template-popup .cancel").click(function(){
         		jQuery(".save-template-popup").css("display","none");
         		jQuery(".popupBg").css("display","none");
         	  //alert(jQuery("#container").html());
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
         		//alert(questname = jQuery(".questPopup .quest-title").val());
         		//alert(questdescr =jQuery(".questPopup .quest-descr").val());
         });
         
         //Custom DataTable UI Change
        
         //	jQuery('.dataTables_filter').find('label').empty();
         
         
         jQuery('body').on('click', '.editCategory', function(){
         	//alert("in edit");
         	            var $this = jQuery(this).closest('tr');
                         var catName = $this.find('.catName').text();
                         var catValue = $this.find('.catVal').val();
                         var catId = $this.find('.categoryId').text();
                         var count = $this.find('.qstCount').text();
                         jQuery('.category_name_edit').val(catName);
                         jQuery('.category_description').val(catValue);
                         jQuery('.category_ID').val(catId);
                         jQuery('.quesCount').val(count);
         
         });
         
         /*  jQuery('.catName').on('click', function(){
         	var catName = jQuery(this).html();
             var catValue = jQuery(this).parents('tr').find('.catVal').html();
                         jQuery('.catNameView').html(catName);
                         jQuery('.catValView').html(catValue);
               jQuery('#viewCategory').show();
              jQuery('.popupBg').show();
         });  */
         
         jQuery('.deletefrom_edit').on('click', function(){
         
             var catId = jQuery(this).parents('.modal-body').find('.category_ID').val();
         
             jQuery('.category_ID_delete').val(catId);
         
         
         });

         
         function submitCategory(formName)
         {
         	var fName = formName.name;
         	//alert('form name '+fName);
         	
         	if(fName != "deleteCat"){
         	var catName = formName.categoryName.value;
         	var catDesc = formName.categoryDesc.value;
         	
         	//alert('category Name'+catName);
         	//alert('category Desc'+catDesc);
         //	if(fName == "deleteCat"){
         		
         	//	}
         	//alert("mess"+jQuery('#errMsg'));
         	//jQuery('#errMsg').hide();
         	if(catName == ""){
         		//jQuery('#errMsg').css('display','block');
         		if(fName == "categoryCreate") {
         		    document.getElementById('errMsgCreate').innerHTML="<font color='red'>Category Name cannot be empty</font>";
         		   jQuery("#errMsgSubmit font").html("");
         		}
         		if(fName == "editCategory") {
         			document.getElementById('errMsgEdit').innerHTML="<font color='red'>Category Name cannot be empty</font>";
         			jQuery("#errMsgSubmit font").html("");
         		}
         		//jQuery('#errMsg').html('Category Name and Description cannot be empty');
         		//alert('null val');
         		}
         	else{
         		formName.submit();
         		}
         	}else{
         		formName.submit();
         	}
         	
         }
         function clearMsg(){
         	document.getElementById('errMsgCreate').innerHTML="";
         	document.getElementById('errMsgEdit').innerHTML="";
         	jQuery("#errMsgSubmit font").text("");
         	
         }
         
         function clear(formName){
         	formName.categoryName.value = "";
         	formName.categoryDesc.value = "Description goes here...";
         	
         }
         
         
/*          							jQuery(document).on('click', function(e) {
         								var dropable = jQuery('.dropdown');
         								if(!dropable.is(e.target) && dropable.has(e.target).length == 0){
         								    dropable.removeClass('show').addClass('hide');
         								}
         							});  */
         
         							 jQuery('.container').on('mouseenter', '.catName', function(){
         								 
         							   if(jQuery('.container .qb_question').find('.dropdown').hasClass('hide')) {
         					             var offset = jQuery(this).offset(),
         					             descText = jQuery(this).closest('tr').find('.catVal').attr("value");
         					             if(descText.length > 0) {
         					            	jQuery('.tooltop').text(descText).show();
         					            	var length = jQuery('.tooltop').height() + 22;
         					               jQuery('.tooltop').css({'top': offset.top - length +"px", 'left': 45 + 'px'});
         					              }
         					            } 
         							   
         						     });
         							 jQuery('.container').on('mouseleave', '.catName', function(){ 
         					             jQuery('.tooltop').hide();
         					           });
         
         							jQuery('.deletefrom_edit').on('click', function() {
                                          var $this = jQuery(this),
         				                 count = $this.closest('.modal-content').find('.quesCount').val();
                                          jQuery('.modal').modal('hide');
                                           if(parseInt(count) > 0) {
                                         	 $this.removeAttr('href', '#deleteCategory');
                                         	 var name = $this.closest('.modal-content').find('.input-large').val();
                                         	 jQuery('.modal').modal('hide');
                                         	 jQuery('.popupBg').show();
                                              if(parseInt(count) == 1){
                                             	 jQuery('.questCount').text("There is " + count + " question");
                                               }                                 	 
                                              else {
                                             	 jQuery('.questCount').text("There are " + count + " questions");
                                                  }
         
                                         	 jQuery('.catN').text(name);
                                         	 jQuery('.deleteCat').show();
                                         	 
                                          }
                                          else {
                                                   $this.attr('href', '#deleteCategory');
                                              }
                                          
         			  });
         
         			  jQuery('.deleteCat').on('click', '.deleteOk, .deleteClose', function(){
         				  jQuery('.popupBg').hide();
         				  jQuery('.modal').modal('hide');
         				  jQuery('.deleteCat').hide();
         			  }); 	


         				jQuery('#category_create').on('click', '.cancel', function() {
         				   jQuery('#category_name, #category_description').val('');
         				   jQuery('#errMsgSubmit font').text('');
         				});	  
         					
         	
      </script>
      <div class="popupBg"></div>
   </body>
</html>

