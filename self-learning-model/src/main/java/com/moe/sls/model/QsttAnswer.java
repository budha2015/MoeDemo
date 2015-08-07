package com.moe.sls.model;



import java.util.Date;


public class QsttAnswer  implements java.io.Serializable {


     private Long id;
     private QsttQuestionnaire qsttQuestionnaire;
     private QsttQuestionOption qsttQuestionOption;
     private Short questionScore;
     private String answerWord;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;

    public QsttAnswer() {
    }

	
    public QsttAnswer(QsttQuestionnaire qsttQuestionnaire, QsttQuestionOption qsttQuestionOption, Date createDate, Date updateDate) {
        this.qsttQuestionnaire = qsttQuestionnaire;
        this.setQsttQuestionOption(qsttQuestionOption);
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttAnswer(QsttQuestionnaire qsttQuestionnaire, QsttQuestionOption qsttQuestionOption, Short questionScore, String answerWord, Date createDate, Long createBy, Date updateDate, Long updateBy) {
       this.qsttQuestionnaire = qsttQuestionnaire;
       this.setQsttQuestionOption(qsttQuestionOption);
       this.questionScore = questionScore;
       this.answerWord = answerWord;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public QsttQuestionnaire getQsttQuestionnaire() {
        return this.qsttQuestionnaire;
    }
    
    public void setQsttQuestionnaire(QsttQuestionnaire qsttQuestionnaire) {
        this.qsttQuestionnaire = qsttQuestionnaire;
    }
    
    public Short getQuestionScore() {
        return this.questionScore;
    }
    
    public void setQuestionScore(Short questionScore) {
        this.questionScore = questionScore;
    }
    public String getAnswerWord() {
        return this.answerWord;
    }
    
    public void setAnswerWord(String answerWord) {
        this.answerWord = answerWord;
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


	public QsttQuestionOption getQsttQuestionOption() {
		return qsttQuestionOption;
	}


	public void setQsttQuestionOption(QsttQuestionOption qsttQuestionOption) {
		this.qsttQuestionOption = qsttQuestionOption;
	}




}


