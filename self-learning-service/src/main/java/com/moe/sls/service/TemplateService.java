package com.moe.sls.service;

import java.util.List;


public interface TemplateService {
	
	List getQuestionIds(long templateId);
	
	void saveQuestionsIntoMap(List questionIdsofTemplateId,Long questionnaireId,String secName);

}
