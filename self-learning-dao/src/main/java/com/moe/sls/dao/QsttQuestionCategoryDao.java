package com.moe.sls.dao;

import java.util.List;

import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionCategory;

public interface QsttQuestionCategoryDao {
	
	public List<QsttQuestion> viewQuestionForCategory(Integer category);
	
	public void deleteCategory(QsttQuestionCategory category);
	
	public void updateCategory(QsttQuestionCategory category);
	
	public void addQuestionCategory(QsttQuestionCategory questionCategory);
	
	public List<QsttQuestionCategory> viewQuestionCategoryAll();

}
