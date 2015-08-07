package com.moe.sls.daoimpl;

import com.moe.sls.dao.QsttBoilerplateQuestionDao;
import com.moe.sls.model.QsttBoilerplateQuestion;

public class QsttBoilerplateQuestionDaoImpl implements QsttBoilerplateQuestionDao {

	//@Override
	public void saveTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {
			System.out.println("Inside DaoIMPL for save template Question");
			
			save(qtemplatequestion);
			
		} catch (Exception he) {
			
			throw new Exception("DB_Q_1", he);

		}

	}
	
	//@Override
	public void editTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {
			System.out.println("Inside DAO IMPL for EDIT TEMPLATE QUESTION");
			
			getSession().save(qtemplatequestion);
			

		} catch (Exception he) {
			
			throw new Exception("DB_Q_1", he);
		}

		}
		
	//@Override
	public void deleteTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {
			
			delete(qtemplatequestion);
			
		} catch (Exception he) {
			 
			throw new Exception("DB_Q_1", he);

		}
	}

	

	//@Override
	public void updateTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {
			System.out.println("Inside DAO IMPL for UPDATE TEMPLATE QUESTION");
			
			getSession().update(qtemplatequestion);
			
		} catch (Exception he) {
		
			throw new Exception("DB_Q_1", he);
		}
		
	}



}
