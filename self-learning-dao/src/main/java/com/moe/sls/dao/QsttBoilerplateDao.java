package com.moe.sls.dao;

import java.util.List;

import com.moe.sls.model.QsttBoilerplate;
import com.moe.sls.model.QsttBoilerplateQuestion;


public interface QsttBoilerplateDao {
	
	public Long saveTemplate(QsttBoilerplate qtemplate);
	public void updateTemplate(QsttBoilerplate qtemplate);
	public void deleteTemplate(QsttBoilerplate qtemplate);
	public List<QsttBoilerplate>  getBoilerplateList();
	public List<QsttBoilerplateQuestion> getQuestionsByTemplateId(Long id);
	public List<java.math.BigInteger> getTemplateId(String tempName);

}
