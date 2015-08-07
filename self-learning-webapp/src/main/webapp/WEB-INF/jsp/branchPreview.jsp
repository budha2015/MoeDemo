<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.rfg.tprm.questionnaire.model.RecordPojo"%>
<%@ page import="java.util.*" %>

		<%
		    int temp = 0;
		 
		    
		
			RecordPojo recordPojo = (RecordPojo) request.getAttribute("BranchPreviewComponent1");
			String myContent = "";		
		
	//		System.out.println("Size of DestinationQuestionTagNames Map is:"+(recordPojo.getDestinationQuestionTagNames()).size());
			
	//		System.out.println("RecordPojo AnswerOptionValues Size is:"+(recordPojo.getAnswerOptionValues()).size());		
			
	//		System.out.println("Size of sourceQuestionTagNames is::::::::::::::"+(recordPojo.getSourceQuestionTagNames()).size());
			
	//		 Set<String> s = new TreeSet<String>((recordPojo.getSourceQuestionTagNames()));
			
	//		System.out.println("Neww Size is:"+s.size());
			
	//		int newSize = s.size(); 
			
	//		int newSize = (recordPojo.getSourceQuestionTagNames()).size();
			
//			for(int h = 0;h<2;h++){
				
//				if(h==1){
//					recordPojo = (RecordPojo) request.getAttribute("BranchPreviewComponent2");
//				}

//System.out.println("Super Value"+(recordPojo.getQuestionText()).get((recordPojo.getSourceQuestionTagNames()).get(2)).get(0));
			
			if( (recordPojo.getSourceQuestionTagNames())!=null && (recordPojo.getSourceQuestionTagNames()).size() > 0  ){
			
			for(int k = 0;k<(recordPojo.getSourceQuestionTagNames()).size();k++){
				//System.out.println("Value1:"+(((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))));
				//System.out.println("Value2:"+((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k))));
				if(((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 3) || ((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 4) ){
					//System.out.println("Inside If Condition");
					temp = 1;
				}
				int j=0;
				int i=1;
				
				if (((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 3) || ((((recordPojo.getQuestionTypeId()).get((recordPojo.getSourceQuestionTagNames()).get(k)))) == 4)){
					j++;
					i++;
				}
			for (;  j < i; j++) {
				
				System.out.println("K Value is:"+k);

				myContent += "<tr class='tagHead'><td class='sourceQuestion'>"
						+ (recordPojo.getSourceQuestionTagNames()).get(k)
						+ "<span>"+(recordPojo.getQuestionText()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)+"</span></td><td>"
						+ (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j).replace("to","  To  ")
						+ "</td><td>"	
						+ (((recordPojo.getIsSkip()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ ((recordPojo.getDestinationQuestionTagNames()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j))
						+ "</td><td>"						
						+ (((recordPojo.getIsMandatory()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ (((recordPojo.getIsAttachment()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td></tr>";

			}
			
			
			int previewStyleLength = (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).size();
			for(;j < (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).size(); j++){
				if(j != previewStyleLength-1) {
				myContent += "<tr class='tagBody'><td>" +""+
						"</td><td>"+ (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j).replace("to","  To  ")
						+ "</td><td>"
						+ (((recordPojo.getIsSkip()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ (recordPojo.getDestinationQuestionTagNames()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)
						+ "</td><td>"						
						+ (((recordPojo.getIsMandatory()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td><td>"
						+ (((recordPojo.getIsAttachment()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
						+ "</td></tr>";
				} else {
					myContent += "<tr><td>" +""+
							"</td><td>"+ (recordPojo.getAnswerOptionValues()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j).replace("to","  To  ")
							+ "</td><td>"
							+ (((recordPojo.getIsSkip()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
							+ "</td><td>"
							+ (recordPojo.getDestinationQuestionTagNames()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)
							+ "</td><td>"						
							+ (((recordPojo.getIsMandatory()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
							+ "</td><td>"
							+ (((recordPojo.getIsAttachment()).get((recordPojo.getSourceQuestionTagNames()).get(k)).get(j)).equals(true)?"On":"Off")
							+ "</td></tr>";
				}
			}
			} //outer for loop
//			System.out.println("After "+h+" Iteration Pojo Processed MyContent is:"+myContent);
			
			System.out.println("After Iteration Pojo Processed MyContent is:"+myContent);
			
	} // OUTER IF CONDITION TO KNOW DATA IS THERE IN BRANCH TABLE OR NOT
	else{
//		if(h!=1)
		myContent += "<tr><td colspan='6' style='color:#f00; text-align: center'>NO DATA TO DISPLAY </tr></td>";
	}
//			}
		%>

		<div class="contentPanel">
			<div class="questHeader clearfix">
				<h1 class="title"><%= ((java.lang.String)session.getAttribute("QuestionnaireName"))%></h1>
			</div>
			<div class="setupQuestContainer branchPreview">
				<table width='100%'>
					<tr class="branchPreviewHead">
						<th><b>Source Question</b></th>
						<th><b>Answer Option</b></th>
						<th><b>Skip</b></th>
						<th><b>Target Question</b></th>						
						<th><b>Mandatory</b></th>
						<th><b>Attachment</b></th>
					</tr>
					<%
						out.println(myContent);
					%>
				</table>
			</div>
			<div class='btn-group'><button type="submit" class='btn cancel qstSubmitEdit'>Close</button></div>

		</div>	  
	<div class="tooltop"></div>