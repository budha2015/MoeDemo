package com.moe.sls.daoimpl;

import java.util.List;

import com.moe.sls.dao.QsttAnswerDao;
import com.moe.sls.model.QsttAnswer;

public class QsttAnswerDaoImpl implements QsttAnswerDao {

	public void saveQuestionnaireResponse(QsttAnswer qsttAnswer) {
		try {
			if (qsttAnswer != null) {
				saveOrUpdate(qsttAnswer);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<QsttAnswer> getQsttAnswerList() {
		List<QsttAnswer> qsttAnslist = null;
		try {
			qsttAnslist = findAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return qsttAnslist;

	}

}
