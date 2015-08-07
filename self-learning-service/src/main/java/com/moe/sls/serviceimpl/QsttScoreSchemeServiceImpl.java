package com.moe.sls.serviceimpl;

import java.util.List;

import com.moe.sls.dao.QsttScoreSchemeDao;
import com.moe.sls.model.QsttScoreScheme;
import com.moe.sls.model.QsttScoreSchemeHelper;
import com.moe.sls.service.QsttScoreSchemeService;

public class QsttScoreSchemeServiceImpl implements QsttScoreSchemeService {
	@Autowired
	QsttScoreSchemeDao qsttScoreSchemeDao;

	public void savedata(QsttScoreScheme s) {

		qsttScoreSchemeDao.save(s);

	}

	public void deletedata(long l) {

	}

	public List<QsttScoreSchemeHelper> retrieveQsttLink(Long qId, Long lId) {
		return qsttScoreSchemeDao.retrieveQsttLink(qId, lId);
	}

}
