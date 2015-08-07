package com.moe.sls.service;

import java.util.List;

import com.moe.sls.model.QsttScoreScheme;
//import com.rfg.tprm.questionnaire.model.ScoreScheme;
import com.moe.sls.model.QsttScoreSchemeHelper;

public interface QsttScoreSchemeService {
	
    public void savedata( QsttScoreScheme s); 
    public List<QsttScoreSchemeHelper> retrieveQsttLink(Long qid,Long lid);
	
	public void deletedata(long l);

	

}
