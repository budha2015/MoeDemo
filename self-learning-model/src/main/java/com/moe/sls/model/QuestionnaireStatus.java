package com.moe.sls.model;




/**
 * @author bhavya_b
 *
 */
public enum QuestionnaireStatus {

	NEW("new"), SAVED("saved"), SUBMITTED("submitted"), REFERREDBACK("referredback");
	private String status;
	
	private QuestionnaireStatus(String status){
		this.status = status;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	
}
