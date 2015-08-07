package com.moe.sls.serviceimpl;

import java.util.List;

import com.moe.sls.dao.QsttQuestionnaireDao;
import com.moe.sls.dao.QsttScoreSchemeDao;
import com.moe.sls.dao.QuestionnaireLinkingDao;
import com.moe.sls.model.QsttLink;
import com.moe.sls.model.QsttQuestionnaireLink;
import com.moe.sls.model.QsttScoreScheme;
import com.moe.sls.service.QuestionnaireLinkingService;

@Service
public class QuestionnaireLinkingServiceImpl implements QuestionnaireLinkingService {
	@Autowired
	QuestionnaireLinkingDao qsttQuestionLinkingDao;

	@Autowired
	QsttScoreSchemeDao qsttScoreSchemeDao;
	@Autowired
	QsttQuestionnaireDao qsttQuestionnaireDao;

	//@Override
	public void addQuestionnaireLink(QsttLink questionnaireLinking) {
		System.out.println("inside service impl");
		qsttQuestionLinkingDao.addQuestionnaireLink(questionnaireLinking);

	}

	//@Override
	public List<QsttQuestionnaireLink> listQuestionnaires(String deftype) {
		System.out.println("inside service impl");
		return qsttQuestionnaireDao.listQuestionnaires(deftype);
	}

	//@Override
	public void deleteQuestionnaireLink(Long id) {

		try {

			System.out.println("Inside deleteQuestionnaire DaoImpl");

			qsttQuestionLinkingDao.deleteQuestionnaireLink(id);

		} catch (Exception de) {
			de.printStackTrace();

		}

	}

	//@Override
	public void deletePerticularQuestionnaireLink(Long qrId, Long linkId) {
		try {

			System.out.println("Inside deleteQuestionnaire DaoImpl");

			qsttQuestionLinkingDao.deletePerticularQuestionnaireLink(qrId,
					linkId);

		} catch (Exception de) {
			de.printStackTrace();

		}
	}

	//@Override
	public void deleteScoreScheme(QsttScoreScheme qsttScoreScheme) {
		try {

			System.out.println("Inside deleteQuestionnaire DaoImpl");
			if (qsttScoreScheme != null) {
				qsttScoreSchemeDao.deleteScoreScheme(qsttScoreScheme);
			} else {
				System.out.println("delete not possible");
			}
		} catch (Exception de) {
			de.printStackTrace();

		}
	}

	public Long getLinkId(String linkName) {
		Long l = null;
		List<java.math.BigInteger> list = qsttQuestionLinkingDao
				.getLinkId(linkName);
		if (list.size() > 0) {
			l = (list.get(0)).longValue();
			return l;
		} else
			return null;
	}

	public List<QsttScoreScheme> getLinkIdFromScoreScheme(Long id) {
		List<QsttScoreScheme> qsttScoreScheme = qsttQuestionLinkingDao
				.getLinkIdFromScoreScheme(id);
		return qsttScoreScheme;

	}

	//@Override
	public List getQuestionnairesByLinkId(Long id) {
		List list = qsttQuestionLinkingDao.getQuestionnairesByLinkId(id);
		return list;
	}

	//@Override
	public int deleteScoreSchemeByLinkId(Long id) {
		int count = qsttScoreSchemeDao.deleteScoreSchemeByLinkId(id);
		return count;
	}

	//@Override
	public void saveScoreScheme(QsttScoreScheme qsttScoreScheme) {
		System.out.println("inside service impl");
		qsttScoreSchemeDao.saveScoreScheme(qsttScoreScheme);

	}

}
