package com.moe.sls.model;


public class QsttQuestionnaireLink {
	private String questionnaireDefId;
	private String name;
	private String status;
	private String linkId;
	private String linkName;
	private String colorCode;
	private String defType;
	private String description;
	private String createDate;
	private Long count;
	private Long create_by;
	private Long update_by;
	private String createUserFirstName;
	private String updateUserFirstName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	
	public String getQuestionnaireDefId() {
		return questionnaireDefId;
	}

	public void setQuestionnaireDefId(String questionnaireDefId) {
		this.questionnaireDefId = questionnaireDefId;
	}

	public String getLinkId() {
		return linkId;
	}

	public void setLinkId(String linkId) {
		this.linkId = linkId;
	}

	public String getColorCode() {
		return colorCode;
	}

	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDefType() {
		return defType;
	}

	public void setDefType(String defType) {
		this.defType = defType;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Long getCreate_by() {
		return create_by;
	}

	public void setCreate_by(Long create_by) {
		this.create_by = create_by;
	}

	public Long getUpdate_by() {
		return update_by;
	}

	public void setUpdate_by(Long update_by) {
		this.update_by = update_by;
	}

	public String getCreateUserFirstName() {
		return createUserFirstName;
	}

	public void setCreateUserFirstName(String createUserFirstName) {
		this.createUserFirstName = createUserFirstName;
	}

	public String getUpdateUserFirstName() {
		return updateUserFirstName;
	}

	public void setUpdateUserFirstName(String updateUserFirstName) {
		this.updateUserFirstName = updateUserFirstName;
	}

	
}
