package com.moe.sls.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class RecordPojo {
	
	List<String> questionTagNames =  new ArrayList<String>();
	public Map<String,LinkedList<String>> questionText = new LinkedHashMap<String,LinkedList<String>>();
	
	Long questionId;
	Long qsttQuestionnaireDefId;
	Map<String,LinkedList<Long>> answerOptionId = new LinkedHashMap<String,LinkedList<Long>>();
	Map<String,LinkedList<Byte>> skip = new LinkedHashMap<String,LinkedList<Byte>>();
	Map<String,LinkedList<Byte>> mandatory = new LinkedHashMap<String,LinkedList<Byte>>();
	Map<String,LinkedList<Byte>> attachment = new LinkedHashMap<String,LinkedList<Byte>>();
	Long destQuestionnnaireId;
	Map<String,LinkedList<Long>> destQuestionId = new LinkedHashMap<String,LinkedList<Long>>();
	Long destQuestionnaireDefId;
	public Map<String,LinkedList<String>> answerOptionValues = new LinkedHashMap<String,LinkedList<String>>();
	
	public Map<String,LinkedList<Long>> answerOptionIds = new LinkedHashMap<String,LinkedList<Long>>();
	
	public Map<String, LinkedList<Long>> getAnswerOptionIds() {
		return answerOptionIds;
	}
	public void setAnswerOptionIds(Map<String, LinkedList<Long>> answerOptionIds) {
		this.answerOptionIds = answerOptionIds;
	}
	public Map<String, LinkedList<Boolean>> getIsMandatory() {
		return isMandatory;
	}
	public void setIsMandatory(Map<String, LinkedList<Boolean>> isMandatory) {
		this.isMandatory = isMandatory;
	}
	public Map<String, LinkedList<Boolean>> getIsAttachment() {
		return isAttachment;
	}
	public void setIsAttachment(Map<String, LinkedList<Boolean>> isAttachment) {
		this.isAttachment = isAttachment;
	}
	public LinkedList<String> sourceQuestionTagNames = new LinkedList<String>();
	
	public Map<String,LinkedList<String>> destinationQuestionTagNames = new LinkedHashMap<String,LinkedList<String>>();
	
	public Map<String,Short> questionTypeId = new LinkedHashMap<String,Short>();	
	
	public Map<String,LinkedList<Boolean>> isSkip = new LinkedHashMap<String,LinkedList<Boolean>>();
	
	public Map<String,LinkedList<Boolean>> isMandatory = new LinkedHashMap<String,LinkedList<Boolean>>();
	
	public Map<String,LinkedList<Boolean>> isAttachment = new LinkedHashMap<String,LinkedList<Boolean>>();
	
	public LinkedList<Long> branchIds = new LinkedList<Long>();
	
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public Long getQsttQuestionnaireDefId() {
		return qsttQuestionnaireDefId;
	}
	public void setQsttQuestionnaireDefId(Long qsttQuestionnaireDefId) {
		this.qsttQuestionnaireDefId = qsttQuestionnaireDefId;
	}	
	public Long getDestQuestionnnaireId() {
		return destQuestionnnaireId;
	}
	public void setDestQuestionnnaireId(Long destQuestionnnaireId) {
		this.destQuestionnnaireId = destQuestionnnaireId;
	}	
	public Long getDestQuestionnaireDefId() {
		return destQuestionnaireDefId;
	}
	public void setDestQuestionnaireDefId(Long destQuestionnaireDefId) {
		this.destQuestionnaireDefId = destQuestionnaireDefId;
	}
	
	public Map<String, LinkedList<Byte>> getSkip() {
		return skip;
	}
	public void setSkip(Map<String, LinkedList<Byte>> skip) {
		this.skip = skip;
	}
	public Map<String, LinkedList<Byte>> getMandatory() {
		return mandatory;
	}
	public void setMandatory(Map<String, LinkedList<Byte>> mandatory) {
		this.mandatory = mandatory;
	}
	public Map<String, LinkedList<Long>> getDestQuestionId() {
		return destQuestionId;
	}
	public void setDestQuestionId(Map<String, LinkedList<Long>> destQuestionId) {
		this.destQuestionId = destQuestionId;
	}	
	public Map<String, LinkedList<Long>> getAnswerOptionId() {
		return answerOptionId;
	}
	public void setAnswerOptionId(Map<String, LinkedList<Long>> answerOptionId) {
		this.answerOptionId = answerOptionId;
	}
	public LinkedList<String> getSourceQuestionTagNames() {
		return sourceQuestionTagNames;
	}
	public void setSourceQuestionTagNames(LinkedList<String> sourceQuestionTagNames) {
		this.sourceQuestionTagNames = sourceQuestionTagNames;
	}
	public Map<String, LinkedList<String>> getAnswerOptionValues() {
		return answerOptionValues;
	}
	public void setAnswerOptionValues(
			Map<String, LinkedList<String>> answerOptionValues) {
		this.answerOptionValues = answerOptionValues;
	}
	public Map<String, LinkedList<String>> getDestinationQuestionTagNames() {
		return destinationQuestionTagNames;
	}
	public void setDestinationQuestionTagNames(
			Map<String, LinkedList<String>> destinationQuestionTagNames) {
		this.destinationQuestionTagNames = destinationQuestionTagNames;
	}
	public Map<String, Short> getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(Map<String, Short> questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	public Map<String, LinkedList<Boolean>> getIsSkip() {
		return isSkip;
	}
	public void setIsSkip(Map<String, LinkedList<Boolean>> isSkip) {
		this.isSkip = isSkip;
	}
	public Map<String, LinkedList<Byte>> getAttachment() {
		return attachment;
	}
	public void setAttachment(Map<String, LinkedList<Byte>> attachment) {
		this.attachment = attachment;
	}
	public List<String> getQuestionTagNames() {
		return questionTagNames;
	}
	public void setQuestionTagNames(List<String> questionTagNames) {
		this.questionTagNames = questionTagNames;
	}
	public Map<String, LinkedList<String>> getQuestionText() {
		return questionText;
	}
	public void setQuestionText(Map<String, LinkedList<String>> questionText) {
		this.questionText = questionText;
	}
	public LinkedList<Long> getBranchIds() {
		return branchIds;
	}
	public void setBranchIds(LinkedList<Long> branchIds) {
		this.branchIds = branchIds;
	}
	
	
}
