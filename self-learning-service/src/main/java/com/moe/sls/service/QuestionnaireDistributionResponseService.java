package com.moe.sls.service;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import com.moe.sls.model.QsttAnswer;
import com.moe.sls.model.QuestionComponent;
import com.moe.sls.model.QuestionnaireDistributionComponent;

public interface QuestionnaireDistributionResponseService {
	public LinkedHashMap<String, LinkedList<QuestionComponent>> retrieveQuestionnaire(
			Long questionnaireId);

	public void saveQuestionnaireResponse(QsttAnswer qsttAnswer);

	public void saveQuestionnaireResponse(
			List<QuestionnaireDistributionComponent> questionnaireDistributionComponent);

	public List<QsttAnswer> getQsttAnswerList();
}
