package com.moe.sls.daoimpl;

import java.util.List;

import com.moe.sls.dao.QsttQuestionnaireDefDao;
import com.moe.sls.model.QsttQuestionnaireDef;

public class QsttQuestionnaireDefDaoImpl implements QsttQuestionnaireDefDao {
	
	//@Override
	public Long createQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef) {

		Long qsttQuestionnaireDefId = null;

		try {

			if (qsttQuestionnaireDef != null) {
				//qsttQuestionnaireDefId = this.save(qsttQuestionnaireDef);
				
			} else {
				//throw new PartnerIntegrityException("Session Problem");
			}
		} catch (Exception hb) {
			
			//throw new DataBaseException("DB_Q_1", hb);
		}

		return qsttQuestionnaireDefId;
	}

	//@Override
	public List<String> getAllQuestionnaire(
			QsttQuestionnaireDef qsttQuestionnaireDef) {
		List<String> questionnaireNames = null;
		try {
			
			if (qsttQuestionnaireDef != null) {
				String hql = "select concat(name,'-',def_type) from QsttQuestionnaireDef";
				//Query query = this.getQuery(hql);
				//questionnaireNames = query.list();

			} else {
				//throw new PartnerIntegrityException("Session Problem");
			}
		} catch (Exception hb) {
			
			//throw new DataBaseException("DB_Q_1", hb);
		}
		return questionnaireNames;
	}
	
	//@Override
	public List<String> getAllQuestionnaireWithDescription(
			QsttQuestionnaireDef qsttQuestionnaireDef) {
		List<String> questionnaireNames = null;
		try {
			
			if (qsttQuestionnaireDef != null) {
				String hql = "select concat(q.name,'-',q.description) from QsttQuestionnaireDef q";
				//Query query = this.getQuery(hql);
				//questionnaireNames = query.list();

			} else {
				//throw new PartnerIntegrityException("Session Problem");
			}
		} catch (Exception hb) {
			
			//throw new DataBaseException("DB_Q_1", hb);
		}
		return questionnaireNames;
	}
}
