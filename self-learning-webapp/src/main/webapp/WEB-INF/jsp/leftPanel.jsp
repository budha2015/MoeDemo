<style>
 .leftPanelLinks form li > a {color: white!important;text-decoration: none!important;padding-left: 4em;}
 .leftPanelLinks form li > a:hover {color: white!important;padding-left: 4em;text-decoration: underline!important;}
 
 ul > form {padding-bottom: .6em!important;}
 .pr10{padding-right:1em!important;}
</style>




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
       
      <span class="leftPanelLinks">   
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li><a href="${pageContext.request.contextPath}/homepage"><img src="images/home_normal.png" class="pr10"> <span>Home</span></a></li>
		
		<!-- Partners -->
		<li class="nav-parent"><a href=""> <img src="images/internal_normal.png" class="pr10" > <span>Partners</span></a>
			<ul class="children">
				<form id="searchExtorgform" method="post" action="${pageContext.request.contextPath}/searchexternalorganisation">
					<li><a onClick="document.getElementById('searchExtorgform').submit();"><i class="fa fa-caret-right"></i> Third Party</a></li>
				</form>
				<form id="searchuserform" method="POST" action="${pageContext.request.contextPath}/searchuser">
					<li><a onClick="document.getElementById('searchuserform').submit();"><i	class="fa fa-caret-right"></i>Contacts</a></li>
				</form>
			</ul>
		</li>
		
		<!-- Onboarding -->
		<li class="nav-parent"><a href=""><img src="images/Partner-Management_normal.png" class="pr10"> <span>Onboarding</span></a>
			<ul class="children">
			
				<form id="datacollection" method="post"	action="${pageContext.request.contextPath}/datacollectionlisting">
					<li><a onClick="document.getElementById('datacollection').submit();"><i class="fa fa-caret-right"></i> Data Collection </a></li>
				</form>
				
				<%-- <form id="viewRemediationform" method="get" action="${pageContext.request.contextPath}/displayRecievedTask">
						<li><!-- <a onClick="document.getElementById('viewRemediationform').submit();"> -->	<i class="fa fa-caret-right"></i>Remediation <!-- </a> --></li>
					</form> --%>
					
					<form id="remediationform" method="post" action="${pageContext.request.contextPath}/createremediation">
					<li><a onClick="document.getElementById('remediationform').submit();">
					<i class="fa fa-caret-right"></i>Add Task </a></li>
				</form>
				
				<%-- <form id="viewRemediationform" method="get" action="${pageContext.request.contextPath}/displayrecievedtask">
						<li><a onClick="document.getElementById('viewRemediationform').submit();">	<i class="fa fa-caret-right"></i>Remediation </a></li>
					</form> --%>
				<form id="viewRemediationform" method="post" action="${pageContext.request.contextPath}/viewsummary?param=remediationTaskSummary">
					<li><a onClick="document.getElementById('viewRemediationform').submit();">
					<i class="fa fa-caret-right"></i>Remediation Summary</a></li>
				</form>
				
				<form id="contractSummeryform" method="post"
					action="${pageContext.request.contextPath}/viewcontractdetails">
					<li><a onClick="document.getElementById('contractSummeryform').submit();"><i class="fa fa-caret-right"></i> Contracts </a></li>
				</form>
				
				<form id="licenseSummaryform" method="POST"
					action="${pageContext.request.contextPath}/licensemanager">
					<li><a onClick="document.getElementById('licenseSummaryform').submit();"><i class="fa fa-caret-right"></i>License Manager</a></li>
				</form>
				
			</ul>	
		</li>
			
		<!-- Management -->
		<li class="nav-parent"><a href=""><img src="images/onboarding_normal.png" class="pr10"> <span>Management</span></a>
			<ul class="children">
				
				<form id="searchorgform" method="post" 	action="${pageContext.request.contextPath}/searchinternalorganisation">
					<li><a onClick="document.getElementById('searchorgform').submit();"><i class="fa fa-caret-right"></i> My Organisation</a></li>
				</form>
				<form id="searchuserform" method="POST" action="${pageContext.request.contextPath}/searchuser">
					<li><a onClick="document.getElementById('searchuserform').submit();"><i class="fa fa-caret-right"></i>Users</a></li>
				</form>
				
				<form id="questionnairesSetupform" method="post" action="${pageContext.request.contextPath}/postquestionnaire">
					<li><a onClick="document.getElementById('questionnairesSetupform').submit();"><i class="fa fa-caret-right"></i> Questionnaire Design</a></li>
				</form>
				<form id="businesscaseform" method="post" action="${pageContext.request.contextPath}/postquestionnaire">
					<input type="hidden" name="businesCase"/> 
					<li><a onClick="document.getElementById('businesscaseform').submit();"><i class="fa fa-caret-right"></i> Business Case Design </a></li>		
				</form>
				
				<form id="questionnairesBankform" method="post" action="${pageContext.request.contextPath}/displayquestionbank">
					<li><a onClick="document.getElementById('questionnairesBankform').submit();"><i class="fa fa-caret-right"></i> Question Bank</a></li>
				</form>
				
				<form id="questionnairesform" method="post" action="${pageContext.request.contextPath}/retrievequestioncategory">
					<li><a onClick="document.getElementById('questionnairesform').submit();"><i class="fa fa-caret-right"></i> Question Category</a></li>
				</form>
				
				<form id="questionnairesLinkform" method="post" action="${pageContext.request.contextPath}/assigndatacollection">
					<li><a onClick="document.getElementById('questionnairesLinkform').submit();"><i	class="fa fa-caret-right"></i> Questionnaire Linking </a></li>
				</form>
				
			</ul>
		</li>

			
		<!-- Comments menu -->
		<li class="nav-parent"><a href=""><img src="images/Comments_normal.png" class="pr10"> <span>Comments</span></a>
			<ul class="children">
				<form id="commentform" method="post"
					action="${pageContext.request.contextPath}/postcomments">
					<li><a onClick="document.getElementById('commentform').submit();"><i class="fa fa-caret-right"></i> Comments</a></li>
				</form>
				
			</ul>
		</li>
		
		
		<!-- Document Management System -->
		<li class="nav-parent"><a href=""><img src="images/Partner-Management_normal.png" class="pr10"> <span> TenantDMS</span></a>
			<ul class="children">
				<form id="dmsform" method="post"
					action="${pageContext.request.contextPath}/dmsflow">
					<li><a onClick="document.getElementById('dmsform').submit();"><i class="fa fa-caret-right"></i> DMS</a></li>
				</form>
							
			</ul>
		</li>
		<!--  UserPreference -->
		<li class="nav-parent"><a href=""><img src="images/Questionnaire-Management_normal.png" class="pr10"><span>User Preference</span></a>
		<ul class="children">
			<form id="userPreferenceform" method="post"
				action="${pageContext.request.contextPath}/userPrefenceLoad">
				<li><a onClick="document.getElementById('userPreferenceform').submit();"><i
						class="fa fa-caret-right"></i> user preference</a></li>
			</form>			
		</ul>		
		</li>
		
			<!-- Business Region -->
<li class="nav-parent">
	<a href=""><span>Business Region</span></a>
	<ul class="children">
		<form id="businessRegionform" method="POST" action="${pageContext.request.contextPath}/businessRegionflow">
			<li>
				<a onClick="document.getElementById('businessRegionform').submit();">
				<i class="fa fa-caret-right"></i>Business Region</a>
			</li>
		</form>
	</ul>
</li>
		
		
		
	</ul>	
	</span>	

	</div><!-- leftpanelinner -->