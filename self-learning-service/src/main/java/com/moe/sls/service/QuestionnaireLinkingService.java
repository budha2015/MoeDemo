package com.moe.sls.service;

import java.util.List;

import com.moe.sls.model.QsttLink;
import com.moe.sls.model.QsttQuestionnaireLink;
import com.moe.sls.model.QsttScoreScheme;



public interface QuestionnaireLinkingService {
	public void addQuestionnaireLink(QsttLink questionnaireLinking);
	public List<QsttQuestionnaireLink> listQuestionnaires(String deftype);
	public void deleteQuestionnaireLink(Long id);
	public void deletePerticularQuestionnaireLink(Long qrId, Long linkId);
	public void deleteScoreScheme(QsttScoreScheme qsttScoreScheme);
	public Long getLinkId(String linkName);
	public List getQuestionnairesByLinkId(Long id);
	public List<QsttScoreScheme> getLinkIdFromScoreScheme(Long id);
	
	public int deleteScoreSchemeByLinkId(Long id);
	public void saveScoreScheme(QsttScoreScheme qsttScoreScheme);
}
