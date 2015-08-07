package com.moe.sls.dao;

import com.moe.sls.model.QsttQuestionOptionScore;
import com.moe.sls.model.QsttQuestionOptionScoreId;

public interface QsttQuestionOptionScoreDao {
	
	public void deleteQuestion(QsttQuestionOptionScore qsttQuestionOptionScore);
	public QsttQuestionOptionScoreId addAnswerOptionScore(QsttQuestionOptionScore qsttQuestionOptionScore);
}
