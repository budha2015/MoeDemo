package com.moe.sls.service;


import java.util.LinkedHashMap;




public class ResponseBranchingPojo {
//	public TreeMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>> responseBranchingMap = new TreeMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>>();
	
	public LinkedHashMap<ResponseBranchingKey,String> responseBranchingMap = new LinkedHashMap<ResponseBranchingKey,String>();

	public LinkedHashMap<ResponseBranchingKey, String> getResponseBranchingMap() {
		return responseBranchingMap;
	}

	public void setResponseBranchingMap(
			LinkedHashMap<ResponseBranchingKey, String> responseBranchingMap) {
		this.responseBranchingMap = responseBranchingMap;
	}
	
//	public HashMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>> responseBranchingMap = new HashMap<ResponseBranchingKey,LinkedList<ResponseBranchingValue>>();

//	public HashMap<ResponseBranchingKey, LinkedList<ResponseBranchingValue>> getResponseBranchingMap() {
//		return responseBranchingMap;
//	}
//
//	public void setResponseBranchingMap(
//			HashMap<ResponseBranchingKey, LinkedList<ResponseBranchingValue>> responseBranchingMap) {
//		this.responseBranchingMap = responseBranchingMap;
//	}

/*	public LinkedHashMap<ResponseBranchingKey, LinkedList<ResponseBranchingValue>> getResponseBranchingMap() {
		return responseBranchingMap;
	}

	public void setResponseBranchingMap(
			LinkedHashMap<ResponseBranchingKey, LinkedList<ResponseBranchingValue>> responseBranchingMap) {
		this.responseBranchingMap = responseBranchingMap;
	}*/

//	public TreeMap<ResponseBranchingKey, LinkedList<ResponseBranchingValue>> getResponseBranchingMap() {
//		return responseBranchingMap;
//	}
//
//	public void setResponseBranchingMap(
//			TreeMap<ResponseBranchingKey, LinkedList<ResponseBranchingValue>> responseBranchingMap) {
//		this.responseBranchingMap = responseBranchingMap;
//	}
	
	

	
}
