package com.moe.sls.dao;

import java.util.List;

import com.moe.sls.model.QsttQuestionnaireDef;

public interface QsttQuestionnaireDefDao {
	
	public Long createQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef);
	
	public List<String> getAllQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef);
	
	public List<String> getAllQuestionnaireWithDescription(QsttQuestionnaireDef qsttQuestionnaireDef);
	
}
