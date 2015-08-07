package com.moe.sls.model;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttQuestionnaireDef  implements java.io.Serializable {


     private Long id;
     private String name;
     private String defType;
     private String language;
     private boolean isInternal;
     private Short score;
     private Byte versionNumber;
     private Date validityStartDate;
     private Date validityEndDate;
     private String status;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private String description;
     private Set qsttLinks = new HashSet(0);
     private Set qsttQuestionMaps = new HashSet(0);
     private Set qsttScoreSchemes = new HashSet(0);
     private Set qsttQuestionnaires = new HashSet(0);
     private Set qsttQuestionSectionScores = new HashSet(0);
     private Set businessCaseQuestionnaires = new HashSet(0);

    public QsttQuestionnaireDef() {
    }

	
    public QsttQuestionnaireDef(String name, boolean isInternal, Date createDate, Date updateDate) {
        this.name = name;
        this.isInternal = isInternal;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionnaireDef(String name, String language, boolean isInternal, Short score, Byte versionNumber, Date validityStartDate, Date validityEndDate, String status, Date createDate, Long createBy, Date updateDate, Long updateBy, String description, Set qsttLinks, Set qsttQuestionMaps, Set qsttScoreSchemes, Set qsttQuestionnaires, Set qsttQuestionSectionScores, Set businessCaseQuestionnaires) {
       this.name = name;
       this.language = language;
       this.isInternal = isInternal;
       this.score = score;
       this.versionNumber = versionNumber;
       this.validityStartDate = validityStartDate;
       this.validityEndDate = validityEndDate;
       this.status = status;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.description = description;
       this.qsttLinks = qsttLinks;
       this.qsttQuestionMaps = qsttQuestionMaps;
       this.qsttScoreSchemes = qsttScoreSchemes;
       this.qsttQuestionnaires = qsttQuestionnaires;
       this.qsttQuestionSectionScores = qsttQuestionSectionScores;
       this.businessCaseQuestionnaires = businessCaseQuestionnaires;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    
    public String getDefType() {
		return defType;
	}


	public void setDefType(String defType) {
		this.defType = defType;
	}


	public void setName(String name) {
        this.name = name;
    }
    public String getLanguage() {
        return this.language;
    }
    
    public void setLanguage(String language) {
        this.language = language;
    }
    public boolean isIsInternal() {
        return this.isInternal;
    }
    
    public void setIsInternal(boolean isInternal) {
        this.isInternal = isInternal;
    }
    public Short getScore() {
        return this.score;
    }
    
    public void setScore(Short score) {
        this.score = score;
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
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
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
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Set getQsttLinks() {
        return this.qsttLinks;
    }
    
    public void setQsttLinks(Set qsttLinks) {
        this.qsttLinks = qsttLinks;
    }
    public Set getQsttQuestionMaps() {
        return this.qsttQuestionMaps;
    }
    
    public void setQsttQuestionMaps(Set qsttQuestionMaps) {
        this.qsttQuestionMaps = qsttQuestionMaps;
    }
    public Set getQsttScoreSchemes() {
        return this.qsttScoreSchemes;
    }
    
    public void setQsttScoreSchemes(Set qsttScoreSchemes) {
        this.qsttScoreSchemes = qsttScoreSchemes;
    }
    public Set getQsttQuestionnaires() {
        return this.qsttQuestionnaires;
    }
    
    public void setQsttQuestionnaires(Set qsttQuestionnaires) {
        this.qsttQuestionnaires = qsttQuestionnaires;
    }
    public Set getQsttQuestionSectionScores() {
        return this.qsttQuestionSectionScores;
    }
    
    public void setQsttQuestionSectionScores(Set qsttQuestionSectionScores) {
        this.qsttQuestionSectionScores = qsttQuestionSectionScores;
    }
    public Set getBusinessCaseQuestionnaires() {
        return this.businessCaseQuestionnaires;
    }
    
    public void setBusinessCaseQuestionnaires(Set businessCaseQuestionnaires) {
        this.businessCaseQuestionnaires = businessCaseQuestionnaires;
    }




}


