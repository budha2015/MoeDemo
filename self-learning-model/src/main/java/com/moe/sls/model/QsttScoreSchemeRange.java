package com.moe.sls.model;


import java.util.Date;


public class QsttScoreSchemeRange  implements java.io.Serializable {


     private long id;
     private QsttScoreScheme qsttScoreScheme;
     private Short minScore;
     private Short maxScore;
     private String instruction;
     private String riskLabel;
     private long remediation;
     private String notification;
     private Long ddTask;
     private Boolean ddRequiresApproval;
     private Boolean iwRequiresApproval;
     private Long iwTask1;
     private Long iwTask2;
     private Long iwTask3;
     private Boolean remediationIsAuto;
     private Date createDate;
     private Long createBy;
     private Date updateDate;
     private Long updateBy;

    public QsttScoreSchemeRange() {
    }

	
    public QsttScoreSchemeRange(long id, QsttScoreScheme qsttScoreScheme, Date createDate) {
        this.id = id;
        this.qsttScoreScheme = qsttScoreScheme;
        this.createDate = createDate;
    }
    public QsttScoreSchemeRange(long id, QsttScoreScheme qsttScoreScheme, Short minScore, Short maxScore, String instruction, String riskLabel, Long remediation, String notification, Long ddTask, Boolean ddRequiresApproval, Boolean iwRequiresApproval, Long iwTask1, Long iwTask2, Long iwTask3, Boolean remediationIsAuto, Date createDate, Long createBy, Date updateDate, Long updateBy) {
       this.id = id;
       this.qsttScoreScheme = qsttScoreScheme;
       this.minScore = minScore;
       this.maxScore = maxScore;
       this.instruction = instruction;
       this.riskLabel = riskLabel;
       this.remediation = remediation;
       this.notification = notification;
       this.ddTask = ddTask;
       this.ddRequiresApproval = ddRequiresApproval;
       this.iwRequiresApproval = iwRequiresApproval;
       this.iwTask1 = iwTask1;
       this.iwTask2 = iwTask2;
       this.iwTask3 = iwTask3;
       this.remediationIsAuto = remediationIsAuto;
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
    public QsttScoreScheme getQsttScoreScheme() {
        return this.qsttScoreScheme;
    }
    
    public void setQsttScoreScheme(QsttScoreScheme qsttScoreScheme) {
        this.qsttScoreScheme = qsttScoreScheme;
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
    public String getInstruction() {
        return this.instruction;
    }
    
    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }
    public String getRiskLabel() {
        return this.riskLabel;
    }
    
    public void setRiskLabel(String riskLabel) {
        this.riskLabel = riskLabel;
    }
    public Long getRemediation() {
        return this.remediation;
    }
    
    public void setRemediation(Long remediation) {
        this.remediation = remediation;
    }
    public String getNotification() {
        return this.notification;
    }
    
    public void setNotification(String notification) {
        this.notification = notification;
    }
    public Long getDdTask() {
        return this.ddTask;
    }
    
    public void setDdTask(Long ddTask) {
        this.ddTask = ddTask;
    }
    public Boolean getDdRequiresApproval() {
        return this.ddRequiresApproval;
    }
    
    public void setDdRequiresApproval(Boolean ddRequiresApproval) {
        this.ddRequiresApproval = ddRequiresApproval;
    }
    public Boolean getIwRequiresApproval() {
        return this.iwRequiresApproval;
    }
    
    public void setIwRequiresApproval(Boolean iwRequiresApproval) {
        this.iwRequiresApproval = iwRequiresApproval;
    }
    public Long getIwTask1() {
        return this.iwTask1;
    }
    
    public void setIwTask1(Long iwTask1) {
        this.iwTask1 = iwTask1;
    }
    public Long getIwTask2() {
        return this.iwTask2;
    }
    
    public void setIwTask2(Long iwTask2) {
        this.iwTask2 = iwTask2;
    }
    public Long getIwTask3() {
        return this.iwTask3;
    }
    
    public void setIwTask3(Long iwTask3) {
        this.iwTask3 = iwTask3;
    }
    public Boolean getRemediationIsAuto() {
        return this.remediationIsAuto;
    }
    
    public void setRemediationIsAuto(Boolean remediationIsAuto) {
        this.remediationIsAuto = remediationIsAuto;
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


