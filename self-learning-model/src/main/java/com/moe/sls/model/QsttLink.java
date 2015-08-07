package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttLink  implements java.io.Serializable {


     private Long id;
     private String linkName;
     private Short min;
     private Short max;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttScoreSchemes = new HashSet(0);
     private Set qsttQuestionnaireDefs = new HashSet(0);

    public QsttLink() {
    }

	
    public QsttLink(Date createDate, Date updateDate) {
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttLink(String linkName, Short min, Short max, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttScoreSchemes, Set qsttQuestionnaireDefs) {
       this.linkName = linkName;
       this.min = min;
       this.max = max;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttScoreSchemes = qsttScoreSchemes;
       this.qsttQuestionnaireDefs = qsttQuestionnaireDefs;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public String getLinkName() {
        return this.linkName;
    }
    
    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }
    public Short getMin() {
        return this.min;
    }
    
    public void setMin(Short min) {
        this.min = min;
    }
    public Short getMax() {
        return this.max;
    }
    
    public void setMax(Short max) {
        this.max = max;
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
    public Set getQsttScoreSchemes() {
        return this.qsttScoreSchemes;
    }
    
    public void setQsttScoreSchemes(Set qsttScoreSchemes) {
        this.qsttScoreSchemes = qsttScoreSchemes;
    }
    public Set getQsttQuestionnaireDefs() {
        return this.qsttQuestionnaireDefs;
    }
    
    public void setQsttQuestionnaireDefs(Set qsttQuestionnaireDefs) {
        this.qsttQuestionnaireDefs = qsttQuestionnaireDefs;
    }




}


