package com.moe.sls.service;

import java.util.List;

import com.moe.sls.model.QsttBoilerplate;
import com.moe.sls.model.QsttBoilerplateQuestion;
import com.moe.sls.model.QsttQuestionBank;

public interface QsttBoilerplateService {
	
	public void saveTemplate(QsttBoilerplate questionnaireTemplate);

	public void updateTemplate(QsttBoilerplate questionnaireTemplate);
	
	public void deleteTemplate(QsttBoilerplate questionnaireTemplate);
	
	public QsttBoilerplate viewTemplate(Long id);
	
	public List<QsttQuestionBank> viewQuestionBank();
	
	public List<QsttBoilerplateQuestion> getQuestionsByTemplateId(Long id);

	List<QsttBoilerplate> getBoilerplateList();
	
	public Long getTemplateId(String tempName);
	
	public List<QsttQuestionBank> viewQuestionOfBank();

}
