package com.moe.sls.service;
import java.util.List;

import com.moe.sls.model.QsttDataCollectionList;

public interface QsttDataCollectionLinkService {
	public List<QsttDataCollectionList> getDataCollectionList(String defType,Long userId);
	public List<QsttDataCollectionList> getDataCollectionListForUsers(String defType,Long userId);
	
}