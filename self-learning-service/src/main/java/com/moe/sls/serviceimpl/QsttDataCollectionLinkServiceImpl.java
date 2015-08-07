package com.moe.sls.serviceimpl;

import java.util.List;

import com.moe.sls.dao.QsttDataCollectionListDao;
//import com.rfg.tprm.questionnaire.dao.QuestionnaireDao;
import com.moe.sls.model.QsttDataCollectionList;
import com.moe.sls.service.QsttDataCollectionLinkService;

@Service
public class QsttDataCollectionLinkServiceImpl implements QsttDataCollectionLinkService {
	@Autowired
	QsttDataCollectionListDao qsttDataCollectionListDao;
//	@Autowired
	//QuestionnaireDao questionnaireDao;
	//@Override
	public List<QsttDataCollectionList> getDataCollectionList(String defType,Long userId) {
		List<QsttDataCollectionList> dataCollectionList = qsttDataCollectionListDao.getDataCollectionList(defType,userId);
		return dataCollectionList;
	}
	//@Override
	public List<QsttDataCollectionList> getDataCollectionListForUsers(String defType,Long userId) {
		List<QsttDataCollectionList> dataCollectionList = qsttDataCollectionListDao.getDataCollectionListForUsers(defType,userId);
		return dataCollectionList;
	}
}
