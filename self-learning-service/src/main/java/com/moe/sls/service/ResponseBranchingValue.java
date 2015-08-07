package com.moe.sls.service;



public class ResponseBranchingValue {
	
	public Boolean skipValue;
	public Boolean mandatoryValue;
	public Long destinationQuestionId;
//	public LinkedList<Long> nextQuestionId = new LinkedList<Long>();
	
	
	public Boolean getSkipValue() {
		return skipValue;
	}
	public void setSkipValue(Boolean skipValue) {
		this.skipValue = skipValue;
	}
	public Long getDestinationQuestionId() {
		return destinationQuestionId;
	}
	public void setDestinationQuestionId(Long destinationQuestionId) {
		this.destinationQuestionId = destinationQuestionId;
	}
//	public LinkedList<Long> getNextQuestionId() {
//		return nextQuestionId;
//	}
//	public void setNextQuestionId(LinkedList<Long> nextQuestionId) {
//		this.nextQuestionId = nextQuestionId;
//	}
	
	
	public String toString() {
        return "{" + skipValue + " " + destinationQuestionId + "}";
    }
	public Boolean getMandatoryValue() {
		return mandatoryValue;
	}
	public void setMandatoryValue(Boolean mandatoryValue) {
		this.mandatoryValue = mandatoryValue;
	}
 
/*   @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
//        result = prime * result + (Integer)skipValue.booleanValue();
        result = prime * result + (Integer)destinationQuestionId.intValue();
//        result = prime * result + ((name == null) ? 0 : name.hashCode());
        return result;
    }
 
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final ResponseBranchingValue other = (ResponseBranchingValue) obj;
        if (skipValue != other.skipValue)
            return false;
        if (destinationQuestionId != other.destinationQuestionId)
            return false;
//        if (name == null) {
//            if (other.name != null)
//                return false;
//        } else if (!name.equals(other.name))
//            return false;
        return true;
    }*/
	
}
