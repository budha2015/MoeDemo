package com.moe.sls.service;

public class BranchingKey{// implements java.lang.Comparable{
	

	public String answerOptionValue;
	public Long answerOptionId;
	
	public BranchingKey(){
		//log.info("Branching Key Object is Created");
	}

	public String getAnswerOptionValue() {
		return answerOptionValue;
	}

	public void setAnswerOptionValue(String answerOptionValue) {
		this.answerOptionValue = answerOptionValue;
	}	 

/*	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}*/

	@Override
	    public int hashCode() {
	        final int prime = 31;
	        int result = 1;
	        result = prime * result + answerOptionId.intValue();     
	        //System.out.println("Result generated From hashCode method is:::::::::::::::::::::::::"+result);
	        return result;
	    }
	 
	   @Override
	    public boolean equals(Object obj) {
	    	//System.out.println("In Equals Method.............");
	        if (this == obj)
	            return true;
	        if (obj == null)
	            return false;
	        if (getClass() != obj.getClass())
	            return false;
	        if (!(obj instanceof BranchingKey))
	            return false;
	        final BranchingKey other = (BranchingKey) obj;
	        //System.out.println("SUREKHA SOURCE QUESTION ID:"+answerOptionId);
	        //System.out.println("SUREKHA ANSWER OPTION VALUE:"+answerOptionValue);	        
	        //System.out.println("********************************************");	        
	        //System.out.println("HARSHITH SOURCE QUESTION ID:"+other.getAnswerOptionId());
	        //System.out.println("HARSHITH ANSWER OPTION VALUE:"+other.getAnswerOptionValue());
	        if((answerOptionId.longValue()) == (other.answerOptionId)){
				//log.info("First QuestionIds are Equal");
				if(answerOptionValue.equals(other.getAnswerOptionValue())){
					//log.info("Second AnswerOptionValues are Equal");
					//log.info("Existing & Passed Key are Equal");
				return true;
				}
			}
			else{
				//log.info("Existing & Passed Key are Not Equal");
				return false;
			}
	        return true;
	    }

	public Long getAnswerOptionId() {
		return answerOptionId;
	}

	public void setAnswerOptionId(Long answerOptionId) {
		this.answerOptionId = answerOptionId;
	}
	
	/*	@Override
	public int compareTo(Object arg0) {
		// TODO Auto-generated method stub
		System.out.println("From compareTo Method");
		BranchingKey branchingKey = (BranchingKey)arg0;
		
		System.out.println("First Key AnswerOption Value is:"+answerOptionValue);
// 		System.out.println("First Key AnswerOptionId is:"+answerOptionId);
 		
 		System.out.println("Second Key AnswerOption Value is:"+branchingKey.getAnswerOptionValue());
// 		System.out.println("Second Key AnswerOptionId is:"+branchingKey.getAnswerOptionId());
 		
		if(answerOptionValue.equals(branchingKey.getAnswerOptionValue())){
			System.out.println("First AnswerOptionValues are Equal");
//			if((sourceQuestionId.longValue()) == (branchingKey.getSourceQuestionId())){
				System.out.println("Existing & Passed Key are Equal");
			return 1;
//			}
		}
		else{
			System.out.println("Existing & Passed Key are Not Equal");
			return 0;
		}
//		return 0;
	}*/
	
}
