package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttQuestionOptionScore  implements java.io.Serializable {


     private QsttQuestionOptionScoreId id;
     private QsttQuestionOption qsttQuestionOption;
     private QsttQuestionMap qsttQuestionMap;
     private short riskScore;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttAnswers = new HashSet(0);

    public QsttQuestionOptionScore() {
    }

	
    public QsttQuestionOptionScore(QsttQuestionOption qsttQuestionOption, QsttQuestionMap qsttQuestionMap, short riskScore, Date createDate, Date updateDate) {
        this.qsttQuestionOption = qsttQuestionOption;
        this.qsttQuestionMap = qsttQuestionMap;
        this.riskScore = riskScore;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionOptionScore(QsttQuestionOption qsttQuestionOption, QsttQuestionMap qsttQuestionMap, short riskScore, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttAnswers) {
       this.qsttQuestionOption = qsttQuestionOption;
       this.qsttQuestionMap = qsttQuestionMap;
       this.riskScore = riskScore;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttAnswers = qsttAnswers;
    }
   
    public QsttQuestionOptionScoreId getId() {
        return this.id;
    }
    
    public void setId(QsttQuestionOptionScoreId id) {
        this.id = id;
    }
    public QsttQuestionOption getQsttQuestionOption() {
        return this.qsttQuestionOption;
    }
    
    public void setQsttQuestionOption(QsttQuestionOption qsttQuestionOption) {
        this.qsttQuestionOption = qsttQuestionOption;
    }
    public QsttQuestionMap getQsttQuestionMap() {
        return this.qsttQuestionMap;
    }
    
    public void setQsttQuestionMap(QsttQuestionMap qsttQuestionMap) {
        this.qsttQuestionMap = qsttQuestionMap;
    }
    public short getRiskScore() {
        return this.riskScore;
    }
    
    public void setRiskScore(short riskScore) {
        this.riskScore = riskScore;
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




}


