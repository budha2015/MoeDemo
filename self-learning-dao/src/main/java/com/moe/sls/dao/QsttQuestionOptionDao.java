package com.moe.sls.dao;

import com.moe.sls.model.QsttQuestionOption;
import com.moe.sls.model.QsttQuestionOptionId;

public interface QsttQuestionOptionDao {
	public QsttQuestionOptionId addAnswerOption(QsttQuestionOption qsttQuestionOption);
	public QsttQuestionOptionId saveAnswers(QsttQuestionOption qsttQuestionOption);
}
