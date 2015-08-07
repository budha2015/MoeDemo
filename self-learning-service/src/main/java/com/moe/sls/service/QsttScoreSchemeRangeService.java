package com.moe.sls.service;

import java.util.List;


public interface QsttScoreSchemeRangeService {
	
public void savedat(List s); 
	
	//public void deletedat( long l); 
	public void deleteAlldata(Long ScoreSchemaId);
	public void deleteOneData(long l);
	
	public List retrieveScoreSchema(Long ScoreSchemaId);

	//public List   getdata();
}
