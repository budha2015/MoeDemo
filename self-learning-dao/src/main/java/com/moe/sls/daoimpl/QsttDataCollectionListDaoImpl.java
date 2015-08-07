package com.moe.sls.daoimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.moe.sls.dao.QsttDataCollectionListDao;
import com.moe.sls.model.QsttDataCollectionList;
import com.moe.sls.model.QsttLink;

public class QsttDataCollectionListDaoImpl implements QsttDataCollectionListDao {

	static String gencode()   
    {   
        String[] letters = new String[15];   
        letters = "0123456789ABCDEF".split("");   
        String code ="#";   
        for(int i=0;i<6;i++)   
        {   
            double ind = Math.random() * 15;   
            int index = (int)Math.round(ind);   
            code += letters[index];    
        }   
        return code;   
    }   
	
	
	public List<QsttDataCollectionList> getDataCollectionList(String defType,Long userId){
		List<QsttDataCollectionList> qlList = new ArrayList<QsttDataCollectionList>();
		Map<String,String> colorMap = new HashMap<String, String>();
		try{
			
			/* String query = "select  qnr.id as 'qnr_Id', qnr.recipient, qnrdef.name, "
					 		+"qnr.status, qnr.sent_on, qnr.submit_date, qnr.third_party, qnr.qstt_questionnaire_def_id as 'qnrdef_Id', " 
					 		+"usr.id as 'user_Id',usr.given_name, "
					 		+"qlink.id as 'Link Id', qlink.link_name as 'Link Name' "
					 		+"from qstt_questionnaire qnr "
					 		+"left join qstt_questionnaire_def qnrdef on qnrdef.id = qnr.id "
							+"left join user usr on usr.id = qnr.id  "
							+"left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnr.id " 
							+" left join qstt_link qlink on qnrdeflink.link_id = qlink.id "
							+"order by qnrdef_Id";
					 */
			String query = null;
			if(defType != null && ((defType.equalsIgnoreCase("B")) || (defType.equalsIgnoreCase("Q")))){
				query="select  qnr.id as 'Qnr Id', usr.login_id as 'Recipient Mail',qnrdef.name, qnr.status,qnr.sent_on, qnr.submit_date,orgname.legal_name as 'Company Name',qnr.qstt_questionnaire_def_id as 'Qnrdef Id',usr.id,usr.first_name as 'Recipient First name',usr.last_name as 'Recipient Last name',qlink.id as 'Link Id', qlink.link_name as 'Link Name', qnrdef.def_type from qstt_questionnaire qnr left join qstt_questionnaire_def qnrdef on qnrdef.id = qnr.qstt_questionnaire_def_id left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnr.qstt_questionnaire_def_id left join qstt_link qlink on qnrdeflink.link_id = qlink.id left join user usr on usr.id = qnr.responder left join organisation_name orgname on orgname.organisation_id = qnr.third_party where qnr.sender = "+userId+" and qnrdef.def_type='"+defType+"' order by qnr.Id";
			}else{
				query="select  qnr.id as 'Qnr Id', usr.login_id as 'Recipient Mail',qnrdef.name, qnr.status,qnr.sent_on, qnr.submit_date,orgname.legal_name as 'Company Name',qnr.qstt_questionnaire_def_id as 'Qnrdef Id',usr.id,usr.first_name as 'Recipient First name',usr.last_name as 'Recipient Last name',qlink.id as 'Link Id', qlink.link_name as 'Link Name', qnrdef.def_type from qstt_questionnaire qnr left join qstt_questionnaire_def qnrdef on qnrdef.id = qnr.qstt_questionnaire_def_id left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnr.qstt_questionnaire_def_id left join qstt_link qlink on qnrdeflink.link_id = qlink.id left join user usr on usr.id = qnr.responder left join organisation_name orgname on orgname.organisation_id = qnr.third_party where qnr.sender = "+userId+"  order by qnr.Id";
			}
			 

			 SQLQuery sql = this.getSQLQuery(query);
			 QsttDataCollectionList qsttDataCollectionList = null;
			 List<Object[]> qsttDataCollectionLists = sql.list();
			 System.out.println(qsttDataCollectionLists.size());
			 Object obj1 = null;
			 Object temp=null;
			 Object temp1=null;
			 
			 for(Object obj[]:qsttDataCollectionLists){
				 
				 for(Object obj5:obj){
				 
				 System.out.println(obj5+"checkkkkkkkkkkkkkkkk............");
				 
				 }
			 }
			 
			 for(Object[] obj:qsttDataCollectionLists){
				 
				
				 
				 int i = 0;
				 qsttDataCollectionList = new QsttDataCollectionList();
				 temp = obj[i++];
				 qsttDataCollectionList.setQuestionnaireId((temp!=null?temp.toString():""));
				 temp = obj[i++];
				 qsttDataCollectionList.setRecipient(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setQuestionnaireDefname((temp!=null)?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setStatus(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setDateSent((Date)temp);
				 temp = obj[i++];
				 qsttDataCollectionList.setDateCompleted((Date)temp);
				 temp = obj[i++];
				 qsttDataCollectionList.setResponsibleParty(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setQuestionnaireDefId((temp!=null?temp.toString():""));
				 temp = obj[i++];	
				 qsttDataCollectionList.setUserId(temp!=null?temp.toString():"");
/*				 temp = obj[i++];
				 String s1="";
				 if(temp!=null){
					
				  s1=temp.toString();
				 }
				 temp1 = obj[i++];
				 String s2="";
				 if( temp1!=null){
					  s2=temp1.toString(); 
					 
				 }
				
				
				 qsttDataCollectionList.setUserName(temp!=null?s1+"\t"+s2:"");*/
				 temp = obj[i++];
				 qsttDataCollectionList.setRecipientFirstName(temp!=null?temp.toString():"");
				 
				 temp = obj[i++];
				 qsttDataCollectionList.setRecipientLastName(temp!=null?temp.toString():"");
				 
				 temp = obj[i++];
				 qsttDataCollectionList.setLinkId(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setLinkName(temp!=null?temp.toString():"");
				 
				 temp = obj[i++];
				 qsttDataCollectionList.setDefType(temp!=null?temp.toString():"");
				 
				 if(null != qsttDataCollectionList.getLinkName() && !qsttDataCollectionList.getLinkName().equals("") && colorMap.get(qsttDataCollectionList.getLinkName()) == null)
				 colorMap.put(qsttDataCollectionList.getLinkName(), gencode());
				 
			      Set set = colorMap.entrySet();
			
			      Iterator iterator = set.iterator();
			
			      while(iterator.hasNext()) {
			         Map.Entry me = (Map.Entry)iterator.next();
			         System.out.print(me.getKey() + ": ");
			         System.out.println(me.getValue());
			      }
			      qsttDataCollectionList.setColorCode(colorMap.get(qsttDataCollectionList.getLinkName())==null?gencode():colorMap.get(qsttDataCollectionList.getLinkName()));
				 System.out.println(qsttDataCollectionList.getColorCode());

				
			
               	 qlList.add(qsttDataCollectionList);
				 
			 }
			 
		}
		catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("From Dao Impl....."+qlList.size());
		return qlList;
		
	}
	public List<QsttDataCollectionList> getDataCollectionListForUsers(String defType,Long userId){
		List<QsttDataCollectionList> qlList = new ArrayList<QsttDataCollectionList>();
		Map<String,String> colorMap = new HashMap<String, String>();
		String query = null;
		try{
			
			/* String query = "select  qnr.id as 'qnr_Id', qnr.recipient, qnrdef.name, "
					 		+"qnr.status, qnr.sent_on, qnr.submit_date, qnr.third_party, qnr.qstt_questionnaire_def_id as 'qnrdef_Id', " 
					 		+"usr.id as 'user_Id',usr.given_name, "
					 		+"qlink.id as 'Link Id', qlink.link_name as 'Link Name' "
					 		+"from qstt_questionnaire qnr "
					 		+"left join qstt_questionnaire_def qnrdef on qnrdef.id = qnr.id "
							+"left join user usr on usr.id = qnr.id  "
							+"left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnr.id " 
							+" left join qstt_link qlink on qnrdeflink.link_id = qlink.id "
							+"order by qnrdef_Id";
					 */
			 
			 /*String query="select  qnr.id as 'Qnr Id', usr.login_id as 'Recipient Mail',qnrdef.name,qnr.status,qnr.sent_on, qnr.submit_date,orgname.legal_name as 'Company Name',"
			+"qnr.qstt_questionnaire_def_id as 'Qnrdef Id',usr.id,usr.first_name as 'Recipient First name',usr.last_name as 'Recipient Last name',qlink.id as 'Link Id', qlink.link_name as 'Link Name'"
			+" from qstt_questionnaire qnr"
			  +" left join qstt_questionnaire_def qnrdef on qnrdef.id = qnr.qstt_questionnaire_def_id"
			    +" left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnr.qstt_questionnaire_def_id"
			    +" left join qstt_link qlink on qnrdeflink.link_id = qlink.id"
			    +" left join user usr on usr.id = qnr.responder"
			    +" left join organisation_name orgname on orgname.organisation_id = qnr.third_party"
			    +" where usr.id = ?"
			     +" order by qnr.Id";*/

			if(defType != null && ((defType.equalsIgnoreCase("B")) || (defType.equalsIgnoreCase("Q")))){
				
				 query = "select  qnr.id as 'Qnr Id',"
							+ "usr.login_id as 'Recipient Mail',"
							+ "qnrdef.name as 'Qnr Name',"
							+ "qnr.status as 'Qnr Status',"
							+ "qnr.sent_on as 'Qnr Sent on',"
							+ "qnr.submit_date as 'Qnr Submit Date',"
							+ "qnr.qstt_questionnaire_def_id as 'Qnrdef Id',"
							+ "usr.id,usr.first_name as 'Recipient First name',"
							+ "usr.last_name as 'Recipient Last name',"
							+ "orgname.legal_name as 'Company Name' "
							+ "from qstt_questionnaire_def qnrdef, qstt_questionnaire qnr,user usr,organisation_name orgname "
							+ "where qnr.responder = ? "
							+ "and qnr.responder = usr.id "
							+ "and qnr.sender = qnr.sender "
							+ "and qnrdef.id = qnr.qstt_questionnaire_def_id "
							+ "qnrdef.def_type='"+defType+"' "
							+ "and orgname.organisation_id = qnr.third_party order by qnr.Id";				
			}
			
		 query = "select  qnr.id as 'Qnr Id',"
				+ "usr.login_id as 'Recipient Mail',"
				+ "qnrdef.name as 'Qnr Name',"
				+ "qnr.status as 'Qnr Status',"
				+ "qnr.sent_on as 'Qnr Sent on',"
				+ "qnr.submit_date as 'Qnr Submit Date',"
				+ "qnr.qstt_questionnaire_def_id as 'Qnrdef Id',"
				+ "usr.id,usr.first_name as 'Recipient First name',"
				+ "usr.last_name as 'Recipient Last name',"
				+ "orgname.legal_name as 'Company Name' "
				+ "from qstt_questionnaire_def qnrdef, qstt_questionnaire qnr,user usr,organisation_name orgname "
				+ "where qnr.responder = ? "
				+ "and qnr.responder = usr.id "
				+ "and qnr.sender = qnr.sender "
				+ "and qnrdef.id = qnr.qstt_questionnaire_def_id "
				+ "and orgname.organisation_id = qnr.third_party order by qnr.Id";
			 
			

			 SQLQuery sql = this.getSQLQuery(query);
			 sql.setParameter(0,userId);
			 QsttDataCollectionList qsttDataCollectionList = null;
			 List<Object[]> qsttDataCollectionLists = sql.list();
			 System.out.println(qsttDataCollectionLists.size());
//			 Object obj1 = null;
			 Object temp=null;
//			 Object temp1=null;
			 
			/* for(Object obj[]:qsttDataCollectionLists){
				 
				 for(Object obj5:obj){
				 
				 System.out.println(obj5+"checkkkkkkkkkkkkkkkk............");
				 
				 }
			 }*/
			 
			 for(Object[] obj:qsttDataCollectionLists){			
				 
				 int i = 0;
				 qsttDataCollectionList = new QsttDataCollectionList();
				 temp = obj[i++];
				 qsttDataCollectionList.setQuestionnaireId((temp!=null?temp.toString():""));
				 temp = obj[i++];
				 qsttDataCollectionList.setRecipient(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setQuestionnaireDefname((temp!=null)?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setStatus(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setDateSent((Date)temp);
				 temp = obj[i++];
				 qsttDataCollectionList.setDateCompleted((Date)temp);
				 temp = obj[i++];
				 qsttDataCollectionList.setQuestionnaireDefId((temp!=null?temp.toString():""));
				 temp = obj[i++];
				 qsttDataCollectionList.setResponsibleParty(temp!=null?temp.toString():"");	
				 
				 temp = obj[i++];
				 qsttDataCollectionList.setRecipientFirstName(temp!=null?temp.toString():"");
				 
				 temp = obj[i++];
				 qsttDataCollectionList.setRecipientLastName(temp!=null?temp.toString():"");
				 
				 temp = obj[i++];
				 qsttDataCollectionList.setCompanyName(temp!=null?temp.toString():"");
				 
				/* temp = obj[i++];	
				 qsttDataCollectionList.setUserId(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 String s1="";
				 if(temp!=null){
					
				  s1=temp.toString();
				 }
				 temp1 = obj[i++];
				 String s2="";
				 if( temp1!=null){
					  s2=temp1.toString(); 
					 
				 }
				
				
				 qsttDataCollectionList.setUserName(temp!=null?s1+"\t"+s2:"");
				 temp = obj[i++];
				 qsttDataCollectionList.setLinkId(temp!=null?temp.toString():"");
				 temp = obj[i++];
				 qsttDataCollectionList.setLinkName(temp!=null?temp.toString():"");
				 
				 if(null != qsttDataCollectionList.getLinkName() && !qsttDataCollectionList.getLinkName().equals("") && colorMap.get(qsttDataCollectionList.getLinkName()) == null)
				 colorMap.put(qsttDataCollectionList.getLinkName(), gencode());
				 
			      Set set = colorMap.entrySet();
			
			      Iterator iterator = set.iterator();
			
			      while(iterator.hasNext()) {
			         Map.Entry me = (Map.Entry)iterator.next();
			         System.out.print(me.getKey() + ": ");
			         System.out.println(me.getValue());
			      }
			      qsttDataCollectionList.setColorCode(colorMap.get(qsttDataCollectionList.getLinkName())==null?gencode():colorMap.get(qsttDataCollectionList.getLinkName()));
				 System.out.println(qsttDataCollectionList.getColorCode());
*/
				
			
               	 qlList.add(qsttDataCollectionList);
				 
			 }
			 
		}
		catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("From Dao Impl....."+qlList.size());
		return qlList;
		
	}
}
