package com.moe.sls.service;

public class BranchingValue {
	public Long questionId;
	public String questionText;
	public String questionTagName;
	public Short questionTypeId;
	public boolean skip;
	public boolean mandatory;
	public boolean attachment;
	public String destinationTagName;
	public Long answerOptionId;
	public Long branchId;
	public Integer order;
	
	public BranchingValue(){
		//log.info("Branching Value Object is Created");
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

	public String getQuestionTagName() {
		return questionTagName;
	}

	public void setQuestionTagName(String questionTagName) {
		this.questionTagName = questionTagName;
	}

	public boolean isSkip() {
		return skip;
	}

	public void setSkip(boolean skip) {
		this.skip = skip;
	}

	public boolean isMandatory() {
		return mandatory;
	}

	public void setMandatory(boolean mandatory) {
		this.mandatory = mandatory;
	}

	public boolean isAttachment() {
		return attachment;
	}

	public void setAttachment(boolean attachment) {
		this.attachment = attachment;
	}

	public String getDestinationTagName() {
		return destinationTagName;
	}

	public void setDestinationTagName(String destinationTagName) {
		this.destinationTagName = destinationTagName;
	}

	public Short getQuestionTypeId() {
		return questionTypeId;
	}

	public void setQuestionTypeId(Short questionTypeId) {
		this.questionTypeId = questionTypeId;
	}

	public Long getAnswerOptionId() {
		return answerOptionId;
	}

	public void setAnswerOptionId(Long answerOptionId) {
		this.answerOptionId = answerOptionId;
	}

	public Long getBranchId() {
		return branchId;
	}

	public void setBranchId(Long branchId) {
		this.branchId = branchId;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	
}
