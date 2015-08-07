package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttScoreScheme  implements java.io.Serializable {


     private Long id;
     private QsttQuestionnaireDef qsttQuestionnaireDef;
     private QsttLink qsttLink;
     private String name;
     private Short minScore;
     private Short maxScore;
     private Date createDate;
     private String createBy;
     private Date updateDate;
     private String updateBy;
     private Set qsttScoreSchemeRanges = new HashSet(0);

    public QsttScoreScheme() {
    }

    public QsttScoreScheme(QsttQuestionnaireDef qsttQuestionnaireDef, QsttLink qsttLink, String name, Short minScore, Short maxScore, Date createDate, String createBy, Date updateDate, String updateBy, Set qsttScoreSchemeRanges) {
       this.qsttQuestionnaireDef = qsttQuestionnaireDef;
       this.qsttLink = qsttLink;
       this.name = name;
       this.minScore = minScore;
       this.maxScore = maxScore;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttScoreSchemeRanges = qsttScoreSchemeRanges;
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
    public QsttLink getQsttLink() {
        return this.qsttLink;
    }
    
    public void setQsttLink(QsttLink qsttLink) {
        this.qsttLink = qsttLink;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Short getMinScore() {
        return this.minScore;
    }
    
    public void setMinScore(Short minScore) {
        this.minScore = minScore;
    }
    public Short getMaxScore() {
        return this.maxScore;
    }
    
    public void setMaxScore(Short maxScore) {
        this.maxScore = maxScore;
    }
    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public String getCreateBy() {
        return this.createBy;
    }
    
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }
    
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public String getUpdateBy() {
        return this.updateBy;
    }
    
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
    public Set getQsttScoreSchemeRanges() {
        return this.qsttScoreSchemeRanges;
    }
    
    public void setQsttScoreSchemeRanges(Set qsttScoreSchemeRanges) {
        this.qsttScoreSchemeRanges = qsttScoreSchemeRanges;
    }




}


