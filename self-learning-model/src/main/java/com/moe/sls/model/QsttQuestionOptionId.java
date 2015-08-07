package com.moe.sls.model;

public class QsttQuestionOptionId  implements java.io.Serializable {


     private long id;
     private long qsttQuestionId;

    public QsttQuestionOptionId() {
    }

    public QsttQuestionOptionId(long id, long qsttQuestionId) {
       this.id = id;
       this.qsttQuestionId = qsttQuestionId;
    }
   
    public long getId() {
        return this.id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    public long getQsttQuestionId() {
        return this.qsttQuestionId;
    }
    
    public void setQsttQuestionId(long qsttQuestionId) {
        this.qsttQuestionId = qsttQuestionId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof QsttQuestionOptionId) ) return false;
		 QsttQuestionOptionId castOther = ( QsttQuestionOptionId ) other; 
         
		 return (this.getId()==castOther.getId())
 && (this.getQsttQuestionId()==castOther.getQsttQuestionId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + (int) this.getId();
         result = 37 * result + (int) this.getQsttQuestionId();
         return result;
   }   


}


