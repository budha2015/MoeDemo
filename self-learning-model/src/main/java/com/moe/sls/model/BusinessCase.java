package com.moe.sls.model;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class BusinessCase  implements java.io.Serializable {


     private Long id;
     private String label;
     private Date createDate;
     private String createBy;
     private Date updateDate;
     private String updateBy;
     private Set businessCaseQuestionnaires = new HashSet(0);
     private Set qsttQuestions = new HashSet(0);

    public BusinessCase() {
    }

    public BusinessCase(String label, Date createDate, String createBy, Date updateDate, String updateBy, Set businessCaseQuestionnaires, Set qsttQuestions) {
       this.label = label;
       this.createDate = createDate;
       this.createBy = createBy;
       this.updateDate = updateDate;
       this.updateBy = updateBy;
       this.businessCaseQuestionnaires = businessCaseQuestionnaires;
       this.qsttQuestions = qsttQuestions;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public String getLabel() {
        return this.label;
    }
    
    public void setLabel(String label) {
        this.label = label;
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
    public Set getBusinessCaseQuestionnaires() {
        return this.businessCaseQuestionnaires;
    }
    
    public void setBusinessCaseQuestionnaires(Set businessCaseQuestionnaires) {
        this.businessCaseQuestionnaires = businessCaseQuestionnaires;
    }
    public Set getQsttQuestions() {
        return this.qsttQuestions;
    }
    
    public void setQsttQuestions(Set qsttQuestions) {
        this.qsttQuestions = qsttQuestions;
    }




}


