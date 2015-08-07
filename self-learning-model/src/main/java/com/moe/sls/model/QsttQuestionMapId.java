package com.moe.sls.model;




public class QsttQuestionMapId  implements java.io.Serializable {


     private long qsttQuestionId;
     private long qsttQuestionnaireDefId;

    public QsttQuestionMapId() {
    }

    public QsttQuestionMapId(long qsttQuestionId, long qsttQuestionnaireDefId) {
       this.qsttQuestionId = qsttQuestionId;
       this.qsttQuestionnaireDefId = qsttQuestionnaireDefId;
    }
   
    public long getQsttQuestionId() {
        return this.qsttQuestionId;
    }
    
    public void setQsttQuestionId(long qsttQuestionId) {
        this.qsttQuestionId = qsttQuestionId;
    }
    public long getQsttQuestionnaireDefId() {
        return this.qsttQuestionnaireDefId;
    }
    
    public void setQsttQuestionnaireDefId(long qsttQuestionnaireDefId) {
        this.qsttQuestionnaireDefId = qsttQuestionnaireDefId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof QsttQuestionMapId) ) return false;
		 QsttQuestionMapId castOther = ( QsttQuestionMapId ) other; 
         
		 return (this.getQsttQuestionId()==castOther.getQsttQuestionId())
 && (this.getQsttQuestionnaireDefId()==castOther.getQsttQuestionnaireDefId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + (int) this.getQsttQuestionId();
         result = 37 * result + (int) this.getQsttQuestionnaireDefId();
         return result;
   }   


}


