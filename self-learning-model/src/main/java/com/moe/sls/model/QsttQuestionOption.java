package com.moe.sls.model;



import java.util.Date;


public class QsttQuestionOption  implements java.io.Serializable {


     private QsttQuestionOptionId id;
     private QsttQuestion qsttQuestion;
     private Short optionOrder;
     private String optionValue;
     private String answerWording;
     private boolean isActive;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private QsttQuestionOptionScore qsttQuestionOptionScore;

    public QsttQuestionOption() {
    }

	
    public QsttQuestionOption(QsttQuestionOptionId id, QsttQuestion qsttQuestion, boolean isActive, Date createDate, Date updateDate) {
        this.id = id;
        this.qsttQuestion = qsttQuestion;
        this.isActive = isActive;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionOption(QsttQuestionOptionId id, QsttQuestion qsttQuestion, Short optionOrder, String optionValue, String answerWording, boolean isActive, Date createDate, Long createBy, Date updateDate, Long updateBy, QsttQuestionOptionScore qsttQuestionOptionScore) {
       this.id = id;
       this.qsttQuestion = qsttQuestion;
       this.optionOrder = optionOrder;
       this.optionValue = optionValue;
       this.answerWording = answerWording;
       this.isActive = isActive;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttQuestionOptionScore = qsttQuestionOptionScore;
    }
   
    public QsttQuestionOptionId getId() {
        return this.id;
    }
    
    public void setId(QsttQuestionOptionId id) {
        this.id = id;
    }
    public QsttQuestion getQsttQuestion() {
        return this.qsttQuestion;
    }
    
    public void setQsttQuestion(QsttQuestion qsttQuestion) {
        this.qsttQuestion = qsttQuestion;
    }
    public Short getOptionOrder() {
        return this.optionOrder;
    }
    
    public void setOptionOrder(Short optionOrder) {
        this.optionOrder = optionOrder;
    }
    public String getOptionValue() {
        return this.optionValue;
    }
    
    public void setOptionValue(String optionValue) {
        this.optionValue = optionValue;
    }
    public String getAnswerWording() {
        return this.answerWording;
    }
    
    public void setAnswerWording(String answerWording) {
        this.answerWording = answerWording;
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
    public QsttQuestionOptionScore getQsttQuestionOptionScore() {
        return this.qsttQuestionOptionScore;
    }
    
    public void setQsttQuestionOptionScore(QsttQuestionOptionScore qsttQuestionOptionScore) {
        this.qsttQuestionOptionScore = qsttQuestionOptionScore;
    }




}


