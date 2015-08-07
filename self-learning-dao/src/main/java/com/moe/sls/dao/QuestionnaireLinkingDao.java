package com.moe.sls.dao;

import java.util.List;

import com.moe.sls.model.QsttLink;
import com.moe.sls.model.QsttScoreScheme;

public interface QuestionnaireLinkingDao {
	
	public void addQuestionnaireLink(QsttLink questionnaireLinking);

	public QsttLink getQuestionnaireLinkById(Long id);

	public void deleteQuestionnaireLink(Long id);

	public void deletePerticularQuestionnaireLink(Long qrId, Long linkId);

	public List<java.math.BigInteger> getLinkId(String linkName);

	public Long saveQsttLink(QsttLink qsttLink);

	public List<QsttScoreScheme> getLinkIdFromScoreScheme(Long id);

	public List getQuestionnairesByLinkId(Long id);
}
