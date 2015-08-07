package com.moe.sls.model;




public class BusinessCaseQuestionnaireId  implements java.io.Serializable {


     private long qsttQuestionnaireDefId;
     private long businessCaseId;

    public BusinessCaseQuestionnaireId() {
    }

    public BusinessCaseQuestionnaireId(long qsttQuestionnaireDefId, long businessCaseId) {
       this.qsttQuestionnaireDefId = qsttQuestionnaireDefId;
       this.businessCaseId = businessCaseId;
    }
   
    public long getQsttQuestionnaireDefId() {
        return this.qsttQuestionnaireDefId;
    }
    
    public void setQsttQuestionnaireDefId(long qsttQuestionnaireDefId) {
        this.qsttQuestionnaireDefId = qsttQuestionnaireDefId;
    }
    public long getBusinessCaseId() {
        return this.businessCaseId;
    }
    
    public void setBusinessCaseId(long businessCaseId) {
        this.businessCaseId = businessCaseId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof BusinessCaseQuestionnaireId) ) return false;
		 BusinessCaseQuestionnaireId castOther = ( BusinessCaseQuestionnaireId ) other; 
         
		 return (this.getQsttQuestionnaireDefId()==castOther.getQsttQuestionnaireDefId())
 && (this.getBusinessCaseId()==castOther.getBusinessCaseId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + (int) this.getQsttQuestionnaireDefId();
         result = 37 * result + (int) this.getBusinessCaseId();
         return result;
   }   


}


