package com.moe.sls.service;

import java.util.List;

import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionCategory;

public interface QsttQuestionCategoryService {
	
	public void addQuestionCategory(QsttQuestionCategory questionCategory);
	
	public List<QsttQuestion> viewQuestionForCategory(Integer category);

	public void deleteCategory(QsttQuestionCategory category);

	public void updateCategory(QsttQuestionCategory category);
	
	public List<QsttQuestionCategory> viewQuestionCategoryAll();

}