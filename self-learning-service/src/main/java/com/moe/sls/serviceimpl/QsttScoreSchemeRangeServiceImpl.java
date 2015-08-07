package com.moe.sls.serviceimpl;

import java.util.Iterator;
import java.util.List;

//import com.rfg.tprm.questionnaire.controller.Query;
import com.moe.sls.dao.QsttScoreSchemeDao;
import com.moe.sls.dao.QsttScoreSchemeRangeDao;
import com.moe.sls.model.QsttScoreScheme;
import com.moe.sls.model.QsttScoreSchemeRange;
import com.moe.sls.service.QsttScoreSchemeRangeService;

public class QsttScoreSchemeRangeServiceImpl implements
		QsttScoreSchemeRangeService {
	@Autowired
	QsttScoreSchemeRangeDao qsttScoreSchemeRangeDao;
	@Autowired
	QsttScoreSchemeDao qsttScoreSchemeDaoImp;

	@Autowired
	QsttScoreScheme qsttScoreScheme;

	public void savedat(List listRangeObjects) {
		QsttScoreSchemeRange qsttScoreSchemeRange = null;
		Iterator i = listRangeObjects.iterator();
		while (i.hasNext()) {
			qsttScoreSchemeRange = (QsttScoreSchemeRange) (i.next());

			if (qsttScoreSchemeRange.getId() > 0) {

				qsttScoreSchemeRangeDao.merge(qsttScoreSchemeRange);
			} else {
				qsttScoreSchemeRangeDao.save(qsttScoreSchemeRange);

			}
		}
	}

	public List retrieveScoreSchema(Long ScoreSchemaId) {
		QsttScoreSchemeRange qsttScoreSchemeRange = null;

		qsttScoreScheme.setId(ScoreSchemaId);

		Criterion criterion = Restrictions.eq("qsttScoreScheme",
				qsttScoreScheme);

		List schemeRangeObjects = qsttScoreSchemeRangeDao
				.findByCriteria(criterion);
		for (Object o : schemeRangeObjects) {
			QsttScoreSchemeRange ss = (QsttScoreSchemeRange) o;

		}
		return schemeRangeObjects;

	}

	/*
	 * public void deleteAlldata(){ List
	 * schemeRangeList=qsttScoreSchemeRangeDao.findAll(); for(Object
	 * o:schemeRangeList){ QsttScoreSchemeRange
	 * qsttScoreSchemeRange=(QsttScoreSchemeRange)o;
	 * qsttScoreSchemeRangeDao.delete( qsttScoreSchemeRange); } }
	 */

	public void deleteAlldata(Long ScoreSchemaId) {

		QsttScoreSchemeRange qsttScoreSchemeRange = null;

		qsttScoreScheme.setId(ScoreSchemaId);

		Criterion criterion = Restrictions.eq("qsttScoreScheme",
				qsttScoreScheme);

		List l = qsttScoreSchemeRangeDao.findByCriteria(criterion);
		for (Object o : l) {
			qsttScoreSchemeRange = (QsttScoreSchemeRange) o;

			qsttScoreSchemeRangeDao.delete(qsttScoreSchemeRange);

		}

	}

	public void deleteOneData(long schemeRangeId) {

		QsttScoreSchemeRange qsttScoreSchemeRange = qsttScoreSchemeRangeDao
				.get(schemeRangeId);
		if (qsttScoreSchemeRange != null) {
			qsttScoreSchemeRangeDao.delete(qsttScoreSchemeRange);
		}

	}

}
