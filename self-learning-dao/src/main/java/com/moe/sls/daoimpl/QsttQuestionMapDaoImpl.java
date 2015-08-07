package com.moe.sls.daoimpl;


import com.moe.sls.dao.QsttQuestionMapDao;
import com.moe.sls.model.QsttQuestionMap;
import com.moe.sls.model.QsttQuestionMapId;

public class QsttQuestionMapDaoImpl implements QsttQuestionMapDao {
	

	//@Override
	public QsttQuestionMapId createQsttQuestionMap(
			QsttQuestionMap qsttQuestionMap) {
		QsttQuestionMapId qsttQuestionMapId = null;
		try {


			if (qsttQuestionMap != null) {
				saveOrUpdate(qsttQuestionMap);
				
			} else {
				throw new Exception("Session Problem");
			}

		} catch (Exception hb) {
			
			throw new Exception("DB_Q_1", hb);
		}
		return qsttQuestionMapId;
	}
}
