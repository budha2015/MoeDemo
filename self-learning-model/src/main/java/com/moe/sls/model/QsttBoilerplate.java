package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class QsttBoilerplate  implements java.io.Serializable {


     private Long id;
     private String name;
     private String description;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;
     private Set qsttBoilerplateQuestions = new HashSet(0);

    public QsttBoilerplate() {
    }

	
    public QsttBoilerplate(Date createDate, Date updateDate) {
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
    public QsttBoilerplate(String name, String description, Date createDate, Long createBy, Date updateDate, Long updateBy, Set qsttBoilerplateQuestions) {
       this.name = name;
       this.description = description;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.qsttBoilerplateQuestions = qsttBoilerplateQuestions;
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
    
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
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
    public Set getQsttBoilerplateQuestions() {
        return this.qsttBoilerplateQuestions;
    }
    
    public void setQsttBoilerplateQuestions(Set qsttBoilerplateQuestions) {
        this.qsttBoilerplateQuestions = qsttBoilerplateQuestions;
    }




}


