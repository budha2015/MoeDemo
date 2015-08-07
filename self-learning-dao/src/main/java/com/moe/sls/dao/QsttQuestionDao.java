package com.moe.sls.dao;

import com.moe.sls.model.QsttQuestion;

public interface QsttQuestionDao{
	
	public Long createQuestion(QsttQuestion qsttQuestion);
	public void modifyQuestion(QsttQuestion qsttQuestion);
}
