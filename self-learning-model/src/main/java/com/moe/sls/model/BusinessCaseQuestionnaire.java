package com.moe.sls.model;





public class BusinessCaseQuestionnaire  implements java.io.Serializable {


     private BusinessCaseQuestionnaireId id;
     private QsttQuestionnaireDef qsttQuestionnaireDef;
     private BusinessCase businessCase;
     private String labelName;
     private String clourCode;

    public BusinessCaseQuestionnaire() {
    }

	
    public BusinessCaseQuestionnaire(BusinessCaseQuestionnaireId id, QsttQuestionnaireDef qsttQuestionnaireDef, BusinessCase businessCase) {
        this.id = id;
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
        this.businessCase = businessCase;
    }
    public BusinessCaseQuestionnaire(BusinessCaseQuestionnaireId id, QsttQuestionnaireDef qsttQuestionnaireDef, BusinessCase businessCase, String labelName, String clourCode) {
       this.id = id;
       this.qsttQuestionnaireDef = qsttQuestionnaireDef;
       this.businessCase = businessCase;
       this.labelName = labelName;
       this.clourCode = clourCode;
    }
   
    public BusinessCaseQuestionnaireId getId() {
        return this.id;
    }
    
    public void setId(BusinessCaseQuestionnaireId id) {
        this.id = id;
    }
    public QsttQuestionnaireDef getQsttQuestionnaireDef() {
        return this.qsttQuestionnaireDef;
    }
    
    public void setQsttQuestionnaireDef(QsttQuestionnaireDef qsttQuestionnaireDef) {
        this.qsttQuestionnaireDef = qsttQuestionnaireDef;
    }
    public BusinessCase getBusinessCase() {
        return this.businessCase;
    }
    
    public void setBusinessCase(BusinessCase businessCase) {
        this.businessCase = businessCase;
    }
    public String getLabelName() {
        return this.labelName;
    }
    
    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }
    public String getClourCode() {
        return this.clourCode;
    }
    
    public void setClourCode(String clourCode) {
        this.clourCode = clourCode;
    }




}


