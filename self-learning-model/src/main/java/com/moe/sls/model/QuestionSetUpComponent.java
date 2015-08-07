package com.moe.sls.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class QuestionSetUpComponent implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long questionnaireId;
	private String questionnaireName;
	private Long questionId;
	private String questionText;
	private List<Long> answerOptionId;
	private List<String> answerOptionValue = new ArrayList<String>();
	private List<Short> answerOptionScore = new ArrayList<Short>();
	private Boolean questionMandatory;
	private Boolean questionAttachment;
	private String questionTag;
	private Integer questionCategory;
	private Short questionType;
	private Short questionOrder;
	private String sectionLabel;
	private Short sectionOrder;
	private Boolean isActive;
	private Boolean isBanked;
	private String temPlate;
	private Long templatId;
	private Long userId; //new added property
	
	public Long getTemplatId() {
		return templatId;
	}
	public void setTemplatId(Long templatId) {
		this.templatId = templatId;
	}
	public String getTemPlate() {
		return temPlate;
	}
	public void setTemPlate(String temPlate) {
		this.temPlate = temPlate;
	}
	public Long getQuestionnaireId() {
		return questionnaireId;
	}
	public void setQuestionnaireId(Long questionnaireId) {
		this.questionnaireId = questionnaireId;
	}
	public String getQuestionnaireName() {
		return questionnaireName;
	}
	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}
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
	public List<Short> getAnswerOptionScore() {
		return answerOptionScore;
	}
	public void setAnswerOptionScore(List<Short> answerOptionScore) {
		this.answerOptionScore = answerOptionScore;
	}
	public Boolean getQuestionMandatory() {
		return questionMandatory;
	}
	public void setQuestionMandatory(Boolean questionMandatory) {
		this.questionMandatory = questionMandatory;
	}
	public Boolean getQuestionAttachment() {
		return questionAttachment;
	}
	public void setQuestionAttachment(Boolean questionAttachment) {
		this.questionAttachment = questionAttachment;
	}
	
	public Integer getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(Integer questionCategory) {
		this.questionCategory = questionCategory;
	}
	public Short getQuestionType() {
		return questionType;
	}
	public void setQuestionType(Short questionType) {
		this.questionType = questionType;
	}
	public Short getQuestionOrder() {
		return questionOrder;
	}
	public void setQuestionOrder(Short questionOrder) {
		this.questionOrder = questionOrder;
	}
	public String getSectionLabel() {
		return sectionLabel;
	}
	public void setSectionLabel(String sectionLabel) {
		this.sectionLabel = sectionLabel;
	}
	public Short getSectionOrder() {
		return sectionOrder;
	}
	public void setSectionOrder(Short sectionOrder) {
		this.sectionOrder = sectionOrder;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public Boolean getIsBanked() {
		return isBanked;
	}
	public void setIsBanked(Boolean isBanked) {
		this.isBanked = isBanked;
	}
	public String getQuestionTag() {
		return questionTag;
	}
	public void setQuestionTag(String questionTag) {
		this.questionTag = questionTag;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
}
