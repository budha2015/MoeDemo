package com.moe.sls.service;

import com.moe.sls.model.QsttBoilerplateQuestion;

public interface QsttBoilerplateQuestionService {
	
	public void saveTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	public void deleteTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	public void editTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	public void updateTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);

}
