<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="image/png">
      <title>Partner Integrity</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui-1.11.0.css">
      <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-switch.min.css">
      
      <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->
      
      <style>
        #ui-id-1{width: 275px !important}
        #ui-id-2{width: 183px !important}
        .addPhoneContainer .row {display:none}
        .addEmailContainer .row {display:none}
         .addRoleContainer .row {display:none}
        .errorMessage {display: block; padding-bottom: 4px; padding-left: 125px;}
        .ui-widget {width: 279px !important}
      </style>
   </head>
   <body>
      <!-- Preloader -->
      <div id="preloader">
         <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
      </div>
      <div class="leftpanel">
         <div class="logopanel">
            <a href="#"><img src="${pageContext.request.contextPath}/images/img_logo.png" alt="Partner Integrity" border="0"></a>
         </div>
         <!-- logopanel -->
         <div class="leftpanelinner">
				<jsp:include page="leftPanel.jsp"></jsp:include>
		 </div>
         <!-- leftpanelinner -->
      </div>
      <!-- leftpanel -->
      <div class="mainpanel">
         <div class="headerbar">
            <a class="menutoggle"><i class="fa fa-bars"></i></a>
            <form class="searchform" action="#" method="post">
               <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
            </form>
            <div class="header-right">
               <ul class="headermenu">
                  <li>
                     <div class="btn-group" >
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/images/photos/loggeduser.png" alt="" />
                        Jonathan carter
                        <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                           <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                           <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                           <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                           <li><a href="#"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
                        </ul>
                     </div>
                  </li>
                  <li>
                     <div class="btn-group">
                        <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-bell" style="color:#999999"></i>
                        <span class="badge">1</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-head pull-right">
                           <h5 class="title">You Have 1 New Notifications</h5>
                           <ul class="dropdown-list gen-list">
                              <li class="new">
                                 <a href="">
                                 <span class="thumb"><img src="${pageContext.request.contextPath}/images/photos/user4.png" alt="" /></span>
                                 <span class="desc">
                                 <span class="name">Zaham Sindilmaca <span class="badge badge-success">new</span></span>
                                 <span class="msg">is now following you</span>
                                 </span>
                                 </a>
                              </li>
                              <li class="new"><a href="">See All Notifications</a></li>
                           </ul>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>
            <!-- header-right -->
         </div>
         <!-- headerbar -->
         <!-- User Management - Add User -->
           <form:form method="post" name="myForm" action="editUserSuccess.do"
				modelAttribute="userDTO">
         <div class="container">
            <div class="containerPanel clearfix">
               <h1 class="title">Personal Information</h1>
               <div class="um-form">
                  <div class="row">
                  <div class="col-md-6">
                  <div class="row"> <label>Title </label>
            <%--           <div class="titleRow customInput customRadio" >
                      <c:choose>
                      <c:when test = "${userDTO.title eq 'mr' }">
                      <input type="radio" name="title" id="mr" checked/><label for="mr">Mr. </label> 
                      <input type="radio" name="title" id="mrs" /><label for="mrs">Mrs. </label> 
                      <input type="radio" name="title" id="ms" /><label for="ms">Ms. </label> 
                      <input type="radio" name="title" id="dr" /><label for="dr">Dr. </label> 
                      </c:when>
                      <c:when test = "${userDTO.title eq 'mrs' }">
					<input type="radio" name="title" id="mr" /><label for="mr">Mr. </label> 
                      <input type="radio" name="title" id="mrs" checked/><label for="mrs">Mrs. </label> 
                      <input type="radio" name="title" id="ms" /><label for="ms">Ms. </label> 
                      <input type="radio" name="title" id="dr" /><label for="dr">Dr. </label> 
                      </c:when>
                      <c:when test = "${userDTO.title eq 'ms' }">
					<input type="radio" name="title" id="mr" /><label for="mr">Mr. </label> 
                      <input type="radio" name="title" id="mrs" /><label for="mrs">Mrs. </label> 
                      <input type="radio" name="title" id="ms" checked/><label for="ms">Ms. </label> 
                      <input type="radio" name="title" id="dr" /><label for="dr">Dr. </label> 
                      </c:when>
                      <c:when test = "${userDTO.title eq 'dr' }">
					<input type="radio" name="title" id="mr" /><label for="mr">Mr. </label> 
                      <input type="radio" name="title" id="mrs" /><label for="mrs">Mrs. </label> 
                      <input type="radio" name="title" id="ms" /><label for="ms">Ms. </label> 
                      <input type="radio" name="title" id="dr" checked/><label for="dr">Dr. </label> 
                      </c:when>
                      </c:choose>     
                      </div> --%>
                      <div class="titleRow customInput customRadio" > 
                  		   <form:radiobutton path="title" id="mr" value="mr"/>
                  		   <label for="mr">Mr. </label> 
                  		   <form:radiobutton path="title" id="mrs" value="mrs"/>
                      	   <label for="mrs">Mrs. </label> 
                      	   <form:radiobutton  path="title" id="ms" value="ms"/>
                      	   <label for="ms">Ms. </label> 
                      	   <form:radiobutton  path="title" id="dr" value="dr"/>
                      	   <label for="dr">Dr. </label>		
                     </div>
                  </div>
                  </div>
                  <div class="col-md-6">
                  <div class="row">
                           <label style="width:auto">Primary Organistaion</label>
         				<input type="text"  name="searchUserMap" id="searchUserMap" class="search-recepients clearfix searchUserMap ui-autocomplete-input" />
         				<input type="hidden"  name="searchUserMapValue" id="searchUserMapValue" /> 
                          
                        </div>
                  </div>
                  <div class="clearfix"></div>
				 <div class="col-md-4">
						<input type="hidden" class="form-control" name="id" value="${userDTO.id}" />
						<input type="hidden" class="form-control" name="orgID" value="${userDTO.organisationId}" />
                        <div class="row">
                           <label><span class="red">*</span> First Name</label>
                           <input type="text" class="form-control" placeholder="First Name" name="firstName" value="${userDTO.firstName}" />
                        </div>
                        <div class="row">
                           <label>Given Name</label>
                           <input type="text" class="form-control" name="givenName" value="${userDTO.givenName}" />
                        </div>
                        <div class="row">
                           <label>Designation</label>
                           <input type="text" class="form-control" name="designation" value="${userDTO.designation}" />
                        </div>
                        <div class="addEmailContainer">
                        <input type="text" class="hiddenEmailPhone" style="display:none" value="1" />
                        <c:forEach items="${userDTO.userEmailList}" var="emailDTO" varStatus="status">
                        <span class="${emailDTO.objectSelected} hidden"></span>
                        <div class="row">
                        <span class="errorMessage"><form:errors path="userEmailList[${status.index}].emailId" cssClass="red"></form:errors></span>
                           <label ><span class="red">*</span>Email</label>
                            <%-- <input type="text" class="form-control" placeholder="phoneNum" name="phoneNum" value="${telephoneDTO.phoneNum}" /> --%>
                            <form:input type="text" class="form-control" placeholder="emailId" path="userEmailList[${status.index}].emailId" value="${emailDTO.emailId}" />
                           <span class='addPhone hidden'></span>
                           <span class='removePhone'></span>
                           <input type="hidden" class="phoneEl" name="userEmailList[${status.index}].objectSelected" value="${emailDTO.objectSelected}" />
                        </div> 
                        </c:forEach>  
                        </div>
                        <div class="addPhoneContainer">
                        <input type="text" class="hiddenEmailPhone" style="display:none" value="1" />
                        <c:forEach items="${userDTO.userTelephoneList}" var="telephoneDTO" varStatus="status"> 
                        <div class="row">
                           <label >Phone</label>
                           <span class="${telephoneDTO.objectSelected} hidden"></span>
                            <%-- <input type="text" class="form-control" placeholder="phoneNum" name="phoneNum" value="${telephoneDTO.phoneNum}" /> --%>
                            <input type="text" class="form-control" placeholder="phoneNum" name="userTelephoneList[${status.index}].phoneNum" value="${telephoneDTO.phoneNum}" />
                           <span class='addPhone hidden'></span>
                           <span class='removePhone'></span>
                        <input type="hidden" class="phoneEl" name="userTelephoneList[${status.index}].objectSelected" value="${telephoneDTO.objectSelected}" />
                        </div> 
                        </c:forEach>  
                        </div>
                     </div>
                         <div class="col-md-4">
                        <div class="row">
                           <label>Middle Name</label>
                           <input type="text" class="form-control" placeholder="Second Name" name="middleName" value="${userDTO.middleName}" />
                        </div>
                        </div>
                        <div class="col-md-4">
                        <div class="row">
                           <label><span class="red">*</span> Last Name</label>
                           <input type="text" class="form-control" placeholder="Last Name" name="lastName" value="${userDTO.lastName}" />
                        </div>
                        <div class="row">
                           <label>Employee Id </label>
                            <input type="text" class="form-control" placeholder="Employee Id" name="employeeId" value="${userDTO.employeeId}" />
                        </div>
                        <div class="row">
                           <label>Manager</label>
                          <input type="text"  name="searchManagerMap" id="searchManagerMap" class="search-recepients clearfix searchManagerMap ui-autocomplete-input" />
          				<input type="hidden"  name="searchManagerMapValue" id="searchManagerMapValue" /> 
                        </div>
                        <div class="row">
                           <label >Fax</label>
                           <input type="text" class="form-control" placeholder="isFax" name="isFax" value="${telephoneDTO.isFax}" />
                           <!-- <input name="Fax"/> -->
                           <span class='addElement'></span>
                           <span class='removeElement hidden'></span>
                        </div>
                       </div>
                  </div>
                  
             <hr/>     
                  
                    <h1 class="title">Address Information</h1> 
                  <div class="row">
                     <span class="addAddress address"><span class="icon-add"></span>Add Another Address</span>
                  </div>
                                  
                  
               <div class="addressContainer">
               <c:forEach items="${userDTO.userAddressList}" var="addressDTO" varStatus="status">
               
                  <div class="row addressDiv">
                  <span class='${addressDTO.objectSelected} hidden'></span>
                  <div class="row">
	                           <input type="hidden" class="objectSelect" placeholder="Address country" name="userAddressList[${status.index}].objectSelected" value="${addressDTO.objectSelected}" />
	               </div>
                  
                     <div class="row">
                       <span class="removeAdd address"><span class="icon-remove"></span><span>Remove Address</span></span>
                     </div>
                     <div class="col-md-6">
                        <div class="row"> <label>Address Type</label>
                                           
                           <select class="customSelect" name="userAddressList[${status.index}].addressTypeId" id="userAddressTypeId"> 
                           		<!-- <option>Select</option> -->
                           		<c:forEach items="${userAddressTypeDTOList}" var="addressTypeDTOList">
								<option value="${addressTypeDTOList.id}">${addressTypeDTOList.name}</option>
								</c:forEach>
                           </select>
                        </div>
                       
	                        <div class="row">
	                           <label>Address Line 1</label>
	                           <input type="text" class="form-control" placeholder="Address Line1" name="userAddressList[${status.index}].addressLine1" value="${addressDTO.addressLine1}" />
	                        </div>
	                        <div class="row">
	                           <label>Address Line 2</label>
	                           <input type="text" class="form-control" placeholder="Address Line2" name="userAddressList[${status.index}].addressLine2" value="${addressDTO.addressLine2}" />
	                        </div>
	                        <div class="row">
	                           <label>Address Line 3</label>
	                           <input type="text" class="form-control" placeholder="Address Line3" name="userAddressList[${status.index}].addressLine3" value="${addressDTO.addressLine3}" />
	                        </div>
	                         <div class="row">
	                           <label>Address Line 4</label>
	                           <input type="text" class="form-control" placeholder="Address Line4" name="userAddressList[${status.index}].addressLine4" value="${addressDTO.addressLine4}" />
	                        </div>
	                         <div class="row">
	                           <label>Address Line 5</label>
	                           <input type="text" class="form-control" placeholder="Address Line5" name="userAddressList[${status.index}].addressLine5" value="${addressDTO.addressLine5}" />
	                        </div>
                     
                        
                        
                     </div>
                     <div class="col-md-6">
                        <div class="outerdiv">
                        <div class="row">
                           <label>City</label>
                           <input type="text" class="form-control" placeholder="Address Line5" name="userAddressList[${status.index}].city" value="${addressDTO.city}" />
                          <%--  <input type="text" placeholder="Address Line5" name="city" value="${addressDTO.city}" /> --%>
                        </div>
                        </div>
                        <div class="row">
                           <label>Zip/Post Code</label>
                           <input type="text" class="form-control" placeholder="Address zipCode" name="userAddressList[${status.index}].zipCode" value="${addressDTO.zipCode}" />
                        </div>
                        <div class="row">
                         <span class="errorMessage"><form:errors path="userAddressList[${status.index}].country" cssClass="red"></form:errors></span>
                         <label><span class="red">*</span>Country</label>
                            <form:input type="text" class="form-control" placeholder="Address country" path="userAddressList[${status.index}].country" value="${addressDTO.country}" />
                        </div>
                        <div class="row">
                           <label>ISO 3</label>
                           <input type="text" class="form-control" placeholder="Address continent" name="userAddressList[${status.index}].continent" value="${addressDTO.continent}" />
                        </div>
                        <div class="row">
                           <label> State/Province</label>
                            <input type="text" class="form-control" placeholder="Address state" name="userAddressList[${status.index}].state" value="${addressDTO.state}" />
                        </div>
                        
                     </div> <hr/>   
                  </div>
             </c:forEach>
                  </div>
                    <hr/>     
                    <h1 class="title">Role and Status</h1> 
                    <div class="row">
                      <div class="col-md-6">
                        <div class="row">
                           <label>Group</label>
                               <!-- <select class="customSelect" name="Group"> <option>Select</option></select> -->
                                <select name="groupId" id="groupId" class="customSelect">
                               		<!-- <option>Select</option> -->
										<c:forEach items="${userGroupMasterDTOList}" var="userGroupMasterDTO">
										<option value="${userGroupMasterDTO.id}">${userGroupMasterDTO.name}</option>
										</c:forEach>
								</select>
                        </div>
                        <div class="row">
                           <label><span class="red"> * </span>Status</label>
                            <div class="titleRow customInput customRadio" >     
                            <input type="radio" name="active" id="active_status" value="1" ${userDTO.activeChecked} />
                            <label for="active_status">Active</label> 
                            <input type="radio"  name="active" id="inactive_status" value="0" ${userDTO.inActiveChecked} />
                            <label for="inactive_status">Inactive </label> 
                            </div>
                        </div>
                        </div>
                      
                    
                     <div class="col-md-6">
                      
                         <div class="addRoleContainer">
                      <input type="text" class="hiddenEmailPhone" style="display:none" value="1" />
                      <c:forEach items="${userDTO.userRoleList}" var="userRoleDTO" varStatus="status"> 
                      <span class="${userRoleDTO.objectSelected} hidden"></span>
                        <div class="row">
                          <span class="errorMessage"><form:errors path="userRoleList[${status.index}].roleId" cssClass="red"></form:errors></span>
                            <label>Role</label>
                                <form:select path="userRoleList[${status.index}].roleId" id="roleId" class="customSelect">
                               		<option value="">Select</option>
										<c:forEach items="${roleList}" var="role">
										<option value="${role.id}">${role.name}</option>
										</c:forEach>
								</form:select>
                             <span class='addPhone hidden'></span>
                             <span class='removePhone'></span>
                              <input type="hidden" class="phoneEl" name="userRoleList[${status.index}].objectSelected" value="${userRoleDTO.objectSelected}" />
                        </div>
                        </c:forEach>
                        </div>
                        <div class="row" >
                         <label>Account Locked</label>
                        <span class=" customInput customCheckBox" > 
                        <input type="checkbox"  name="accountLock" id="accountLock" value="1"  ${userDTO.lockedChecked}/>
                        <label for="accountLock"></label></span>
                           
                        </div>
                                        
                        
                       </div>
                        </div>
                        <hr/>
                        <div class=" row buttonRow">
                         <div class="col-md-6 text-right">
                         	<button class="btn btn-xs delete" name="delete" ${userDTO.isDeleteEnabled}>Delete</button>
                         </div>
                          <div class="col-md-6">
                          <!-- <button class="btn btn-xs">Save</button> -->
                          <button class="btn btn-xs" type="submit" name="action">Update</button>
                          </div>
                          
                  </div>
                  
               </div>
            </div>
         </div>
       
         </form:form> 
         <!-- signuppanel -->
         <br/>
         <div class="text-center">Copyright © 2014 The Red Flag Group. All rights reserved. </div>
      </div>
      <!-- mainpanel -->
      <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	  <script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.min.js"></script>
	  <script src="${pageContext.request.contextPath}/js/jquery-ui-1.11.0.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/modernizr.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.cookies.js"></script>
      <script src="${pageContext.request.contextPath}/js/common.js"></script>
      <script src="${pageContext.request.contextPath}/js/custom.js"></script>
      
    <script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/toggles.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/retina.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/jquery.cookies.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wysihtml5-0.3.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-wysihtml5.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/js/custom.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
	
      
     <script type="text/javascript">
	
	
	jq('.addressDiv').hide();
	jq('.addressDiv').eq(0).find('.removeAdd').hide().end().find('.objectSelect').val('1').end().show();
	jq('.addAdd').on('click', function(){
	   var i = jq('.indexInput').val();
	   var index = parseInt(i); 
	   jq('.addressDiv').eq(index).find('.objectSelect').val("1").end().show();
	   jq('.indexInput').val(++index);
	});
	
	jq('.removeAdd').on('click', function() {
	     jq(this).closest('.addressDiv').find('.objectSelect').val('0').end().hide();	
	});
	
	
	(function() {
		jq('.addEmailContainer').find('.row').eq(0).show().find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
		jq('.addEmailContainer').on('click', '.addPhone', function() {
		   var jqthis = jq(this).parents('.addEmailContainer'),
		   i = jqthis.children('.hiddenEmailPhone').val(),
		   index = parseInt(i);
		   jqthis.children('.row').eq(index).show();
		   jqthis.children('.hiddenEmailPhone').val(++index);
		   alert(jq(this).closest('.addressDiv').find('.objectSelect').val());
		});
		
		jq('.addEmailContainer').on('click', '.removePhone', function(){
			jq(this).closest('.row').hide();
		});
	})();
	
	
	(function() {
		jq('.addPhoneContainer').find('.row').eq(0).show().find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
		jq('.addPhoneContainer').on('click', '.addPhone', function() {
		   var jqthis = jq(this).parents('.addPhoneContainer'),
		   i = jqthis.children('.hiddenEmailPhone').val(),
		   index = parseInt(i);
		  // jqthis.children('.row').eq(index).show();
		  jqthis.children('.row').eq(index).find('.phoneEl').val("1").end().show();
		   jqthis.children('.hiddenEmailPhone').val(++index);
		   
		});
		jq('.addPhoneContainer').on('click', '.removePhone', function(){
   			jq(this).closest('.row').hide();
   		});
		
		jq('.addFaxContainer').find('.row').eq(0).show().find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
   		jq('.addFaxContainer').on('click', '.addPhone', function() {
   		   var jqthis = jq(this).parents('.addFaxContainer'),
   		   i = jqthis.children('.hiddenFax').val(),
   		   index = parseInt(i);
   		  // jqthis.children('.row').eq(index).show();
   		  jqthis.children('.row').eq(index).find('.phoneEl').val("1").end().show();
   		   jqthis.children('.hiddenFax').val(++index);
   		   
   		});
   		jq('.addFaxContainer').on('click', '.removePhone', function(){
   			jq(this).closest('.row').hide();
   		});
		
		jq('.addRoleContainer').find('.row').eq(0).show().find('.addPhone').removeClass('hidden').end().find('.removePhone').addClass('hidden');
		jq('.addRoleContainer').on('click', '.addPhone', function() {
		   var jqthis = jq(this).parents('.addRoleContainer'),
		   i = jqthis.children('.hiddenEmailPhone').val(),
		   index = parseInt(i);
		   //jqthis.children('.row').eq(index).show();
		   jqthis.children('.row').eq(index).find('.phoneEl').val("1").end().show();
		   jqthis.children('.hiddenEmailPhone').val(++index);
		   
		});
		
		jq('.addRoleContainer').on('click', '.removePhone', function(){
			jq(this).closest('.row').hide();
		});
	})();
			
		/* jq("#searchUserMap").autocomplete({
			source : function(request, response) {
				jq.ajax({
					url : "searchUserMap",
					type : "GET",
					data : {
						term : request.term
					},
					dataType : "json",
					success : function(data) {
						response(data);
					},
					error: function(){
						alert("Error......");
					}
				});
			},
			select : function(event, ui) {
				var keyV =[];
					keyV= (ui.item.value).split("|");
				jq('#searchUserMap').val(keyV[1]);
				jq('#searchUserMapValue').val(keyV[0]);
				
			}
		}); */
		
			
		jq("#searchUserMap").autocomplete({
			source : function(request, response) {
				jq.ajax({
					url : "searchUserMap",
					type : "GET",
					data : {
						term : request.term
					},
					dataType : "json",
					success : function(data) {
						response(data);
					},
					error: function(){
						alert("Error......");
					}
				});
			},
			select : function(event, ui) {
				var keyV =[];
					keyV= (ui.item.value).split("|");
					jq('#searchUserMap').val(keyV[1]);
					jq('#searchUserMapValue').val(keyV[0]);
				
			}
		});
	
	
	jq("#searchManagerMap").autocomplete({
		source : function(request, response) {
			jq.ajax({
				url : "searchManagerMap",
				type : "GET",
				data : {
					term : request.term
				},
				dataType : "json",
				success : function(data) {
					response(data);
				},
				error: function(){
					alert("Error......");
				}
			});
		},
		select : function(event, ui) {
			var keyV =[];
				keyV= (ui.item.value).split("|");
				jq('#searchManagerMap').val(keyV[1]);
				jq('#searchManagerMapValue').val(keyV[0]);
			
		}
	});
 
	 jq('.1').each(function() {
		 jq(this).parents('.addressDiv').show();
	 });
	
	</script>
    
      
   </body>
</html>

