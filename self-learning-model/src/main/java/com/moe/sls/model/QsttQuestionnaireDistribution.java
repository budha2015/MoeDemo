package com.moe.sls.model;

import java.util.Date;
import java.util.List;

public class QsttQuestionnaireDistribution {
	
	private Long id;
	private Long userId;
	private String recipientName;
	private String emailId;
	private Date sentOn;
	private Date repliedOn;
	private Boolean remove;
	private Long senderId;
	private String organisationName;
	private String strSentOn;
	private String strRepliedOn;
	private Long orgId;
	private List<String> strRecipient;
	private String recipientEmailId;
	

	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public Date getSentOn() {
		return sentOn;
	}
	public void setSentOn(Date sentOn) {
		this.sentOn = sentOn;
	}
	public Date getRepliedOn() {
		return repliedOn;
	}
	public void setRepliedOn(Date repliedOn) {
		this.repliedOn = repliedOn;
	}
	public Boolean getRemove() {
		return remove;
	}
	public void setRemove(Boolean remove) {
		this.remove = remove;
	}
	public Long getSenderId() {
		return senderId;
	}
	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}
	public String getOrganisationName() {
		return organisationName;
	}
	public void setOrganisationName(String organisationName) {
		this.organisationName = organisationName;
	}
	public String getStrSentOn() {
		return strSentOn;
	}
	public void setStrSentOn(String strSentOn) {
		this.strSentOn = strSentOn;
	}
	public String getStrRepliedOn() {
		return strRepliedOn;
	}
	public void setStrRepliedOn(String strRepliedOn) {
		this.strRepliedOn = strRepliedOn;
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public List<String> getStrRecipient() {
		return strRecipient;
	}
	public void setStrRecipient(List<String> strRecipient) {
		this.strRecipient = strRecipient;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRecipientEmailId() {
		return recipientEmailId;
	}
	public void setRecipientEmailId(String recipientEmailId) {
		this.recipientEmailId = recipientEmailId;
	}

}
