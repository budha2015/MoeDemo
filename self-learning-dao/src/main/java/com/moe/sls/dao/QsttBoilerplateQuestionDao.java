package com.moe.sls.dao;

import com.moe.sls.model.QsttBoilerplateQuestion;

public interface QsttBoilerplateQuestionDao {
	public void saveTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	public void editTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	public void updateTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	public void deleteTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	
	
}
