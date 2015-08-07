package com.moe.sls.model;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttQuestionType  implements java.io.Serializable {


     private Short id;
     private String name;
     private String description;
     private String objectType;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttQuestions = new HashSet(0);

    public QsttQuestionType() {
    }

	
    public QsttQuestionType(Date createDate, Date updateDate) {
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttQuestionType(String name, String description, String objectType, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttQuestions) {
       this.name = name;
       this.description = description;
       this.objectType = objectType;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttQuestions = qsttQuestions;
    }
   
    public Short getId() {
        return this.id;
    }
    
    public void setId(Short id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public String getObjectType() {
        return this.objectType;
    }
    
    public void setObjectType(String objectType) {
        this.objectType = objectType;
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
    public Set getQsttQuestions() {
        return this.qsttQuestions;
    }
    
    public void setQsttQuestions(Set qsttQuestions) {
        this.qsttQuestions = qsttQuestions;
    }




}


