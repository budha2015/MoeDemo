package com.moe.sls.dao;

import java.util.List;

import com.moe.sls.model.QsttQuestionnaireLink;

public interface QsttQuestionnaireDao {
	public List<QsttQuestionnaireLink> listQuestionnaires(String deftype);
	public int updateQuestionnaire(Long qrId,String status, String date);

}
