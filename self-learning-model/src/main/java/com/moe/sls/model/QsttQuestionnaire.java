package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttQuestionnaire  implements java.io.Serializable {


     private Long id;
     private QsttQuestionnaireDef qsttQuestionnaireDef;
     private String sender;
     private Date sentOn;
     private Date submitDate;
     private String responder;
     private String recipient;
     private String status;
     private Short totalScore;
     private String thirdParty;
     private Boolean isActive;
     private Byte versionNumber;
     private Date validityStartDate;
     private Date validityEndDate;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttAnswers = new HashSet(0);

    public QsttQuestionnaire() {
    }

	
    public QsttQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef, String recipient, Date createDate, Date updateDate) {
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
        this.recipient = recipient;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef, String sender, Date sentOn, Date submitDate, String responder, String recipient, String status, Short totalScore, String thirdParty, Boolean isActive, Byte versionNumber, Date validityStartDate, Date validityEndDate, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttAnswers) {
       this.qsttQuestionnaireDef = qsttQuestionnaireDef;
       this.sender = sender;
       this.sentOn = sentOn;
       this.submitDate = submitDate;
       this.responder = responder;
       this.recipient = recipient;
       this.status = status;
       this.totalScore = totalScore;
       this.thirdParty = thirdParty;
       this.isActive = isActive;
       this.versionNumber = versionNumber;
       this.validityStartDate = validityStartDate;
       this.validityEndDate = validityEndDate;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttAnswers = qsttAnswers;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public QsttQuestionnaireDef getQsttQuestionnaireDef() {
        return this.qsttQuestionnaireDef;
    }
    
    public void setQsttQuestionnaireDef(QsttQuestionnaireDef qsttQuestionnaireDef) {
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
    }
  
    public Date getSentOn() {
        return this.sentOn;
    }
    
    public void setSentOn(Date sentOn) {
        this.sentOn = sentOn;
    }
    public Date getSubmitDate() {
        return this.submitDate;
    }
    
    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }
   
    public String getRecipient() {
        return this.recipient;
    }
    
    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    public Short getTotalScore() {
        return this.totalScore;
    }
    
    public void setTotalScore(Short totalScore) {
        this.totalScore = totalScore;
    }
 
    public Boolean getIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    public Byte getVersionNumber() {
        return this.versionNumber;
    }
    
    public void setVersionNumber(Byte versionNumber) {
        this.versionNumber = versionNumber;
    }
    public Date getValidityStartDate() {
        return this.validityStartDate;
    }
    
    public void setValidityStartDate(Date validityStartDate) {
        this.validityStartDate = validityStartDate;
    }
    public Date getValidityEndDate() {
        return this.validityEndDate;
    }
    
    public void setValidityEndDate(Date validityEndDate) {
        this.validityEndDate = validityEndDate;
    }
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public Long getCreateBy() {
        return this.createBy;
    }
    
    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }
    
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public Long getUpdateBy() {
        return this.updateBy;
    }
    
    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }
    public Set getQsttAnswers() {
        return this.qsttAnswers;
    }
    
    public void setQsttAnswers(Set qsttAnswers) {
        this.qsttAnswers = qsttAnswers;
    }


	public String getSender() {
		return sender;
	}


	public void setSender(String sender) {
		this.sender = sender;
	}





	public String getResponder() {
		return responder;
	}


	public void setResponder(String responder) {
		this.responder = responder;
	}


	public String getThirdParty() {
		return thirdParty;
	}


	public void setThirdParty(String thirdParty) {
		this.thirdParty = thirdParty;
	}




}


