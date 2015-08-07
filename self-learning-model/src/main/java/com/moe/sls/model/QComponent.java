package com.moe.sls.model;
import java.io.Serializable;
import java.util.Date;

public class QComponent implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	private String sectionLabel;
	private Long questionnaireDefId;
	private Long answerId;
	private Long answerScore;
	private String answerWord;
	private Long questionnaireId;
	private String questionnaireName;
	private Integer questionCategoryId;
	private String questionText;
	private String questionDescription;
	private Short questionTypeId;
	private Short sectionOrder;
	private Short questionOrder;
	private Short optionOrder;
	private Long answerOptionId;
	private String answerOptionValue;
	private Short answerOptionScore;
	private Long questionId;	
	private Boolean questionMandatory;	
	private String questionTag;
	private Boolean questionBanked;
	private String questionCategory;
	private String questionType;
	private Boolean questionAttachment;
	private Long branchedQuestionId;
	private String source;
	private String status;
	private String description;
	private String deftype;
	private String legalname;
	private Date creatDate; //newly added for business case
	private Long creatBy; //newly added for business case
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
	public String getLegalname() {
		return legalname;
	}
	public void setLegalname(String legalname) {
		this.legalname = legalname;
	}
	public String getSectionLabel() {
		return sectionLabel;
	}
	public void setSectionLabel(String sectionLabel) {
		this.sectionLabel = sectionLabel;
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
	public Integer getQuestionCategoryId() {
		return questionCategoryId;
	}
	public void setQuestionCategoryId(Integer questionCategoryId) {
		this.questionCategoryId = questionCategoryId;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public String getQuestionDescription() {
		return questionDescription;
	}
	public void setQuestionDescription(String questionDescription) {
		this.questionDescription = questionDescription;
	}
	public Short getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(Short questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	public Short getSectionOrder() {
		return sectionOrder;
	}
	public void setSectionOrder(Short sectionOrder) {
		this.sectionOrder = sectionOrder;
	}
	public Short getQuestionOrder() {
		return questionOrder;
	}
	public void setQuestionOrder(Short questionOrder) {
		this.questionOrder = questionOrder;
	}
	public Short getOptionOrder() {
		return optionOrder;
	}
	public void setOptionOrder(Short optionOrder) {
		this.optionOrder = optionOrder;
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
	public Short getAnswerOptionScore() {
		return answerOptionScore;
	}
	public void setAnswerOptionScore(Short answerOptionScore) {
		this.answerOptionScore = answerOptionScore;
	}
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public Boolean getQuestionMandatory() {
		return questionMandatory;
	}
	public void setQuestionMandatory(Boolean questionMandatory) {
		this.questionMandatory = questionMandatory;
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
	public Boolean getQuestionAttachment() {
		return questionAttachment;
	}
	public void setQuestionAttachment(Boolean questionAttachment) {
		this.questionAttachment = questionAttachment;
	}
	public Long getBranchedQuestionId() {
		return branchedQuestionId;
	}
	public void setBranchedQuestionId(Long branchedQuestionId) {
		this.branchedQuestionId = branchedQuestionId;
	}
	public Long getQuestionnaireDefId() {
		return questionnaireDefId;
	}
	public void setQuestionnaireDefId(Long questionnaireDefId) {
		this.questionnaireDefId = questionnaireDefId;
	}
	public Long getAnswerId() {
		return answerId;
	}
	public void setAnswerId(Long answerId) {
		this.answerId = answerId;
	}
	public Long getAnswerScore() {
		return answerScore;
	}
	public void setAnswerScore(Long answerScore) {
		this.answerScore = answerScore;
	}
	public String getAnswerWord() {
		return answerWord;
	}
	public void setAnswerWord(String answerWord) {
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
	public Date getCreatDate() {
		return creatDate;
	}
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	public Long getCreatBy() {
		return creatBy;
	}
	public void setCreatBy(Long creatBy) {
		this.creatBy = creatBy;
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

