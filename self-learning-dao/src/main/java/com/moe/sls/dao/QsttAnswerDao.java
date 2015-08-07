package com.moe.sls.dao;

import java.util.List;

import com.moe.sls.model.QsttAnswer;

public interface QsttAnswerDao {
	public void saveQuestionnaireResponse(QsttAnswer qsttAnswer);
	public List<QsttAnswer> getQsttAnswerList();
}
