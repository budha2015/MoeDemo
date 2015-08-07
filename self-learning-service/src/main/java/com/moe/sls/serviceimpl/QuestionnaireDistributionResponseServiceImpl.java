package com.moe.sls.serviceimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.moe.sls.dao.QsttAnswerDao;
import com.moe.sls.dao.QsttQuestionDao;
import com.moe.sls.dao.QsttQuestionMapDao;
import com.moe.sls.dao.QsttQuestionOptionDao;
import com.moe.sls.dao.QsttQuestionOptionScoreDao;
import com.moe.sls.dao.QsttQuestionnaireDao;
import com.moe.sls.dao.QsttQuestionnaireDefDao;
import com.moe.sls.model.QComponent;
import com.moe.sls.model.QsttAnswer;
import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionCategory;
import com.moe.sls.model.QsttQuestionMap;
import com.moe.sls.model.QsttQuestionMapId;
import com.moe.sls.model.QsttQuestionOption;
import com.moe.sls.model.QsttQuestionOptionId;
import com.moe.sls.model.QsttQuestionOptionScore;
import com.moe.sls.model.QsttQuestionOptionScoreId;
import com.moe.sls.model.QsttQuestionType;
import com.moe.sls.model.QsttQuestionnaire;
import com.moe.sls.model.QsttQuestionnaireDef;
import com.moe.sls.model.QuestionComponent;
import com.moe.sls.model.QuestionnaireDistributionComponent;
import com.moe.sls.service.QuestionnaireDistributionResponseService;
import com.rfg.tprm.questionnaire.util.Utility;

@Service
public class QuestionnaireDistributionResponseServiceImpl implements QuestionnaireDistributionResponseService {
	
	@Autowired
	QsttQuestionDao qsttQuestionDao;
	@Autowired
	QsttQuestionMapDao qsttQuestionMapDao;
	@Autowired
	QsttQuestionOptionDao qsttQuestionOptionDao;
	@Autowired
	QsttQuestionOptionScoreDao qsttQuestionOptionScoreDao;
	@Autowired
	QsttAnswerDao qsttAnswerDao;
	@Autowired
	private QsttQuestionCategory qsttQuestionCategory;
	@Autowired
	private QsttQuestion qsttQuestion;
	@Autowired
	private QsttQuestionType qsttQuestionType;
	@Autowired
	private QsttQuestionMap qsttQuestionMap;
	@Autowired
	private QsttQuestionMapId qsttQuestionMapId;
	@Autowired
	private QsttQuestionnaireDef qsttQuestionnaireDef;
	@Autowired
	private QsttQuestionOption qsttQuestionOption;
	@Autowired
	private QsttQuestionOptionId qsttQuestionOptionId;
	@Autowired
	private QsttQuestionOptionScore qsttQuestionOptionScore;
	@Autowired
	private QsttQuestionOptionScoreId qsttQuestionOptionScoreId;
	@Autowired
	private QsttQuestionnaireDefDao qsttQuestionnaireDefDao;
	@Autowired
	private DriverManagerDataSource parentdataSource;
	@Autowired
	private QsttQuestionnaireDao qsttQuestionnaireDao;

	//@Override
	public LinkedHashMap<String,LinkedList<QuestionComponent>> retrieveQuestionnaire(Long questionnaireId) {

		
		String query = "select distinct qstt_question_map.Section_label as 'Section Name', "
				+ "qstt_questionnaire_def.id as 'Questionnaire Def Id', "
				+ "qstt_questionnaire_def.name as 'Questionnaire Name', "
				+ "qstt_question_category.id as 'Qn Category Id', "
				+ "qstt_question.qtext as 'Qn Text',qstt_question.description as 'Qn Help Text', "
				+ "qstt_question_type.id as 'Qn Type Id',qstt_question_map.Section_Order, "
				+ "qstt_question_map.Question_Order,qstt_question_option.option_order as 'Ans Option Order', "
				+ "qstt_question_option.id as 'Ans_Option Id',qstt_question_option.option_value as 'Ans Option Value', "
				+ "qstt_question_option_score.risk_score,qstt_question.id as 'Qn Id', "
				+ "qstt_question_map.is_mandatory,qstt_question_map.tag_name,qstt_question.is_banked, "
				+ "qstt_question_category.name as 'QUESTION CATEGORY NAME',qstt_question_type.name as 'QUESTION TYPE NAME', "
				+ "qstt_question_map.is_attachment, "
				+ "usr.id, "
				/*+ "c.d_question_id as 'Branched Question', "*/

				+ "qstt_questionnaire.id as 'Questionnaire Id' , "
				+ "qstt_answer.id as 'Answer ID', "
				+ "qstt_answer.question_score as 'QA Score', "
				+ "qstt_answer.answer_word as 'Answer Word' , "
				+ "qstt_questionnaire.status as 'status',  "
				+ "qstt_questionnaire_def.def_type as 'DefType', "
				+ "qstt_questionnaire_def.create_date as 'CreatDate', "
				+ "qstt_questionnaire_def.create_by as 'CreatBy'"
				+ "from qstt_questionnaire_def "
				+ "left join qstt_question_map on qstt_questionnaire_def.id = qstt_question_map.qstt_questionnaire_def_id "

				+ "left join qstt_question_branch on qstt_question_map.qstt_questionnaire_def_id =  qstt_question_branch.qstt_questionnaire_def_id "
				+ "and qstt_question_map.qstt_question_id = qstt_question_branch.question_id "

				+ "left join qstt_question on qstt_question_map.qstt_question_id = qstt_question.id "
				+ " and qstt_question_map.validity_end_date is null "
				+ "left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id "
				+ "left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id "

				/*+ "left join  ( select a.question_id, a.d_question_id, a.ans_option_id, qnmap1.qstt_questionnaire_def_id, qnmap1.qstt_question_id, qnmap1.tag_name from qstt_question_map qnmap1, "
				+ "((select qstt_questionnaire_def_id, question_id, d_question_id, ans_option_id from qstt_question_branch ) as a) ) as c "
				+ "on "
				+ "c.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id  and "
				+ "c.qstt_question_id = c.d_question_id "
				+ "and c.ans_option_id = qstt_question_option.id and "
				+ "c.question_id = qstt_question_branch.question_id and "
				+ "c.qstt_questionnaire_def_id = qstt_question_branch.qstt_questionnaire_def_id "*/

				+ "left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id "
				+ "left join qstt_question_option_score on "
				+ "qstt_question_option_score.question_option_id = qstt_question_option.id and "
				+ "qstt_question_option_score.questionnaire_def_id = qstt_question_map.qstt_questionnaire_def_id and "
				+ "qstt_question_option_score.qr_question_id = qstt_question_map.qstt_question_id and  "
				+ "qstt_question_option_score.question_id = qstt_question_option.qstt_question_id "
				+ "left join qstt_questionnaire on qstt_questionnaire_def.id = qstt_questionnaire.qstt_questionnaire_def_id "
				+ "left join qstt_answer on qstt_answer.qstt_question_id = qstt_question_option.qstt_question_id and qstt_answer.question_option_id = qstt_question_option.id  and qstt_answer.qstt_questionnaire_id = qstt_questionnaire.id "
				+ "left join user usr on usr.id = qstt_questionnaire.responder "
				+ "where qstt_questionnaire.id = ? and qstt_questionnaire_def.status = 'in progress' "
				+ "Order By qstt_question_map.Section_Order,qstt_question_map.Question_Order,qstt_question.id, "
				+ " qstt_question_option.option_order";
		
		
		
		SQLQuery sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(query);
		sqlQuery.setParameter(0,questionnaireId);
 		List<Object[]> qComponentList=sqlQuery.list();
		
		int qComponentsSize=qComponentList.size();
		
		List<QComponent> qComponentsList=new ArrayList<QComponent>();
		QComponent qComp=new QComponent();
		int k=0;
		for(int i=0;i<qComponentsSize;i++){
			Object qc[]=qComponentList.get(k++);
			for(int j=0;j<qc.length;j++){	

				qComp.setSectionLabel(qc[0]!=null ?(java.lang.String)qc[0]:"");
				qComp.setQuestionnaireDefId(qc[1] !=null?((java.math.BigInteger)(qc[1])).longValue():0);
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
				qComp.setQuestionMandatory(qc[14]!=null?(java.lang.Boolean)qc[14]:false);
				qComp.setQuestionTag(qc[15]!=null?(java.lang.String)qc[15]:"");
				qComp.setQuestionBanked(qc[16]!=null?(java.lang.Boolean)qc[16]:false);
				qComp.setQuestionCategory(qc[17]!=null?(java.lang.String)qc[17]:"");
				qComp.setQuestionType(qc[18]!=null?(java.lang.String)qc[18]:"");	
				qComp.setQuestionAttachment(qc[19]!=null?(java.lang.Boolean)qc[19]:false);
				qComp.setUserId(qc[20]!=null?((java.math.BigInteger)(qc[20])).longValue():0);
				//qComp.setBranchedQuestionId(qc[20] !=null?((java.math.BigInteger)qc[20]).longValue():0);
				qComp.setQuestionnaireId(qc[21] !=null?((java.math.BigInteger)(qc[21])).longValue():0);
				qComp.setAnswerId(qc[22] !=null?((java.math.BigInteger)(qc[22])).longValue():0);
				qComp.setAnswerScore(qc[23] !=null?((java.math.BigInteger)(qc[23])).longValue():0);
				qComp.setAnswerWord(qc[24] !=null?(java.lang.String)qc[24]:"");
				qComp.setStatus(qc[25] !=null?(java.lang.String)qc[25]:"");
				qComp.setDeftype(qc[26] !=null?((java.lang.Character)qc[26]).toString():"");
				qComp.setCreatDate((Date) (qc[27] !=null?((java.util.Date)qc[27]):""));
				qComp.setCreatBy(qc[28] !=null?((java.math.BigInteger)(qc[28])).longValue():0);
				
			}
			qComponentsList.add(qComp);
			qComp=new QComponent();		
			
		}
		
		for(int i=0;i<qComponentsSize;i++){

			
		}
	
		
		QuestionComponent qComponent=null;
		LinkedList<QuestionComponent> questionComponentLinkedList = new LinkedList<QuestionComponent>();
		LinkedHashMap<Long,QuestionComponent> map=new LinkedHashMap<Long,QuestionComponent>();
		LinkedHashMap<String,LinkedList<QuestionComponent>> sectionMap = new LinkedHashMap<String,LinkedList<QuestionComponent>>();
		for(int i=0;i<qComponentsSize;i++){
			long some=(qComponentsList.get(i)).getQuestionId();
			if(map.get((qComponentsList.get(i)).getQuestionId())==null){
				qComponent=new QuestionComponent();
				qComponent.setQuestionnaireDefId((qComponentsList.get(i)).getQuestionnaireDefId());
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
				qComponent.setUserId((qComponentsList.get(i)).getUserId());
				//qComponent.setBranchedQuestionId((qComponentsList.get(i)).getBranchedQuestionId());
				qComponent.setQuestionnaireId((qComponentsList.get(i)).getQuestionnaireId());
				(qComponent.getAnswerId()).add((qComponentsList.get(i)).getAnswerId());
				qComponent.setAnswerScore((qComponentsList.get(i)).getAnswerScore());
				(qComponent.getAnswerWord()).add((qComponentsList.get(i)).getAnswerWord());
				qComponent.setStatus((qComponentsList.get(i)).getStatus());
				qComponent.setDeftype((qComponentsList.get(i)).getDeftype());
				qComponent.setCreateDate((qComponentsList.get(i)).getCreatDate());
				qComponent.setCreatBy((qComponentsList.get(i)).getCreatBy());
				map.put((qComponentsList.get(i)).getQuestionId(),qComponent);
			}
			else{
				qComponent=map.get((qComponentsList.get(i)).getQuestionId());
				qComponent.setQuestionnaireDefId((qComponentsList.get(i)).getQuestionnaireDefId());
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
				qComponent.setUserId((qComponentsList.get(i)).getUserId());
				//qComponent.setBranchedQuestionId((qComponentsList.get(i)).getBranchedQuestionId());
				qComponent.setQuestionnaireId((qComponentsList.get(i)).getQuestionnaireId());
				(qComponent.getAnswerId()).add((qComponentsList.get(i)).getAnswerId());
				qComponent.setAnswerScore((qComponentsList.get(i)).getAnswerScore());
				(qComponent.getAnswerWord()).add((qComponentsList.get(i)).getAnswerWord());
				qComponent.setStatus((qComponentsList.get(i)).getStatus());
				qComponent.setDeftype((qComponentsList.get(i)).getDeftype());
				qComponent.setCreateDate((qComponentsList.get(i)).getCreatDate());
				qComponent.setCreatBy((qComponentsList.get(i)).getCreatBy());
			}
			//Added for Business Case
			if(qComponent!=null){	
				if(((qComponent.getDeftype()) != null && ((qComponent.getQuestionTypeId().toString()).equalsIgnoreCase("13")) && ((qComponent.getDeftype().equalsIgnoreCase("B"))))){
					List<String> option = qComponent.getAnswerOptionValue();
					String bcOptionId = option.get(0);
					if(!(bcOptionId.equalsIgnoreCase(""))){
						Long id = Long.parseLong(bcOptionId);
						//String query = "select legal_name from organisation_name where id=?";
						String querytolegal = "select legal_name from organisation org , organisation_name orgn where org.id=orgn.organisation_id and org.is_internal=0 and organisation_id=?";
						sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(querytolegal);
						sqlQuery.setParameter(0,id);
						List<String> legaid =sqlQuery.list();
						for (String obj : legaid) {
							qComponent.setLegalName(obj!=null?obj:"");
						}
					}
				}
			}
			
			/*if(qComponent!=null){	
				if(((qComponent.getDeftype()) != null && ((qComponent.getQuestionTypeId().toString()).equalsIgnoreCase("13")) && ((qComponent.getDeftype().equalsIgnoreCase("B"))))){
					Long questionnairDefID = qComponent.getQuestionnaireDefId();
					
					if(questionnairDefID != null){
						//String query = "select legal_name from organisation_name where id=?";
						//String querytolegal = "select legal_name from organisation org , organisation_name orgn where org.id=orgn.organisation_id and org.is_internal=0 and organisation_id=?";
						String querytogetAllquestionnaires = "select a.QnName from"
						+ "( select questionnaire_def_id, (select name from qstt_questionnaire_def where id = questionnaire_def_id) as 'QnName' from qstt_questionnaire_def_qstt_link where link_id in" 
						+ "(select link_id from qstt_questionnaire_def_qstt_link where questionnaire_def_id="+questionnairDefID+") ) as a where a.questionnaire_def_id <> "+questionnairDefID+"";
						sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(querytogetAllquestionnaires);
						List<String> questionnaires =sqlQuery.list();
						List<String> questinnaireList = new ArrayList<String>();
						for (String obj : questionnaires) {
							questinnaireList.add(obj);
						}
						String linkedQuestionnaires = Utility.getLinkedQuestinnairs(questinnaireList);
						qComponent.setLinkedQuestionnaires(linkedQuestionnaires);
					}
				}
			}*/
			
			if(qComponent!=null){	
				if(((qComponent.getDeftype()) != null && ((qComponent.getQuestionTypeId().toString()).equalsIgnoreCase("13")) && ((qComponent.getDeftype().equalsIgnoreCase("B"))))){
					Long userId = qComponent.getCreatBy();
					
					if(userId != null){
						//String query = "select legal_name from organisation_name where id=?";
						//String querytolegal = "select legal_name from organisation org , organisation_name orgn where org.id=orgn.organisation_id and org.is_internal=0 and organisation_id=?";
						String authorName = "select concat(first_name, ' ', last_name) from user where id=?";
						sqlQuery=qsttQuestionnaireDefDao.getSQLQuery(authorName);
						sqlQuery.setParameter(0,userId);
						List<String> userid =sqlQuery.list();
						for (String obj : userid) {
							qComponent.setCreatedBy(obj);
						}
					}
				}
			}
			//Ended for Business Case
		}
		

		//log.info("Map Size is :"+map.size());
		
		Set<Map.Entry<Long,QuestionComponent>> me=map.entrySet();
		
		Iterator iterator=me.iterator();
		
		List<QuestionComponent> questionComponents=new ArrayList<QuestionComponent>(); //THIS SHOULD BE THE OUTPUT
		
		while(iterator.hasNext()){
			
			Map.Entry<Long,QuestionComponent> m=(Map.Entry<Long,QuestionComponent>)iterator.next();
			//log.info("Key"+m.getKey());
			QuestionComponent qc=m.getValue();
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
			
			List<Long> answerId=qc.getAnswerId();
			Iterator it1=answerId.iterator();
			System.out.println("SIze ID list-----"+answerId.size());
			while(it1.hasNext()){
				//log.info("ID Value"+(Long)it1.next());
			}
			List<String> answerWord=qc.getAnswerWord();
			Iterator it2=answerWord.iterator();
			while(it1.hasNext()){
				//log.info("First"+(String)it1.next());
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
				if(qc.getQuestionId() !=null && qc.getQuestionId() != 0 )
				sectionMap.put(qc.getSectionLabel(),questionComponentLinkedList);
				
					
				questionComponentLinkedList = new LinkedList<QuestionComponent>();
			}
			else{
				questionComponentLinkedList = sectionMap.get(qc.getSectionLabel());
				questionComponentLinkedList.add(qc);
				if(qc.getQuestionId() != 0 )
				sectionMap.put(qc.getSectionLabel(),questionComponentLinkedList);	
				questionComponentLinkedList = new LinkedList<QuestionComponent>();
			}
		}
		
		//log.info("Section Map Size is:"+sectionMap.size());
		if(sectionMap.size() == 0){
			sectionMap.put("",questionComponentLinkedList);
		}
		
		System.out.println("-------------------- RELATED TO SECTION RETRIEVING QUESTIONNAIRE----------------------");
		
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
			
			//log.info("Section Name is:"+qc.getSectionLabel()+"Question Id is:"+qc.getQuestionId());
			//log.info("Question Text is:"+qc.getQuestionText());
			//log.info("Question Tag is:"+qc.getQuestionTag());
			ansOptValSize = ((qc.getAnswerOptionValue()).size() != 0)?(qc.getAnswerOptionValue()).size():0;
			//log.info("Answer Option Value Array Size is:"+ansOptValSize);
			for(String s:(qc.getAnswerOptionValue())){
				System.out.println("AOPTValue:"+s);
			}
			ansOptScoSize = ((qc.getAnswerOptionScore()).size() != 0)?(qc.getAnswerOptionScore()).size():0;
			//log.info("Answer Option Score Size is:"+ansOptScoSize);
			for(Short sh:(qc.getAnswerOptionScore())){
				System.out.println("AOPTSCOREValue is:"+sh);
			}
			
			}
			
		}
		
		System.out.println("-------------------- RELATED TO SECTION RETRIEVING QUESTIONNAIRE----------------------");
		
		//log.info("Question Components Size:::::"+questionComponents.size());	
		return sectionMap;
	}
	
	
	public List<QsttAnswer> getQsttAnswerList(){
		return qsttAnswerDao.getQsttAnswerList();
	}
	
	
	public void saveQuestionnaireResponse(QsttAnswer qsttAnswer){
		
		//qsttAnswerDao.saveQuestionnaireResponse(qsttAnswer);
		
	}
	
	//@Override
	//@Transactional
	public void saveQuestionnaireResponse(List<QuestionnaireDistributionComponent> questionnaireDistributionComponent) {
		
		int id = 0;
		String actionType ="";
		Long qrId=0L;
		 QsttQuestionnaire qsttQuestionnaire = null;
		if (questionnaireDistributionComponent != null && questionnaireDistributionComponent.size() > 0) {
			actionType=questionnaireDistributionComponent.get(0).getActionType();
			qrId=questionnaireDistributionComponent.get(0).getQuestionnaireId();
			for (QuestionnaireDistributionComponent qc : questionnaireDistributionComponent) {
				
				try {
					
					System.out.println("Questionnaire Id:"+qc.getQuestionnaireId());
					 QsttAnswer qsttAnswer = null;
				    
				     QsttQuestionOptionScore qsttQuestionOptionScore = null;
				     QsttQuestionOption qsttQuestionOption = null;
				     QsttQuestionOptionScoreId qsttQuestionOptionScoreId = null;
				     QsttQuestionOptionId qsttQuestionOptionId = null;					
					 qsttQuestionOptionScoreId  = new QsttQuestionOptionScoreId();
					 qsttQuestionOptionScore = new QsttQuestionOptionScore();
					 qsttQuestionOptionId = new QsttQuestionOptionId();
					 qsttQuestionOption = new QsttQuestionOption();
					 qsttAnswer = new QsttAnswer();
					 
					// adding AnswerOptions
					int answerOptionId = 1;
					
					if (questionnaireDistributionComponent.get(id) != null && questionnaireDistributionComponent.get(id).getAnswerOptionValue() != null && questionnaireDistributionComponent.get(id).getAnswerOptionValue().size() > 0) {
						for (int i = 0  ; i < questionnaireDistributionComponent.get(id).getAnswerOptionValue().size() ; i++) {
							
							// adding AnswerOptions
							qsttQuestionOptionId.setId(qc.getAnswerOptionId().get(i));
							qsttQuestionOptionId.setQsttQuestionId(qc.getQuestionId());
							qsttQuestionOption.setId(qsttQuestionOptionId);
							if(qc.getQsttAnswerId().get(i)!=0){
								qsttAnswer.setId(qc.getQsttAnswerId().get(i));
							}
							else if(qsttAnswer.getId()!=null){
								qsttAnswer.setId(null);								
							}
										
								qsttAnswer.setAnswerWord((qc.getAnswerOptionValue().get(i)!=null)?(qc.getAnswerOptionValue().get(i)):null);
							//}
							
			
							
							 //adding AnswerOptionScoreId 
							if(questionnaireDistributionComponent.get(id)!=null)
							{
								
									qsttQuestionOptionScoreId.setQuestionId(qc.getQuestionId());
									qsttQuestionOptionScoreId.setQuestionOptionId(qc.getAnswerOptionId().get(i));
									qsttQuestionOptionScore.setId(qsttQuestionOptionScoreId);
																
								
							}
							
							
							qsttAnswer.setCreateBy(100L);
							qsttAnswer.setCreateDate(new Date());
							qsttAnswer.setUpdateDate(new Date());
							qsttAnswer.setUpdateBy(100L);
							
							qsttQuestionnaire = new QsttQuestionnaire();
							qsttQuestionnaire.setId(qrId);
							
							
							qsttAnswer.setQsttQuestionnaire(qsttQuestionnaire);
							qsttAnswer.setQsttQuestionOption(qsttQuestionOption);
													
							qsttAnswerDao.saveQuestionnaireResponse(qsttAnswer);
							answerOptionId++;
						}
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
				id++;
				qsttQuestion = new QsttQuestion();
				qsttQuestionType = new QsttQuestionType();
				qsttQuestionMapId = new QsttQuestionMapId();
				qsttQuestionMap = new QsttQuestionMap();
				qsttQuestionnaireDef = new QsttQuestionnaireDef();
				qsttQuestionOptionId = new QsttQuestionOptionId();
				qsttQuestionOption = new QsttQuestionOption();
				qsttQuestionOptionScoreId = new QsttQuestionOptionScoreId();
				qsttQuestionOptionScore = new QsttQuestionOptionScore();
		}
			
		if(actionType.equalsIgnoreCase("save")){
			
			qsttQuestionnaireDao.updateQuestionnaire(qrId,"saved","");
			
			
		}else{
			qsttQuestionnaireDao.updateQuestionnaire(qrId,"submitted","Date");
		}
			
		}
		
	}
	
	
	
	

}



