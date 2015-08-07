package com.moe.sls.serviceimpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;



import com.moe.sls.dao.QsttQuestionDao;
import com.moe.sls.model.Question;
import com.moe.sls.model.QuestionPlainRecord;
import com.moe.sls.service.RetrieveQuestionService;

@Service
public class RetrieveQuestionServiceImpl implements RetrieveQuestionService {
	
	@Autowired
	QsttQuestionDao qsttQuestionDao;

	//@Override
	public Question retrieveQuestion(Long id) {
		log.info("Control is in RetrieveQuestionServiceImpl");
		Question q=new Question();
		
		QuestionPlainRecord questionPlainRecord;
		
		List<QuestionPlainRecord> questionPlainRecordList = new ArrayList<QuestionPlainRecord>();
		
		String query="select qstt_question.id as 'QUESTION ID',qstt_question.qtext as 'QUESTION TEXT',qstt_question_option.id as 'ANSWER OPTION ID',qstt_question_option.option_value as 'ANSWER OPTION VALUE',qstt_question_type.id as 'QUESTION TYPE ID',qstt_question_type.name as 'QUESTION TYPE',qstt_question_category.id as 'QUESTION CATEGORY ID',qstt_question_category.name as 'QUESTION CATEGORY' from qstt_question left join qstt_question_option on qstt_question.id = qstt_question_option.qstt_question_id left join qstt_question_type on qstt_question.question_type_id = qstt_question_type.id left join qstt_question_category on qstt_question.question_category_id = qstt_question_category.id where qstt_question.id = ? Order By qstt_question.id,qstt_question_option.option_order";
				
		SQLQuery sqlQuery=qsttQuestionDao.getSQLQuery(query);
		
		sqlQuery.setParameter(0,id);
		
		
		
		List<Object[]> records = sqlQuery.list();
		
		log.info("Next Statement of calling list method");
		
		log.info("Records Size came from Database are:"+records.size());
		
		Iterator iterator = records.iterator();
		
		
		
		while(iterator.hasNext()){
			Object[] obj = (Object[])iterator.next();	
			questionPlainRecord = new QuestionPlainRecord();
			
//				questionPlainRecord.setQuestionId(((java.math.BigInteger)obj[0]).longValue());
				
				questionPlainRecord.setQuestionId(((java.math.BigInteger)(obj[0])).longValue());
				
				questionPlainRecord.setQuestionText((String)obj[1]);
				if(obj[2]!=null){
				log.info("AnswerOptionId:"+((java.math.BigInteger)obj[2]).longValue());
				questionPlainRecord.setAnswerOptionId(((java.math.BigInteger)obj[2]).longValue());
				log.info("AnswerOptionValue:"+(String)obj[3]);
				questionPlainRecord.setAnswerOptionValue((String)obj[3]);	
				}
				else{
				questionPlainRecord.setAnswerOptionValue("");	
				}
				questionPlainRecord.setQuestionTypeId((Short)obj[4]);
				questionPlainRecord.setQuestionType((String)obj[5]);
				questionPlainRecord.setQuestionCategoryId((Integer)obj[6]);
				questionPlainRecord.setQuestionCategory((String)obj[7]);	
				questionPlainRecordList.add(questionPlainRecord);
				questionPlainRecord=null;
				obj=null;
		}
		
		//log.info("QuestionPlainRecordList Size is:"+questionPlainRecordList.size());
		
		Map<Long,Question> map = new TreeMap<Long,Question>();
		
		for(int i=0;i<questionPlainRecordList.size();i++){
		if(map.get((questionPlainRecordList.get(i)).getQuestionId())==null){
			q.setQuestionId((questionPlainRecordList.get(i)).getQuestionId());
			q.setQuestionText((questionPlainRecordList.get(i)).getQuestionText());
			(q.getAnswerOptionId()).add(i,(questionPlainRecordList.get(i)).getAnswerOptionId());
			(q.getAnswerOptionValue()).add((questionPlainRecordList.get(i)).getAnswerOptionValue());
			q.setQuestionTypeId((questionPlainRecordList.get(i)).getQuestionTypeId());
			q.setQuestionType((questionPlainRecordList.get(i)).getQuestionType());
			q.setQuestionCategoryId((questionPlainRecordList.get(i)).getQuestionCategoryId());
			q.setQuestionCategory((questionPlainRecordList.get(i)).getQuestionCategory());
			map.put((questionPlainRecordList.get(i)).getQuestionId(),q);
		}
		else{
			(q.getAnswerOptionId()).add(i,(questionPlainRecordList.get(i)).getAnswerOptionId());
			(q.getAnswerOptionValue()).add((questionPlainRecordList.get(i)).getAnswerOptionValue());
			map.put((questionPlainRecordList.get(i)).getQuestionId(),q);					
		}
		}
		
		//log.info("Map Size After Additions:"+map.size());
		
		Set<Map.Entry<Long,Question>> s = map.entrySet();
		
		Iterator iterator1 = s.iterator();
		
		while(iterator1.hasNext()){
			Map.Entry<Long,Question> mEntry = (Map.Entry<Long, Question>)iterator1.next();
			//log.info("Question Id in Entry is:"+mEntry.getKey());
			Question question = mEntry.getValue();
			/*log.info("Question Id is:"+question.getQuestionId());
			log.info("Question Text is:"+question.getQuestionText());
			log.info("AnswerOption Ids are :");*/
			List<Long> answerOptionIds = question.getAnswerOptionId();
			//log.info("AnswerOptionId List Size is:"+answerOptionIds.size());
			for(Long l:answerOptionIds){
				//log.info("Id:"+l);
			}
			List<String> answerOptionValues = question.getAnswerOptionValue();
			//log.info("AnswerOptionValues List Size is:"+answerOptionValues.size());
			for(String str:answerOptionValues){
				//log.info("Value:"+str);
			}
			/*log.info("QuestionType Id is:"+question.getQuestionTypeId());
			log.info("QuestionType Name is:"+question.getQuestionType());
			log.info("Question Category Id is:"+question.getQuestionCategoryId());
			log.info("QuestionCategory Name is:"+question.getQuestionCategory());*/
		}		
		return q;
	}

}
