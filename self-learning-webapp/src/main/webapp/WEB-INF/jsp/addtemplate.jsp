<!DOCTYPE HTML>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.png"
	type="image/png">

<title>Partner Integrity</title>

<link href="css/style.default.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-fileupload.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/toggle.css" />
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
<!-- <script type="text/javascript">
							function getAjaxReceipt(){
								removeall();
								var eventval=$("#eventid").val();
								if(eventval!="0"){
								    $.ajax({
								        type:'GET',
								        url:'getTemplateList',
								        cache: false,
								        data:{eid:eventval},
								        success:function(data){
								        	
								        	addoptions(data);	
								        },
								        error:function(xmlHttpRequest, textStatus, errorThrown){
								            if(xmlHttpRequest.readyState=0 || xmlHttpRequest.status == 0)
								                return;
								        },
								    });
								}
								
								}
							   function removeall(){
							        var ct=document.templateform.etemplates.length;
							        for(i=ct; i>=0; i--){    
							            document.templateform.etemplates.options[i]=null;
							        }
							    }
								
								function addoptions(reslt){
									
									var outputstring= reslt;
									var tarray=[];
									tarray=outputstring.split("|");
									var tlength=tarray.length;
									for( var i=0;i<tlength;i++){
										var toption=tarray[i].split(":");
										var ct1=document.createElement("OPTION");
								        ct1.text=toption[1];
								        ct1.value=toption[0];
								        document.templateform.etemplates.options.add(ct1);
									}
									
							    }
								 
							</script>
							
							
							<script type="text/javascript">
							function getAjaxUpdate(){
								var eventval=$("#eventid").val();
								var tempval=$("#templateid").val();
								if(eventval!="0" && tempval!="0"){
								    $.ajax({
								        type:'GET',
								        url:'getTemplate',
								        cache: false,
								        data:{eid:eventval,tid:tempval},
								        success:function(data){
								        	alert(data);
								        	populatetemplate(data);
								        	  var content=[];
								        	content=data.split("|");
								        	alert("content"+content[6]);
								        	//$("#wysiwyg").parent('body').find('iframe').contents().find('.wysihtml5-editor').html(revertTo.get(content[6]));
								        	//$('#wysiwyg').wysihtml5().data("wysihtml5").editor.setValue('hello world');
								        	$('#wysiwyg').data("wysihtml5").editor.setValue(content[6]);
								        },
								        error:function(xmlHttpRequest, textStatus, errorThrown){
								            if(xmlHttpRequest.readyState=0 || xmlHttpRequest.status == 0)
								                return;
								        },
								    });
								}
								}
							function populatetemplate(reslt){
								
								var outputstring= reslt;
								var tarray=[];
								tarray=outputstring.split("|");
							    document.templateform.templateName.value=tarray[0];
							    document.templateform.from.value=tarray[1];
							    document.templateform.to.value=tarray[2];
							    document.templateform.CC.value=tarray[3];
							    document.templateform.BCC.value=tarray[4];
							    document.templateform.subject.value=tarray[5];
							    //alert(tarray[6]);
							   
							    
						    }
							</script> -->
	<!--  <script type="text/javascript">
								function getTemplate(eventid) {
									alert("event id"+eventid);
									var xmlhttp;
									if (eventid == "") {
										document.getElementById("etemplates").innerHTML = "";
										return;
									}
									alert("inside1");
									if (window.XMLHttpRequest) {
										xmlhttp = new XMLHttpRequest();
										alert("inside");
									} else {
										xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
									}
									xmlhttp.onreadystatechange = function() {
										alert(xmlhttp.responseText);
										if (xmlhttp.readyState == 4	&& xmlhttp.status == 200) {
											document.getElementById("etemplates").innerHTML = xmlhttp.responseText;
										}else{
											alert("inside:onreadystatechange ");
										}
									}
									xmlhttp.open("GET", "/getTemplate?eid="+eventid,true);
									xmlhttp.send();
								}
						</script>  -->
<style type='text/css'>
form.form label.error,label.error {
	/* remove the next line when you have trouble in IE6 with labels in list */
	color: red;
	font-style: italic
}

div.header-right{margin-top: 0px;}

</style>
<script type="text/javascript">
function getValidated(){
	$("label.error").hide();
}
</script>					
<script type='text/javascript' src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/js/validateemail.js"></script>
<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
</head>

<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">
			<i class="fa fa-spinner fa-spin"></i>
		</div>
	</div>

	<section>

		<div class="leftpanel">

			<div class="logopanel">
				<a href="#"><img
					src="${pageContext.request.contextPath}/images/img_logo.png"
					alt="Partner Integrity" border="0"></a>

			</div>
			<!-- logopanel -->

			<div class="leftpanelinner">
			
				<jsp:include page="leftPanel.jsp"></jsp:include>
				<!-- This is only visible to small devices -->
				<%-- <div class="visible-xs hidden-sm hidden-md hidden-lg">
					<div class="media userlogged">
						<img alt=""
							src="${pageContext.request.contextPath}/images/photos/loggeduser.png"
							class="media-object">
						<div class="media-body">
							<h4><%=session.getAttribute("loggedInUser")%></h4>

						</div>
					</div>

					<h5 class="sidebartitle actitle">Account</h5>
					<ul class="nav nav-pills nav-stacked nav-bracket mb30">
						<li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
						<li><a href=""><i class="fa fa-cog"></i> <span>Account
									Settings</span></a></li>
						<li><a href=""><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
						<li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign
									Out</span></a></li>
					</ul>
				</div>

				<br>
				<ul class="nav nav-pills nav-stacked nav-bracket">
					<li><a href="#"><i class="fa fa-home"></i> <span>Home</span></a></li>
					<li class="nav-parent"><a href=""><i
							class="glyphicon glyphicon-plane"></i> <span>Onboarding</span></a>
						<ul class="children">
							<li><a href="#"><i class="fa fa-caret-right"></i> New
									Onboarding</a></li>
							<li><a href="#"><i class="fa fa-caret-right"></i> Data
									Collection</a></li>
							<li><a href="#"><i class="fa fa-caret-right"></i>
									Validation</a></li>
						</ul></li>
					<li><a href=""><i class="glyphicon glyphicon-map-marker"></i>
							<span>3P Organisations</span></a></li>
					<li><a href="#"><i class="glyphicon  glyphicon-ok"></i> <span>Remediations</span></a></li>
					<li><a href=""><i class="glyphicon glyphicon-pencil"></i>
							<span>Contracts</span></a></li>
				</ul> --%>



			</div>
			<!-- leftpanelinner -->
		</div>
		<!-- leftpanel -->

		<div class="mainpanel">

			<div class="headerbar">

				<a class="menutoggle"><i class="fa fa-bars"></i></a>
				<form class="searchform" action="#" method="post">
					<input type="text" class="form-control" name="keyword"
						placeholder="Search here..." />
				</form>


				<div class="header-right">

					<ul class="headermenu">
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									<img
										src="${pageContext.request.contextPath}/images/photos/loggeduser.png"
										alt="" /> <%=session.getAttribute("loggedInUser")%> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
									<li><a href="#"><i class="glyphicon glyphicon-user"></i>
											My Profile</a></li>
									<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
											Account Settings</a></li>
									<li><a href="#"><i
											class="glyphicon glyphicon-question-sign"></i> Help</a></li>
									<form id="myform" method="post" action="/partnerintegrity/logout">
											
 												<!--  <a onclick="document.getElementById('myform').submit();"><b>Log Out</b></a> -->
 												<a href="#" onclick="javascript:logout();"><i class="glyphicon glyphicon-log-out"></i> Log Out</a>
 											 												
 												
											</form>
								</ul>
							</div>
						</li>

						<li>
							<div class="btn-group">
								<button class="btn btn-default dropdown-toggle tp-icon"
									data-toggle="dropdown">
									<i class="glyphicon glyphicon-bell" style="color: #999999"></i>
									<span class="badge">1</span>
								</button>
								<div class="dropdown-menu dropdown-menu-head pull-right">
									<h5 class="title">You Have 1 New Notifications</h5>
									<ul class="dropdown-list gen-list">
										<li class="new"><a href=""> <span class="thumb"><img
													src="${pageContext.request.contextPath}/images/photos/user4.png"
													alt="" /></span> <span class="desc"> <span class="name">Zaham
														Sindilmaca <span class="badge badge-success">new</span>
												</span> <span class="msg">is now following you</span>
											</span>
										</a></li>
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

			<div class="pageheader">
				<h2>Add New Templates</h2>

			</div>
			<form id="templateform" action="addSuccess"  name="templateform" method="POST">
				<div class="contentpanel panel-email">

					<div class="row">
						<div class="col-sm-3 col-lg-2">


							<h5 class="subtitle mb5">Business Events</h5>

							<br> <select name="eventid" id="eventid" onchange="getValidated()" class="form-control">
								<option value="0">Select Business Event</option>
								<c:forEach items="${eventList}" var="eventlist">
									<option value="${eventlist.id}">${eventlist.eventName}</option>
								</c:forEach>
							</select>
							<br>
							<!-- <h5 class="subtitle mb5">Templates</h5>
							<br>
							<select name="etemplates" id="templateid" onchange="getAjaxUpdate()">
						            <option value="0">--Template List---</option>
						    </select>
 -->
							<%-- <select name="templateid">
										<c:forEach items="${templateList}" var="templatelist">
								<c:if test="${eventDto.id == templatelist.templateId}">
									<option value="${templateList.templateId}">${templateList.TemplateName}</option>
									<!-- <div id="etemplates"></div> -->
										</c:if>
							</c:forEach>
							</select> --%>





							<!-- Nav tabs -->
							<!--  <ul class="nav nav-tabs">
          <li class="active"><a href="#T1" data-toggle="tab"><strong>T1</strong></a></li>
          <li><a href="#T2" data-toggle="tab"><strong>T2</strong></a></li>for loop event name   
        </ul> -->

							<!-- Tab panes -->
							<!--  <div class="tab-content mb30">
          <div class="tab-pane active" id="T1">
                 
				 <div class="form-group">
                      <label class="col-sm-5 control-label"> T1_1</label>
                          <div class="col-sm-7 control-label">
                                <div class="toggle toggle-success"></div>
                          </div>
                  </div>
				  
                  <div class="form-group">
                      <label class="col-sm-5 control-label"> T1_2</label>
                          <div class="col-sm-7 control-label">
                                <div class="toggle toggle-success"></div>
                          </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-5 control-label"> T1_3</label>
                          <div class="col-sm-7 control-label">
                                <div class="toggle toggle-success"></div>
                          </div>
                  </div>
          </div>
          <div class="tab-pane" id="T2">
                <div class="form-group">
                      <label class="col-sm-5 control-label"> T2_1</label>
                          <div class="col-sm-7 control-label">
                                <div class="toggle toggle-success"></div>
                          </div>
                  </div>for loop template list
                  <div class="form-group">
                      <label class="col-sm-5 control-label"> T2_2</label>
                          <div class="col-sm-7 control-label">
                                <div class="toggle toggle-success"></div>
                          </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-5 control-label"> T2_3</label>
                          <div class="col-sm-7 control-label">
                                <div class="toggle toggle-success"></div>
                          </div>
                  </div>
          </div>
          
           
        </div> -->

							
						
						</div>
						<!-- col-sm-3 -->

						<div class="col-sm-9 col-lg-10">
							<!-- <h4 class="subtitle mb5"> Email Template - Business Case </h4> event name -->
							<div class="panel panel-default">
								<div class="panel-body">

									<!--<div class="form-group mb5">
                            <select class="chosen-select" multiple data-placeholder="Recipients">
                                <option value=""></option>
                                <option value="Anna Fat">Anna Fat</option>
                                <option value="Bilbo Bagens">Belbo Bagens</option>
                                <option value="Catherine Zones">Catherine Zones</option>
                                <option value="Daniel Powter">Danie Powter</option>
                                <option value="Ellen Page">Ellen Page</option>
                                <option value="Francis Yan">Francis Yan</option>
                                <option value="Gerald Dom">Gerald Dom</option>
                                <option value="Helder Carasbong">Helder Carasbong</option>
                                <option value="Ian Page">Ian Page</option>
                                <option value="John Doe">John Doe</option>
                                <option value="Kik Wee">Kik Wee</option>
                                <option value="Lance Arms">Lance Arms</option>
                                <option value="Mike Tyson">Mike Tyson</option>
                                <option value="Niel Strong">Niel Strong</option>
                                <option value="Owen Wilson">Owen Wilson</option>
                                <option value="Penelope Cruz">Penelope Cruz</option>
                                <option value="Queen King">Queen King</option>
                                <option value="Ralph Lamb">Ralph Lamb</option>
                                <option value="Sansa Stark">Sansa Stark</option>
                                <option value="Tyron Mike">Tyron Mike</option>
                                <option value="Umber Heard">Umber Heard</option>
                                <option value="Vanessa Hudgens">Vanessa Hudgens</option>
                                <option value="William Jor">Willliam Jor</option>
                                <option value="Xavier Saint">Xavier Saint</option>
                                <option value="Yam Concept">Yam Concept</option>
                                <option value="Zach Randolph">Zach Randolph</option> 
                            </select>
                        </div>
                        
                        <div id="cc" class="form-group mb5" style="display: none">
                            <select class="chosen-select" multiple data-placeholder="CC">
                                <option value=""></option>
                                <option value="Anna Fat">Anna Fat</option>
                                <option value="Bilbo Bagens">Belbo Bagens</option>
                                <option value="Catherine Zones">Catherine Zones</option>
                                <option value="Daniel Powter">Danie Powter</option>
                                <option value="Ellen Page">Ellen Page</option>
                                <option value="Francis Yan">Francis Yan</option>
                                <option value="Gerald Dom">Gerald Dom</option>
                                <option value="Helder Carasbong">Helder Carasbong</option>
                                <option value="Ian Page">Ian Page</option>
                                <option value="John Doe">John Doe</option>
                                <option value="Kik Wee">Kik Wee</option>
                                <option value="Lance Arms">Lance Arms</option>
                                <option value="Mike Tyson">Mike Tyson</option>
                                <option value="Niel Strong">Niel Strong</option>
                                <option value="Owen Wilson">Owen Wilson</option>
                                <option value="Penelope Cruz">Penelope Cruz</option>
                                <option value="Queen King">Queen King</option>
                                <option value="Ralph Lamb">Ralph Lamb</option>
                                <option value="Sansa Stark">Sansa Stark</option>
                                <option value="Tyron Mike">Tyron Mike</option>
                                <option value="Umber Heard">Umber Heard</option>
                                <option value="Vanessa Hudgens">Vanessa Hudgens</option>
                                <option value="William Jor">Willliam Jor</option>
                                <option value="Xavier Saint">Xavier Saint</option>
                                <option value="Yam Concept">Yam Concept</option>
                                <option value="Zach Randolph">Zach Randolph</option>
                            </select>
                        </div>
                        
                        <div id="bcc" class="form-group mb5" style="display: none">
                            <select class="chosen-select" multiple data-placeholder="BCC">
                                <option value=""></option>
                                <option value="Anna Fat">Anna Fat</option>
                                <option value="Bilbo Bagens">Belbo Bagens</option>
                                <option value="Catherine Zones">Catherine Zones</option>
                                <option value="Daniel Powter">Danie Powter</option>
                                <option value="Ellen Page">Ellen Page</option>
                                <option value="Francis Yan">Francis Yan</option>
                                <option value="Gerald Dom">Gerald Dom</option>
                                <option value="Helder Carasbong">Helder Carasbong</option>
                                <option value="Ian Page">Ian Page</option>
                                <option value="John Doe">John Doe</option>
                                <option value="Kik Wee">Kik Wee</option>
                                <option value="Lance Arms">Lance Arms</option>
                                <option value="Mike Tyson">Mike Tyson</option>
                                <option value="Niel Strong">Niel Strong</option>
                                <option value="Owen Wilson">Owen Wilson</option>
                                <option value="Penelope Cruz">Penelope Cruz</option>
                                <option value="Queen King">Queen King</option>
                                <option value="Ralph Lamb">Ralph Lamb</option>
                                <option value="Sansa Stark">Sansa Stark</option>
                                <option value="Tyron Mike">Tyron Mike</option>
                                <option value="Umber Heard">Umber Heard</option>
                                <option value="Vanessa Hudgens">Vanessa Hudgens</option>
                                <option value="William Jor">Willliam Jor</option>
                                <option value="Xavier Saint">Xavier Saint</option>
                                <option value="Yam Concept">Yam Concept</option>
                                <option value="Zach Randolph">Zach Randolph</option>
                            </select>
                        </div>
                        
                        <a href="" id="acc" class="inblock mb5"><small>Add CC</small></a> &nbsp; <a href="" class="inblock mb5" id="abcc"><small>Add BCC</small></a>-->
									<div class="form-group">
										<input type="text" name="templateName" id="templateName"
											placeholder="Template Name"
											 class="form-control" />
									</div>
									<div class="form-group">
										<input type="text" name="from" placeholder="From"
											readonly="readonly" value="sebinsrit@gmail.com"
											class="form-control" />
								</div>
									<!-- 	<table border="0" colspan="5" width="100%">
												<tbody><tr>
													<td width="50"> -->
                                                      <div class="form-group">
												<input type="text" name="to" id="to" placeholder="Recipients" class="form-control"></div>
													<!-- </td>
													<td width="5%"></td>
													<td width="30%">
														<div class="form-group">
															<select id="recipientTag" name="tags" class="form-control valid">
																<option value="0">---Choose Tags---</option>
																<option value="{user}">User</option>
																<option value="{Date}">Date</option>
																<option value="{password link}">Password Link</option>
															</select>
														</div>
														<div class="form-group">
															<input type="button" id="recbtn" value="Add Tag to Recipients" class="btn btn-block">
														</div>
													</td>
	
												</tr>
													<tr><td><br></td></tr>
										</tbody>
										</table> -->
												<script type="text/javascript">
											jQuery("#recbtn").on('click',
															function() {
																var value = $('#recipientTag').val();
																if (value != 0) {
																	var caretPos = document.getElementById("to").selectionStart;
																	var textAreaTxt = $('#to').val();
																	var txtToAdd = value;
																	//$('#to').val(textAreaTxt.substring(caretPos)+ txtToAdd);
																}
															});
										       </script>
									<div class="form-group">
										<input type="text" name="CC" id="CC" placeholder="CC"
											 class="form-control" />
									</div>
									<div class="form-group">
										<input type="text" name="BCC" id="BCC" placeholder="BCC"
											 class="form-control" />
									</div>
								<!-- 	<table border="0" colspan="5" width="100%">
												<tbody><tr>
													<td width="50"> -->
                                                   <div class="form-group">
											<input type="text" name="subject" placeholder="Subject"
												id="subject" id="subject" class="form-control" />
										</div>
												<!-- 	</td>
													<td width="5%"></td>
													<td width="30%">
														<div class="form-group">
															<select id="subjectTag" name="tags" class="form-control valid">
																<option value="0">---Choose Tags---</option>
																<option value="{user}">User</option>
																<option value="{Date}">Date</option>
																<option value="{password link}">Password Link</option>
															</select>
														</div>
														<div class="form-group">
															<input type="button" id="subbtn" value="Add Tag to Subject" class="btn btn-block">
														</div>
													</td>
												</tr><tr><td><br></td></tr>
										</tbody></table> -->
												<script type="text/javascript">
											jQuery("#subbtn").on('click',
															function() {
																var value = $('#subjectTag').val();
																if (value != 0) {
																	var caretPos = document.getElementById("subject").selectionStart;
																	var textAreaTxt = $('#subject').val();
																	var txtToAdd = value;
																	//$('#subject').val(textAreaTxt.substring(caretPos)+ txtToAdd);
																	$('#subject').val(caretPos+txtToAdd);
																}
															});
										       </script>
								<div class="form-group">
											<label  for="trigger">Template
												Trigger</label>&nbsp;&nbsp;<input type="radio" name="etrigger" value="1" id="on"
												>ON &nbsp;<input type="radio"
												name="etrigger" value="0" id="off">OFF
										</div>
			<!-- 			<table border="0" colspan="5" width="100%">
											
												<tr>
													<td width="50">
														<div class="form-group">
															<select id="tagsid" name="tags"
																class="form-control valid">
																<option value="0">---Choose Tags---</option>
																<option value="{user}">User</option>
																<option value="{Date}">Date</option>
																<option value="{password link}">Password Link</option>
															</select>
														</div>
													</td>

													<td width="5%"></td>
													<td width="10%">
														<div class="form-group">
															<input type="button" id="btn" value="Add Tag to Message"
																class="btn btn-block">
														</div>
													</td>
													<td width="10%"></td>
													<td width="10%"></td>
												</tr>

										
										</table> -->

										<br>
									<!-- Add Tags Jquery -->
					<script type="text/javascript">
					jQuery("#btn").on('click', function() {
						 var value = $('#tagsid').val();
						 if(value != 0){
						    var caretPos = document.getElementById("wysiwyg").selectionStart;
						    var textAreaTxt = $('#wysiwyg').val();
						    var txtToAdd = value;
							$('#wysiwyg').data("wysihtml5").editor
							.setValue(textAreaTxt.substring(caretPos) + txtToAdd);
						 }
					}); 
					</script>
									<!--
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Tags</label>
                          <div class="col-sm-7">
                            <input name="tags" id="tags" class="form-control" value="foo,bar,baz" />
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="col-sm-2 control-label">Attach a File</label>
                          <div class="col-sm-6">
                            <div class="fileupload fileupload-new" data-provides="fileupload">
                              <div class="input-append">
                                <div class="uneditable-input">
                                  <i class="glyphicon glyphicon-file fileupload-exists"></i>
                                  <span class="fileupload-preview"></span>
                                </div>
                                <span class="btn btn-default btn-file">
                                  <span class="fileupload-new">Select file</span>
                                  <span class="fileupload-exists">Change</span>
                                  <input type="file" />
                                </span>
                                <a href="#" class="btn btn-default fileupload-exists" data-dismiss="fileupload">Remove</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        -->
									<textarea id="wysiwyg" name="content"  placeholder="Your message here..."
										class="form-control" rows="20"></textarea>

								</div>
								<!-- panel-body -->
								<div class="panel-footer">

									<div class="row">
										<!-- <div class="col-md-6 mb30">
											<button class="btn btn-danger">Delete</button>
											<input type="submit" class="btn btn-danger" value="Delete" />
										</div> -->
										<!-- col-md-6 -->

										<div class="col-md-6 mb20 text-right">
											<!--  <button class="btn btn-primary btn-block">Save</button>-->
											<input type="submit" class="btn btn-primary btn-block"
												value="Save" />
										</div>
										<!-- col-md-6 -->

									</div>

								</div>
								<!-- panel -->

							</div>
							<!-- col-sm-9 -->

						</div>
						<!-- row -->
			</form>


			<div class="text-center">Copyright © 2014 The Red Flag Group. All rights reserved. </div>
		</div>
		<!-- contentpanel -->

		</div>
		<!-- mainpanel -->




	</section>








<%-- 	<script
		src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/modernizr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/toggles.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/retina.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.cookies.js"></script>
	<script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>



	<script
		src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/wysihtml5-0.3.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap-wysihtml5.js"></script>

	<script src="js/custom.js"></script>
	<script>
    jQuery(document).ready(function(){
        // Chosen Select
        jQuery(".chosen-select").chosen({'width':'100%','white-space':'nowrap'});
    });
    
    jQuery('#acc').click(function(){
        jQuery('#cc').show();
        jQuery(this).hide();
        return false;
    });
    
    jQuery('#abcc').click(function(){
        jQuery('#bcc').show();
        jQuery(this).hide();
        return false;
    });
    
    // HTML5 WYSIWYG Editor
    jQuery('#wysiwyg').wysihtml5({color: true,html:true});
    
</script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.tagsinput.min.js"></script>
	<script>
jQuery(document).ready(function(){
    
  // Chosen Select
  jQuery(".chosen-select").chosen({'width':'100%','white-space':'nowrap'});
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  
  });
</script>
</body>
</html>
