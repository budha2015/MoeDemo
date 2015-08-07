package com.moe.sls.model;



import java.util.Date;


public class QsttQuestionSectionScore  implements java.io.Serializable {


     private long id;
     private QsttQuestionnaireDef qsttQuestionnaireDef;
     private Integer score;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;

    public QsttQuestionSectionScore() {
    }

	
    public QsttQuestionSectionScore(long id, QsttQuestionnaireDef qsttQuestionnaireDef, Date createDate, Date updateDate) {
        this.id = id;
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionSectionScore(long id, QsttQuestionnaireDef qsttQuestionnaireDef, Integer score, Date createDate, Long createBy, Date updateDate, Long updateBy) {
       this.id = id;
       this.qsttQuestionnaireDef = qsttQuestionnaireDef;
       this.score = score;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
    }
   
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    public QsttQuestionnaireDef getQsttQuestionnaireDef() {
        return this.qsttQuestionnaireDef;
    }
    
    public void setQsttQuestionnaireDef(QsttQuestionnaireDef qsttQuestionnaireDef) {
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
    }
    public Integer getScore() {
        return this.score;
    }
    
    public void setScore(Integer score) {
        this.score = score;
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


