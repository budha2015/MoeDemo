package com.moe.sls.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.moe.sls.dao.MyException;
import com.moe.sls.model.QuestionComponent;
import com.moe.sls.model.RecordPojo;

public interface BranchingService {
	List<QuestionComponent> getBranchedQuestions(Long questionnaireId,String sourceQuestionTagName);
	boolean saveBranchedQuestionsData(List<QuestionComponent> branchedQuestionComponents,Map<String,String[]> map,List<String> selectedOnes,List<QuestionComponent> retrieveQuestionnaireComponents,RecordPojo recordPojo,boolean fromWhichMethod,String removeBranchingIdsList,String updateBranchingIdsList,Map<String,LinkedList<BranchingValue>> targetQuestionsOrder) throws MyException;
	RecordPojo branchPreview(long id);
	List<String> saveTargetQuestions(Long questionnaireId,String sourceQuestionTagName);
	TreeMap<String,Short> saveTargetQuestions(Long questionnaireId,TreeMap<String,Short> tagNamesOrderMap,String sourceQuestionTagName);
	RecordPojo existingBranchRelatedInfo(Long questionnaireId,Long selectedTagQuestionId);
	boolean delSection(String sectionLabel,Long questionnaireId);
//	RecordPojo showPreview(Enumeration parameterNames,Map<String, String[]> parameterValues,List<String> selectedOnes,List<QuestionComponent> retrieveQuestionnaireComponents)throws MyException;
	List<String> reArrangeSelectedOnes(List<QuestionComponent> branchedQuestionComponents,List<String> selectedOnes);
	Map<String,LinkedList<BranchingValue>> getTargetQuestionsOrder(String targetQuestions,List<QuestionComponent> retrieveQuestionnaireComponents,List<String> selectedOnes);
}
