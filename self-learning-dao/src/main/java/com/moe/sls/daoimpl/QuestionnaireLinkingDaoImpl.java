package com.moe.sls.daoimpl;

import java.util.List;

import com.moe.sls.dao.QuestionnaireLinkingDao;
import com.moe.sls.model.QsttLink;
import com.moe.sls.model.QsttScoreScheme;


public class QuestionnaireLinkingDaoImpl implements QuestionnaireLinkingDao{

	
	public void addQuestionnaireLink(QsttLink qsttLink) {
		try {

			//this.saveOrUpdate(qsttLink);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	public QsttLink getQuestionnaireLinkById(Long id) {
		QsttLink qsttLink = null;
		try {

			//qsttLink = (QsttLink) getSession().load(QsttLink.class, id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return qsttLink;
	}

	public List<QsttScoreScheme> getLinkIdFromScoreScheme(Long id) {
		List<QsttScoreScheme> qsttScoreScheme = null;
		try {

			//qsttScoreScheme = getSession()
				//	.createCriteria(QsttScoreScheme.class)
				//	.add(Restrictions.eq("qsttLink.id", id)).list();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return qsttScoreScheme;

	}

	//@Override
	public void deleteQuestionnaireLink(Long id) {

		try {
			//int count = getSQLQuery(
					//"delete  from qstt_questionnaire_def_qstt_link where link_id ="
						//	+ id).executeUpdate();
			//System.out.println("Delete Count:" + count);

		} catch (Exception he) {
			// t.rollback();
			he.printStackTrace();

		}
	}

	public void deletePerticularQuestionnaireLink(Long qrId, Long linkId) {
		try {
			//int count = getSQLQuery(
				//	"delete  from qstt_questionnaire_def_qstt_link where questionnaire_def_id = "
				//			+ qrId + " and link_id =" + linkId).executeUpdate();
			//System.out.println("Delete Count:" + count);

		} catch (Exception he) {
			// t.rollback();
			he.printStackTrace();

		}
	}

	
	public List<java.math.BigInteger> getLinkId(String linkName) {
		/*SQLQuery query = getSQLQuery("select id from qstt_link where link_name = '"
				+ linkName + "'");*/
		//return query.list();
		return null;
	}

	//@Override
	public Long saveQsttLink(QsttLink qsttLink) {
		//Long l = save(qsttLink);
		return null;
	}

	//@Override
	public List getQuestionnairesByLinkId(Long id) {
		//SQLQuery query = this
				//.getSQLQuery("select questionnaire_def_id from qstt_questionnaire_def_qstt_link where link_id = "
				//		+ id);
		//return query.list();
		return null;
	}

}
