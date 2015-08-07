package com.moe.sls.model;



import java.util.Date;


public class QsttBoilerplateQuestion  implements java.io.Serializable {


     private Long id;
     private QsttBoilerplate qsttBoilerplate;
     private QsttQuestion qsttQuestion;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;

    public QsttBoilerplateQuestion() {
    }

	
    public QsttBoilerplateQuestion(QsttBoilerplate qsttBoilerplate, QsttQuestion qsttQuestion, Date createDate, Date updateDate) {
        this.qsttBoilerplate = qsttBoilerplate;
        this.qsttQuestion = qsttQuestion;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttBoilerplateQuestion(QsttBoilerplate qsttBoilerplate, QsttQuestion qsttQuestion, Date createDate, Long createBy, Date updateDate, Long updateBy) {
       this.qsttBoilerplate = qsttBoilerplate;
       this.qsttQuestion = qsttQuestion;
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
    public QsttBoilerplate getQsttBoilerplate() {
        return this.qsttBoilerplate;
    }
    
    public void setQsttBoilerplate(QsttBoilerplate qsttBoilerplate) {
        this.qsttBoilerplate = qsttBoilerplate;
    }
    public QsttQuestion getQsttQuestion() {
        return this.qsttQuestion;
    }
    
    public void setQsttQuestion(QsttQuestion qsttQuestion) {
        this.qsttQuestion = qsttQuestion;
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




}


