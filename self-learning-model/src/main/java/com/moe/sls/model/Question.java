package com.moe.sls.model;

import java.util.ArrayList;
import java.util.List;

public class Question {
	private Long questionId;
	private String questionText;
	private List<Long> answerOptionId = new ArrayList<Long>();
	private List<String> answerOptionValue = new ArrayList<String>();
	private Short questionTypeId;
	private String questionType;
	private Integer questionCategoryId;
	private String questionCategory;
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public List<Long> getAnswerOptionId() {
		return answerOptionId;
	}
	public void setAnswerOptionId(List<Long> answerOptionId) {
		this.answerOptionId = answerOptionId;
	}
	public List<String> getAnswerOptionValue() {
		return answerOptionValue;
	}
	public void setAnswerOptionValue(List<String> answerOptionValue) {
		this.answerOptionValue = answerOptionValue;
	}
	public Short getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(Short questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public Integer getQuestionCategoryId() {
		return questionCategoryId;
	}
	public void setQuestionCategoryId(Integer questionCategoryId) {
		this.questionCategoryId = questionCategoryId;
	}
	public String getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}
	
}
