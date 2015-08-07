package com.moe.sls.serviceimpl;


import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.moe.sls.dao.QsttQuestionBranchDao;
import com.moe.sls.service.ResponseBranchingKey;
import com.moe.sls.service.ResponseBranchingPojo;
import com.moe.sls.service.ResponseBranchingService;
import com.moe.sls.service.ResponseBranchingValue;

@Service
public class ResponseBranchingServiceImpl implements ResponseBranchingService{
	
	@Autowired
	QsttQuestionBranchDao qsttQuestionBranchDao;
	
//	@Autowired
//	ResponseBranchingKey responseBranchingKey;
//	
//	@Autowired
//	ResponseBranchingValue responseBranchingValue;

	//@Override
	public ResponseBranchingPojo getResponseBranchingMap(Long questionnaireId) {
		ResponseBranchingPojo responseBranchingPojo = new ResponseBranchingPojo();
		
//		This Query is having only Skip Value to Branch.
//		String query = "Select distinct qnbr.question_id as 'SOURCE QUESTION ID',c.d_question_id as 'DESTINATION QUESTION ID',(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Q Tag Name',qnopt.id as 'Qn Option Id', qnopt.option_value as 'Qn Option',c.tag_name as 'Tag Name', qntype.id as 'Qn Type Id', c.is_skip as 'Is Skip' From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, a.is_skip, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id, is_skip from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ?";
		
//		This Query is having only Skip Value & Mandatory Value to Branch.
		
		String query = "Select distinct qnbr.question_id as 'SOURCE QUESTION ID',c.d_question_id as 'DESTINATION QUESTION ID',(select qstt_question_map.tag_name from qstt_question_map where qstt_question_map.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qnbr.question_id) as 'Q Tag Name',qnopt.id as 'Qn Option Id', qnopt.option_value as 'Qn Option',c.tag_name as 'Tag Name', qntype.id as 'Qn Type Id', c.is_skip as 'Is Skip',c.is_mandatory as 'Is Mandatory' From qstt_question_branch qnbr left join qstt_question_option qnopt on qnbr.question_id = qnopt.qstt_question_id left join  ( select a.question_id, a.d_question_id, a.ans_option_id, a.is_skip,a.is_mandatory,qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1,((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id, is_skip,is_mandatory from qstt_question_branch ) as a) ) as c on c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id  and c.qstt_question_id = c.d_question_id and c.ans_option_id = qnopt.id and c.question_id = qnbr.question_id and c.qstt_questionnaire_def_id = qnbr.qstt_questionnaire_def_id left join qstt_question qn on qnbr.question_id = qn.id left join qstt_question_type qntype on qn.question_type_id = qntype.id where qnbr.qstt_questionnaire_def_id = ?";
		
		SQLQuery sqlQuery = qsttQuestionBranchDao.getSQLQuery(query);
		
	//	System.out.println("qsttQuestionBranchDao hash code is:"+qsttQuestionBranchDao.hashCode());
		
		sqlQuery.setParameter(0,questionnaireId);

		List<Object[]> l = sqlQuery.list();		
//		System.out.println("List Size is:"+l.size());
		Iterator iterator = l.iterator();
		
		ResponseBranchingKey responseBranchingKey = new ResponseBranchingKey();
		
		ResponseBranchingValue responseBranchingValue = new ResponseBranchingValue();
		
//		TreeMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>> responseBranchingMap = (responseBranchingPojo.getResponseBranchingMap());
		
		LinkedHashMap<ResponseBranchingKey,String> responseBranchingMap = (responseBranchingPojo.getResponseBranchingMap());
		
//		HashMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>> responseBranchingMap = (responseBranchingPojo.getResponseBranchingMap());
		
//		HashMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>> responseBranchingMap = new HashMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>>();
		
		try{
		
		String reBV = new String();
		
		while(iterator.hasNext()){
			Object obj[] = (Object[]) iterator.next();
			
//			System.out.println("Object Array Size is......." + obj.length);
			
//			System.out.println("ResponseBranchingMap Object HashCode:"+responseBranchingMap.hashCode());
			
			responseBranchingKey = new ResponseBranchingKey();
			responseBranchingValue = new ResponseBranchingValue();
//			System.out.println("Object is:"+responseBranchingKey);
//			System.out.println("ResponseBranchKey Object HashCode Value:"+responseBranchingKey.hashCode());
//			responseBranchingValue = new ResponseBranchingValue();
//			System.out.println("Object is:"+responseBranchingValue);
//			System.out.println("ResponseBranchValue Object HashCode Value:"+responseBranchingValue.hashCode());
			responseBranchingKey.setSourceQuestionId(obj[0] !=null?((java.math.BigInteger)(obj[0])).longValue():0);
			responseBranchingKey.setAnswerOptionId(obj[3] !=null?((java.math.BigInteger)obj[3]).longValue():0);
			responseBranchingValue.setSkipValue((java.lang.Boolean)obj[7]!=null?(java.lang.Boolean)obj[7]:false);
			responseBranchingValue.setMandatoryValue((java.lang.Boolean)obj[8]!=null?(java.lang.Boolean)obj[8]:false);
			responseBranchingValue.setDestinationQuestionId(obj[1] !=null?((java.math.BigInteger)(obj[1])).longValue():0);
			// If Mandatory is required use this condition
			if(!reBV.contains(responseBranchingValue.skipValue+" "+responseBranchingValue.mandatoryValue+" "+responseBranchingValue.getDestinationQuestionId())){ // THIS IS TO AVOID DUPLICATE SKIP,DESTINATION TARGET QUESTION COMBINATION
//			if(!reBV.contains(responseBranchingValue.skipValue+" "+responseBranchingValue.getDestinationQuestionId())){ // THIS IS TO AVOID DUPLICATE SKIP,DESTINATION TARGET QUESTION COMBINATION
				if(!(responseBranchingValue.getDestinationQuestionId()==0)) // THIS IS TO AVOID BRANCHING KEY VALUES OF 3 & 4 TH TYPE QUESTIONS WHY BECAUSE ONE ANSWER OPTION ID IS NOT TARGETED TO ANY QUESTION
			// If Mandatory is required use this statement		
			reBV = (responseBranchingValue.skipValue+" "+responseBranchingValue.mandatoryValue+" "+responseBranchingValue.getDestinationQuestionId());
	//				reBV = (responseBranchingValue.skipValue+" "+responseBranchingValue.getDestinationQuestionId());
			}
//			System.out.println("SourceQuestionId: "+responseBranchingKey.getSourceQuestionId()+"AnswerOptionId: "+responseBranchingKey.getAnswerOptionId()+"Skip Value: "+responseBranchingValue.getSkipValue()+"DestinationQuestionId :"+responseBranchingValue.getDestinationQuestionId());
			
//			System.out.println("Value : "+((responseBranchingMap.get(responseBranchingKey))==null?"Map Does Not Contains This Key":"Map Contains This Key"));
			
			if((responseBranchingMap.get(responseBranchingKey)) == null){
			 if(!((responseBranchingValue.getDestinationQuestionId().toString()).equals("0")))	// THIS IS TO AVOID BRANCHING KEY VALUES OF 3 & 4 TH TYPE QUESTIONS WHY BECAUSE ONE ANSWER OPTION ID IS NOT TARGETED TO ANY QUESTION
			responseBranchingMap.put(responseBranchingKey, reBV);
			}
			else{
				String some = responseBranchingMap.get(responseBranchingKey);
				some = some+" "+reBV;
//				System.out.println("SourceQuestionId: "+responseBranchingKey.getSourceQuestionId()+"AnswerOptionId: "+responseBranchingKey.getAnswerOptionId()+"Skip Value: "+responseBranchingValue.getSkipValue()+"DestinationQuestionId :"+responseBranchingValue.getDestinationQuestionId());
				responseBranchingMap.put(responseBranchingKey, some);
			}
			//reBV = new String();
//			responseBranchingKey.setSourceQuestionId(null);
//			responseBranchingKey.setAnswerOptionId(null);			
//			responseBranchingKey = new ResponseBranchingKey();
//			responseBranchingValue = new ResponseBranchingValue();
		}
		
//		System.out.println("Size of Local ResponseBranchingMap is:"+ responseBranchingMap.size());
		
//		System.out.println("Before Size of Global ResponseBranchingMap is:"+(responseBranchingPojo.getResponseBranchingMap()).size());
		
		responseBranchingPojo.setResponseBranchingMap(responseBranchingMap);
		
//		System.out.println("After Size of Global ResponseBranchingMap is:"+(responseBranchingPojo.getResponseBranchingMap()).size());
		
//		responseBranchingKey = new ResponseBranchingKey();
	
//		responseBranchingValue = new ResponseBranchingValue();
		
		reBV = new String();
		
		LinkedList<Long> next = new LinkedList<Long>();
		
//		Set<Map.Entry<ResponseBranchingKey,LinkedList<ResponseBranchingValue>>> mEntries = responseBranchingMap.entrySet();
		
		Set<Map.Entry<ResponseBranchingKey,String>> mEntries = (responseBranchingPojo.getResponseBranchingMap()).entrySet();
		
		Iterator itt = mEntries.iterator();
		
		int i = 0;
		
		// OUTPUT CODE OF MAP RELATED ENTRIES
		
		while(itt.hasNext()){
			Map.Entry<ResponseBranchingKey,String> entry = (Map.Entry<ResponseBranchingKey,String>)itt.next();
			
			responseBranchingKey = entry.getKey();
			
//			System.out.println("Source Question Id: "+ responseBranchingKey.getSourceQuestionId() +"Answer Option Id: "+ responseBranchingKey.getAnswerOptionId());
			
			reBV = entry.getValue();
			
		//	System.out.println("Size of Linked List is:"+reBV.size());
			
		/*	for(ResponseBranchingValue resBV : reBV){				
				System.out.println("Entry "+i+" Skip Value: "+ resBV.getSkipValue() +"Destination Question Id: " + resBV.getDestinationQuestionId());
//				next = resBV.getNextQuestionId();
//				next = responseBranchingKey.getNextQuestionIds();
				if(next.size() > 0){
					System.out.println("HARSHITH");
				}
				else{
					System.out.println("SUREKHA");
				}
	    	if(resBV.getSkipValue()){
				if(next.size() > 0){
				for(Long ll:next){
					System.out.println("Values in nextQuestionIds :"+ll);
				}
				}
				next.add(resBV.getDestinationQuestionId());
//				resBV.setNextQuestionId(next);
//				responseBranchingKey.setNextQuestionIds(next);
				if(next.size() > 0){
				for(Long ll:next){
					System.out.println("Values in nextQuestionIds :"+ll);
				}
				}
			}
			else{
				if(next.size() > 0){
				for(Long ll:next){
					System.out.println("Values in nextQuestionIds :"+ll);
				}
				}
				next = Utility.findBetweenNumbers(responseBranchingKey, resBV);
//				resBV.setNextQuestionId(next);
//				responseBranchingKey.setNextQuestionIds(next);
				if(next.size() > 0){
				for(Long ll:next){
					System.out.println("Values in nextQuestionIds :"+ll);
				}
				}
			}
				i++;
			}	*/		
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		// OUTPUT CODE OF MAP RELATED ENTRIES
		
		return responseBranchingPojo;
	}

}
