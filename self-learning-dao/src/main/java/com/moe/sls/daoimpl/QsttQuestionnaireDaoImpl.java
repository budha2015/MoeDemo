package com.moe.sls.daoimpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moe.sls.dao.QsttQuestionnaireDao;
import com.moe.sls.model.QsttQuestionnaire;
import com.moe.sls.model.QsttQuestionnaireLink;
import com.rfg.tprm.questionnaire.util.Utility;


public class QsttQuestionnaireDaoImpl implements QsttQuestionnaireDao {
	
	QsttQuestionnaireLink qsttQuestionnaireLink = null;
	/*static String gencode() {
		String[] letters = new String[15];
		letters = "0123456789ABCDE".split("");
		String code = "#";
		for (int i = 0; i < 6; i++) {
			double ind = Math.random() * 15;
			int index = (int) Math.round(ind);
			code += letters[index];

		}
		System.out.println(code.length());
		if (code.length() <= 6) {
			gencode();
		}

		return code;
	}
*/
	//@Override
	public List<QsttQuestionnaireLink> listQuestionnaires(String deftype) {
		List<QsttQuestionnaireLink> qlList = new ArrayList<QsttQuestionnaireLink>();
		Map<String, String> colorMap = new HashMap<String, String>();
		String query = null;
		try {
			
			if(deftype != null && ((deftype.equalsIgnoreCase("B")) || (deftype.equalsIgnoreCase("Q")))){
				/*query = "select qnrdef.id as 'qnrdef_Id', qnrdef.name, qnrdef.status, "
						+ "qlink.id as 'Link Id', qlink.link_name as 'Link Name' "
						+ ", qnrdef.description, qnrdef.def_type, qnrdef.create_date,qnrdef.create_by,qnrdef.update_by from qstt_questionnaire_def qnrdef "
						+ "left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnrdef.id "
						+ "left join qstt_link qlink on qnrdeflink.link_id = qlink.id "
						+ "where qnrdef.validity_end_date is null and qnrdef.def_type ='"+deftype+"' order by qnrdef_Id";*/
				query = "select qnrdef.id as 'qnrdef_Id',qnrdef.name,qnrdef.description,qnrdef.def_type,qnrdef.status,qnrdef.create_date,user.first_name as 'Created by User',usr.first_name as 'Updated by User', (select count(1) from qstt_questionnaire where qstt_questionnaire_def_id = qnrdef.id) as 'Count' from qstt_questionnaire_def qnrdef left join user on  user.id=qnrdef.create_by left join user usr on  usr.id=qnrdef.update_by where qnrdef.validity_end_date is null and qnrdef.def_type ='"+deftype+"' order by qnrdef_Id";
				
			}else{
//				 query = "select qnrdef.id as 'qnrdef_Id', qnrdef.name, qnrdef.status, "
//							+ "qlink.id as 'Link Id', qlink.link_name as 'Link Name' "
//							+ ", qnrdef.description, qnrdef.def_type, qnrdef.create_date,qnrdef.create_by,qnrdef.update_by from qstt_questionnaire_def qnrdef "
//							+ "left join qstt_questionnaire_def_qstt_link qnrdeflink on qnrdeflink.questionnaire_def_id = qnrdef.id "
//							+ "left join qstt_link qlink on qnrdeflink.link_id = qlink.id "
//							+ "where qnrdef.validity_end_date is null order by qnrdef_Id";
				query = "select qnrdef.id as 'qnrdef_Id',qnrdef.name,qnrdef.description,qnrdef.def_type,qnrdef.status,qnrdef.create_date,user.first_name as 'Created by User',usr.first_name as 'Updated by User', (select count(1) from qstt_questionnaire where qstt_questionnaire_def_id = qnrdef.id) as 'Count' from qstt_questionnaire_def qnrdef left join user on  user.id=qnrdef.create_by left join user usr on  usr.id=qnrdef.update_by where qnrdef.validity_end_date is null order by qnrdef_Id";
			}
			
			SQLQuery sql = this.getSQLQuery(query);
			//QsttQuestionnaireLink qsttQuestionnaireLink = null;
			List<Object[]> questionnairAndLinkLists = sql.list();
			System.out.println("questionnairAndLinkLists.size()============="
					+ questionnairAndLinkLists.size());
			Object obj1 = null;
			Object temp = null;
			String border = ";border: 1px solid black";
			
			for (Object[] obj : questionnairAndLinkLists) {

				int i = 0;
				qsttQuestionnaireLink = new QsttQuestionnaireLink();
				temp = obj[i++];
				qsttQuestionnaireLink
						.setQuestionnaireDefId((temp != null ? temp.toString(): "") + "$");
				temp = obj[i++];
				qsttQuestionnaireLink.setName(temp != null ? temp.toString()
						: "");
				temp = obj[i++];
				qsttQuestionnaireLink.setDescription(temp != null ? temp.toString(): "");
				
				temp = obj[i++];
				qsttQuestionnaireLink.setDefType(temp != null ? temp.toString()
						: "");
				
				temp = obj[i++];
				qsttQuestionnaireLink.setStatus(temp != null ? temp.toString()
						: "");
				
				temp = obj[i++];
				qsttQuestionnaireLink.setCreateDate(Utility.getDate((Date) temp));
				
				temp = obj[i++];
				qsttQuestionnaireLink.setCreateUserFirstName(temp != null ? temp.toString(): "");
				
				temp = obj[i++];
				qsttQuestionnaireLink.setUpdateUserFirstName(temp != null ? temp.toString(): "");
				
				//temp = obj[i++];
				qsttQuestionnaireLink.setLinkId(qsttQuestionnaireLink
						.getQuestionnaireDefId()
						+"");
			//	temp = obj[i++];
				//qsttQuestionnaireLink.setLinkName(temp != null ? temp.toString() : "");

			/*	if (null != qsttQuestionnaireLink.getLinkName()
						&& !qsttQuestionnaireLink.getLinkName().equals("")
						&& colorMap.get(qsttQuestionnaireLink.getLinkName()) == null)
					colorMap.put(qsttQuestionnaireLink.getLinkName(), gencode());

				String colorCode = colorMap.get(qsttQuestionnaireLink
						.getLinkName()) + border;

				qsttQuestionnaireLink
						.setColorCode(colorMap.get(qsttQuestionnaireLink
								.getLinkName()) == null ? "#FFFFFF" : colorCode);*/
				
				
				
				
				
				
				/*temp=obj[i++];
				qsttQuestionnaireLink.setCreate_by(temp !=null?((java.math.BigInteger)(temp)).longValue():0);
				
				temp=obj[i++];
				qsttQuestionnaireLink.setUpdate_by(temp !=null?((java.math.BigInteger)(temp)).longValue():0);*/
				
				
				
				
				
				//String str = qsttQuestionnaireLink.getQuestionnaireDefId();
				//String qid1 = str.substring(0, str.length()-1);
				temp = obj[i++];
				qsttQuestionnaireLink.setCount(temp != null ? ((java.math.BigInteger)(temp)).longValue(): 0);
				qlList.add(qsttQuestionnaireLink);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("From Dao Impl....." + qlList.size());
		return qlList;

	}

	private Long getAssignCount(String str){
		String qid = qsttQuestionnaireLink.getQuestionnaireDefId();
		String qid1 = qid.substring(0, qid.length()-1);
		Long qid2 = Long.parseLong(qid1);
		String query1 = "SELECT COUNT(*) FROM qstt_questionnaire where qstt_questionnaire_def_id="+qid2+"";
		//String query1 = "select distinct qnr.qstt_questionnaire_def_id as 'Qnr ID', (select name from qstt_questionnaire_def where id = qstt_questionnaire_def_id) as 'Qnr Name', (select count(qstt_questionnaire_def_id) from qstt_questionnaire where qstt_questionnaire_def_id=qnr.qstt_questionnaire_def_id) as 'COUNT' from qstt_questionnaire qnr where qnr.qstt_questionnaire_def_id="+qid2+"";

		SQLQuery sql1 = this.getSQLQuery(query1);
		List countList = sql1.list();
		Long assignCount = null;
		if(countList != null && countList.size() > 0){
			for (int i = 0 ; i < countList.size() ; i++) {
				if((countList.get(i)) != null){
					assignCount = ((java.math.BigInteger)countList.get(i)).longValue();
				}
			}
		}
		
		return assignCount;
	}
	
	public int updateQuestionnaire(Long qrId, String status, String date) {
		String date1 = null;
		if (date.equalsIgnoreCase("date")) {
			date1 = "sysdate()";
		}

		String query = "update qstt_questionnaire set submit_date = " + date1
				+ ",status ='" + status + "' where id = " + qrId;
		SQLQuery sq = this.getSQLQuery(query);
		int val = sq.executeUpdate();
		return val;

	}
	
	

}
