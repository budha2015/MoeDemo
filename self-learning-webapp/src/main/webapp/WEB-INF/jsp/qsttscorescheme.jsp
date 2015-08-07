
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import = "com.rfg.tprm.questionnaire.model.QsttScoreSchemeHelper"%>
<%@ page import = "java.util.*" %>



<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="shortcut icon" href="images/favicon.png" type="image/png">
      <title>Partner Integrity</title>
      <link rel="stylesheet" type="text/css" href="css/jquery-ui-1.11.0.css">
      <link href="css/quescommon.css" rel="stylesheet">
      <link href="css/linkmain.css" rel="stylesheet">
      <link href="css/slider.css" rel="stylesheet">
      
      
      <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->
       <style>
        .closeClearSave {width: 96%; margin: 0 2%}
        .footer {position: relative; margin-left: 240px}
        .from, .to {width: 50px}
		 .labelInput {width: 80px}
        .questPopup {height:100px}
        .leftpanel { height: 100% !important}
        .mainpanel{min-height: 720px;height:100% !important; overflow:hidden}
        .remedSelect + span {margin-top: 3em;}
        .default {display: none}
		  select[multiple], select[size] {border-radius: 5px; border: #ccc 1px solid;}   
		  .switch-light {font-size: 9px;}
		  
		  /* For New Custom Select by Ravi */
		.customSelectWrapper{float:left; height:25px; overflow:hidden; position:relative; width:100%;}
		.customSelectNew{height:25px; width:100%; position:absolute; left:0; top:0; opacity:0; filter: alpha(opacity=0); z-index:999;}
		.customSelectClick{background:url(images/icons/dd.png) right center #fff no-repeat; box-sizing:border-box; border:1px solid #ccc; border-radius:5px; color:#636e7b; font-size:12px; font-family:arial; padding:0px 25px 0px 5px;  height:25px; line-height:25px; width:100%; position:absolute; left:0; top:0; z-index:99;}
		.customSelectClickDisabled{background-color:#F7F7F7; color:#b3b3b3;}
      </style>
   </head>
   <body>



 <%
          
          
               
          List<QsttScoreSchemeHelper> qsttScoreSchemeHelper = (List<QsttScoreSchemeHelper>)request.getAttribute("qsttScoreSchemeHelpers");
          System.out.println("Size of Helper:"+qsttScoreSchemeHelper.size());
               String myContent = qsttScoreSchemeHelper.get(0).getLinkName();
               int minScoreAddition = 0;
               int maxScoreAddition = 0;
               String questionnaireName = null;
               for(QsttScoreSchemeHelper qsttScoreSchemeHlpr:qsttScoreSchemeHelper){
            	   minScoreAddition += qsttScoreSchemeHlpr.getMinScoreAddition();
            	   maxScoreAddition += qsttScoreSchemeHlpr.getMaxScoreAddition();
            	   questionnaireName = qsttScoreSchemeHlpr.getQuestionnaireName();
               }
               
               System.out.println("linkName"+myContent);
               System.out.println("minScoreAddition"+minScoreAddition);
               System.out.println("maxScoreAddition"+maxScoreAddition);
              
             
            	   
           %>


      <!-- Preloader -->
      <div id="preloader">
         <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
      </div>
      <div class="leftpanel">
        
          <div class="logopanel"> <a href="#"><img src="images/img_logo.png" alt="Partner Integrity" ></a> </div>
  <!-- logopanel -->
  
 		<div class="leftpanelinner">
			<jsp:include page="leftPanel.jsp"></jsp:include>	

		</div>
         <!-- leftpanelinner -->
      </div>
      <!-- leftpanel -->
      <div class="mainpanel">
      
      
      
         <jsp:include page="header.jsp"></jsp:include>
			
		<!-- headerbar -->
		
		
		
		
		
         <!-- User Management - Create User -->
       
          <form name="scoreForm" action="#" method="post">
        
          <input type="hidden" name="scoreSchemaId" value="${scoreSchemaId}">
           <input type="hidden" name="id" value="${id}">
         <div class="container">
    
            <div class="containerPanel clearfix">    
             
   <h1 class="title"> Score scheme panel: <%= myContent %> </h1>
             
               <div class="ss-status-container clearfix"><div class="ss-status clearfix">
             
 <div class="fl">
               <c:if test="${!empty qsttScoreSchemeHelpers}">
               <c:forEach items="${qsttScoreSchemeHelpers}" var="qsttScoreSchemeHelper" >  
                  

               <div class="score clearfix">
               <div class="score-name"><c:out value="${qsttScoreSchemeHelper.questionnaireName}"/></div>
               <div class="mm-score">Minimum <span class="count seperator">: <c:out value="${qsttScoreSchemeHelper.minScore}"/></span></div>
               <div class="mm-score">Maximum <span class="count">: <c:out value="${qsttScoreSchemeHelper.maxScore}"/></span></div>
            	</div>
                    
             </c:forEach>
				</c:if>
				   </div>
               <div class="fr">
               <div class="score clearfix">
                <div class="score-name">Cumulative Score</div>
               </div>
                <div class="score clearfix">
              
               <div class="mm-score">Minimum <span class="count seperator">: <%= minScoreAddition %></span></div>
               <div class="mm-score">Maximum <span class="count">: <%= maxScoreAddition %></span></div>


            	</div>
               </div>
               </div>
               </div>               
        <div class="ss-form">
               <table width="100%" class="ss-table" cellspacing="0" cellpadding="0">
               <thead>
               <tr>
               <td colspan="2" class="borderR"><b>Number Range</b></td>
               <td class="borderR" width="70" rowspan="2" style="vertical-align:middle"><b>Label</b></td>
               <td><b>Services</b></td>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
               </tr>
               <tr>
               <td width="70">From</td><td class="borderR" width="70">To</td><td width="200">Notification</td><td width="200">Due Diligence</td><td width="200">Integra Watch</td><td width="200">Remediation</td><td></td>
               </tr></thead>
               <tbody>
               <tr class="hidden">
               <td><input type="text" class="from" name="minScore"/></td><td><input type="text" class="to"  name = "maxScore"/></td><td><input type="text" class="labelInput" name="riskLabel" /></td><td><span class="ss-notify ss-icon"></span><textarea name="notification" class="toggle"></textarea></td><td><span class="ss-dueDiligence ss-icon"></span>
                             <div class="toggle">
               	<div class="approval">Approval Required: <label class="switch-light switch-slider"><input type="checkbox"  name="ddRequiresApproval" />
               	<input type="hidden" class="check ddApp" name="ddApproval" value="false"/><span><span>No</span><span>Yes</span></span><a></a></label>
               	</div>
											<select name="ddTask" class="customSelectNew">
												<option value="1">DD Select</option>
												<option value="2">DD Select2</option>
												<option value="3">DD Select3</option>
												<option value="4">DD Select4</option>
											</select>
										</div></td><td><span class="ss-integrawatch ss-icon"></span> 	<div class="toggle">
               	<div class="approval">Approval Required:<label class="switch-light switch-slider"><input type="checkbox" name="iwRequiresApproval" />
               	<input type="hidden" class="check iwApp" name="iwApproval" value="false"/><span><span>No</span><span>Yes</span></span><a></a></label>
               	</div>
                <select name="iwTask"  multiple="multiple" size="2" class="appReq">
                	<option class="appR" value="1">multiple entities</option>       <!-- do not put any value as 0 becuase 0 is for default value -->
                	<option class="appR" value="5">multiple entities2</option>
                	<option class="appR" value="6">multiple entities3</option>
                	<option class="appR" value="7">multiple entities4</option>
                	<option class="appR" value="8">multiple entities5</option>
                	<option value="default" class="default hidden" selected >Default</option>
                	<option value="default" class="default hidden" selected >Default</option>
                	<option value="default" class="default hidden" selected >Default</option>
                </select>
               </div></td><td><span class="ss-remediation ss-icon"></span> 	<div class="toggle">
               <select name="remediation" class="customSelectNew">
                	<option>Certification</option>
                	<option>Certification1</option>
                	<option>Certification2</option>
                	<option>Certification3</option>
                </select></div></td><td><div class="addRemove"><span class="addElement"></span><span class="removeElement"></span></div></td>
               </tr>
             
                       

            <c:choose>
      			<c:when test="${not empty l}"> 
                  <c:forEach items="${l}" var="rr">
                  
              <tr class="ss-row clone">
              
               <td>
            
               <input type="text" class="from" name="minScore" value="${rr.minScore}"/></td><td><input type="text" class="to" name = "maxScore" value="${rr.maxScore}" /></td><td><input type="text" class="labelInput" name="riskLabel" value="${rr.riskLabel}" /></td><td><span class="ss-notify ss-icon"></span><textarea name="notification" value="${rr.notification}"  class="toggle">${rr.notification}</textarea></td><td><span class="ss-dueDiligence ss-icon"></span>
               <div class="toggle">
               	<div class="approval">Approval Required: <label class="switch-light switch-slider"><input type="checkbox" name="ddRequiresApproval" ${rr.ddRequiresApproval == 'true' ? 'checked' : 'false'} />
               	 <input type="hidden" class="check ddApp" name="ddApproval" value="false"/><span><span>No</span><span>Yes</span></span><a></a></label>
               	</div> 
                <select name="ddTask" class="customSelectNew">
                    <option value="1" ${rr.ddTask == 1 ? 'selected="selected"' : ''}>DD Select</option>
                	<option value="2" ${rr.ddTask == 2 ? 'selected="selected"' : ''}>DD Select2</option>
                	<option value="3"  ${rr.ddTask == 3 ? 'selected="selected"' : ''}>DD Select3</option>
                	<option value="4"  ${rr.ddTask == 4 ? 'selected="selected"' : ''}>DD Select4</option>
                </select>
               </div></td><td><span class="ss-integrawatch ss-icon"></span> <div class="toggle">
               	<div class="approval">Approval Required: <label class="switch-light switch-slider"><input type="checkbox" name="iwRequiresApproval" ${rr.iwRequiresApproval == 'true' ? 'checked' : 'false'} />
               	               	<input type="hidden" class="check iwApp" name="iwApproval" value="false" /><span><span>No</span><span>Yes</span></span><a></a></label>
               	</div>
                <select  name="iwTask" multiple="multiple" size="2" class="appReq multiSelectQuesLinking">
                	 <!-- do not put any value as 0 becuase 0 is for default value -->
                	
                	<option class="appR" value="1" ${rr.iwTask1 == 1 ||rr.iwTask2 == 1 || rr.iwTask3 == 1  ? "selected" : ""}>multiple entities</option> 
                	<option class="appR" value="5" ${rr.iwTask1 == 5 ||rr.iwTask2 == 5 || rr.iwTask3 == 5  ? "selected" : ""}>multiple entities2</option>
                	<option class="appR" value="6" ${rr.iwTask1 == 6 ||rr.iwTask2 == 6 || rr.iwTask3 == 6  ? "selected" : ""}>multiple entities3</option>
                	<option class="appR" value="7" ${rr.iwTask1 == 7 ||rr.iwTask2 == 7 || rr.iwTask3 == 7  ? "selected" : ""}>multiple entities4</option>
                	<option class="appR" value="8" ${rr.iwTask1 == 8 ||rr.iwTask2 == 8 || rr.iwTask3 == 8  ? "selected" : ""}>multiple entities5</option>
                	<option value="default" class="default hidden" ${rr.iwTask1 == '0' ? "selected" : ""}>Default</option>
                	<option value="default" class="default hidden" ${rr.iwTask2 == '0' ? "selected" : ""}>Default</option>
                	<option value="default" class="default hidden" ${rr.iwTask3 == '0' ? "selected" : ""}>Default</option>
                </select>
               </div></td><td><span class="ss-remediation ss-icon"></span> 	<div class="toggle"><select class="customSelectNew remedSelect" name="remediation" value="${rr.remediation}">
               
                	<option>Certification</option>
                	<option>Certification1</option>
                	<option>Certification2</option>
                	<option>Certification3</option>
                </select></div></td><td><div class="addRemove">  <input type=hidden  class="idVal" name="SchemeId" value=${rr.id} /><span class="addElement"></span></div></td>
               </tr>
         </c:forEach> 
         </c:when>
      <c:otherwise>    
      <tr class="ss-row">
               <td><input type="text" class="from numaricOnly" name="minScore" value=""/></td><td><input type="text" class="to numaricOnly" name = "maxScore" /></td><td><input type="text" class="labelInput" name="riskLabel" /></td><td><span class="ss-notify ss-icon"></span><textarea name="notification"  class="toggle"></textarea></td><td><span class="ss-dueDiligence ss-icon"></span>
               <div class="toggle">
               	<div class="approval">Approval Required: <label class="switch-light switch-slider"><input type="checkbox" name="ddRequiresApproval" />
               	 <input type="hidden" class="check ddApp" name="ddApproval" value="false"/><span><span>No</span><span>Yes</span></span><a></a></label>
               	</div>
                <select name="ddTask" class="customSelectNew">
                    <option value="1">DD Select</option>
                	<option value="2">DD Select2</option>
                	<option value="3">DD Select3</option>
                	<option value="4">DD Select4</option>
                </select>
               </div></td><td><span class="ss-integrawatch ss-icon"></span> <div class="toggle">
               	<div class="approval">Approval Required: <label class="switch-light switch-slider"><input type="checkbox" name="iwRequiresApproval" />
               	 <input type="hidden" class="check iwApp" name="iwApproval" value="false"/><span><span>No</span><span>Yes</span></span><a></a></label>
               	</div>
                <select  name="iwTask" multiple="multiple" size="2" class="appReq">
                 <!-- do not put any value as 0 becuase 0 is for default value -->
                	
                    <option value="1" class="appR">multiple entities</option> 
                	<option value="5" class="appR">multiple entities2</option>
                	<option value="6" class="appR">multiple entities3</option>
                	<option value="7" class="appR">multiple entities4</option>
                	<option value="8" class="appR">multiple entities5</option>
                	<option value="default" class="default hidden" selected>Default</option>
                	<option value="default" class="default hidden" selected>Default</option>
                	<option value="default" class="default hidden" selected>Default</option>
                </select>
               </div></td><td><span class="ss-remediation ss-icon"></span> 	<div class="toggle"><select class="customSelectNew remedSelect" name="remediation">
                	
                	<option>Certification</option>
                	<option>Certification1</option>
                	<option>Certification2</option>
                	<option>Certification3</option>
                </select></div></td><td><div class="addRemove"><span class="addElement"></span></div></td>
                 </tr>
      	</c:otherwise>
		</c:choose>                 
              </tbody>
               </table>

                  
                  
              </div>
               
            </div>
            </div>
            </form>
        
            
            <div class="btns closeClearSave">
               <button class="btn btn-xs cancel">Close</button><button class="btn btn-xs clear delete">Clear</button><button class="btn btn-xs fr abc">Save Score Scheme</button></div>
         </div>
         <!-- Score Schema -->
         <div class="removePopup questPopup">
	 <i class="closeBtn"></i>       
    <ul>
      <li>Are you sure want to remove <span class="rangeVal"></span> range?</li>
      <li style="margin: 0 4em;"><button type="button" class="btn btn-xs delete" name="cancelQ">Yes</button>
     <button type="button" class="btn btn-xs closePopup fr" name="submitQ">No</button></li>
    </ul>    
</div>

  <div class="clearPopup questPopup">
	 <i class="closeBtn"></i>       
    <ul>
      <li>Are you sure want to clear entire score scheme?</li>
      <li style="margin: 0 4em;"><button type="button" class="btn btn-xs deleteall" name="cancelQ">Yes</button>
     <button type="button" class="btn btn-xs closePopup fr" name="submitQ">No</button></li>
    </ul>    
</div>
<div class="popupBg"></div>
         
		 <jsp:include page="footer.jsp"></jsp:include>
					<!-- contentpanel -->



      </div>
      <!-- mainpanel -->
      <script src="js/jquery-1.10.2.min.js"></script>
	  <script src="js/jquery-ui-1.11.0.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/modernizr.min.js"></script>
      <script src="js/jquery.cookies.js"></script>
      <script src="js/quescommon.js"></script>
      <script src="js/custom.js"></script>
      <script src="${pageContext.request.contextPath}/js/commonvalidation.js"></script>
     <script>
     jQuery(document).ready(function(){
    	 jQuery('.container').on('click', '.switch-slider input[type="checkbox"]',function() {
    		    if(jQuery(this).is(':checked')) {
    		       jQuery(this).siblings('.check').val('true');
    		    }
    		    else{
    		        jQuery(this).siblings('.check').val('false');
    		        }
    		});
  
  
     jQuery('.abc').on('click',function(){
         //alert("Inside Jquery");
        
			//var aid = $(this).data('id');
			//var url = "/partnerintegrity/savescorescheme";
			/* alert("minScore"+document.scoreForm.minScore.value)
			alert("maxScore"+document.scoreForm.maxScore.value)
			alert("riskLabel"+document.scoreForm.riskLabel.value)
			alert("notification"+document.scoreForm.notification.value)
			alert("notification"+document.scoreForm.ddRequiresApproval.value) */
			
			document.scoreForm.action="savescorescheme";
			document.scoreForm.submit();
			//window.location.href = url;
         });
		jQuery('.clear').on('click',function(){
			jQuery('.clearPopup').show();
			jQuery('.popupBg').show();				
		});
		
         jQuery('.deleteall').on('click',function(){
        // alert("Inside Delete")
        
			//var aid = $(this).data('id');
			//var url = "/partnerintegrity/savescorescheme";
			document.scoreForm.action="deletescorescheme";
			document.scoreForm.submit();
			//window.location.href = url;
          
         });

         jQuery('.cancel').on('click',function(){
             // alert("Inside Delete")
             
     			//var aid = $(this).data('id');
     			var url = "/partnerintegrity/datacollection";
     			//document.scoreForm.action="deletescorescheme";
     			//document.scoreForm.submit();
     			window.location.href = url;
               
              });         
/*          
          jQuery('.delete').on('click',function(){
         alert("Inside -");
        alert("id"+document.scoreForm.SchemeId.value);
			var aid = jQuery(this).data('id');alert(aid);
			//var url = "/partnerintegrity/savescorescheme";
			document.scoreForm.action="deletescoreschemeone";
			document.scoreForm.submit();
			//window.location.href = url;
          
         }); */
         
     });

     jQuery('.ss-table').on('click', '.appReq', function(){
    	    jQuery(this).children('.default').removeAttr('selected');
    	    
    	    var total = jQuery(this).children('.appR:selected').length;
    	    if(total == 0) {
    	       jQuery(this).children('.default').attr('selected', 'selected');
    	     }
    	    else if(total == 1) {
    	       jQuery(this).children('.default').eq(1).attr('selected', 'selected');
    	       jQuery(this).children('.default').eq(2).attr('selected', 'selected');
    	    }
    	    else if(total == 2) {
    	       jQuery(this).children('.default').eq(1).attr('selected', 'selected');   
    	    } 
    	});  

     jQuery('.switch-light input[type="checkbox"]').each(function() {
   	     var vals = jQuery(this).is(':checked');
         jQuery(this).closest('.toggle').find('.check').val(vals);
        });
     
     
     //Allow only numeric values
	    jQuery(document).on('keypress focus','input.numaricOnly, input.qt_score',function (e) {
	                var key = window.e ? e.keyCode : e.which;
	                if (e.keyCode == 8 ||e.keyCode == 0) {
	                                return true;
	                }
	                else if( key < 48 || key > 57 ) {                              
	                    return false;
	                }
	                else return true;
	             });  


     
     </script>  
      
   </body>
</html>

