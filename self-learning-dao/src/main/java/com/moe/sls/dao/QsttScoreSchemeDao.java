package com.moe.sls.dao;

import java.util.List;


import com.moe.sls.model.QsttScoreScheme;
import com.moe.sls.model.QsttScoreSchemeHelper;

public interface QsttScoreSchemeDao {
	
	public List<QsttScoreSchemeHelper> retrieveQsttLink(Long qId,Long lId);

	public void saveScoreScheme(QsttScoreScheme qsttScoreScheme);
	
	public void deleteScoreScheme(QsttScoreScheme qsttScoreScheme);
	

	public int deleteScoreSchemeByLinkId(Long id);
		
}
