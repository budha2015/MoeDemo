package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttQuestion  implements java.io.Serializable {


     private Long id;
     private QsttQuestionCategory qsttQuestionCategory;
     private QsttQuestionType qsttQuestionType;
     private String qtext;
     private boolean isBanked;
     private String description;
     private boolean isActive;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttQuestionOptions = new HashSet(0);
     private Set businessCases = new HashSet(0);
     private Set qsttBoilerplateQuestions = new HashSet(0);
     private Set qsttQuestionMaps = new HashSet(0);

    public QsttQuestion() {
    }

	
    public QsttQuestion(QsttQuestionType qsttQuestionType, boolean isBanked, boolean isActive, Date createDate, Date updateDate) {
        this.qsttQuestionType = qsttQuestionType;
        this.isBanked = isBanked;
        this.isActive = isActive;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestion(QsttQuestionCategory qsttQuestionCategory, QsttQuestionType qsttQuestionType, String qtext, boolean isBanked, String description, boolean isActive, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttQuestionOptions, Set businessCases, Set qsttBoilerplateQuestions, Set qsttQuestionMaps) {
       this.qsttQuestionCategory = qsttQuestionCategory;
       this.qsttQuestionType = qsttQuestionType;
       this.qtext = qtext;
       this.isBanked = isBanked;
       this.description = description;
       this.isActive = isActive;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttQuestionOptions = qsttQuestionOptions;
       this.businessCases = businessCases;
       this.qsttBoilerplateQuestions = qsttBoilerplateQuestions;
       this.qsttQuestionMaps = qsttQuestionMaps;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public QsttQuestionCategory getQsttQuestionCategory() {
        return this.qsttQuestionCategory;
    }
    
    public void setQsttQuestionCategory(QsttQuestionCategory qsttQuestionCategory) {
        this.qsttQuestionCategory = qsttQuestionCategory;
    }
    public QsttQuestionType getQsttQuestionType() {
        return this.qsttQuestionType;
    }
    
    public void setQsttQuestionType(QsttQuestionType qsttQuestionType) {
        this.qsttQuestionType = qsttQuestionType;
    }
    public String getQtext() {
        return this.qtext;
    }
    
    public void setQtext(String qtext) {
        this.qtext = qtext;
    }
    public boolean isIsBanked() {
        return this.isBanked;
    }
    
    public void setIsBanked(boolean isBanked) {
        this.isBanked = isBanked;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public boolean isIsActive() {
        return this.isActive;
    }
    
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
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
    public Set getQsttQuestionOptions() {
        return this.qsttQuestionOptions;
    }
    
    public void setQsttQuestionOptions(Set qsttQuestionOptions) {
        this.qsttQuestionOptions = qsttQuestionOptions;
    }
    public Set getBusinessCases() {
        return this.businessCases;
    }
    
    public void setBusinessCases(Set businessCases) {
        this.businessCases = businessCases;
    }
    public Set getQsttBoilerplateQuestions() {
        return this.qsttBoilerplateQuestions;
    }
    
    public void setQsttBoilerplateQuestions(Set qsttBoilerplateQuestions) {
        this.qsttBoilerplateQuestions = qsttBoilerplateQuestions;
    }
    public Set getQsttQuestionMaps() {
        return this.qsttQuestionMaps;
    }
    
    public void setQsttQuestionMaps(Set qsttQuestionMaps) {
        this.qsttQuestionMaps = qsttQuestionMaps;
    }




}


