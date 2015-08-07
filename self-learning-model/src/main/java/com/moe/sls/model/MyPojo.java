package com.moe.sls.model;

import java.util.ArrayList;
import java.util.List;

public class MyPojo {
	List<String> questionTagNames =  new ArrayList<String>();
	String questionText;
	List<String> answerOptionValue = new ArrayList<String>();
	String thisQuestionTagName;
	List<Long> answerOptionIds = new ArrayList<Long>(); //newly added
	Short questionTypeId; //newly added
	
	public List<String> getQuestionTagNames() {
		return questionTagNames;
	}
	public void setQuestionTagNames(List<String> questionTagNames) {
		this.questionTagNames = questionTagNames;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public List<String> getAnswerOptionValue() {
		return answerOptionValue;
	}
	public void setAnswerOptionValue(List<String> answerOptionValue) {
		this.answerOptionValue = answerOptionValue;
	}
	public String getThisQuestionTagName() {
		return thisQuestionTagName;
	}
	public void setThisQuestionTagName(String thisQuestionTagName) {
		this.thisQuestionTagName = thisQuestionTagName;
	}
	public List<Long> getAnswerOptionIds() {
		return answerOptionIds;
	}
	public void setAnswerOptionIds(List<Long> answerOptionIds) {
		this.answerOptionIds = answerOptionIds;
	}
	public Short getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(Short questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	
	
	
}
