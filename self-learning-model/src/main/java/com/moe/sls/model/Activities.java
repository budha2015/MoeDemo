package com.moe.sls.model;

import java.util.Comparator;
import java.util.Date;

public class Activities{
	private long id;
	private String name;
	private String status;
	private Date dateReceived;
	private Date dateSubmitted;
	private String type;
	private String overdueColor;
	
	public String getOverdueColor() {
		return overdueColor;
	}
	public void setOverdueColor(String overdueColor) {
		this.overdueColor = overdueColor;
	}
	public Activities(){
		
	}
	public Activities(Long id,String name,String status,Date dateReceived,Date dateSubmitted,String type,String overdueColor){
		System.out.println("Activities Object Created");		
		this.id = id;
		this.name= name;
		this.status = status;
		this.dateReceived = dateReceived;
		this.dateSubmitted= dateSubmitted;
		this.type = type;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDateReceived() {
		return dateReceived;
	}
	public void setDateReceived(Date dateReceived) {
		this.dateReceived = dateReceived;
	}
	public Date getDateSubmitted() {
		return dateSubmitted;
	}
	public void setDateSubmitted(Date dateSubmitted) {
		this.dateSubmitted = dateSubmitted;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	/*@Override
	public int compare(Object o1, Object o2) {
		Activities a1 = (Activities) o1;
		Activities a2 = (Activities) o2;
		if(a1.getDateReceived().before(a2.getDateReceived()))
		return 1;
		else 
		return 0;
	}*/
	/*@Override
	public int compareTo(Object o) {
		Activities act = (Activities)o;
		if(this.getDateReceived().before(act.getDateReceived()))
		return 0;
		else
			return 1;
	}*/
}
