package com.moe.sls.model;
// Generated Aug 1, 2014 11:32:18 AM by Hibernate Tools 3.6.0


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



/**
 * Questionnaire generated by hbm2java
 */
public class Questionnaire {


     private Long id;
     private long sender;
     private Date sentOn;
     private Date submitedDate;
     private long responder;
     private List<BigInteger> recipient;
     private QuestionnaireStatus status;
     private short totalScore;
     private Long thirdParty;
     private byte isActive;
     private Integer versionNumber;
     private Date validityStartDate;
     private Date validityEndDate;
     private long questionnaireDef;
     private String organisationName;
     
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the sender
	 */
	public Long getSender() {
		return sender;
	}
	/**
	 * @param sender the sender to set
	 */
	public void setSender(long sender) {
		this.sender = sender;
	}
	/**
	 * @return the sentOn
	 */
	public Date getSentOn() {
		return sentOn;
	}
	/**
	 * @param sentOn the sentOn to set
	 */
	public void setSentOn(Date sentOn) {
		this.sentOn = sentOn;
	}
	/**
	 * @return the submitedDate
	 */
	public Date getSubmitedDate() {
		return submitedDate;
	}
	/**
	 * @param submitedDate the submitedDate to set
	 */
	public void setSubmitedDate(Date submitedDate) {
		this.submitedDate = submitedDate;
	}
	/**
	 * @return the responder
	 */
	public Long getResponder() {
		return responder;
	}
	/**
	 * @param responder the responder to set
	 */
	public void setResponder(long responder) {
		this.responder = responder;
	}
	/**
	 * @return the recipient
	 */
	public List<BigInteger> getRecipient() {
		return recipient;
	}
	/**
	 * @param recipient the recipient to set
	 */
	public void setRecipient(String[] recipient) {
		
		List<BigInteger> datalist = new ArrayList<BigInteger>();
		for(String s : recipient){
			datalist.add(new BigInteger(s));
		}
		this.recipient = datalist;
	}
	/**
	 * @return the status
	 */
	public QuestionnaireStatus getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(QuestionnaireStatus status) {
		this.status = status;
	}
	/**
	 * @return the totalScore
	 */
	public short getTotalScore() {
		return totalScore;
	}
	/**
	 * @param totalScore the totalScore to set
	 */
	public void setTotalScore(short totalScore) {
		this.totalScore = totalScore;
	}
	/**
	 * @return the thirdParty
	 */
	public Long getThirdParty() {
		return thirdParty;
	}
	/**
	 * @param thirdParty the thirdParty to set
	 */
	public void setThirdParty(Long thirdParty) {
		this.thirdParty = thirdParty;
	}
	/**
	 * @return the isActive
	 */
	public byte getIsActive() {
		return isActive;
	}
	/**
	 * @param isActive the isActive to set
	 */
	public void setIsActive(byte isActive) {
		this.isActive = isActive;
	}
	/**
	 * @return the versionNumber
	 */
	public Integer getVersionNumber() {
		return versionNumber;
	}
	/**
	 * @param versionNumber the versionNumber to set
	 */
	public void setVersionNumber(Integer versionNumber) {
		this.versionNumber = versionNumber;
	}
	/**
	 * @return the validityStartDate
	 */
	public Date getValidityStartDate() {
		return validityStartDate;
	}
	/**
	 * @param validityStartDate the validityStartDate to set
	 */
	public void setValidityStartDate(Date validityStartDate) {
		this.validityStartDate = validityStartDate;
	}
	/**
	 * @return the validityEndDate
	 */
	public Date getValidityEndDate() {
		return validityEndDate;
	}
	/**
	 * @param validityEndDate the validityEndDate to set
	 */
	public void setValidityEndDate(Date validityEndDate) {
		this.validityEndDate = validityEndDate;
	}
	/**
	 * @return the questionnaireDef
	 */
	public long getQuestionnaireDef() {
		return questionnaireDef;
	}
	/**
	 * @param questionnaireDef the questionnaireDef to set
	 */
	public void setQuestionnaireDef(long questionnaireDef) {
		this.questionnaireDef = questionnaireDef;
	}
	public String getOrganisationName() {
		return organisationName;
	}
	public void setOrganisationName(String organisationName) {
		this.organisationName = organisationName;
	}
     
}


