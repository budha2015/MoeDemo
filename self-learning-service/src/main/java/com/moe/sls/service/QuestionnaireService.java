package com.moe.sls.service;

import java.util.List;

import com.moe.sls.model.QsttBoilerplateQuestion;
import com.moe.sls.model.QsttLegaNames;
import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionMap;
import com.moe.sls.model.QsttQuestionMapId;
import com.moe.sls.model.QsttQuestionOption;
import com.moe.sls.model.QsttQuestionOptionId;
import com.moe.sls.model.QsttQuestionOptionScore;
import com.moe.sls.model.QsttQuestionOptionScoreId;
import com.moe.sls.model.QsttQuestionnaireDef;
import com.moe.sls.model.QuestionSetUpComponent;

public interface QuestionnaireService {
	
	public String checkDuplicateQuestion(QuestionSetUpComponent questionSetUpComponent);

	public void createQuestionSetUp(QuestionSetUpComponent questionSetUpComponent);
	
	public void createQuestionnaireSetUp(List<QuestionSetUpComponent> questionSetUpComponent);
	
	public Long createQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef);

	public Long createQuestion(QsttQuestion qsttQuestion);
	
	public QsttQuestionMapId createQsttQuestionMap(QsttQuestionMap qsttQuestionMap);
	
	public QsttQuestionOptionId addAnswerOption(QsttQuestionOption qsttQuestionOption);
	
	public QsttQuestionOptionId saveAnswers(QsttQuestionOption qsttQuestionOption);
	
	public QsttQuestionOptionScoreId addAnswerOptionScore(QsttQuestionOptionScore qsttQuestionOptionScore);
	
	public void deleteQuestion();
	
	public List<String> getAllQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef);
	
	public List<String> getAllQuestionnaireWithDescription(QsttQuestionnaireDef qsttQuestionnaireDef);
	
	public void updateQuestion(QsttQuestion qsttQuestion);
	
	public void saveTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion);
	
	public List<QsttLegaNames> getLegaNameList(String legalNameToSearch);
	
	public void modifyQuestion(QsttQuestion qsttQuestion);
	
	public List<String> getNamaDecs(Long id);
}
