package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class QsttQuestionMap  implements java.io.Serializable {


     private QsttQuestionMapId id;
     private QsttQuestion qsttQuestion;
     private QsttQuestionnaireDef qsttQuestionnaireDef;
     private String sectionLabel;
     private Short sectionOrder;
     private Short questionOrder;
     private boolean isMandatory;
     private boolean isBranch;
     private short versionNumber;
     private Date validityStartDate;
     private Date validityEndDate;
     private boolean isAttachment;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttQuestionOptionScores = new HashSet(0);
     private Set qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1 = new HashSet(0);
     private QsttQuestionBranch qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2;
     
     private String tagName;

    public QsttQuestionMap() {
    }

	
    public QsttQuestionMap(QsttQuestionMapId id, QsttQuestion qsttQuestion, QsttQuestionnaireDef qsttQuestionnaireDef, boolean isMandatory, boolean isBranch, short versionNumber, boolean isAttachment, Date createDate, Date updateDate) {
        this.id = id;
        this.qsttQuestion = qsttQuestion;
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
        this.isMandatory = isMandatory;
        this.isBranch = isBranch;
        this.versionNumber = versionNumber;
        this.isAttachment = isAttachment;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionMap(QsttQuestionMapId id, QsttQuestion qsttQuestion, QsttQuestionnaireDef qsttQuestionnaireDef, String sectionLabel, Short sectionOrder, Short questionOrder, boolean isMandatory, boolean isBranch, short versionNumber, Date validityStartDate, Date validityEndDate, boolean isAttachment, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttQuestionOptionScores, Set qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1, QsttQuestionBranch qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2) {
       this.id = id;
       this.qsttQuestion = qsttQuestion;
       this.qsttQuestionnaireDef = qsttQuestionnaireDef;
       this.sectionLabel = sectionLabel;
       this.sectionOrder = sectionOrder;
       this.questionOrder = questionOrder;
       this.isMandatory = isMandatory;
       this.isBranch = isBranch;
       this.versionNumber = versionNumber;
       this.validityStartDate = validityStartDate;
       this.validityEndDate = validityEndDate;
       this.isAttachment = isAttachment;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttQuestionOptionScores = qsttQuestionOptionScores;
       this.qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1 = qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1;
       this.qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2 = qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2;
    }
   
    public QsttQuestionMapId getId() {
        return this.id;
    }
    
    public void setId(QsttQuestionMapId id) {
        this.id = id;
    }
    public QsttQuestion getQsttQuestion() {
        return this.qsttQuestion;
    }
    
    public void setQsttQuestion(QsttQuestion qsttQuestion) {
        this.qsttQuestion = qsttQuestion;
    }
    public QsttQuestionnaireDef getQsttQuestionnaireDef() {
        return this.qsttQuestionnaireDef;
    }
    
    public void setQsttQuestionnaireDef(QsttQuestionnaireDef qsttQuestionnaireDef) {
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
    }
    public String getSectionLabel() {
        return this.sectionLabel;
    }
    
    public void setSectionLabel(String sectionLabel) {
        this.sectionLabel = sectionLabel;
    }
    public Short getSectionOrder() {
        return this.sectionOrder;
    }
    
    public void setSectionOrder(Short sectionOrder) {
        this.sectionOrder = sectionOrder;
    }
    public Short getQuestionOrder() {
        return this.questionOrder;
    }
    
    public void setQuestionOrder(Short questionOrder) {
        this.questionOrder = questionOrder;
    }
    public boolean isIsMandatory() {
        return this.isMandatory;
    }
    
    public void setIsMandatory(boolean isMandatory) {
        this.isMandatory = isMandatory;
    }
    public boolean isIsBranch() {
        return this.isBranch;
    }
    
    public void setIsBranch(boolean isBranch) {
        this.isBranch = isBranch;
    }
    public short getVersionNumber() {
        return this.versionNumber;
    }
    
    public void setVersionNumber(short versionNumber) {
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
    public boolean isIsAttachment() {
        return this.isAttachment;
    }
    
    public void setIsAttachment(boolean isAttachment) {
        this.isAttachment = isAttachment;
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
    public Set getQsttQuestionOptionScores() {
        return this.qsttQuestionOptionScores;
    }
    
    public void setQsttQuestionOptionScores(Set qsttQuestionOptionScores) {
        this.qsttQuestionOptionScores = qsttQuestionOptionScores;
    }
    public Set getQsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1() {
        return this.qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1;
    }
    
    public void setQsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1(Set qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1) {
        this.qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1 = qsttQuestionBranchesForQsttQuestionBranchQsttQuestionMapFk1;
    }
    public QsttQuestionBranch getQsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2() {
        return this.qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2;
    }
    
    public void setQsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2(QsttQuestionBranch qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2) {
        this.qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2 = qsttQuestionBranchByQsttQuestionBranchQsttQuestionMapFk2;
    }


	public boolean isMandatory() {
		return isMandatory;
	}


	public void setMandatory(boolean isMandatory) {
		this.isMandatory = isMandatory;
	}


	public boolean isBranch() {
		return isBranch;
	}


	public void setBranch(boolean isBranch) {
		this.isBranch = isBranch;
	}


	public boolean isAttachment() {
		return isAttachment;
	}


	public void setAttachment(boolean isAttachment) {
		this.isAttachment = isAttachment;
	}


	public String getTagName() {
		return tagName;
	}


	public void setTagName(String tagName) {
		this.tagName = tagName;
	}




}


