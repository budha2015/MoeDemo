package com.moe.sls.daoimpl;

import com.moe.sls.dao.QsttQuestionOptionScoreDao;
import com.moe.sls.model.QsttQuestionOptionScore;
import com.moe.sls.model.QsttQuestionOptionScoreId;

public class QsttQuestionOptionScoreDaoImpl	implements QsttQuestionOptionScoreDao {
	
	//@Override
	public void deleteQuestion(QsttQuestionOptionScore qsttQuestionOptionScore) {
		try {

			
			QsttQuestionOptionScoreId id = qsttQuestionOptionScore.getId();
			//delete(qsttQuestionOptionScore);
			
		} catch (Exception he) {
			
			//throw new Exception("DB_Q_1", he);

		}
	}
	//@Override
	public QsttQuestionOptionScoreId addAnswerOptionScore(
			QsttQuestionOptionScore qsttQuestionOptionScore) {
		QsttQuestionOptionScoreId qsttQuestionOptionScoreId = null;
		try{
			
			
			if(qsttQuestionOptionScore != null){
				//saveOrUpdate(qsttQuestionOptionScore);
		   	}
			else{
				//throw new PartnerIntegrityException("Session Problem");
			}
				
			
        
        }catch(Exception hb){
        	//getSession().clear();
        	//throw new DataBaseException("DB_Q_1", hb);
        }
		return qsttQuestionOptionScoreId;
	}
}


