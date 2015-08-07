package com.moe.sls.model;

public class QsttScoreSchemeHelper {
	
	private String linkName;
	private String questionnaireName;
	private String scoreSchemeId;
	private Short minScore;
	private Short maxScore;
	private int minScoreAddition;
	private int maxScoreAddition;
	public String getLinkName() {
		return linkName;
	}
	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}
	public String getQuestionnaireName() {
		return questionnaireName;
	}
	public void setQuestionnaireName(String questionnaireName) {
		this.questionnaireName = questionnaireName;
	}
	public int getMinScore() {
		return minScore;
	}
	public void setMinScore(Short minScore) {
		this.minScore = minScore;
	}
	public int getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(Short maxScore) {
		this.maxScore = maxScore;
	}
	public int getMinScoreAddition() {
		return minScoreAddition;
	}
	public void setMinScoreAddition(int minScoreAddition) {
		this.minScoreAddition = minScoreAddition;
	}
	public int getMaxScoreAddition() {
		return maxScoreAddition;
	}
	public void setMaxScoreAddition(int maxScoreAddition) {
		this.maxScoreAddition = maxScoreAddition;
	}
	public String getScoreSchemeId() {
		return scoreSchemeId;
	}
	public void setScoreSchemeId(String scoreSchemeId) {
		this.scoreSchemeId = scoreSchemeId;
	}
	

}
