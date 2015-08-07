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
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="${pageContext.request.contextPath}/homepage"><span>Home</span></a></li>
		
        <!-- User management menu -->
        <li class="nav-parent"><a href=""> <span>User Management</span></a>
		<ul class="children">
			<form id="internaluserform" method="POST"
				action="${pageContext.request.contextPath}/userflow?param=internaluser">
				<li><a onClick="document.getElementById('internaluserform').submit();"><i
						class="fa fa-caret-right"></i>Internal User</a></li>
			</form>
			<form id="externaluserform" method="POST"
				action="${pageContext.request.contextPath}/userflow?param=externaluser">
				<li><a onClick="document.getElementById('externaluserform').submit();"><i
						class="fa fa-caret-right"></i>External User</a></li>
			</form>
			<form id="searchuserform" method="POST"
				action="${pageContext.request.contextPath}/userflow?param=searchuser">
				<li><a onClick="document.getElementById('searchuserform').submit();"><i
						class="fa fa-caret-right"></i>Search User</a></li>
			</form>
		</ul></li>
        
        	<!-- Organisation management menu -->
	<!-- Organisation management menu -->
	<li class="nav-parent"><a href=""> <span>Internal Organisation</span></a>
		<ul class="children">
			<form id="createorgform" method="post"
				action="${pageContext.request.contextPath}/createinternalorg">
				<li><a onClick="document.getElementById('createorgform').submit();"><i
						class="fa fa-caret-right"></i> Create Organisation</a></li>
			</form>
			<%-- <form id="createorgstructure" method="post"
				action="${pageContext.request.contextPath}/createorgsetuphome">
				<li><a onClick="document.getElementById('createorgstructure').submit();"><i
						class="fa fa-caret-right"></i> Organisation Structure &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Setup</a></li>
			</form> --%>
			<%-- <form id="previeworgsetucture" method="post"
				action="${pageContext.request.contextPath}/previeworgsetup">
				<li><a onClick="document.getElementById('previeworgsetucture').submit();"><i
						class="fa fa-caret-right"></i> Preview Organisation Structure</a></li>
			</form> --%>
			<form id="searchorgform" method="post"
				action="${pageContext.request.contextPath}/searchinternalorg">
				<li><a onClick="document.getElementById('searchorgform').submit();"><i
						class="fa fa-caret-right"></i> Search Organisation</a></li>
			</form>
			
		</ul></li>
        
           	<!-- Template menu -->
	<li class="nav-parent"><a href=""> <span>Email Template </span></a>
		<ul class="children">
			<form id="etemplateForm" method="POST"
				action="${pageContext.request.contextPath}/getETemplateList">
				<li><a onClick="document.getElementById('etemplateForm').submit();"><i
						class="fa fa-caret-right"></i>Email Event List</a></li>
			</form>
			
		</ul></li>
        
        
           <!-- External Organisation management menu -->
	<li class="nav-parent"><a href=""> <span>External Organisation</span></a>
		<ul class="children">
			<form id="createExtorgform" method="post"
				action="${pageContext.request.contextPath}/createexternalorg">
				<li><a onClick="document.getElementById('createExtorgform').submit();"><i
						class="fa fa-caret-right"></i> Create Organisation</a></li>
			</form>
			<form id="searchExtorgform" method="post"
				action="${pageContext.request.contextPath}/searchexternalorg">
				<li><a onClick="document.getElementById('searchExtorgform').submit();"><i
						class="fa fa-caret-right"></i> Search Organisation</a></li>
			</form>
		</ul></li>
		
		<!-- Comments menu -->
	<li class="nav-parent"><a href=""><span>Comments</span></a>
		<ul class="children">
			<form id="commentform" method="post"
				action="${pageContext.request.contextPath}/postcomments">
				<li><a onClick="document.getElementById('commentform').submit();"><i
						class="fa fa-caret-right"></i> Comments</a></li>
			</form>
			
		</ul></li>
		
		<!-- Questionnaire menu -->
	<li class="nav-parent"><a href=""><span>Questionnaires</span></a>
		<ul class="children">
			<form id="questionnairesform" method="post"
				action="${pageContext.request.contextPath}/retrievequestioncategory">
				<li><a onClick="document.getElementById('questionnairesform').submit();"><i
						class="fa fa-caret-right"></i> View Category</a></li>
			</form>
			
		</ul>
		
		<ul class="children">
			<form id="questionnairesBankform" method="post"
				action="${pageContext.request.contextPath}/displayquestionbank">
				<li><a onClick="document.getElementById('questionnairesBankform').submit();"><i
						class="fa fa-caret-right"></i> Question Bank</a></li>
			</form>
			
		</ul>
		
				<ul class="children">
			<form id="questionnairesSetupform" method="post"
				action="${pageContext.request.contextPath}/postquestionnaire">
				<li><a onClick="document.getElementById('questionnairesSetupform').submit();"><i
						class="fa fa-caret-right"></i> Setup Questionnaire</a></li>
			</form>
			
		</ul>
		
				<ul class="children">
			<form id="questionnairesLinkform" method="post"
				action="${pageContext.request.contextPath}/assigndatacollection">
				<li><a onClick="document.getElementById('questionnairesLinkform').submit();"><i
						class="fa fa-caret-right"></i> Questionnarie Linking</a></li>
			</form>
			
		</ul>
		
		<ul class="children">
			<form id="datacollection" method="post"
				action="${pageContext.request.contextPath}/datacollectionlisting">
				<li><a onClick="document.getElementById('datacollection').submit();"><i
						class="fa fa-caret-right"></i>Data Collection</a></li>
			</form>
			
		</ul>
		</li>
		
		
		<!-- Contract menu -->
	<li class="nav-parent"><a href=""><span>Initiate Contract</span></a>
		<ul class="children">
			<form id="contractform" method="post"
				action="${pageContext.request.contextPath}/initiateContract">
				<li><a onClick="document.getElementById('contractform').submit();"><i
						class="fa fa-caret-right"></i> Create Contract</a></li>
			</form>
			
			<form id="contractSummeryform" method="post"
				action="${pageContext.request.contextPath}/viewContractDetails">
				<li><a onClick="document.getElementById('contractSummeryform').submit();"><i
						class="fa fa-caret-right"></i> Contracts Summary</a></li>
			</form>
			
		</ul></li>
		
		
     
    </div><!-- leftpanelinner -->