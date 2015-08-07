package com.moe.sls.daoimpl;

import com.moe.sls.dao.QsttQuestionOptionDao;
import com.moe.sls.model.QsttQuestionOption;
import com.moe.sls.model.QsttQuestionOptionId;


public class QsttQuestionOptionDaoImpl implements QsttQuestionOptionDao {
	
	//@Override
	public QsttQuestionOptionId saveAnswers(QsttQuestionOption qsttQuestionOption) {
		QsttQuestionOptionId qsttQuestionOptionId = null;
		
		try {

			if (qsttQuestionOption != null) {
				//save(qsttQuestionOption);
				
				
			} else {
				//throw new PartnerIntegrityException("Session Problem");
			}

		} catch (Exception hb) {
			
			//throw new DataBaseException("DB_A_1", hb);
		}
		return qsttQuestionOptionId;
		
	}
	
	//@Override
	public QsttQuestionOptionId addAnswerOption(QsttQuestionOption qsttQuestionOption) {
		QsttQuestionOptionId qsttQuestionOptionId = null;
		
		try {


			if (qsttQuestionOption != null) {
				//saveOrUpdate(qsttQuestionOption);
			} else {
				//throw new PartnerIntegrityException("Session Problem");
			}

		} catch (Exception hb) {
			
			
			//throw new DataBaseException("DB_A_1", hb);
		}
		return qsttQuestionOptionId;
		
	}
}
