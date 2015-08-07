package com.moe.sls.service;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import com.moe.sls.model.QuestionComponent;
public interface RetrieveQuestionnaireService {	
	
	public List<QuestionComponent> retrieveQuestionnaire(Long questionnaireId);
//	public TreeMap<String,LinkedList<QuestionComponent>> retrieveSectionBasedQuestionnaire(Long questionnaireId);
	public LinkedHashMap<String,LinkedList<QuestionComponent>> retrieveSectionBasedQuestionnaire(Long questionnaireId);
//	public TreeMap<String,LinkedList<QuestionComponent>> retrieveBankRelatedQuestionnaire(Long questionnaireId,List questionIds);
	public LinkedHashMap<String,LinkedList<QuestionComponent>> retrieveBankRelatedQuestionnaire(Long questionnaireId,List questionIds,String sectionName);

}
