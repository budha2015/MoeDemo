package com.moe.sls.model;

public class QuestionPlainRecord {
	private Long questionId;
	private String questionText;
	private Long answerOptionId;
	private String answerOptionValue;
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
	public Long getAnswerOptionId() {
		return answerOptionId;
	}
	public void setAnswerOptionId(Long answerOptionId) {
		this.answerOptionId = answerOptionId;
	}
	public String getAnswerOptionValue() {
		return answerOptionValue;
	}
	public void setAnswerOptionValue(String answerOptionValue) {
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
