package com.moe.sls.service;

import java.util.LinkedHashMap;
import java.util.LinkedList;

public class BranchingPojo {
	
	public int count = 0;
	public boolean flag = false;
	public LinkedHashMap<String,LinkedList<BranchingValue>> branchingMap = new LinkedHashMap<String,LinkedList<BranchingValue>>();

	public LinkedHashMap<String, LinkedList<BranchingValue>> getBranchingMap() {
		return branchingMap;
	}

	public void setBranchingMap(
			LinkedHashMap<String, LinkedList<BranchingValue>> branchingMap) {
		this.branchingMap = branchingMap;
	}
	
//	public TreeMap<BranchingKey,LinkedList<BranchingValue>> branchingMap = new TreeMap<BranchingKey,LinkedList<BranchingValue>>();

/*	public TreeMap<BranchingKey, LinkedList<BranchingValue>> getBranchingMap() {
		return branchingMap;
	}

	public void setBranchingMap(
			TreeMap<BranchingKey, LinkedList<BranchingValue>> branchingMap) {
		this.branchingMap = branchingMap;
	}*/

/*	public LinkedHashMap<BranchingKey, LinkedList<BranchingValue>> getBranchingMap() {
		return branchingMap;
	}

	public void setBranchingMap(
			LinkedHashMap<BranchingKey, LinkedList<BranchingValue>> branchingMap) {
		this.branchingMap = branchingMap;
	}*/
}
