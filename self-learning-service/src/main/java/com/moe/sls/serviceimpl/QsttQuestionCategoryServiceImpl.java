package com.moe.sls.serviceimpl;

import java.util.List;

import com.moe.sls.dao.QsttQuestionCategoryDao;
import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionCategory;
import com.moe.sls.service.QsttQuestionCategoryService;


@Service
public class QsttQuestionCategoryServiceImpl implements QsttQuestionCategoryService{
	@Autowired
	protected QsttQuestionCategoryDao questionCategoryTypeDao ;

	//@Override
	public void addQuestionCategory(QsttQuestionCategory questionCategory) {
		
		try{
			if(questionCategory != null)
		      questionCategoryTypeDao.addQuestionCategory(questionCategory);
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
	}
	
	
	//@Override
	public List<QsttQuestion> viewQuestionForCategory(Integer category) {
		
		List<QsttQuestion> questionForCategoryDetails = null;
		try{
			
			questionForCategoryDetails = questionCategoryTypeDao.viewQuestionForCategory(category);
			
		}catch(Exception de){

			throw new Exception(de.getMessage(), de);
		}
		return questionForCategoryDetails;
	}
	//@Override
	public void deleteCategory(QsttQuestionCategory category) {
		
		try{
			
			questionCategoryTypeDao.deleteCategory(category);
			
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		
	}
	//@Override
	public void updateCategory(QsttQuestionCategory category) {
		
		try{
			if(category != null)
		      questionCategoryTypeDao.updateCategory(category);
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		
	}
	
	//@Override
	public List<QsttQuestionCategory> viewQuestionCategoryAll() {
		List<QsttQuestionCategory> list = null;
		try{
		   if(questionCategoryTypeDao != null)
		   {
			   list= questionCategoryTypeDao.viewQuestionCategoryAll();
		   }
		}catch(Exception de){
			de.printStackTrace();
			throw new Exception(de.getMessage(),de);
		}
		return list;
		   
	}

}
