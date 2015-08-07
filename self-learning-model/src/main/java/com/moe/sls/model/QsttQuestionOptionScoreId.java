package com.moe.sls.model;



public class QsttQuestionOptionScoreId  implements java.io.Serializable {


     private long questionOptionId;
     private long questionId;

    public QsttQuestionOptionScoreId() {
    }

    public QsttQuestionOptionScoreId(long questionOptionId, long questionId) {
       this.questionOptionId = questionOptionId;
       this.questionId = questionId;
    }
   
    public long getQuestionOptionId() {
        return this.questionOptionId;
    }
    
    public void setQuestionOptionId(long questionOptionId) {
        this.questionOptionId = questionOptionId;
    }
    public long getQuestionId() {
        return this.questionId;
    }
    
    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof QsttQuestionOptionScoreId) ) return false;
		 QsttQuestionOptionScoreId castOther = ( QsttQuestionOptionScoreId ) other; 
         
		 return (this.getQuestionOptionId()==castOther.getQuestionOptionId())
 && (this.getQuestionId()==castOther.getQuestionId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + (int) this.getQuestionOptionId();
         result = 37 * result + (int) this.getQuestionId();
         return result;
   }   


}


