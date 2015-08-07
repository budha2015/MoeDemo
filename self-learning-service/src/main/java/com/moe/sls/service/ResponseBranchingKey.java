package com.moe.sls.service;


public class ResponseBranchingKey implements java.util.Comparator{
//public class ResponseBranchingKey implements java.lang.Comparable{
	public Long sourceQuestionId;
	public Long answerOptionId;
//	public LinkedList<Long> nextQuestionIds = new LinkedList<Long>();
	public Long getSourceQuestionId() {
		return sourceQuestionId;
	}
	public void setSourceQuestionId(Long sourceQuestionId) {
		this.sourceQuestionId = sourceQuestionId;
	}
	public Long getAnswerOptionId() {
		return answerOptionId;
	}
	public void setAnswerOptionId(Long answerOptionId) {
		this.answerOptionId = answerOptionId;
	}
	 public String toString() {
	        return "\""+sourceQuestionId + " " + answerOptionId+"\":";
	    }
	 
  @Override
	    public int hashCode() {
	        final int prime = 31;
	        int result = 1;
	        result = prime * result + sourceQuestionId.intValue();
	        result = prime * result + answerOptionId.intValue();	        
	//        System.out.println("Result generated From hashCode method is:::::::::::::::::::::::::"+result);
//	        java.util.Random r = new Random();
//	        return super.hashCode();
//	        return r.nextInt();
	        return result;
	    }
	 
	   @Override
	    public boolean equals(Object obj) {
	 //   	System.out.println("In Equals Method.............");
	        if (this == obj)
	            return true;
	        if (obj == null)
	            return false;
	        if (getClass() != obj.getClass())
	            return false;
	        if (!(obj instanceof ResponseBranchingKey))
	            return false;
	        final ResponseBranchingKey other = (ResponseBranchingKey) obj;
	//        System.out.println("SUREKHA SOURCE QUESTION ID:"+sourceQuestionId);
	//        System.out.println("SUREKHA ANSWER OPTION ID:"+answerOptionId);
	        
	//        System.out.println("********************************************");
	        
//        System.out.println("HARSHITH SOURCE QUESTION ID:"+other.getSourceQuestionId());
//	        System.out.println("HARSHITH ANSWER OPTION ID:"+other.getAnswerOptionId());
//	        if (sourceQuestionId != other.sourceQuestionId)
//	            return false;
//	        if (answerOptionId != other.answerOptionId)
//	            return false;
	        if((answerOptionId.longValue()) == (other.getAnswerOptionId())){
				
				if((sourceQuestionId.longValue()) == (other.getSourceQuestionId())){
					
				return true;
				}
			}
			else{
				return false;
			}
	        return true;
//	    	return false;
//	    	return true;
	    }
	 	//@Override
		public int compare(Object arg0, Object arg1) {
			// TODO Auto-generated method stub
	// 		System.out.println("From compare Method");
	 		ResponseBranchingKey responseBranchingKey1 = (ResponseBranchingKey)arg0;
	 		ResponseBranchingKey responseBranchingKey2 = (ResponseBranchingKey)arg1;
	// 		System.out.println("First Key SourceQuestionId isssssss:"+responseBranchingKey1.getSourceQuestionId());
	// 		System.out.println("First Key AnswerOptionId isssssss:"+responseBranchingKey1.getAnswerOptionId());
	// 		System.out.println("Second Key SourceQuestionId issssss:"+responseBranchingKey2.getSourceQuestionId());
	// 		System.out.println("Second Key AnswerOptionId isssssss:"+responseBranchingKey2.getAnswerOptionId());
	 		if(responseBranchingKey1.getSourceQuestionId() == responseBranchingKey2.getSourceQuestionId()){
	 			//log.info("In Iffffffffffffffffffffffffffffffff BlockkkkkkkkkkkkkkkkkkkkkkkkSourceQuestionIds Are Equal");
	 			
	 			if(responseBranchingKey1.getAnswerOptionId() == responseBranchingKey2.getAnswerOptionId()){
	 				return 1;
	 			}
	 		}
			return 0;
		}
	/*	@Override
		public int compareTo(Object arg0) {
			// TODO Auto-generated method stub
			System.out.println("From compareTo Method");
			ResponseBranchingKey responseBranchingKey = (ResponseBranchingKey)arg0;
			
			System.out.println("First Key SourceQuestionId is:"+sourceQuestionId);
	 		System.out.println("First Key AnswerOptionId is:"+answerOptionId);
	 		
	 		System.out.println("Second Key SourceQuestionId is:"+responseBranchingKey.getSourceQuestionId());
	 		System.out.println("Second Key AnswerOptionId is:"+responseBranchingKey.getAnswerOptionId());
	 		
			if((answerOptionId.longValue()) == (responseBranchingKey.getAnswerOptionId())){
				System.out.println("First AnswerOptionIds are Equal");
				if((sourceQuestionId.longValue()) == (responseBranchingKey.getSourceQuestionId())){
					System.out.println("Existing & Passed Key are Equal");
				return 1;
				}
			}
			else{
				System.out.println("Existing & Passed Key are Not Equal");
				return 0;
			}
			return 0;
		}*/
	/*	public LinkedList<Long> getNextQuestionIds() {
			return nextQuestionIds;
		}
		public void setNextQuestionIds(LinkedList<Long> nextQuestionIds) {
			this.nextQuestionIds = nextQuestionIds;
		}*/
	 	
}




