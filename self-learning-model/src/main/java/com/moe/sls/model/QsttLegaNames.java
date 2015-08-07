package com.moe.sls.model;

import java.io.Serializable;

public class QsttLegaNames implements Serializable{
	
	private static final long serialVersionUID = 1L;
	String legalNameId;
	String companyLegalName;
	public String getLegalNameId() {
		return legalNameId;
	}
	public void setLegalNameId(String legalNameId) {
		this.legalNameId = legalNameId;
	}
	public String getCompanyLegalName() {
		return companyLegalName;
	}
	public void setCompanyLegalName(String companyLegalName) {
		this.companyLegalName = companyLegalName;
	}
}
