package com.moe.sls.serviceimpl;

import java.util.List;



import com.moe.sls.dao.QsttBoilerplateDao;
import com.moe.sls.model.QsttQuestionMap;
import com.moe.sls.model.QsttQuestionMapId;
import com.moe.sls.model.QsttQuestionnaireDef;
import com.moe.sls.service.TemplateService;

public class TemplateServiceImpl implements TemplateService {
	
	@Autowired
	QsttBoilerplateDao qsttBoilerplateDao;
	
	@Autowired
	QsttQuestionMapId qsttQuestionMapId;
	
	@Autowired
	QsttQuestionMap qsttQuestionMap;
	
	@Autowired
	QsttQuestionnaireDef qsttQuestionnaireDef;
	
	@Autowired
	QuestionnaireService questionnaireService; 

	//@Override
	public List getQuestionIds(long templateId) {
		
		List list =qsttBoilerplateDao.getQuestionsByTemplateId(templateId);
		
		System.out.println("List Size Came from Dao is:"+list.size());
		
		for(Object o:list){
			System.out.println("Question Id is:"+o);
		}		
		
		return list;
	}

	//@Override
	public void saveQuestionsIntoMap(List questionIdsofTemplateId,Long questionnaireId,String secName) {
		
		for(Object o:questionIdsofTemplateId){
			
//			System.out.println("Long Value...."+(Long)o);
		if(!(o.toString()).equals("")){
		qsttQuestionMapId.setQsttQuestionId(new Long(o.toString()));

		qsttQuestionMapId.setQsttQuestionnaireDefId(questionnaireId);
		qsttQuestionMap.setId(qsttQuestionMapId);
//		qsttQuestionMap.setQsttQuestion(qsttQuestion);
		qsttQuestionnaireDef.setId(questionnaireId);
		qsttQuestionMap.setQsttQuestionnaireDef(qsttQuestionnaireDef);
		qsttQuestionMap.setSectionLabel(secName != null? "Default" : "Default");
		System.out.println("SectionLabel()======"+qsttQuestionMap.getSectionLabel());
		qsttQuestionMap.setSectionOrder((short)1);
		System.out.println("SectionOrder()==========="+qsttQuestionMap.getSectionOrder());
		qsttQuestionMap.setTagName("");
		qsttQuestionMap.setIsMandatory(true);
		qsttQuestionMap.setIsAttachment(false);
		qsttQuestionMap.setIsBranch(true);
		questionnaireService.createQsttQuestionMap(qsttQuestionMap);
		}
		}
		
	}
	
	

}
