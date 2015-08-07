package com.moe.sls.serviceimpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import com.moe.sls.dao.QsttQuestionnaireDefDao;
import com.moe.sls.model.QComponent;
import com.moe.sls.model.QuestionComponent;
import com.moe.sls.service.RetrieveQuestionnaireService;
import com.moe.sls.util.Utility;

@Service
public class RetrieveQuestionnaireServiceImpl implements RetrieveQuestionnaireService {
	
	//String query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment,'qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type', 'NB' as 'Type' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order";
	String query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment,'qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type', 'NB' as 'Type',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.question_id=qstt_question.id) as 'Branched',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.d_question_id=qstt_question.id) as 'TargetBranched' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order";
	
	@Autowired
	QsttQuestionnaireDefDao qsttQuestionnaireDefDao;

	//@Override
	public List<QuestionComponent> retrieveQuestionnaire(Long questionnaireId) {

		
		//String query="select qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_branch.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment from qstt_questionnaire,qstt_questionnaire_def,qstt_question_map,qstt_question,qstt_question_type,qstt_question_option,qstt_question_category,qstt_question_option_score,qstt_question_branch where qstt_questionnaire.id = 1 and qstt_questionnaire.status = 'submitted' and qstt_questionnaire.id = qstt_questionnaire_def.id And qstt_questionnaire_def.status = 'in progress' and qstt_questionnaire.id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question.id and qstt_question.question_type_id = qstt_question_type.id and qstt_question.question_category_id = qstt_question_category.id and qstt_question.id = qstt_question_option.qstt_question_id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";
//		String query ="select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_branch.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment from qstt_questionnaire,qstt_questionnaire_def,qstt_question_map,qstt_question,qstt_question_type,qstt_question_option,qstt_question_category,qstt_question_option_score,qstt_question_branch where qstt_questionnaire_def.id = 63 and  qstt_questionnaire_def.status = 'in progress' and qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question.id and qstt_question.question_type_id = qstt_question_type.id and qstt_question.question_category_id = qstt_question_category.id and qstt_question.id = qstt_question_option.qstt_question_id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";
//		String query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";
		
//		String query = "";
		
		
		SQLQuery sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(query);
		sqlQuery.setParameter(0,questionnaireId);
 		List<Object[]> qComponentList=sqlQuery.list();
		
		int qComponentsSize=qComponentList.size();
		String temp = "";
		
		List<QComponent> qComponentsList=new ArrayList<QComponent>();
		QComponent qComp=new QComponent();
//		TreeMap<String,QuestionComponent> sectionMap = new TreeMap<String,QuestionComponent>();
		int k=0;
		for(int i=0;i<qComponentsSize;i++){
			Object qc[]=qComponentList.get(k++);
			for(int j=0;j<qc.length;j++){	
				
				qComp.setSectionLabel(qc[0]!=null ?(java.lang.String)qc[0]:"");
				qComp.setQuestionnaireId(qc[1] !=null?((java.math.BigInteger)(qc[1])).longValue():0);
				qComp.setQuestionnaireName(qc[2]!=null?(java.lang.String)qc[2]:"");
				qComp.setQuestionCategoryId(qc[3]!=null?(java.lang.Integer)qc[3]:0);
				qComp.setQuestionText(qc[4]!=null?(java.lang.String)qc[4]:"");
				qComp.setQuestionDescription(qc[5]!=null?(java.lang.String)qc[5]:"");
				qComp.setQuestionTypeId(qc[6]!=null?(java.lang.Short)qc[6]:0);
				qComp.setSectionOrder(qc[7]!=null?(java.lang.Short)qc[7]:0);
				qComp.setQuestionOrder(qc[8]!=null?(java.lang.Short)qc[8]:0);
				qComp.setOptionOrder(qc[9]!=null?(java.lang.Short)qc[9]:0);
				
				qComp.setAnswerOptionId(qc[10] !=null?((java.math.BigInteger)qc[10]).longValue():0);
				qComp.setAnswerOptionValue(qc[11] !=null?(java.lang.String)qc[11]:"");
				qComp.setAnswerOptionScore(qc[12] !=null?(java.lang.Short)qc[12]:0);
				
					qComp.setQuestionId(qc[13]!=null?((java.math.BigInteger)qc[13]).longValue():0);
				
				temp = qc[14]!=null?qc[14].toString():"";
				if(temp.equalsIgnoreCase("true") || temp.equalsIgnoreCase("1"))
					qComp.setQuestionMandatory(true);
				else
					qComp.setQuestionMandatory(false);
				//qComp.setQuestionMandatory(qc[14]!=null?(java.lang.Boolean)qc[14]:false);
				//qComp.setQuestionMandatory(false);
				qComp.setQuestionTag(qc[15]!=null?(java.lang.String)qc[15]:"");
				temp = qc[16]!=null?qc[16].toString():"";
				if(temp.equalsIgnoreCase("true") || temp.equalsIgnoreCase("1"))
					qComp.setQuestionBanked(true);
				else
					qComp.setQuestionBanked(false);
//				qComp.setQuestionBanked(qc[16]!=null?(java.lang.Boolean)qc[16]:false);
				//qComp.setQuestionBanked(false);
				qComp.setQuestionCategory(qc[17]!=null?(java.lang.String)qc[17]:"");
				qComp.setQuestionType(qc[18]!=null?(java.lang.String)qc[18]:"");	
//				qComp.setQuestionAttachment(qc[19]!=null?(java.lang.Boolean)qc[19]:false);
				temp = qc[19]!=null?qc[19].toString():"";
				if(temp.equalsIgnoreCase("true") || temp.equalsIgnoreCase("1"))
					qComp.setQuestionAttachment(true);
				else
					qComp.setQuestionAttachment(false);

				//qComp.setQuestionAttachment(false);
				qComp.setSource(qc[20]!=null?(java.lang.String)qc[20]:""); // newly added
				qComp.setDescription(qc[21]!=null?(java.lang.String)qc[21]:""); // newly added for questionnaire description
				qComp.setDeftype(qc[22]!=null?((java.lang.Character)qc[22]).toString():"");
				qComp.setBranched(qc[24]!=null && (((java.math.BigInteger)qc[24]).longValue() > 0)?true:false);
				qComp.setMovement(qc[25]!=null && (((java.math.BigInteger)qc[24]).longValue() > 0 || ((java.math.BigInteger)qc[25]).longValue() > 0)?true:false);
				
			}
			qComponentsList.add(qComp);
			qComp=new QComponent();		
			
		}
		
		for(int i=0;i<qComponentsSize;i++){

			
		}
	
		
		QuestionComponent qComponent=null;
		LinkedList<QuestionComponent> questionComponentLinkedList = new LinkedList<QuestionComponent>();
		LinkedHashMap<String,QuestionComponent> map=new LinkedHashMap<String,QuestionComponent>();
		LinkedHashMap<String,LinkedList<QuestionComponent>> sectionMap = new LinkedHashMap<String,LinkedList<QuestionComponent>>();
		//log.info("qComponentsSize::"+qComponentsSize);
		for(int i=0;i<qComponentsSize;i++){
			long some=(qComponentsList.get(i)).getQuestionId();
			//log.info("some:::"+some);
			if(map.get((qComponentsList.get(i)).getQuestionId()+(qComponentsList.get(i)).getSource())==null){
				qComponent=new QuestionComponent();
				qComponent.setQuestionnaireId((qComponentsList.get(i)).getQuestionnaireId());
				qComponent.setQuestionnaireName((qComponentsList.get(i)).getQuestionnaireName());
				qComponent.setQuestionId((qComponentsList.get(i)).getQuestionId());
				qComponent.setQuestionText((qComponentsList.get(i)).getQuestionText());
				(qComponent.getAnswerOptionId()).add((qComponentsList.get(i)).getAnswerOptionId());
				(qComponent.getAnswerOptionValue()).add((qComponentsList.get(i)).getAnswerOptionValue());
				(qComponent.getAnswerOptionScore()).add((qComponentsList.get(i)).getAnswerOptionScore());
				qComponent.setQuestionMandatory((qComponentsList.get(i)).getQuestionMandatory());
				qComponent.setQuestionTag((qComponentsList.get(i)).getQuestionTag());
				qComponent.setQuestionBanked((qComponentsList.get(i)).getQuestionBanked());
				qComponent.setQuestionCategory((qComponentsList.get(i)).getQuestionCategory());
				qComponent.setQuestionType((qComponentsList.get(i)).getQuestionType());
				qComponent.setQuestionOrder((qComponentsList.get(i)).getQuestionOrder());
				qComponent.setSectionLabel((qComponentsList.get(i)).getSectionLabel());
				qComponent.setSectionOrder((qComponentsList.get(i)).getSectionOrder());
				qComponent.setQuestionCategoryId((qComponentsList.get(i)).getQuestionCategoryId());
				qComponent.setQuestionDescription((qComponentsList.get(i)).getQuestionDescription());
				qComponent.setQuestionTypeId((qComponentsList.get(i)).getQuestionTypeId());
				qComponent.setOptionOrder((qComponentsList.get(i)).getOptionOrder());
				qComponent.setQuestionAttachment((qComponentsList.get(i)).getQuestionAttachment());
				qComponent.setSource((qComponentsList.get(i)).getSource()); // newly added
				qComponent.setDescription((qComponentsList.get(i)).getDescription());  // newly added for questionnaire description
				qComponent.setDeftype((qComponentsList.get(i)).getDeftype());
				qComponent.setBranched((qComponentsList.get(i)).isBranched());
				qComponent.setMovement((qComponentsList.get(i)).isMovement());
				map.put((qComponentsList.get(i)).getQuestionId()+(qComponentsList.get(i)).getSource(),qComponent);
			}
			else{
				qComponent=map.get((qComponentsList.get(i)).getQuestionId()+(qComponentsList.get(i)).getSource());
				qComponent.setQuestionnaireId((qComponentsList.get(i)).getQuestionnaireId());
				qComponent.setQuestionnaireName((qComponentsList.get(i)).getQuestionnaireName());
				qComponent.setQuestionId((qComponentsList.get(i)).getQuestionId());
				qComponent.setQuestionText((qComponentsList.get(i)).getQuestionText());
				(qComponent.getAnswerOptionId()).add((qComponentsList.get(i)).getAnswerOptionId());
				(qComponent.getAnswerOptionValue()).add((qComponentsList.get(i)).getAnswerOptionValue());
				(qComponent.getAnswerOptionScore()).add((qComponentsList.get(i)).getAnswerOptionScore());
				qComponent.setQuestionMandatory((qComponentsList.get(i)).getQuestionMandatory());
				qComponent.setQuestionTag((qComponentsList.get(i)).getQuestionTag());
				qComponent.setQuestionBanked((qComponentsList.get(i)).getQuestionBanked());
				qComponent.setQuestionCategory((qComponentsList.get(i)).getQuestionCategory());
				qComponent.setQuestionType((qComponentsList.get(i)).getQuestionType());
				qComponent.setQuestionOrder((qComponentsList.get(i)).getQuestionOrder());
				qComponent.setSectionLabel((qComponentsList.get(i)).getSectionLabel());
				qComponent.setSectionOrder((qComponentsList.get(i)).getSectionOrder());
				qComponent.setQuestionCategoryId((qComponentsList.get(i)).getQuestionCategoryId());
				qComponent.setQuestionDescription((qComponentsList.get(i)).getQuestionDescription());
				qComponent.setQuestionTypeId((qComponentsList.get(i)).getQuestionTypeId());
				qComponent.setOptionOrder((qComponentsList.get(i)).getOptionOrder());
				qComponent.setQuestionAttachment((qComponentsList.get(i)).getQuestionAttachment());
				qComponent.setSource((qComponentsList.get(i)).getSource()); // newly added
				qComponent.setDescription((qComponentsList.get(i)).getDescription());  // newly added for questionnaire description
				qComponent.setDeftype((qComponentsList.get(i)).getDeftype());
				qComponent.setBranched((qComponentsList.get(i)).isBranched());
				qComponent.setMovement((qComponentsList.get(i)).isMovement());
			}
		}
		
		
		//log.info("Map Size is :"+map.size());	
		
		Set<Map.Entry<String,QuestionComponent>> me=map.entrySet();
		
		Iterator iterator=me.iterator();
		
		List<QuestionComponent> questionComponents=new ArrayList<QuestionComponent>(); //THIS SHOULD BE THE OUTPUT
		Long qrBank = 0L;
		while(iterator.hasNext()){
			
			Map.Entry<String,QuestionComponent> m=(Map.Entry<String,QuestionComponent>)iterator.next();
			//log.info("Key"+m.getKey());
			QuestionComponent qc=m.getValue();
			if(m.getKey().contains("bank"))
				qc.setQuestionId(--qrBank);
			questionComponents.add(qc);
			List<Long> answerOptionId=qc.getAnswerOptionId();
			Iterator i=answerOptionId.iterator();
			while(i.hasNext()){
				//log.info("First"+(Long)i.next());
			}	
			List<String> answerOptionValue=qc.getAnswerOptionValue();
			Iterator it=answerOptionValue.iterator();
			while(it.hasNext()){
				//log.info("First"+(String)it.next());
			}
			List<Short> answerOptionScore=qc.getAnswerOptionScore();
			Iterator ite=answerOptionScore.iterator();
			while(ite.hasNext()){
				//log.info("First"+(Short)ite.next());
			}		
			
		}
		
		//log.info("Question Components Size:::::"+questionComponents.size());	
		
		//log.info("Section Map Size is:"+sectionMap.size());
		
		for(QuestionComponent qc:questionComponents){
			if(sectionMap.get(qc.getSectionLabel())== null){
				questionComponentLinkedList.add(qc);
				sectionMap.put(qc.getSectionLabel(),questionComponentLinkedList);
				questionComponentLinkedList = new LinkedList<QuestionComponent>();
			}
			else{
				questionComponentLinkedList = sectionMap.get(qc.getSectionLabel());
				questionComponentLinkedList.add(qc);
				sectionMap.put(qc.getSectionLabel(),questionComponentLinkedList);	
				questionComponentLinkedList = new LinkedList<QuestionComponent>();
			}
		}
		
		//log.info("Section Map Size is:"+sectionMap.size());
		
	//	System.out.println("-------------------- RELATED TO SECTION RETRIEVING QUESTIONNAIRE----------------------");
		
		Set<Map.Entry<String,LinkedList<QuestionComponent>>> mEntries = sectionMap.entrySet();
		
		//log.info("SectionMap Entries Size is:"+mEntries.size());
		
		Iterator i = mEntries.iterator();
		int ansOptValSize = 0;
		
		int ansOptScoSize = 0;
		
		while(i.hasNext()){
			
			Map.Entry<String,LinkedList<QuestionComponent>> mee = (Map.Entry<String, LinkedList<QuestionComponent>>)i.next();
			
			//log.info("Section Name is:"+mee.getKey());
			
			LinkedList<QuestionComponent> qcc = mee.getValue();
			
			//log.info("Size of LinkedList<QuestionComponent> is:"+qcc.size());
			
			for(QuestionComponent qc:qcc){
			
			
			ansOptValSize = ((qc.getAnswerOptionValue()).size() != 0)?(qc.getAnswerOptionValue()).size():0;
			//log.info("Answer Option Value Array Size is:"+ansOptValSize);
			/*for(String s:(qc.getAnswerOptionValue())){
				System.out.println("AOPTValue:"+s);
			}*/
			ansOptScoSize = ((qc.getAnswerOptionScore()).size() != 0)?(qc.getAnswerOptionScore()).size():0;
			//log.info("Answer Option Score Size is:"+ansOptScoSize);
			/*for(Short sh:(qc.getAnswerOptionScore())){
				System.out.println("AOPTSCOREValue is:"+sh);
			}*/
			
			}
			
		}
		
//		System.out.println("-------------------- RELATED TO SECTION RETRIEVING QUESTIONNAIRE----------------------");
		
		//log.info("Question Components Size:::::"+questionComponents.size());		
		
		return questionComponents;
	}
	
	

	//@Override
//	public TreeMap<String,LinkedList<QuestionComponent>> retrieveSectionBasedQuestionnaire(Long questionnaireId) {
		
		public LinkedHashMap<String,LinkedList<QuestionComponent>> retrieveSectionBasedQuestionnaire(Long questionnaireId) {

		
		//String query="select qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_branch.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment from qstt_questionnaire,qstt_questionnaire_def,qstt_question_map,qstt_question,qstt_question_type,qstt_question_option,qstt_question_category,qstt_question_option_score,qstt_question_branch where qstt_questionnaire.id = 1 and qstt_questionnaire.status = 'submitted' and qstt_questionnaire.id = qstt_questionnaire_def.id And qstt_questionnaire_def.status = 'in progress' and qstt_questionnaire.id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question.id and qstt_question.question_type_id = qstt_question_type.id and qstt_question.question_category_id = qstt_question_category.id and qstt_question.id = qstt_question_option.qstt_question_id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";
//		String query ="select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_branch.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment from qstt_questionnaire,qstt_questionnaire_def,qstt_question_map,qstt_question,qstt_question_type,qstt_question_option,qstt_question_category,qstt_question_option_score,qstt_question_branch where qstt_questionnaire_def.id = 63 and  qstt_questionnaire_def.status = 'in progress' and qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question.id and qstt_question.question_type_id = qstt_question_type.id and qstt_question.question_category_id = qstt_question_category.id and qstt_question.id = qstt_question_option.qstt_question_id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";
//		String query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id and qstt_question_map.validity_end_date is null where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";
//		query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment,'qr' as source from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order";	
		//log.info("QUERY EXECUTED IN RETRIEVESECTIONBASEDQUESTIONNAIRE : "+query);
		String temp = "";
		
		SQLQuery sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(query);
		sqlQuery.setParameter(0,questionnaireId);
 		List<Object[]> qComponentList=sqlQuery.list();
		
		int qComponentsSize=qComponentList.size();
		
		//log.info("qComponentList Size:"+qComponentList.size());
		List<QComponent> qComponentsList=new ArrayList<QComponent>();
		QComponent qComp=new QComponent();
//		TreeMap<String,QuestionComponent> sectionMap = new TreeMap<String,QuestionComponent>();
		int k=0;
	
		for(int i=0;i<qComponentsSize;i++){
			Object qc[]=qComponentList.get(k++);
			//log.info("Object Array Size is:"+qc.length);
			for(int j=0;j<qc.length;j++){	
				
				qComp.setSectionLabel(qc[0]!=null ?(java.lang.String)qc[0]:"");
				qComp.setQuestionnaireId(qc[1] !=null?((java.math.BigInteger)(qc[1])).longValue():0);
				qComp.setQuestionnaireName(qc[2]!=null?(java.lang.String)qc[2]:"");
				qComp.setQuestionCategoryId(qc[3]!=null?(java.lang.Integer)qc[3]:0);
				qComp.setQuestionText(qc[4]!=null?(java.lang.String)qc[4]:"");
				qComp.setQuestionDescription(qc[5]!=null?(java.lang.String)qc[5]:"");
				qComp.setQuestionTypeId(qc[6]!=null?(java.lang.Short)qc[6]:0);
				//qComp.setQuestionTypeId(qc[6]!=null?(java.lang.Short)qc[6]:0);
				qComp.setSectionOrder(qc[7]!=null?(java.lang.Short)qc[7]:0);
				qComp.setQuestionOrder(qc[8]!=null?(java.lang.Short)qc[8]:0);
				qComp.setOptionOrder(qc[9]!=null?(java.lang.Short)qc[9]:0);
				
				qComp.setAnswerOptionId(qc[10] !=null?((java.math.BigInteger)qc[10]).longValue():0);
				qComp.setAnswerOptionValue(qc[11] !=null?(java.lang.String)qc[11]:"");
				qComp.setAnswerOptionScore(qc[12] !=null?(java.lang.Short)qc[12]:0);
				
					qComp.setQuestionId(qc[13]!=null?((java.math.BigInteger)qc[13]).longValue():0);
				temp = qc[14]!=null?qc[14].toString():"";
				if(temp.equalsIgnoreCase("true") || temp.equalsIgnoreCase("1"))
					qComp.setQuestionMandatory(true);
				else
					qComp.setQuestionMandatory(false);
//			    qComp.setQuestionMandatory(qc[14]!=null?(java.lang.Boolean)qc[14]:false);
//				qComp.setQuestionMandatory(false);
				qComp.setQuestionTag(qc[15]!=null?(java.lang.String)qc[15]:"");
				temp = qc[16]!=null?qc[16].toString():"";
				if(temp.equalsIgnoreCase("true") || temp.equalsIgnoreCase("1"))
					qComp.setQuestionBanked(true);
				else
					qComp.setQuestionBanked(false);
//				qComp.setQuestionBanked(qc[16]!=null?(java.lang.Boolean)qc[16]:false);
//				qComp.setQuestionBanked(false);
				qComp.setQuestionCategory(qc[17]!=null?(java.lang.String)qc[17]:"");
				qComp.setQuestionType(qc[18]!=null?(java.lang.String)qc[18]:"");	
				temp = qc[19]!=null?qc[19].toString():"";
				if(temp.equalsIgnoreCase("true") || temp.equalsIgnoreCase("1"))
					qComp.setQuestionAttachment(true);
				else
					qComp.setQuestionAttachment(false);
//				qComp.setQuestionAttachment(qc[19]!=null?(java.lang.Boolean)qc[19]:false);
//				qComp.setQuestionAttachment(false);
				qComp.setSource(qc[20]!=null?(java.lang.String)qc[20]:""); // newly added
				qComp.setDescription(qc[21]!=null?(java.lang.String)qc[21]:""); // newly added for questionnaire description
				qComp.setDeftype(qc[22]!=null?((java.lang.Character)qc[22]).toString():"");
				qComp.setBranched(qc[24]!=null && (((java.math.BigInteger)qc[24]).longValue() > 0)?true:false);
				qComp.setMovement(qc[25]!=null && (((java.math.BigInteger)qc[24]).longValue() > 0 || ((java.math.BigInteger)qc[25]).longValue() > 0)?true:false);
			}
			qComponentsList.add(qComp);
			qComp=new QComponent();		
			
		}
		//log.info("SIze of qComponents List:::::::::::::::::::::::::::::::::::"+qComponentsList.size());		
		
		for(int i=0;i<qComponentsSize;i++){

			
			
		}
	
		
		QuestionComponent qComponent= new QuestionComponent();
		LinkedList<QuestionComponent> questionComponentLinkedList = new LinkedList<QuestionComponent>();
//		TreeMap<Long,QuestionComponent> map=new TreeMap<Long,QuestionComponent>();
//		TreeMap<String,LinkedList<QuestionComponent>> sectionMap = new TreeMap<String,LinkedList<QuestionComponent>>();
		LinkedHashMap<String,QuestionComponent> map=new LinkedHashMap<String,QuestionComponent>();
		LinkedHashMap<String,LinkedList<QuestionComponent>> sectionMap = new LinkedHashMap<String,LinkedList<QuestionComponent>>();
		//log.info("qComponentsSize::"+qComponentsSize);
		for(int i=0;i<qComponentsSize;i++){
			long some=(qComponentsList.get(i)).getQuestionId();
			//log.info("some:::"+some);
			if(map.get((qComponentsList.get(i)).getQuestionId()+(qComponentsList.get(i)).getSource())==null){
				if(some !=0){
				qComponent=new QuestionComponent();
				qComponent.setQuestionnaireId((qComponentsList.get(i)).getQuestionnaireId());
				qComponent.setQuestionnaireName((qComponentsList.get(i)).getQuestionnaireName());
				qComponent.setQuestionId((qComponentsList.get(i)).getQuestionId());
				qComponent.setQuestionText((qComponentsList.get(i)).getQuestionText());
				(qComponent.getAnswerOptionId()).add((qComponentsList.get(i)).getAnswerOptionId());
				(qComponent.getAnswerOptionValue()).add((qComponentsList.get(i)).getAnswerOptionValue());
				(qComponent.getAnswerOptionScore()).add((qComponentsList.get(i)).getAnswerOptionScore());
				qComponent.setQuestionMandatory((qComponentsList.get(i)).getQuestionMandatory());
				qComponent.setQuestionTag((qComponentsList.get(i)).getQuestionTag());
				qComponent.setQuestionBanked((qComponentsList.get(i)).getQuestionBanked());
				qComponent.setQuestionCategory((qComponentsList.get(i)).getQuestionCategory());
				qComponent.setQuestionType((qComponentsList.get(i)).getQuestionType());
				qComponent.setQuestionOrder((qComponentsList.get(i)).getQuestionOrder());
				qComponent.setSectionLabel((qComponentsList.get(i)).getSectionLabel());
				qComponent.setSectionOrder((qComponentsList.get(i)).getSectionOrder());
				qComponent.setQuestionCategoryId((qComponentsList.get(i)).getQuestionCategoryId());
				qComponent.setQuestionDescription((qComponentsList.get(i)).getQuestionDescription());
				qComponent.setQuestionTypeId((qComponentsList.get(i)).getQuestionTypeId());
				qComponent.setOptionOrder((qComponentsList.get(i)).getOptionOrder());
				qComponent.setQuestionAttachment((qComponentsList.get(i)).getQuestionAttachment());
				qComponent.setSource((qComponentsList.get(i)).getSource()); // newly added
				qComponent.setDescription((qComponentsList.get(i)).getDescription());  // newly added for questionnaire description
				qComponent.setDeftype((qComponentsList.get(i)).getDeftype());
				qComponent.setBranched((qComponentsList.get(i)).isBranched());
				qComponent.setMovement((qComponentsList.get(i)).isMovement());
				map.put((qComponentsList.get(i)).getQuestionId()+(qComponentsList.get(i)).getSource(),qComponent);}
			}
			else{
				qComponent=map.get((qComponentsList.get(i)).getQuestionId()+(qComponentsList.get(i)).getSource());
				qComponent.setQuestionnaireId((qComponentsList.get(i)).getQuestionnaireId());
				qComponent.setQuestionnaireName((qComponentsList.get(i)).getQuestionnaireName());
				qComponent.setQuestionId((qComponentsList.get(i)).getQuestionId());
				qComponent.setQuestionText((qComponentsList.get(i)).getQuestionText());
				(qComponent.getAnswerOptionId()).add((qComponentsList.get(i)).getAnswerOptionId());
				(qComponent.getAnswerOptionValue()).add((qComponentsList.get(i)).getAnswerOptionValue());
				(qComponent.getAnswerOptionScore()).add((qComponentsList.get(i)).getAnswerOptionScore());
				qComponent.setQuestionMandatory((qComponentsList.get(i)).getQuestionMandatory());
				qComponent.setQuestionTag((qComponentsList.get(i)).getQuestionTag());
				qComponent.setQuestionBanked((qComponentsList.get(i)).getQuestionBanked());
				qComponent.setQuestionCategory((qComponentsList.get(i)).getQuestionCategory());
				qComponent.setQuestionType((qComponentsList.get(i)).getQuestionType());
				qComponent.setQuestionOrder((qComponentsList.get(i)).getQuestionOrder());
				qComponent.setSectionLabel((qComponentsList.get(i)).getSectionLabel());
				qComponent.setSectionOrder((qComponentsList.get(i)).getSectionOrder());
				qComponent.setQuestionCategoryId((qComponentsList.get(i)).getQuestionCategoryId());
				qComponent.setQuestionDescription((qComponentsList.get(i)).getQuestionDescription());
				qComponent.setQuestionTypeId((qComponentsList.get(i)).getQuestionTypeId());
				qComponent.setOptionOrder((qComponentsList.get(i)).getOptionOrder());
				qComponent.setQuestionAttachment((qComponentsList.get(i)).getQuestionAttachment());
				qComponent.setSource((qComponentsList.get(i)).getSource()); // newly added
				qComponent.setDescription((qComponentsList.get(i)).getDescription());  // newly added for questionnaire description
				qComponent.setDeftype((qComponentsList.get(i)).getDeftype());
				qComponent.setBranched((qComponentsList.get(i)).isBranched());
				qComponent.setMovement((qComponentsList.get(i)).isMovement());
			}
			
			if(qComponent!=null){			
			if(((qComponent.getQuestionTypeId()) != null && ((qComponent.getQuestionTypeId().toString()).equalsIgnoreCase("13")))){
				List<String> option = qComponent.getAnswerOptionValue();
				String bcOptionId = option.get(0);
				if(!(bcOptionId.equalsIgnoreCase(""))){
					Long id = Long.parseLong(bcOptionId);
					//String query = "select legal_name from organisation_name where id=?";
					String query = "select legal_name from organisation org , organisation_name orgn where org.id=orgn.organisation_id and org.is_internal=0 and organisation_id=?";
					sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(query);
					sqlQuery.setParameter(0,id);
					List<String> legaid =sqlQuery.list();
					for (String obj : legaid) {
						qComponent.setLegalName(obj!=null?obj:"");
					}
				}
			}
			}
		}
		String qNam = "";
		if(qComponent != null){
		qNam=(qComponent.getQuestionnaireName()==null)?"":qComponent.getQuestionnaireName();
		if( qNam.equalsIgnoreCase("")){
			String query = "select name,description,def_type from qstt_questionnaire_def where id=?";
			sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(query);
			sqlQuery.setParameter(0,questionnaireId);
			List<Object[]> qrNameList =sqlQuery.list();
			for (Object[] obj : qrNameList) {
				qComponent.setQuestionnaireName(obj[0]!=null?(java.lang.String)obj[0]:"");
				qComponent.setDescription(obj[1]!=null?(java.lang.String)obj[1]:"");
				qComponent.setDeftype(obj[2]!=null?((java.lang.Character)obj[2]).toString():"");
			}
			qComponent.setQuestionnaireId(questionnaireId);			
		}
		}		
		
		//log.info("Map Size is :"+map.size());	
		
		Set<Map.Entry<String,QuestionComponent>> me=map.entrySet();
		
		Iterator iterator=me.iterator();
		
		List<QuestionComponent> questionComponents=new ArrayList<QuestionComponent>(); //THIS SHOULD BE THE OUTPUT
		Long qrBank = 0L;
		while(iterator.hasNext()){
			
			Map.Entry<String,QuestionComponent> m=(Map.Entry<String,QuestionComponent>)iterator.next();
			//log.info("Key"+m.getKey());
			QuestionComponent qc=m.getValue();
			if(m.getKey().contains("bank"))
				qc.setQuestionId(--qrBank);
		//	if(qc.getQuestionId() != 0)
			questionComponents.add(qc);
			List<Long> answerOptionId=qc.getAnswerOptionId();
			Iterator i=answerOptionId.iterator();
			while(i.hasNext()){
				//log.info("First"+(Long)i.next());
			}	
			List<String> answerOptionValue=qc.getAnswerOptionValue();
			Iterator it=answerOptionValue.iterator();
			while(it.hasNext()){
				//log.info("First"+(String)it.next());
			}
			List<Short> answerOptionScore=qc.getAnswerOptionScore();
			Iterator ite=answerOptionScore.iterator();
			while(ite.hasNext()){
				//log.info("First"+(Short)ite.next());
			}
			qc = new QuestionComponent();
		}
		
		if(map.size() == 0){
			questionComponents.add(qComponent);
	//		System.out.println("QuestionnaireId"+qComponent.getQuestionnaireId());
	//		System.out.println("Questionnaire Name is:"+qComponent.getQuestionnaireName());
	//		System.out.println("Questionnaire Description is"+qComponent.getDescription());
		}
		
		//log.info("Question Components Size:::::"+questionComponents.size());	
		
		for(QuestionComponent qc:questionComponents){
			if(qc.getSectionLabel() != null && sectionMap.get(qc.getSectionLabel())== null){
				questionComponentLinkedList.add(qc);
				if(qc.getQuestionId() !=null && qc.getQuestionId() != 0 )
				sectionMap.put(qc.getSectionLabel(),questionComponentLinkedList);
				else
					sectionMap.put("",questionComponentLinkedList);
				questionComponentLinkedList = new LinkedList<QuestionComponent>();
	//			System.out.println("Section Label"+qc.getSectionLabel());
	//			System.out.println("QuestionnaireName"+qc.getQuestionnaireName());
	//			System.out.println("QuestionnaireId"+qc.getQuestionnaireId());
				
			}
			else{
				if(qc.getSectionLabel() != null)
				questionComponentLinkedList = sectionMap.get(qc.getSectionLabel());
				questionComponentLinkedList.add(qc);
				if(qc.getQuestionId()!=null && qc.getQuestionId() != 0 )
				sectionMap.put(qc.getSectionLabel(),questionComponentLinkedList);	
				questionComponentLinkedList = new LinkedList<QuestionComponent>();
			}
			
		}
		
		
		
		//log.info("Section Map Size is:"+sectionMap.size());
		
		if(sectionMap.size() == 0){
			sectionMap.put("",questionComponentLinkedList);
		}
		
//		System.out.println("-------------------- RELATED TO SECTION RETRIEVING QUESTIONNAIRE----------------------");
		
		Set<Map.Entry<String,LinkedList<QuestionComponent>>> mEntries = sectionMap.entrySet();
		
		//log.info("SectionMap Entries Size is:"+mEntries.size());
		
		Iterator i = mEntries.iterator();
		int ansOptValSize = 0;
		
		int ansOptScoSize = 0;
		
		while(i.hasNext()){
			
			Map.Entry<String,LinkedList<QuestionComponent>> mee = (Map.Entry<String, LinkedList<QuestionComponent>>)i.next();
			
			//log.info("Section Name is:"+mee.getKey());
			
			LinkedList<QuestionComponent> qcc = mee.getValue();
			
			//log.info("Size of LinkedList<QuestionComponent> is:"+qcc.size());
			
			for(QuestionComponent qc:qcc){
			
			
			ansOptValSize = ((qc.getAnswerOptionValue()).size() != 0)?(qc.getAnswerOptionValue()).size():0;
			//log.info("Answer Option Value Array Size is:"+ansOptValSize);
			/*for(String s:(qc.getAnswerOptionValue())){
				System.out.println("AOPTValue:"+s);
			}*/
			ansOptScoSize = ((qc.getAnswerOptionScore()).size() != 0)?(qc.getAnswerOptionScore()).size():0;
			//log.info("Answer Option Score Size is:"+ansOptScoSize);
			/*for(Short sh:(qc.getAnswerOptionScore())){
				System.out.println("AOPTSCOREValue is:"+sh);
			}*/
			
			}
			
		}
		
		
		
	//	System.out.println("-------------------- RELATED TO SECTION RETRIEVING QUESTIONNAIRE----------------------");
		
		//log.info("Question Components Size:::::"+questionComponents.size());		
		
		return sectionMap;
	}



	//@Override
	//public TreeMap<String,LinkedList<QuestionComponent>> retrieveBankRelatedQuestionnaire(Long questionnaireId,List questionIds) {
	public LinkedHashMap<String,LinkedList<QuestionComponent>> retrieveBankRelatedQuestionnaire(Long questionnaireId,List questionIds,String sectionName) {
		
//		TreeMap<String,LinkedList<QuestionComponent>> questionComponts = new TreeMap<String,LinkedList<QuestionComponent>>();
		if(questionIds.contains("on")){
			questionIds.set(0, "0");
		}
		
		//questionIds = Utility.getquestionIds(questionIds);
		
		String sName = "Default";
		
		if(sectionName.equals("") || sectionName.equals("undefined")){
			sName = "Default";
		}else{
			sName=sectionName;
		}
		
		LinkedHashMap<String,LinkedList<QuestionComponent>> questionComponents = new LinkedHashMap<String,LinkedList<QuestionComponent>>();
//			List<QuestionComponent> questionComponents = new ArrayList<QuestionComponent>();
		//log.info("Question Ids Selected From addBank.jsp are:");
		//log.info("Size of List is:"+questionIds.size());
	    StringBuffer sb = new StringBuffer();
//		for(Object l:questionIds){
//			System.out.println("Value is:"+l);
//			(sb.append(l)).append(",");
//		}
	/*    Object obj = questionIds.get(0);
	    if(obj.equals("")){
	    	questionIds.set(0,0);
	    }*/
	    for(int i = 0;i<questionIds.size();i++){
	    	if(i < (questionIds.size()-1)){
	    		(sb.append(questionIds.get(i))).append(',');
	    	}
	    	else{
	    		sb.append(questionIds.get(i));
	    	}
	    }
	   // log.info("Final QuestionIds with Comma Separator String is:"+(sb.toString()).trim());
		
//		query = "select distinct 'abc' as 'Section Name',null as 'Questionnaire Id','' as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',null as 'Section Order',null as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',null as 'Risk Score',null as 'Qn Id',null as 'IsMandatory',null as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',null as 'IsAttachment' from qstt_question left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id where qstt_question.id in (1294,1300,1304) UNION(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order)";
		//NEW ONE AFTER JOSEPH SIR GIVEN THE QUERY
//		query ="select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in (1294,1300,1304) UNION(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order)";
	//	query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in (1001,1002,1003) UNION(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order)";
	//	query = "select distinct 'EMPTY' as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','bank' as source from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in (1001,1002,1003) UNION(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','qr' as source from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id,qstt_question_option.option_order);";
		//query = "(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' and qstt_question_map.qstt_question_id not in ("+(sb.toString()).trim()+") Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order)  UNION   (select distinct '"+sName+"' as 'Section Name',"+questionnaireId+" as 'Questionnaire Id','' as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',0 as 'IsMandatory','' as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',0 as 'IsAttachment','bank' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in ("+(sb.toString()).trim()+") Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order)";
	    //query = "(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type', 'NB' as 'Type' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' and qstt_question_map.qstt_question_id not in ("+(sb.toString()).trim()+") Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order)  UNION   (select distinct '"+sName+"' as 'Section Name',"+questionnaireId+" as 'Questionnaire Id','' as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',0 as 'IsMandatory','' as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',0 as 'IsAttachment','bank' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type','B' as 'Type' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in ("+(sb.toString()).trim()+") Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order)";
	    query = "(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type', 'NB' as 'Type',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.question_id=qstt_question.id) as 'Branched',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.d_question_id=qstt_question.id) as 'TargetBranched' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order)  UNION   (select distinct '"+sName+"' as 'Section Name',"+questionnaireId+" as 'Questionnaire Id','' as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',0 as 'IsMandatory','' as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',0 as 'IsAttachment','bank' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type','B' as 'Type',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.question_id=qstt_question.id) as 'Branched',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.d_question_id=qstt_question.id) as 'TargetBranched' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in ("+(sb.toString()).trim()+") Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order)";
	    //query="(select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section_Order',qstt_question_map.Question_Order as 'Question_Order',qstt_question_option.option_order as 'Ans_Option_Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type', 'NB' as 'Type' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' )  UNION   (select distinct 'sec' as 'Section Name',"+questionnaireId+" as 'Questionnaire Id','' as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section_Order',qstt_question_map.Question_Order as 'Question_Order',qstt_question_option.option_order as 'Ans_Option_Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',0 as 'IsMandatory','' as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',0 as 'IsAttachment','bank' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type','B' as 'Type' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in ("+(sb.toString()).trim()+")) Order By Section_Order,Question_Order,Ans_Option_Order";
	    
	    String s = (sb.toString()).trim();
	    
	//    System.out.println("String checking ==="+s);
	    
		
		//query = "select distinct '"+sectionName+"' as 'Section Name',"+questionnaireId+" as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order as 'Section Order',qstt_question_map.Question_Order as 'Question Order',qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score as 'Risk Score',qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory as 'IsMandatory',qstt_question_map.tag_name as 'Tag Name',qstt_question.is_banked as 'Is Banked',qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment as 'IsAttachment','bank' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type' from qstt_question left join qstt_question_map on qstt_question.id = qstt_question_map.qstt_question_id left join qstt_questionnaire_def on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_question.id in ("+(sb.toString()).trim()+") UNION (select null,null,qstt_questionnaire_def.name,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null from qstt_questionnaire_def where qstt_questionnaire_def.id = ?)";
		//NEW ONE AFTER JOSEPH SIR GIVEN THE QUERY
//		System.out.println("Bank Related Query :"+query);
		questionComponents = this.retrieveSectionBasedQuestionnaire(questionnaireId);
		query = "select distinct qstt_question_map.Section_label as 'Section Name',qstt_questionnaire_def.id as 'Questionnaire Id',qstt_questionnaire_def.name as 'Questionnaire Name',qstt_question_category.id as 'Qn Category Id',qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text',qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order',qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value',qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id',qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked,qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME',qstt_question_map.is_attachment,'qr' as source,qstt_questionnaire_def.description as 'Questionnaire Description',qstt_questionnaire_def.def_type as 'Definition Type', 'NB' as 'Type',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.question_id=qstt_question.id) as 'Branched',(select count(1) from qstt_question_branch qnbr where qnbr.qstt_questionnaire_def_id = qstt_questionnaire_def.id and qnbr.d_question_id=qstt_question.id) as 'TargetBranched' from qstt_questionnaire_def left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id and qstt_question_map.qstt_question_id = qstt_question_branch.question_id left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id and qstt_question_map.validity_end_date is null left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id left join qstt_question_option_score on qstt_question_option_score.question_option_id = qstt_question_option.id and qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and qstt_question_option_score.question_id = qstt_question_option.qstt_question_id where qstt_questionnaire_def.id = ? and qstt_questionnaire_def.status = 'in progress' Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question_option.option_order";
	//	query = "";
	return questionComponents;
	}
}