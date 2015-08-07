package com.moe.sls.model;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QuestionComponent implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long questionnaireId;
	private Long questionnaireDefId;
	private List<Long> answerId=new ArrayList<Long>();;
	private Long answerScore;
	private List<String> answerWord=new ArrayList<String>();
	private String questionnaireName;
	private Long questionId;
	private String questionText;
	private List<Long> answerOptionId=new ArrayList<Long>();
	private List<String> answerOptionValue=new ArrayList<String>();
	private List<Short> answerOptionScore=new ArrayList<Short>();
	private Boolean questionMandatory;
	private Boolean questionAttachment;
	private String questionTag;
	private Boolean questionBanked;
	private String questionCategory;
	private String questionType;
	private Short questionOrder;
	private String sectionLabel;
	private Short sectionOrder;
	
	private Short optionOrder;
	private Short questionTypeId;
	private String questionDescription;
	private Integer questionCategoryId;
	private Long branchedQuestionId;
	private String source; //newly added
	private String status;
	private Boolean questionSkip;
	private String description;
	private String deftype;
	private String LegalName;
	private String linkedQuestionnaires; //newly added for business case
	private Date createDate; //newly added for business case
	private Long creatBy; //newly added for business case
	private String createdBy; //newly added for business case
	private Long userId;
	private String userName;
	private boolean branched;
	private boolean movement;
	
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getQuestionTag() {
		return questionTag;
	}
	public void setQuestionTag(String questionTag) {
		this.questionTag = questionTag;
	}
	public Boolean getQuestionBanked() {
		return questionBanked;
	}
	public void setQuestionBanked(Boolean questionBanked) {
		this.questionBanked = questionBanked;
	}
	public String getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
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
	public Short getOptionOrder() {
		return optionOrder;
	}
	public void setOptionOrder(Short optionOrder) {
		this.optionOrder = optionOrder;
	}
	public Short getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(Short questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	public String getQuestionDescription() {
		return questionDescription;
	}
	public void setQuestionDescription(String questionDescription) {
		this.questionDescription = questionDescription;
	}
	public Integer getQuestionCategoryId() {
		return questionCategoryId;
	}
	public void setQuestionCategoryId(Integer questionCategoryId) {
		this.questionCategoryId = questionCategoryId;
	}
	public Long getQuestionnaireDefId() {
		return questionnaireDefId;
	}
	public void setQuestionnaireDefId(Long questionnaireDefId) {
		this.questionnaireDefId = questionnaireDefId;
	}
	public Long getBranchedQuestionId() {
		return branchedQuestionId;
	}
	public void setBranchedQuestionId(Long branchedQuestionId) {
		this.branchedQuestionId = branchedQuestionId;
	}
	public List<Long> getAnswerId() {
		return answerId;
	}
	public void setAnswerId(List<Long> answerId) {
		this.answerId = answerId;
	}
	public Long getAnswerScore() {
		return answerScore;
	}
	public void setAnswerScore(Long answerScore) {
		this.answerScore = answerScore;
	}
	public List<String> getAnswerWord() {
		return answerWord;
	}
	public void setAnswerWord(List<String> answerWord) {
		this.answerWord = answerWord;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Boolean getQuestionSkip() {
		return questionSkip;
	}
	public void setQuestionSkip(Boolean questionSkip) {
		this.questionSkip = questionSkip;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDeftype() {
		return deftype;
	}
	public void setDeftype(String deftype) {
		this.deftype = deftype;
	}
	public String getLegalName() {
		return LegalName;
	}
	public void setLegalName(String legalName) {
		LegalName = legalName;
	}
	public String getLinkedQuestionnaires() {
		return linkedQuestionnaires;
	}
	public void setLinkedQuestionnaires(String linkedQuestionnaires) {
		this.linkedQuestionnaires = linkedQuestionnaires;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Long getCreatBy() {
		return creatBy;
	}
	public void setCreatBy(Long creatBy) {
		this.creatBy = creatBy;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public boolean isBranched() {
		return branched;
	}
	public void setBranched(boolean branched) {
		this.branched = branched;
	}
	public boolean isMovement() {
		return movement;
	}
	public void setMovement(boolean movement) {
		this.movement = movement;
	}
	
}
