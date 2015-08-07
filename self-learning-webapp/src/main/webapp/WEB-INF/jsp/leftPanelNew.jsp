 <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                   <h4><%=session.getAttribute("loggedInUser")%></h4>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">Account</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
              <li><a href=""><i class="fa fa-cog"></i> <span>Account Settings</span></a></li>
              <li><a href=""><i class="fa fa-question-circle"></i> <span>Help</span></a></li>
              <form id="myform" method="post" action="/partnerintegrity/logout">
 				<a href="#" onclick="javascript:logout();"><i class="glyphicon glyphicon-log-out"></i> Log Out</a>	</form>
            </ul>
        </div>
        
       <br>
	   
	   
		<a class="collapse_right"><img src="images/leftmenuarrow-right_normal.png" alt="" class="left_panel_arrow" /></a>
		<ul class="menus">
		  <li class="iconDashboard dash_board">
			<div class="icon_header"><a href="${pageContext.request.contextPath}/homepage"><span>Home</span></a></div>
		  </li>
		  <li class="iconOnboard">
			<div class="icon_header"><span>User Management</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				<form id="internaluserform" method="POST" action="${pageContext.request.contextPath}/userflow?param=internaluser">
					<li><a onClick="document.getElementById('internaluserform').submit();"><i class="fa fa-caret-right"></i>Internal User</a></li>
				</form>
				<form id="externaluserform" method="POST" action="${pageContext.request.contextPath}/userflow?param=externaluser">
					<li><a onClick="document.getElementById('externaluserform').submit();"><i class="fa fa-caret-right"></i>External User</a></li>
				</form>
				<form id="searchuserform" method="POST" action="${pageContext.request.contextPath}/userflow?param=searchuser">
					<li><a onClick="document.getElementById('searchuserform').submit();"><i class="fa fa-caret-right"></i>Search User</a></li>
				</form>
			</ul>
			</div>
		  </li>
		  <li class="iconIntorg">
			<div class="icon_header"><span>Internal Organisation</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				<form id="createorgform" method="post" action="${pageContext.request.contextPath}/createinternalorg">
					<li><a onClick="document.getElementById('createorgform').submit();"><i class="fa fa-caret-right"></i> Create Organisation</a></li>
				</form>
			  
				<form id="searchorgform" method="post" action="${pageContext.request.contextPath}/searchinternalorg">
					<li><a onClick="document.getElementById('searchorgform').submit();"><i class="fa fa-caret-right"></i> Search Organisation</a></li>
				</form>
			</ul>
			</div>
		  </li>
		  <li class="iconEmail">
			<div class="icon_header"><span>Email Template</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				<form id="etemplateForm" method="POST" action="${pageContext.request.contextPath}/getETemplateList">
					<li><a onClick="document.getElementById('etemplateForm').submit();"><i class="fa fa-caret-right"></i>Email Event List</a></li>
				</form>
			</ul>
			</div>
		  </li>
		  <li class="iconExtorg">
			<div class="icon_header"><span>External Organisation</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				
				<form id="createExtorgform" method="post" action="${pageContext.request.contextPath}/createexternalorg">
					<li><a onClick="document.getElementById('createExtorgform').submit();"><i class="fa fa-caret-right"></i> Create Organisation</a></li>
				</form>
				<form id="searchExtorgform" method="post" action="${pageContext.request.contextPath}/searchexternalorg">
					<li><a onClick="document.getElementById('searchExtorgform').submit();"><i class="fa fa-caret-right"></i> Search Organisation</a></li>
				</form>
			  
			  
			  
			</ul>
			</div>
		  </li>
		  <li class="iconComments">
			<div class="icon_header"><span>Comments</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				<form id="commentform" method="post" action="${pageContext.request.contextPath}/postcomments">
					<li><a onClick="document.getElementById('commentform').submit();"><i class="fa fa-caret-right"></i> Comments</a></li>
				</form>
			</ul>
			</div>
		  </li>
		  <li class="iconQstnMgmt">
			<div class="icon_header"><span>Questionnaires</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				<form id="questionnairesform" method="post" action="${pageContext.request.contextPath}/retrievequestioncategory">
					<li><a onClick="document.getElementById('questionnairesform').submit();"><i class="fa fa-caret-right"></i> View Category</a></li>
				</form>
				<form id="questionnairesBankform" method="post" action="${pageContext.request.contextPath}/displayquestionbank">
					<li><a onClick="document.getElementById('questionnairesBankform').submit();"><i class="fa fa-caret-right"></i> View Question Bank</a></li>
				</form>
				<form id="questionnairesSetupform" method="post" action="${pageContext.request.contextPath}/postquestionnaire">
					<li><a onClick="document.getElementById('questionnairesSetupform').submit();"><i class="fa fa-caret-right"></i> Setup Questionnaire</a></li>
				</form>
				<form id="questionnairesLinkform" method="post" action="${pageContext.request.contextPath}/assigndatacollection">
					<li><a onClick="document.getElementById('questionnairesLinkform').submit();"><i class="fa fa-caret-right"></i> Questionnarie Linking</a></li>
				</form>
				<form id="datacollection" method="post" action="${pageContext.request.contextPath}/datacollectionlisting">
					<li><a onClick="document.getElementById('datacollection').submit();"><i class="fa fa-caret-right"></i>Data Collection</a></li>
				</form>
			</ul>
			</div>
		  </li>
		  <li class="iconPartnerMgmt">
			<div class="icon_header"><span>Initiate Contract</span></div>
			<div class="subMenuWrapper">
			<ul class="subMenuLevel1">
				<form id="contractform" method="post" action="${pageContext.request.contextPath}/initiateContract">
					<li><a onClick="document.getElementById('contractform').submit();"><i class="fa fa-caret-right"></i> Create Contract</a></li>
				</form>
				<form id="contractSummeryform" method="post" action="${pageContext.request.contextPath}/viewContractDetails">
					<li><a onClick="document.getElementById('contractSummeryform').submit();"><i class="fa fa-caret-right"></i> Contracts Summary</a></li>
				</form>
			</ul>
			</div>
		  </li>
		</ul>