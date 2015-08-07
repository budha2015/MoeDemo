package com.moe.sls.serviceimpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeMap;




import com.moe.sls.dao.MyException;
import com.moe.sls.dao.QsttQuestionBranchDao;
import com.moe.sls.dao.QsttQuestionMapDao;
import com.moe.sls.model.QComponent;
import com.moe.sls.model.QsttQuestionBranch;
import com.moe.sls.model.QsttQuestionBranchId;
import com.moe.sls.model.QsttQuestionMap;
import com.moe.sls.model.QsttQuestionMapId;
import com.moe.sls.model.QsttQuestionnaireDef;
import com.moe.sls.model.QuestionComponent;
import com.moe.sls.model.RecordPojo;
import com.moe.sls.service.BranchingService;
import com.moe.sls.service.BranchingValue;

@Service
public class BranchingServiceImpl implements BranchingService {

	@Autowired
	QsttQuestionBranchDao qsttQuestionBranchDao;
	
	//NEW CODE ADDED FOR ATTACHMENT RELATED
	
	@Autowired
	QsttQuestionMapDao qsttQuestionMapDao;	
	
	@Autowired
	QsttQuestionnaireDef qsttQuestionnaireDef;
	
	//NEW CODE ADDED FOR ATTACHMENT RELATED

	@Autowired
	QsttQuestionBranch qsttQuestionBranch;

	@Autowired
	QsttQuestionBranchId qsttQuestionBranchId;

	@Autowired
	QsttQuestionMap qsttQuestionMap;

	@Autowired
	QsttQuestionMapId qsttQuestionMapId;
	
	Map<String,Long> map = new HashMap<String,Long>();
	
	List<QuestionComponent> retrieveQuestionnaireComponents = new ArrayList<QuestionComponent>();
	
	//@Override
	public List<QuestionComponent> getBranchedQuestions(Long questionnaireId,String sourceQuestionTagName) {
		List<QuestionComponent> questionComponents = new ArrayList<QuestionComponent>();
		// This query retrieves all the branched questions from total questionnaire
		String query = "Select qnmap.qstt_question_id as 'Parent Question Id',qnmap.tag_name as 'Tag Name', qnmap.Is_Attachment as 'Is Attachment',qn1.qtext as 'Question Text',qntyp.id as 'Q Type ID',qnopt.option_value as 'Q Option',qnopt.id as 'Answer Option ID' From qstt_question_map qnmap left join qstt_question qn1 on qnmap.qstt_question_id = qn1.id and qn1.is_active = 1 left join qstt_question_category qncat on qn1.question_category_id = qncat.id left join qstt_question_type qntyp on qn1.question_type_id = qntyp.id left join qstt_question_option qnopt on qn1.id = qnopt.qstt_question_id and qnopt.is_active = 1 where qnmap.qstt_questionnaire_def_id = ? and qnmap.is_Branch = 1 and qnmap.validity_end_date is null";
		// This query retrieves all the branched questions based on the source question tag to which that belongs to a particular section
//		String query ="Select qnmap.qstt_question_id as 'Parent Question Id',qnmap.tag_name as 'Tag Name',qnmap.Is_Attachment as 'Is Attachment',qn1.qtext as 'Question Text',qntyp.id as 'Q Type ID',qnopt.option_value as 'Q Option',qnopt.id as 'Answer Option ID', qnmap.section_label From qstt_question_map qnmap left join qstt_question qn1 on qnmap.qstt_question_id = qn1.id and qn1.is_active = 1 left join qstt_question_category qncat on qn1.question_category_id = qncat.id left join qstt_question_type qntyp on qn1.question_type_id = qntyp.id left join qstt_question_option qnopt on qn1.id = qnopt.qstt_question_id and qnopt.is_active = 1 where qnmap.qstt_questionnaire_def_id = 2048 and qnmap.is_Branch = 1  and qnmap.validity_end_date is null and qnmap.section_label = (SELECT section_label FROM colorado.qstt_question_map where qstt_questionnaire_def_id=? and tag_name = ?)";
		SQLQuery sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
		sqlQuery.setParameter(0, questionnaireId);
	//	sqlQuery.setParameter(1,sourceQuestionTagName);
		List<Object[]> l = sqlQuery.list();

		//System.out.println("Size of List is:" + l.size());

		List<QComponent> branchPlainComponentList = new ArrayList<QComponent>();

		Iterator<Object[]> iterator = l.iterator();
		while (iterator.hasNext()) {
			Object o[] = iterator.next();
			//System.out.println("Object Array Size is:" + o.length);
			QComponent branchPlainComponent = new QComponent();
			branchPlainComponent.setQuestionId(o[0]!=null?((java.math.BigInteger) o[0])
					.longValue():0L);
			branchPlainComponent.setQuestionTypeId(o[4]!=null?(java.lang.Short) o[4]:0);
			branchPlainComponent.setQuestionTag(o[1]!=null?(String) o[1]:"");
			branchPlainComponent.setAnswerOptionValue(o[5]!=null?(String) o[5]:"");
			branchPlainComponent.setQuestionText(o[3]!=null?(java.lang.String) o[3]:"");
			branchPlainComponent.setQuestionAttachment(o[2]!=null?(Boolean) o[2]:false);
			branchPlainComponent
					.setAnswerOptionId(o[6]!=null?((java.math.BigInteger) o[6])
							.longValue():0L);// newly added
			branchPlainComponentList.add(branchPlainComponent);
		}

		Map<Long, QuestionComponent> map = new TreeMap<Long, QuestionComponent>();

		QuestionComponent qComponent = null;

		for (QComponent qComp : branchPlainComponentList) {
			if (map.get(qComp.getQuestionId()) == null) {
				qComponent = new QuestionComponent();

				qComponent.setQuestionnaireId(questionnaireId); // newly added

				System.out.println("Question Id:" + qComp.getQuestionId());
				qComponent.setQuestionId(qComp.getQuestionId());
				qComponent.setQuestionTag(qComp.getQuestionTag());
				qComponent.setQuestionAttachment(qComp.getQuestionAttachment());
				qComponent.setQuestionText(qComp.getQuestionText());
				qComponent.setQuestionTypeId(qComp.getQuestionTypeId());
				//System.out.println("Ans Opt Value:"	+ qComp.getAnswerOptionValue());
				//System.out.println("Ans Opt Value List Size is:"+ (qComponent.getAnswerOptionValue()).size());
				(qComponent.getAnswerOptionValue()).add(qComp
						.getAnswerOptionValue());
				(qComponent.getAnswerOptionId()).add(qComp.getAnswerOptionId()); // newly
																					// added
				map.put(qComp.getQuestionId(), qComponent);
			} else {
				qComponent = map.get(qComp.getQuestionId());
				//System.out.println("Ans Opt Value:"+ qComp.getAnswerOptionValue());
				//System.out.println("Question Id:" + qComp.getQuestionId());
				//System.out.println("Ans Opt Value List Size is:"+ (qComponent.getAnswerOptionValue()).size());
				(qComponent.getAnswerOptionValue()).add(qComp
						.getAnswerOptionValue());
				(qComponent.getAnswerOptionId()).add(qComp.getAnswerOptionId());
			}

		}

		//System.out.println("Map Size is:" + map);

		//System.out.println("Map Size is:" + map.size());

		Set<Map.Entry<Long, QuestionComponent>> mEntrySet = map
				.entrySet();

		//System.out.println("MapEntry Set Size is:" + mEntrySet.size());

		Iterator i = mEntrySet.iterator();

		while (i.hasNext()) {
			Map.Entry<Long, QuestionComponent> me = (Map.Entry<Long, QuestionComponent>) i
					.next();
			//System.out.println("Key or QUestion Id Value is:" + me.getKey());
			QuestionComponent qcc = me.getValue();
			questionComponents.add(qcc);
			List<String> ansOptV = qcc.getAnswerOptionValue();
			for (String s : ansOptV) {
				//log.info("First:" + s);
			}
			/* newly added */
			List<Long> ansOptId = qcc.getAnswerOptionId();
			for (Long lo : ansOptId) {
				//log.info("First:" + lo);
			}
			// newly added

		}

	//	System.out.println("QuestionComponents List Size:"+ questionComponents.size());

		return questionComponents;
	}

	//@Override
	public boolean saveBranchedQuestionsData(
			List<QuestionComponent> branchedQuestionComponents,
			Map<String, String[]> parameterValues, List<String> selectedOnes,List<QuestionComponent> retrieveQuestionnaireComponents,RecordPojo recordPojo,boolean fromWhichMethod,String removeBranchingIdsList,String updateBranchingIdsList,Map<String,LinkedList<BranchingValue>> targetQuestionsOrder)
			throws MyException {
		boolean flag = false;
		
		this.retrieveQuestionnaireComponents = retrieveQuestionnaireComponents;
		
		long questionnaireId = branchedQuestionComponents.get(0).getQuestionnaireId();
		
		List<String> toBeRemovedSelectedOnes = new ArrayList<String>();
		
		long destQuestionnaireId = questionnaireId;
		
		Map<String,Short> questionTypeId = recordPojo.getQuestionTypeId();		
		
		String questionText = "";
		
		String strin[] = null;		
		
		strin = (selectedOnes.get(0)).split("[$]",5);
		
		if(!(recordPojo.getSourceQuestionTagNames()).contains(strin[0]))		
		(recordPojo.getSourceQuestionTagNames()).add(strin[0]);
				
		for(QuestionComponent qc:retrieveQuestionnaireComponents){
			if(strin[0].equals(qc.getQuestionTag())){
				if(questionTypeId.get(strin[0]) == null){
					questionTypeId.put(strin[0],qc.getQuestionTypeId());
					questionText = qc.getQuestionText();			
				}else{
					questionText = qc.getQuestionText();
				}
				break;
			}		
		}

	//	System.out.println("In saveBranchedQuestionsData method............");

	//	System.out.println("Size of Map is:" + parameterValues.size());
		
//		System.out.println("SelectedOnes List Size is:" + selectedOnes.size());

//		RecordPojo recordPojo = new RecordPojo();
		
		// MY OUTPUT CODE

	/*	Set<Map.Entry<String, String[]>> mEntry = parameterValues.entrySet();		

		Iterator iter = mEntry.iterator();

		System.out.println("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{");
		System.out.println("In Service Class............................................");
		
		for(String sg:selectedOnes){
			System.out.println("Selected Values:"+sg);
		}

		while (iter.hasNext()) {
			Map.Entry<String, String[]> me = (Map.Entry<String, String[]>) iter.next();
			System.out.println("Parameter Name From Map is:" + me.getKey());

			String paramValues[] = (String[]) me.getValue();

			System.out.println("ParameterValues Array Size is:"
					+ paramValues.length);

			for (String s : paramValues) {
				System.out.println("Parameter Value From Map is:" + s);
			}
		}	*/
		
		int count = 0;

		for (int i = 0;i<selectedOnes.size();i++) {
		//	System.out.println("First Selected ParameterName:" + selectedOnes.get(i));
			String[] stnggarray = null;
//			if(! selectedOnes.get(i).equals("brId"))

			stnggarray = (selectedOnes.get(i)).split("[$]",5);
			if(stnggarray !=null && stnggarray.length>=2){
			if(stnggarray[2].equals("select")){
	//			System.out.println("Select Parameter Name is:"+selectedOnes.get(i));
				String sttt[] = parameterValues.get(selectedOnes.get(i));
	//			System.out.println("Array Size is:"+sttt.length);
				count += (sttt.length-1); // if(sttt.length==2) count++;				
			}			
			}
		}
		
		// MY OUTPUT CODE
		
	/*	System.out.println("Count Collected::::::::::::::"+count);

		System.out
				.println("In Service Class............................................");
		System.out
				.println("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}");

		System.out.println("For Which Option We are Checking is:"
				+ selectedOnes.get(0));
		
		for(int i = 0; i<selectedOnes.size();i++){

		String str[] = selectedOnes.get(i).split("[$]", 5);

		for (String s : str) {
			System.out.println("Token:" + s);
		}
		}				
		int size = 0;
		
		System.out.println("Selected Ones Size is:"+selectedOnes.size()); */
		
		
		String checkedString = "";
/*THIS FOR LOOP IS TO IDENTIFY HOW MANY DESTINATION QUESTION TAG NAMES ARE NOT HAVING ANSWEROPTION VALUES i.e. FOR SINGLE TEXT BOX.*/		
		
		for(int i =0;i<selectedOnes.size();i++){
			
	//		System.out.println("First Selected ParameterName:" + selectedOnes.get(i));
			String stri[] = null;
//			if(! selectedOnes.get(i).equals("brId"))
			stri = (selectedOnes.get(i)).split("[$]",6);
			long brId = 0L;
			if(stri[2].equals("select")){
				
				String val[] = parameterValues.get(selectedOnes.get(i));
				/*String str = "";
				str = Arrays.deepToString(val);
				System.out.println("Nothing :"+str);
				LinkedList<String> newVal = new LinkedList<String>();
				if(!str.contains("Select Target")){
					val = changeValArray(val);
				}
				System.out.println("New Val Array is:"+Arrays.deepToString(val));*/
				boolean flagg = false;
				for(int k = 0;k<val.length;k++){
		//			System.out.println("k value is:"+k);
	//			System.out.println("Destination Tag Name ;;; HELLO hARSHITH"+val[k]);
				for(QuestionComponent qc:retrieveQuestionnaireComponents){
		//			System.out.println("val[k] value is:"+val[k]);
		//			System.out.println("Question Tag We are Comparing:"+qc.getQuestionTag());
					if(val[k].equals(qc.getQuestionTag())){
						String value = (qc.getAnswerOptionValue()).get(0);
						System.out.println("Value:::::::::::::::::"+value);
						if(value.equals("")){
							
							flag = saveData2(branchedQuestionComponents, parameterValues, selectedOnes, questionnaireId, destQuestionnaireId,selectedOnes.get(i),toBeRemovedSelectedOnes,val[k],retrieveQuestionnaireComponents,recordPojo,fromWhichMethod,questionText,updateBranchingIdsList,k,targetQuestionsOrder);
							count--;
							checkedString = selectedOnes.get(i);
							flagg = true;
						}
						else{
	//						System.out.println("val[k] Before Method Call"+val[k]);
							flag = saveData2(branchedQuestionComponents, parameterValues, selectedOnes, questionnaireId, destQuestionnaireId,selectedOnes.get(i),toBeRemovedSelectedOnes,val[k],retrieveQuestionnaireComponents,recordPojo,fromWhichMethod,questionText,updateBranchingIdsList,k,targetQuestionsOrder);
							count--;
							flagg = true;
						}
					}
				}
			  }
				if(!flagg && fromWhichMethod){
					brId = Long.parseLong(stri[5]);
					System.out.println("Branch Id is:"+brId);
					StringBuffer sb = new StringBuffer("");
					if(null!=removeBranchingIdsList){
					sb = new StringBuffer(removeBranchingIdsList).append(","+new Long(brId).toString()+",");
					removeBranchingIdsList = sb.toString();
					}
				}
			}			
		}
		
//		System.out.println("toBeRemovedSelectedOnes Array Size is:"+toBeRemovedSelectedOnes.size());
		
//		for(String s: toBeRemovedSelectedOnes){
//			System.out.println("This is selectedOne to be removed is::::::::::::::::::::::::::::"+s);
//		}
		
	/*	for(String s: toBeRemovedSelectedOnes){
			
			selectedOnes.remove(s);
			
		} */
		
		/*System.out.println("Selected Ones Size:"+selectedOnes.size());
		
		System.out.println("count:"+count);
		
		System.out.println("Checked String is:"+checkedString);
		
		System.out.println("Flag Value is::"+flag);		
		
		int co = 0;
		for(int i = 0;i<selectedOnes.size();i++){
			System.out.println("List Names:"+selectedOnes.get(i));
			String sf[] = (selectedOnes.get(i)).split("[$]",5);
			System.out.println("Array Size is:"+sf.length);
			if(sf[2].equals("select")){
				String[] selecValue = parameterValues.get(selectedOnes.get(i));
				for(int m = 1;m<selecValue.length;m++){
				System.out.println("Internal Array Size is:"+selecValue.length);
				System.out.println("Value is:"+selecValue[m]);
//				System.out.println("Second Value is:"+selecValue[1]);
				if(!(selecValue[0].equals(selecValue[m]))){
					co++;
				}
				}
			}
		}
		
		System.out.println("After For Loop co value is:"+co);
		
		if(co>0)
		
		flag = saveData1(branchedQuestionComponents, parameterValues, selectedOnes,count);*/
		
	//	System.out.println("Flag Value is::"+flag);
		
		// Deleting Records From DataBase based on the removeBranchingIdsList Came From The Controller
		
		String ids[] = removeBranchingIdsList.split(",");
		
		System.out.println("Length of ids String Array is :"+ids.length);
		
		for(int len = 0;len < ids.length && (!ids[len].isEmpty() && Integer.parseInt(ids[len]) != 0); len++){
		
		String query = "delete from qstt_question_branch where qstt_branch_id = ?";
		
		SQLQuery sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
		
		sqlQuery.setParameter(0,ids[len]);
		
		int executed = 0;
		
		executed = sqlQuery.executeUpdate();
		
		System.out.println("Delete Query Executed :"+executed);
		
		}
		
		// Deleting Records From DataBase based on the removeBranchingIdsList Came From The Controller
	
		return flag;
	}

	//@Override
	public RecordPojo branchPreview(long id) {
		RecordPojo recordPojo = new RecordPojo();
		
		//log.info("Id Value Came into branchPreview is:"+id);

		// String query =
		// "Select qnmap.tag_name as 'Q Tag Name',qnopt.option_value as 'Q Option', qnopt.id,qnbr.ans_option_id, qnbr.qstt_questionnaire_def_id, qnbr.question_id,(select qstt_question_branch.tag_name from qstt_question_branch where qstt_question_branch.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_branch.question_id = qnbr.question_id and qstt_question_branch.ans_option_id = qnopt.id) as 'Ans Tag' From qstt_question_branch qnbr left join qstt_question_map qnmap on qnmap.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qnmap.qstt_question_id = qnbr.question_id left join qstt_question qn1 on qnmap.qstt_question_id = qn1.id and qn1.is_active = 1 left join qstt_question qn on qnbr.d_question_id = qn.id and qn.is_active = 1 left join qstt_question_option qnopt on qn1.id = qnopt.qstt_question_id and qnopt.is_active = 1 and qnbr.ans_option_id = qnopt.id where qnmap.qstt_questionnaire_def_id = "+id+" and qnmap.is_Branch = 1";
//		String query = "Select qnmap.tag_name as 'Q Tag Name',qnopt.option_value as 'Q Option', qnopt.id,qnbr.ans_option_id, qnbr.qstt_questionnaire_def_id, qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.d_question_id) as 'Ans Tag' From qstt_question_branch qnbr left join qstt_question_map qnmap on qnmap.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qnmap.qstt_question_id = qnbr.question_id left join qstt_question qn1 on qnmap.qstt_question_id = qn1.id and qn1.is_active = 1 left join qstt_question qn on qnbr.d_question_id = qn.id and qn.is_active = 1 left join qstt_question_option qnopt on qn1.id = qnopt.qstt_question_id and qnopt.is_active = 1 and qnbr.ans_option_id = qnopt.id where qnmap.qstt_questionnaire_def_id = ? and qnmap.is_Branch = 1";
//		String query = "Select distinct qnmap.qstt_question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnmap.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnmap.qstt_question_id) as 'Q Tag Name',qnopt.id, qnopt.option_value as 'Q Option',(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnmap.qstt_questionnaire_def_id  and	qstt_question_map.qstt_question_id=(select d_question_id from qstt_question_branch where question_id = qnmap.qstt_question_id and qstt_questionnaire_def_id = qnmap.qstt_questionnaire_def_id and ans_option_id = qnopt.id ) ) as 'Ans Tag Name' From qstt_question_branch qnbr,qstt_question_map qnmap left join qstt_question_option qnopt on qnmap.qstt_question_id = qnopt.qstt_question_id where qnmap.qstt_questionnaire_def_id = ? and qnmap.is_branch = 1 and qnmap.qstt_question_id = qnbr.question_id";
// THIS IS PREVIOUS QUERY
// THIS QUERY IS NOT HAVING QUESTION TYPE ID
// String query = "Select distinct qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Q Tag Name',qnopt.id, qnopt.option_value as 'Q Option',c.tag_name From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id where qnbr.qstt_questionnaire_def_id = ?";

// THIS QUERY IS HAVING QUESTION TYPE ID

// String query = "Select distinct qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Q Tag Name',qnopt.id as 'Qn Option Id', qnopt.option_value as 'Qn Option',c.tag_name as 'Tag Name', qntype.id as 'Qn Type Id' From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ?";

//THIS QUERY IS HAVING BOTH QUESTION TYPE ID AND SKIP VALUE

//String query = "Select distinct qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Q Tag Name',qnopt.id as 'Qn Option Id', qnopt.option_value as 'Qn Option',c.tag_name as 'Tag Name', qntype.id as 'Qn Type Id', c.is_skip as 'Is Skip',qn.qtext as 'Qn Text' From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, a.is_skip, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id, is_skip from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ?";
		// I CHANGED QUERY LIKE THIS.
		
//		String query = "Select distinct qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) 'Q Tag Name',qnopt.id, qnopt.option_value as 'Q Option',c.tag_name From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id where qnbr.qstt_questionnaire_def_id = ?";
		
//		Reshma,Ajay told to add Skip,Attachment,Mandatory in BranchPreview.JSP
		
		String query = "Select distinct qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Q Tag Name',qnopt.id as 'Qn Option Id',qnopt.option_value as 'Qn Option',c.tag_name as 'Tag Name', qntype.id as 'Qn Type Id',c.is_skip as 'Is Skip',qn.qtext as 'Qn Text',c.is_mandatory as 'Is Mandatory',c.is_attachment From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, a.is_skip,a.is_mandatory,qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name,     qnmap1.is_attachment    from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id, is_skip,is_mandatory from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ?";

		
		SQLQuery sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
		
		sqlQuery.setParameter(0,id);

		List<Object[]> l = sqlQuery.list();		
	//	System.out.println("List Size is:"+l.size());
		Iterator i = l.iterator();
		Map<String,LinkedList<String>> aOV = new LinkedHashMap<String,LinkedList<String>>();
		Map<String,LinkedList<String>> qText = new LinkedHashMap<String,LinkedList<String>>(); //new
		LinkedList<String> value = new LinkedList<String>();
		Set<String> sQTN = new LinkedHashSet<String>();
		Map<String,LinkedList<String>> dQTN = new LinkedHashMap<String,LinkedList<String>>();
		Map<String,Short> questionTypeId = new LinkedHashMap<String,Short>();
		
		LinkedList<String> destTag = new LinkedList<String>();
		
		Map<String,LinkedList<Boolean>> dSkip = new LinkedHashMap<String,LinkedList<Boolean>>(); //new
		LinkedList<Boolean> skip = new LinkedList<Boolean>(); //new
		
//		Reshma,Ajay told to add Skip,Attachment,Mandatory in BranchPreview.JSP
		
		Map<String,LinkedList<Boolean>> dMandatory = new LinkedHashMap<String,LinkedList<Boolean>>(); //new
		LinkedList<Boolean> mandatory = new LinkedList<Boolean>(); //new
		
		Map<String,LinkedList<Boolean>> dAttachment = new LinkedHashMap<String,LinkedList<Boolean>>(); //new
		LinkedList<Boolean> attachment = new LinkedList<Boolean>(); //new
		
		LinkedList<String> questionText = new LinkedList<String>(); // new
		while (i.hasNext()) {
			Object obj[] = (Object[]) i.next();
			System.out.println("Object Array Size is......." + obj.length);
			questionTypeId.put((java.lang.String)obj[1],(java.lang.Short)(obj[5]));
			
			sQTN.add((java.lang.String) obj[1]);
			value.add((java.lang.String)obj[3]);
			questionText.add((java.lang.String)obj[7]!=null?(java.lang.String)obj[7]:""); // new
			if(aOV.get(obj[1])==null){
				aOV.put((java.lang.String)obj[1],value);
			}
			else{
				LinkedList<String> some = aOV.get((java.lang.String)obj[1]);
				some.add(value.get(0));
				aOV.put((java.lang.String)obj[1],some);
			}
			
			destTag.add((java.lang.String)obj[4]!=null?(java.lang.String)obj[4]:"None");
			skip.add((java.lang.Boolean)obj[6]!=null?(java.lang.Boolean)obj[6]:false);//new
			
			mandatory.add((java.lang.Boolean)obj[8]!=null?(java.lang.Boolean)obj[8]:false);//new
			attachment.add((java.lang.Boolean)obj[9]!=null?(java.lang.Boolean)obj[9]:false);//new
			
			if(dQTN.get((java.lang.String)obj[1])==null){
				dQTN.put((java.lang.String)obj[1],destTag);
			}
			else{
				LinkedList<String> emos = dQTN.get((java.lang.String)obj[1]);
				emos.add(destTag.get(0));				
				dQTN.put((java.lang.String)obj[1],emos);				
			}
			if(dSkip.get((java.lang.String)obj[1])==null){ //new
				dSkip.put((java.lang.String)obj[1],skip);
			}
			else{
				LinkedList<Boolean> emos = dSkip.get((java.lang.String)obj[1]);
				emos.add(skip.get(0));				
				dSkip.put((java.lang.String)obj[1],emos);				
			}//new
			
			if(dMandatory.get((java.lang.String)obj[1])==null){ //new
				dMandatory.put((java.lang.String)obj[1],mandatory);
			}
			else{
				LinkedList<Boolean> emos = dMandatory.get((java.lang.String)obj[1]);
				emos.add(mandatory.get(0));				
				dMandatory.put((java.lang.String)obj[1],emos);				
			}//new
			
			if(dAttachment.get((java.lang.String)obj[1])==null){ //new
				dAttachment.put((java.lang.String)obj[1],attachment);
			}
			else{
				LinkedList<Boolean> emos = dAttachment.get((java.lang.String)obj[1]);
				emos.add(attachment.get(0));				
				dAttachment.put((java.lang.String)obj[1],emos);				
			}//new
			
			if(qText.get(obj[1])==null){
				qText.put((java.lang.String)obj[1],questionText);
			}
			else{
				LinkedList<String> some = qText.get((java.lang.String)obj[1]);
				some.add(questionText.get(0));
				qText.put((java.lang.String)obj[1],some);
			}
			
			
			value = new LinkedList<String>();
			destTag = new LinkedList<String>();
			skip = new LinkedList<Boolean>(); //new
			mandatory = new LinkedList<Boolean>(); //new
			attachment = new LinkedList<Boolean>(); //new
			questionText = new LinkedList<String>();
			
		}
		
		//AnswerOptionValues Related Map is aOV,Destination Question TagNames Related Map is dQTN

//		System.out.println("Destination Question TagNames Map Set in Record Pojo is:"+dQTN.size());
//		System.out.println("AnswerOption Value List Size is:"+aOV.size());
//		System.out.println("Source Question TagNames Map Set in Record Pojo is:"+sQTN.size());
//		System.out.println("AnswerOptionIds Map Set in Record Pojo is:"+questionTypeId.size());
//		System.out.println("Question Text is:"+questionText);
		
		Set<Map.Entry<String,Short>> mEntries = questionTypeId.entrySet();

		Iterator itte = mEntries.iterator();

		while (itte.hasNext()) {
			Map.Entry<String, Short> me = (Map.Entry<String,Short>) itte.next();
	//log.info("Key Value is:"+me.getKey()+"Source Question Tag Name");
			Short some =  me.getValue();
	//log.info("Question Type Id is:"+some);
			
		}
		
		// MY OUTPUT CODE

		/*Set<Map.Entry<String, LinkedList<String>>> mEntries = dQTN.entrySet();

		Iterator itte = mEntries.iterator();

		while (itte.hasNext()) {
			Map.Entry<String, LinkedList<String>> me = (Map.Entry<String, LinkedList<String>>) itte.next();
			System.out.println("Key Value is:"+me.getKey()+"Source Question Tag Name");
			LinkedList<String> some =  (LinkedList<String>)me.getValue();
			for(String s:some){
				System.out.println("Destination Question Tag Name is:"+s);
			}
		}


		Iterator it = sQTN.iterator();

		while (it.hasNext()) {
			String me = (java.lang.String) it.next();
			System.out.println("Source Question Tag Name is:" + me);
		}
		
		
		
		Set<Map.Entry<String, LinkedList<String>>> mEntrries = aOV.entrySet();

		Iterator itter = mEntrries.iterator();

		while (itter.hasNext()) {
			Map.Entry<String, LinkedList<String>> me = (Map.Entry<String, LinkedList<String>>) itter.next();
			System.out.println("Key Value is:"+me.getKey()+"Source Question Tag Name");
			LinkedList<String> some =  (LinkedList<String>)me.getValue();
			for(String s:some){
				System.out.println("Answer Option Value is:"+s);
			}
		}*/
		recordPojo.answerOptionValues = aOV;
		recordPojo.destinationQuestionTagNames = dQTN;
		(recordPojo.getSourceQuestionTagNames()).addAll(sQTN);	
		recordPojo.questionTypeId = questionTypeId;
		recordPojo.isSkip = dSkip;
		recordPojo.isMandatory = dMandatory; // new
		recordPojo.isAttachment = dAttachment; // new
		recordPojo.questionText = qText;
		return recordPojo;
	}

	// FOR GETTING TARGET TAG NAMES
	
	public List<String> saveTargetQuestions(Long questionnaireId,String sourceQuestionTagName) {

		List<String> sourceTagnames = new LinkedList();
		List<Object[]> list = new LinkedList<Object[]>();
		
		String query = "";
		
		SQLQuery sqlQuery = null;	
	
		query = "SELECT tag_name,qstt_question_id from qstt_question_map where qstt_questionnaire_def_id = ? AND TAG_NAME IS NOT NULL and (validity_end_date is null or validity_end_date > current_date) and section_label = (select section_label from qstt_question_map where tag_name = ? and qstt_questionnaire_def_id = ?);";
		sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
		sqlQuery.setParameter(0, questionnaireId);
		sqlQuery.setParameter(1, sourceQuestionTagName);
		sqlQuery.setParameter(2, questionnaireId); 
		list = sqlQuery.list();
		//log.info("Size of List is:" + list.size());
		
		for (Object[] obj : list) {
				sourceTagnames.add(obj[0]!=null?obj[0].toString():"");
				map.put((String)obj[0],((java.math.BigInteger)obj[1]).longValue());
		//		System.out.println("Target Tagnames are ******************"	+ sourceTagnames.size());
		//		System.out.println("Target Tagnames are ******************"	+ sourceTagnames);				
			}		
		return sourceTagnames;
	}
	

	public TreeMap<String,Short> saveTargetQuestions(Long questionnaireId,TreeMap<String,Short> tagNamesOrderMap,String sourceQuestionTagName) {

		List<String> sourceTagnames = new ArrayList();
		List<Object[]> list = new LinkedList<Object[]>();
		
		String query = "";
		
		SQLQuery sqlQuery = null;
		
			query = "SELECT tag_name ,qstt_question_id,question_order from qstt_question_map where qstt_questionnaire_def_id = ? AND TAG_NAME IS NOT NULL and (validity_end_date is null or validity_end_date > current_date) and (section_label = (select section_label from qstt_question_map where tag_name = ? and qstt_questionnaire_def_id = ?) ) order by question_order";
			sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
			sqlQuery.setParameter(0, questionnaireId);
			sqlQuery.setParameter(1, sourceQuestionTagName);
			sqlQuery.setParameter(2, questionnaireId);	
			list = sqlQuery.list();
			//log.info("Size of List is:" + list.size());

			for (Object[] obj : list) {

				sourceTagnames.add(obj[0]!=null?obj[0].toString():"");
		//		System.out.println("Target Tagnames are ******************"	+ sourceTagnames.size());
		//		System.out.println("Target Tagnames are ******************"	+ sourceTagnames);
				map.put((String)obj[0],((java.math.BigInteger)obj[1]).longValue());
				tagNamesOrderMap.put((String)obj[0],((java.lang.Short)obj[2]).shortValue());
			}		
		return tagNamesOrderMap;
	}
	
	
	public boolean saveData2(List<QuestionComponent> branchedQuestionComponents,Map<String, String[]> parameterValues, List<String> selectedOnes,long questionnaireId,long destQuestionnaireId,String mainString,List<String> toBeRemovedSelectedOnes,String value,List<QuestionComponent> retrieveQuestionnaireComponents,RecordPojo recordPojo,Boolean fromWhichMethod,String qText,String updateBranchingIdsList,int identifierOfSkipManAtt,Map<String,LinkedList<BranchingValue>> targetQuestionsOrder){
		
		boolean flag = false;		
		String targetTagName = "";
		String sourceTagName = "";
		long answerOptionId = 0L;
		long branchId = 0L;
		byte isSkip = 0;
		byte isMandatory = 0;
		
		//NEW CODE RELATED TO ATTACHMENT
		byte isAttachment = 0;
		//NEW CODE RELATED TO ATTACHMENT
		long selectedDestinationQuestionId = 0L;
		long selectedSourceQuestionId = 0L;
		
		
		// THIS MAIN STRING CAME FROM PREVIOUS METHOD WHICH CONTAINS TARGET VALUE HAVING NO ANSWER OPTIONS I.E FOR SINGLE TEXT BOX.
//		System.out.println("Main String came is:"+mainString);
		String[] mainStringArray = null;
//		if(! mainString.equals("brId"))
		mainStringArray = mainString.split("[$]",6);
		String answerOptionValue = mainStringArray[1];
//		System.out.println("Final Answer Option Value is:"+answerOptionValue);
		
		
		sourceTagName = mainStringArray[0];
		answerOptionId = Long.parseLong(mainStringArray[4]);
		branchId = Long.parseLong(mainStringArray[5]);
		System.out.println("Branch Id of this Record is :"+branchId);
		
		if(answerOptionValue.startsWith("Repeated")){
			for(QuestionComponent qcc:retrieveQuestionnaireComponents){
				if(sourceTagName.equals(qcc.getQuestionTag())){
					for(int i = 0;i<qcc.getAnswerOptionId().size();i++){
						if(qcc.getAnswerOptionId().get(i) == answerOptionId){
							answerOptionValue = qcc.getAnswerOptionValue().get(i);
							System.out.println("Answer Option Value Which is OverWritten with Repeated is :"+answerOptionValue);
						}
					}				
				}
			}
		}
		
//		System.out.println("Final SOurce Tag Name is:"+sourceTagName);
		
//		System.out.println("Final Answer Option Id:"+answerOptionId);
				
				
		
//		System.out.println("AnswerOption Value is:"+answerOptionValue);
		int v = 0;
		try{	
			
			/* THIS IS TO FIND TARGET VALUE OF SINGLE TEXT BOX RELATED*/
			
	
			String str1[] = mainString.split("[$]",5);
			if(str1[2].equals("select")){
				String some[] = parameterValues.get(mainString); 
//				System.out.println("Size of the array is:"+some.length);
				for(int h = 0;h<some.length;h++)
					if(some[h].equals(value)){				
//			System.out.println("Length is:"+str1.length);			
//			System.out.println("str1[2]:"+str1[2]);
			if(str1[2].equals("select") && str1[1].equals(answerOptionValue)){
				
				String string[]=parameterValues.get(mainString);
//				System.out.println("Some1:"+string[0]);
	//			System.out.println("Some2:"+string[1]);
				for(v = 0;v<string.length;v++){
				if((string[v].equals(value))){
				targetTagName = string[v];
				break;
				}
	//			System.out.println("v:"+v);
				}
	//			System.out.println("Some:"+mainString);
			}			
			}//outer if
			}//outer for	
			
			System.out.println("Target TagName is:"+targetTagName);
		
		
	//	System.out.println("Final v Value:"+v);
		
		/* THIS IS TO SAVE SKIP AND MANDATORY AND ATTACHMENT VALUES OF SINGLE TEXT BOX RELATED*/
			
			int order = 0;
			
			LinkedList<BranchingValue> branchingValueList = new LinkedList<BranchingValue>();
			
			branchingValueList = targetQuestionsOrder.get(answerOptionValue);
			
			for(BranchingValue bv:branchingValueList){
				System.out.println("Destination Tag Name in BranchingValue Object is:"+bv.getDestinationTagName()+"TargetTagName is:"+targetTagName);
				if(bv.getDestinationTagName().equals(targetTagName)){
					order = bv.getOrder();
					System.out.println("Order is:"+order);
				}
			}
		
		for(String s:selectedOnes){
	//		System.out.println("Checking String is:"+s);
			String str2[] = null;
//			if(! s.equals("brId"))
			str2 = s.split("[$]",5);
		
		if(str2[2].equals("skip") && str2[1].equals(answerOptionValue)){			
			String stt[] = parameterValues.get(s);
	//		System.out.println("Length is:"+stt.length);
			
	//		for(int j =0;j<stt.length;j++)
	//		System.out.println("stt[j]"+stt[j]);
			
	//		System.out.println("s value is:"+s);
			
	//		System.out.println("stt[v]..........."+stt[v]);
			
			isSkip = ((!stt[order].equals("false"))?(byte)1:(byte)0);
	//		System.out.println("Final IsSkip Value is:"+isSkip);
	//		System.out.println("Some:"+s);
		}
		else if(str2[2].equals("mandatory") && str2[1].equals(answerOptionValue)){
			String stt[] = parameterValues.get(s);
	//		System.out.println("stt length is:"+stt.length);
			
	//		for(int j =0;j<stt.length;j++)
	//			System.out.println("stt[j]"+stt[j]);
			
	//		System.out.println("s value is:"+s);
			isMandatory = ((!stt[order].equals("false"))?(byte)1:(byte)0);
	//		System.out.println("Final IsMandatory Value is:"+isMandatory);
	//		System.out.println("Some:"+s);
		}	
		else if(str2[2].equals("attachment") && str2[1].equals(answerOptionValue)){
			String stt[] = parameterValues.get(s);
	//		System.out.println("stt length is:"+stt.length);
			
	//		for(int j =0;j<stt.length;j++)
	//			System.out.println("stt[j]"+stt[j]);
			
	//		System.out.println("s value is:"+s);
			isAttachment = ((!stt[order].equals("false"))?(byte)1:(byte)0);
	//		System.out.println("Final IsAttachment Value is:"+isAttachment);
	//		System.out.println("Some:"+s);
		}	
		}			
		for(String qcc: saveTargetQuestions(questionnaireId,sourceTagName)){
			if(qcc.equals(targetTagName)||qcc.equals(sourceTagName)){
	//			System.out.println("targetTagName is:"+targetTagName);
							selectedDestinationQuestionId = map.get(targetTagName);
							selectedSourceQuestionId = map.get(sourceTagName);
			break;
				
			}			
		}
		
		int result = 0;
		
		String uBIL[] = updateBranchingIdsList.split(",");
		
		String query = "";
		
		SQLQuery sqlQuery = null;
		
	//	System.out.println("Destination Question Id of Destination Target Name that is related to Single Text Box is:"+selectedDestinationQuestionId);
		
//		System.out.println("Source Question Id of Destination Target Name that is related to Single Text Box is:"+selectedSourceQuestionId);
		
//		System.out.println("Source String We got is:"+sourceTagName);
		
//		System.out.println("Destination String We got is:"+targetTagName);
		
		boolean found = false;
		
		
		for(int i = 0;i < uBIL.length;i++){
			if(!(uBIL[i].toString().isEmpty()) && Long.parseLong(uBIL[i])!=0)
			if(Long.parseLong(uBIL[i]) == branchId){
				found = true;
				break;
			}
		}
		
		if(found){
			query = "update qstt_question_branch set question_id=?,qstt_questionnaire_def_id=?,ans_option_id=?,is_skip=?,is_mandatory=?,d_question_id=?,d_questionnaire_def_id=? where qstt_branch_id=?";
			
			sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
			
			sqlQuery.setParameter(0,selectedSourceQuestionId);
			
			sqlQuery.setParameter(1,questionnaireId);
			
			sqlQuery.setParameter(2,answerOptionId);
			
			sqlQuery.setParameter(3,isSkip);
			
			sqlQuery.setParameter(4, isMandatory);			
			
			sqlQuery.setParameter(5, selectedDestinationQuestionId );			
			
			sqlQuery.setParameter(6, destQuestionnaireId);
			
			sqlQuery.setParameter(7,branchId);
		}
		else{			
			query = "insert into qstt_question_branch(question_id,qstt_questionnaire_def_id,ans_option_id,is_skip,is_mandatory,d_question_id,d_questionnaire_def_id)values(?,?,?,?,?,?,?)";

			sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
			
			sqlQuery.setParameter(0,selectedSourceQuestionId);
			
			sqlQuery.setParameter(1,questionnaireId);
			
			sqlQuery.setParameter(2,answerOptionId);
			
			sqlQuery.setParameter(3,isSkip);
			
			sqlQuery.setParameter(4, isMandatory);			
			
			sqlQuery.setParameter(5, selectedDestinationQuestionId );			
			
			sqlQuery.setParameter(6, destQuestionnaireId);
		}		
		
		//NEW CODE ADDED FOR ATTACHMENT RELATED
		
		SQLQuery sqlQuery1 = qsttQuestionMapDao.getSQLQuery("update qstt_question_map set is_attachment = ? where qstt_question_id = ? and qstt_questionnaire_def_id = ?");
		
		sqlQuery1.setParameter(0,isAttachment);
		
		sqlQuery1.setParameter(1,selectedDestinationQuestionId);
		
		sqlQuery1.setParameter(2,questionnaireId);
		
		//NEW CODE ADDED FOR ATTACHMENT RELATED
		
//		sqlQuery.setParameter(0,selectedSourceQuestionId);
//		
//		sqlQuery.setParameter(1,questionnaireId);
//		
//		sqlQuery.setParameter(2,answerOptionId);
//		
//		sqlQuery.setParameter(3,isSkip);
//		
//		sqlQuery.setParameter(4, isMandatory);			
//		
//		sqlQuery.setParameter(5, selectedDestinationQuestionId );			
//		
//		sqlQuery.setParameter(6, destQuestionnaireId);
		
	Map<String,LinkedList<String>> answerOptionValues = recordPojo.getAnswerOptionValues();
		
		Map<String,LinkedList<Boolean>> skip = recordPojo.getIsSkip();
		
		Map<String,LinkedList<Boolean>> mandatory = recordPojo.getIsMandatory();
		
		Map<String,LinkedList<Boolean>> attachment = recordPojo.getIsAttachment();
		
		Map<String,LinkedList<String>> destinationQuestionTagNames = recordPojo.getDestinationQuestionTagNames();
		
		Map<String,LinkedList<String>> questionText = recordPojo.getQuestionText();
		
		if((questionText.get(sourceTagName)) == null){
			LinkedList<String> qT = new LinkedList();
			qT.add(qText);
			questionText.put(sourceTagName,qT);		
		}else{
			LinkedList<String> qT = questionText.get(sourceTagName);
			qT.add(qText);
			questionText.put(sourceTagName,qT);					
		}
		
		recordPojo.questionText = questionText;
		
		if((answerOptionValues.get(sourceTagName)) == null){
			LinkedList<String> aOV = new LinkedList();
			aOV.add(answerOptionValue);
			answerOptionValues.put(sourceTagName,aOV);		
		}else{
			LinkedList<String> aOV = answerOptionValues.get(sourceTagName);
			aOV.add(answerOptionValue);
			answerOptionValues.put(sourceTagName,aOV);					
		}
		
		recordPojo.answerOptionValues = answerOptionValues;
		
		if((skip.get(sourceTagName)) == null){
			LinkedList<Boolean> sk = new LinkedList<Boolean>();
			sk.add((isSkip==1)?true:false);
			skip.put(sourceTagName,sk);
		}else{
			LinkedList<Boolean> sk = (skip.get(sourceTagName));
			sk.add((isSkip==1)?true:false);
			skip.put(sourceTagName,sk);
		}	
		
		recordPojo.isSkip = skip;
		
		if((mandatory.get(sourceTagName)) == null){
			LinkedList<Boolean> ma = new LinkedList<Boolean>();
			ma.add((isMandatory==1)?true:false);
			mandatory.put(sourceTagName,ma);
		}else{
			LinkedList<Boolean> ma = (mandatory.get(sourceTagName));
			ma.add((isMandatory==1)?true:false);
			mandatory.put(sourceTagName,ma);
		}	
		
		recordPojo.isMandatory = mandatory;
		
		if((attachment.get(sourceTagName)) == null){
			LinkedList<Boolean> at = new LinkedList<Boolean>();
			at.add((isAttachment==1)?true:false);
			attachment.put(sourceTagName,at);
		}else{
			LinkedList<Boolean> at = (attachment.get(sourceTagName));
			at.add((isAttachment==1)?true:false);
			attachment.put(sourceTagName,at);
		}	
		
		recordPojo.isAttachment = attachment;	
		
		if((destinationQuestionTagNames.get(sourceTagName)) == null){
			LinkedList<String> dQTN = new LinkedList<String>();
			dQTN.add(targetTagName);
			destinationQuestionTagNames.put(sourceTagName,dQTN);
		}else{
			LinkedList<String> dQTN = (destinationQuestionTagNames.get(sourceTagName));
			dQTN.add(targetTagName);
			destinationQuestionTagNames.put(sourceTagName,dQTN);
		}	
		
		recordPojo.destinationQuestionTagNames = destinationQuestionTagNames;	
	
		
		//NEW CODE ADDED FOR ATTACHMENT RELATED		
		
		if(selectedSourceQuestionId != selectedDestinationQuestionId){
		
			
			if(fromWhichMethod)
				result = sqlQuery.executeUpdate();
		
//		System.out.println("Insert Record Result is:"+result);
		
		result = 0;
		
		if(fromWhichMethod)
			result = sqlQuery1.executeUpdate();
		
//		System.out.println("Update Record Result is:"+result);		
		
		}
		
		//NEW CODE ADDED FOR ATTACHMENT RELATED
		
			
		
		flag = true;
		return flag;
		}
		catch(Exception e){
			e.printStackTrace();
			e.getMessage();
			return flag;
//			System.out.println("Exception Caught is:"+e);		
		}		
//		return flag;
	}

	//@Override
	public RecordPojo existingBranchRelatedInfo(Long questionnaireId,Long selectedTagQuestionId) {
		
        RecordPojo recordPojo = new RecordPojo();
		
	//	System.out.println("Id Value Came into branchPreview is:"+questionnaireId);
		// This query ResultSet Does Not Have BranchId Which is helpful to delete a record from qstt_question_branch table
//		String query = "Select distinct qnbr.question_id as 'Source Question Id',(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Source Question Tag Name',qnopt.id as 'Qn Opt Id',qnopt.option_value as 'Qn Opt Value',c.tag_name as 'Destination Tag Name',qntype.id as 'Qn TypeId',c.is_skip as 'Is Skip',c.is_attachment as 'Attachment',c.is_mandatory as 'Mandatory' From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id,a.ans_option_id, a.is_skip,a.is_mandatory,qnmap1.qstt_questionnaire_def_id,qnmap1.qstt_question_id, qnmap1.tag_name,qnmap1.is_attachment from qstt_question_map qnmap1,((select qstt_questionnaire_def_id,question_id,d_question_id,ans_option_id,is_skip,is_mandatory from qstt_question_branch)as a)) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ? and qnbr.question_id = ?";
        
        String query = "Select distinct qnbr.question_id as 'Source Question Id',(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Source Question Tag Name',qnopt.id as 'Qn Opt Id',qnopt.option_value as 'Qn Opt Value',c.tag_name as 'Destination Tag Name',qntype.id as 'Qn TypeId',c.is_skip as 'Is Skip',c.is_attachment as 'Attachment',c.is_mandatory as 'Mandatory',c.qstt_branch_id as 'Branch Id' From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.qstt_branch_id,a.question_id,a.d_question_id,a.ans_option_id,a.is_skip,a.is_mandatory,qnmap1.qstt_questionnaire_def_id,qnmap1.qstt_question_id,qnmap1.tag_name,qnmap1.is_attachment from qstt_question_map qnmap1,((select qstt_branch_id,question_id,d_question_id,ans_option_id,is_skip,is_mandatory from qstt_question_branch)as a)) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ? and qnbr.question_id = ? order by qnopt.id,c.qstt_branch_id";
		// I CHANGED QUERY LIKE THIS.
		
//		String query = "Select distinct qnbr.question_id,(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) 'Q Tag Name',qnopt.id, qnopt.option_value as 'Q Option',c.tag_name From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id where qnbr.qstt_questionnaire_def_id = ?";

		
		SQLQuery sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
		
		sqlQuery.setParameter(0,questionnaireId);
		
		sqlQuery.setParameter(1,selectedTagQuestionId);

		List<Object[]> l = sqlQuery.list();		
		if(l.size() > 0){
//		System.out.println("List Size is:"+l.size());
		Iterator i = l.iterator();
		Map<String,LinkedList<String>> aOV = new LinkedHashMap<String,LinkedList<String>>();
		LinkedList<String> value = new LinkedList<String>();
		
		Map<String,LinkedList<Long>> aOI = new LinkedHashMap<String,LinkedList<Long>>();
		LinkedList<Long> id = new LinkedList<Long>();
		
		Set<String> sQTN = new LinkedHashSet<String>();
		Map<String,LinkedList<String>> dQTN = new LinkedHashMap<String,LinkedList<String>>();
		Map<String,Short> questionTypeId = new LinkedHashMap<String,Short>();
		
		LinkedList<String> destTag = new LinkedList<String>();
		
		Map<String,LinkedList<Boolean>> dSkip = new LinkedHashMap<String,LinkedList<Boolean>>(); //new
		LinkedList<Boolean> skip = new LinkedList<Boolean>(); //new
		
		Map<String,LinkedList<Boolean>> dMandatory = new LinkedHashMap<String,LinkedList<Boolean>>(); //new
		LinkedList<Boolean> mandatory = new LinkedList<Boolean>(); //new
		
		Map<String,LinkedList<Boolean>> dAttachment = new LinkedHashMap<String,LinkedList<Boolean>>(); //new
		LinkedList<Boolean> attachment = new LinkedList<Boolean>(); //new
		
		LinkedList<Long> branchIdsList = new LinkedList<Long>();
		
		while (i.hasNext()) {
			Object obj[] = (Object[]) i.next();
	//		System.out.println("Object Array Size is......." + obj.length);
			recordPojo.setQuestionId((obj[0] !=null?((java.math.BigInteger)(obj[0])).longValue():0));
			questionTypeId.put((java.lang.String)obj[1],(java.lang.Short)(obj[5]));
			sQTN.add((java.lang.String) obj[1]);
			value.add((java.lang.String)obj[3]);
			if(aOV.get(obj[1])==null){
				aOV.put((java.lang.String)obj[1],value);
			}
			else{
				LinkedList<String> some = aOV.get((java.lang.String)obj[1]);
				some.add(value.get(0));
				aOV.put((java.lang.String)obj[1],some);
			}
			
			id.add(obj[2] !=null?((java.math.BigInteger)(obj[2])).longValue():0);
			if(aOI.get(obj[1])==null){
				aOI.put((java.lang.String)obj[1],id);
			}
			else{
				LinkedList<Long> some = aOI.get((java.lang.String)obj[1]);
				some.add(id.get(0));
				aOI.put((java.lang.String)obj[1],some);
			}
			
			destTag.add((java.lang.String)obj[4]!=null?(java.lang.String)obj[4]:"None");
			skip.add((java.lang.Boolean)obj[6]!=null?(java.lang.Boolean)obj[6]:false);//new
			mandatory.add((java.lang.Boolean)obj[8]!=null?(java.lang.Boolean)obj[8]:false);//new
			attachment.add((java.lang.Boolean)obj[7]!=null?(java.lang.Boolean)obj[7]:false);//new
			if(dQTN.get((java.lang.String)obj[1])==null){
				dQTN.put((java.lang.String)obj[1],destTag);
			}
			else{
				LinkedList<String> emos = dQTN.get((java.lang.String)obj[1]);
				emos.add(destTag.get(0));				
				dQTN.put((java.lang.String)obj[1],emos);				
			}
			if(dSkip.get((java.lang.String)obj[1])==null){ //new
				dSkip.put((java.lang.String)obj[1],skip);
			}
			else{
				LinkedList<Boolean> emos = dSkip.get((java.lang.String)obj[1]);
				emos.add(skip.get(0));				
				dSkip.put((java.lang.String)obj[1],emos);				
			}//new
			
			if(dMandatory.get((java.lang.String)obj[1])==null){ //new
				dMandatory.put((java.lang.String)obj[1],mandatory);
			}
			else{
				LinkedList<Boolean> emos = dMandatory.get((java.lang.String)obj[1]);
				emos.add(mandatory.get(0));				
				dMandatory.put((java.lang.String)obj[1],emos);				
			}//new
			
			if(dAttachment.get((java.lang.String)obj[1])==null){ //new
				dAttachment.put((java.lang.String)obj[1],attachment);
			}
			else{
				LinkedList<Boolean> emos = dAttachment.get((java.lang.String)obj[1]);
				emos.add(attachment.get(0));				
				dAttachment.put((java.lang.String)obj[1],emos);				
			}//new
			
			branchIdsList.add((obj[9] !=null?((java.math.BigInteger)(obj[9])).longValue():0));
			value = new LinkedList<String>();
			id = new LinkedList<Long>();
			destTag = new LinkedList<String>();
			skip = new LinkedList<Boolean>(); //new
			mandatory = new LinkedList<Boolean>(); //new
			attachment = new LinkedList<Boolean>(); //new
		}
		
		//AnswerOptionValues Related Map is aOV,Destination Question TagNames Related Map is dQTN

//		System.out.println("Destination Question TagNames Map Set in Record Pojo is:"+dQTN.size());
//		System.out.println("AnswerOption Value List Size is:"+aOV.size());
//		System.out.println("Source Question TagNames Map Set in Record Pojo is:"+sQTN.size());
//		System.out.println("AnswerOptionIds Map Set in Record Pojo is:"+questionTypeId.size());
//		System.out.println("AnswerOption Ids List Size is:"+aOI.size());
		
		Set<Map.Entry<String,Short>> mEntries = questionTypeId.entrySet();

		Iterator itte = mEntries.iterator();

		while (itte.hasNext()) {
			Map.Entry<String, Short> me = (Map.Entry<String,Short>) itte.next();
			//log.info("Key Value is:"+me.getKey()+"Source Question Tag Name");
			Short some =  me.getValue();
			//log.info("Question Type Id is:"+some);
			
		}
		
		// MY OUTPUT CODE
		
//		System.out.println("Destination Question Tag Names.......");

		Set<Map.Entry<String, LinkedList<String>>> mEntriesss = dQTN.entrySet();

		Iterator itteee = mEntriesss.iterator();

		while (itteee.hasNext()) {
			Map.Entry<String, LinkedList<String>> me = (Map.Entry<String, LinkedList<String>>) itteee.next();
	//log.info("Key Value is:"+me.getKey()+"Source Question Tag Name");
			LinkedList<String> some =  me.getValue();
	/*		for(String s:some){
				System.out.println("Destination Question Tag Name is:"+s);
			}*/
		}
		
//		System.out.println("Source Question Tag Names.......");

		Iterator it = sQTN.iterator();

		while (it.hasNext()) {
			String me = (java.lang.String) it.next();
	//log.info("Source Question Tag Name is:" + me);
		}
		
	//	System.out.println("Answer Option Values.......");
		
		Set<Map.Entry<String, LinkedList<String>>> mEntrries = aOV.entrySet();

		Iterator itter = mEntrries.iterator();

		while (itter.hasNext()) {
			Map.Entry<String, LinkedList<String>> me = (Map.Entry<String, LinkedList<String>>) itter.next();
//log.info("Key Value is:"+me.getKey()+"Source Question Tag Name");
			LinkedList<String> some =  me.getValue();
			/*for(String s:some){
				System.out.println("Answer Option Value is:"+s);
			}*/
		}
		
//		System.out.println("Answer Option Id Values.......");
		
		Set<Map.Entry<String, LinkedList<Long>>> some = aOI.entrySet();

		Iterator something = some.iterator();

		while (something.hasNext()) {
			Map.Entry<String, LinkedList<Long>> me = (Map.Entry<String, LinkedList<Long>>) something.next();
	//log.info("Key Value is:"+me.getKey()+"Source Question Tag Name");
			LinkedList<Long> somee =  me.getValue();
			/*for(Long s:somee){
				System.out.println("Answer Option Value is:"+s);
			}*/
		}
		
//		System.out.println("Question Type Id.......");
		
		Set<Map.Entry<String,Short>> mee = questionTypeId.entrySet();
		
		Iterator rotareti = mee.iterator();
		
		while(rotareti.hasNext()){
			Map.Entry<String,Short> m = (Map.Entry<String,Short>)rotareti.next();
	//log.info("Question Tag Name is:"+m.getKey()+"Its Question Type Id is:"+m.getValue());
		}
		
//		System.out.println("Skip Related Values of that Question.......");
		
		Set<Map.Entry<String,LinkedList<Boolean>>> eem = dSkip.entrySet();
		
		Iterator roo = eem.iterator();
		
		while(roo.hasNext()){
			Map.Entry<String,LinkedList<Boolean>> m = (Map.Entry<String,LinkedList<Boolean>>)roo.next();
	//log.info("Question Tag Name is:"+m.getKey());
			LinkedList<Boolean> skk = m.getValue();
			/*for(Boolean bool:skk){
				System.out.println("Its Values are:"+bool);
			}*/
		}
		
//		System.out.println("Mandatory Related Values of that Question.......");
		
		Set<Map.Entry<String,LinkedList<Boolean>>> eeem = dMandatory.entrySet();
		
		Iterator rooo = eeem.iterator();
		
		while(rooo.hasNext()){
			Map.Entry<String,LinkedList<Boolean>> m = (Map.Entry<String,LinkedList<Boolean>>)rooo.next();
//log.info("Question Tag Name is:"+m.getKey());
			LinkedList<Boolean> skk = m.getValue();
			/*for(Boolean bool:skk){
				System.out.println("Its Values are:"+bool);
			}*/
		}
		
//		System.out.println("Attachment Related Values of that Question.......");
		
		Set<Map.Entry<String,LinkedList<Boolean>>> eeeem = dAttachment.entrySet();
		
		Iterator roooo = eeeem.iterator();
		
		while(roooo.hasNext()){
			Map.Entry<String,LinkedList<Boolean>> m = (Map.Entry<String,LinkedList<Boolean>>)roooo.next();
//log.info("Question Tag Name is:"+m.getKey());
			LinkedList<Boolean> skk = m.getValue();
			/*for(Boolean bool:skk){
				System.out.println("Its Values are:"+bool);
			}*/
		}
		
		
		
		
		recordPojo.answerOptionValues = aOV;
		recordPojo.answerOptionIds = aOI;
		recordPojo.destinationQuestionTagNames = dQTN;
		(recordPojo.getSourceQuestionTagNames()).addAll(sQTN);	
		recordPojo.questionTypeId = questionTypeId;
		recordPojo.isSkip = dSkip;	
		recordPojo.isMandatory = dMandatory;
		recordPojo.isAttachment = dAttachment;	
		recordPojo.branchIds = branchIdsList;
		return recordPojo;
		}
		else 
			return null;
	}

	//@Override
	public boolean delSection(String sectionLabel,Long questionnaireId) {
		boolean flag = false;
		try{
		String query = "update qstt_question_map set validity_end_date = sysdate() where qstt_questionnaire_def_id = ? and section_label=?";
		SQLQuery sqlQuery = qsttQuestionMapDao.getSQLQuery(query);
		sqlQuery.setParameter(0,questionnaireId);
		sqlQuery.setParameter(1,sectionLabel);
		int count = sqlQuery.executeUpdate();
		if(count > 0){
			flag = true;
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return flag;
	}

	//@Override
	public List<String> reArrangeSelectedOnes(
			List<QuestionComponent> branchedQuestionComponents,
			List<String> selectedOnes) {
		// TODO Auto-generated method stub
		List<String> newSelectedOnes = new LinkedList<String>();
		String strin[] = null;
		
		String questionTag = "";
		
		strin = (selectedOnes.get(0)).split("[$]",5);
		
		questionTag = strin[0];
		
		for(QuestionComponent qcc:branchedQuestionComponents){
			if(questionTag.equals(qcc.getQuestionTag())){
				for(int j = 0;j<qcc.getAnswerOptionId().size();j++){
					for(int k=0;k<selectedOnes.size();k++){
						strin = (selectedOnes.get(k)).split("[$]",6);
					if(new Long(strin[4]).longValue() == qcc.getAnswerOptionId().get(j) && strin[2].equals("select")){
						newSelectedOnes.add(selectedOnes.get(k));
					}
					}
				}
				break;
			}
		}
		
		for(int k=0;k<selectedOnes.size();k++){
			strin = (selectedOnes.get(k)).split("[$]",6);
		if(strin[2].equals("attachment") || strin[2].equals("skip") || strin[2].equals("mandatory")){
			newSelectedOnes.add(selectedOnes.get(k));
		}
		}		
		return newSelectedOnes;
	}
	
	String[] changeValArray(String val[]){
		LinkedList<String> newVal = new LinkedList<String>();
		
		for(int i = 0;i < val.length ; i++){
			newVal.add(i,val[i]);
		}
		
		System.out.println("NewVal Before Adding Into First Position :"+newVal+"Size is:"+newVal.size());
		
		newVal.add(0,"Select Target");
		
		System.out.println("NewVal After Adding Into First Position :"+newVal+"Size is:"+newVal.size());
		
		val = (String[]) newVal.toArray(new String[newVal.size()]);
		
//		val = (String[])newVal.toArray();
		
		System.out.println("Val Array After Adding Into First Position:"+Arrays.deepToString(val)+"Val Array Size is:"+val.length);

		return val;
	}

	//@Override
	public Map<String, LinkedList<BranchingValue>> getTargetQuestionsOrder(
			String targetQuestions,
			List<QuestionComponent> retrieveQuestionnaireComponents,
			List<String> selectedOnes) {
		 TreeMap<String,LinkedList<BranchingValue>> targetQuestionsOrder = new TreeMap<String,LinkedList<BranchingValue>>();
		  
		  String array[] = targetQuestions.split("[,]");
		  
		  String sourceTag = "";
		  
		  String selectedArray[] = selectedOnes.get(0).split("[$]"); 
		  
		  sourceTag = selectedArray[0];
		  
		  System.out.println("Source Tag is:"+sourceTag);
		  
		  for(QuestionComponent qcc:retrieveQuestionnaireComponents){
			  if(qcc.getQuestionTag().equals(sourceTag)){
			  List<String> answerOptionValuesList = qcc.getAnswerOptionValue();
//			  for(int i = 0;i < array.length;i++){
			  int i = 0;
			  int l = 1;
			  for(int k = 0;k < answerOptionValuesList.size() && i < array.length;k++){				 
				  LinkedList branchingValueList = new LinkedList<BranchingValue>();
				  
				  int s = 1;
				  String nextAnswerOptionValue = "";
				  if(k == answerOptionValuesList.size()-1)
					  nextAnswerOptionValue = answerOptionValuesList.get(answerOptionValuesList.size()-1);
				  else			  
					  nextAnswerOptionValue = answerOptionValuesList.get((k+1));
				  while( !(((array[l]).trim()).contentEquals(nextAnswerOptionValue))){
					  BranchingValue branchingValue = new BranchingValue();
				  branchingValue.setDestinationTagName(array[l]);
				  branchingValue.setOrder(s++);
				  branchingValueList.add(branchingValue);
				  l++;
				  if(l == array.length)
					  break;
				  }
				  targetQuestionsOrder.put(array[i].trim(),branchingValueList);
				  i=l;
				  l = l+1;
			  }
//			  }
			  }
		  }
		  
		  return targetQuestionsOrder;		
	}

	
}
