package com.moe.sls.daoimpl;


import com.moe.sls.dao.QsttQuestionDao;
import com.moe.sls.model.QsttQuestion;

public class QsttQuestionDaoImpl implements QsttQuestionDao {
	

	//@Override
	public Long createQuestion(QsttQuestion qsttQuestion) {
		Long questionId = null;
		try {

			if (qsttQuestion != null) {
				questionId = save(qsttQuestion);

			} else {
				throw new Exception("Session Problem");
			}

		} catch (Exception hb) {

			throw new Exception("DB_Q_1", hb);
		}
		return questionId;
	}

	//@Override
	public void modifyQuestion(QsttQuestion qsttQuestion) {

		try {
			String banked="";

			if (qsttQuestion != null) {
				if(qsttQuestion.isIsBanked())
					banked=",is_banked = 1";
				
				String sql = "update qstt_question set question_category_id="+(qsttQuestion.getQsttQuestionCategory() != null ? (qsttQuestion.getQsttQuestionCategory().getId().intValue()):null)+", qtext='"+qsttQuestion.getQtext()+"', create_date=sysdate(), create_by=111, update_date=sysdate(), update_by=111"+banked+" where id="+qsttQuestion.getId();
				getSession().createSQLQuery(sql).executeUpdate();

			} else {
				throw new Exception("Session Problem");
			}

		} catch (Exception hb) {

			throw new Exception("DB_Q_1", hb);
		}

	}

}
