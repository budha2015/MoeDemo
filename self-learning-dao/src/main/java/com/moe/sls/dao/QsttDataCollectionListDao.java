package com.moe.sls.dao;
import java.util.List;

import com.moe.sls.model.QsttDataCollectionList;

public interface QsttDataCollectionListDao {
	public List<QsttDataCollectionList> getDataCollectionList(String defType,Long userId);
	public List<QsttDataCollectionList> getDataCollectionListForUsers(String defType,Long userId);

}