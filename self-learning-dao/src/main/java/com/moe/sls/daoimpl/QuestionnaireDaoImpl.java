package com.moe.sls.daoimpl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;




import com.rfg.tprm.common.dto.UserDTO;
import com.moe.sls.dao.QuestionnaireDao;
import com.moe.sls.model.QsttQuestionnaire;
import com.moe.sls.model.QsttQuestionnaireDef;
import com.moe.sls.model.Questionnaire;

public class QuestionnaireDaoImpl implements QuestionnaireDao{
	
	
	//Get the user details
	public List<UserDTO> getUserDetails(String userNameToSearch , String type){
		List<UserDTO> userDTOList = new ArrayList<UserDTO>();
		try {
			/*Criteria cri = getCurrentSession().createCriteria(UserModel.class);
			cri.add(Restrictions.or(
					Restrictions.or( Restrictions.like("firstName", userNameToSearch + "%")),
					Restrictions.or( Restrictions.like("lastName", userNameToSearch + "%")
							,Restrictions.like("loginId", userNameToSearch + "%"))
					)).add(Restrictions.ne("isActive", (byte)0)); */

		//	SQLQuery query = getCurrentSession().createSQLQuery("select u.id,u.first_name,u.last_name,u.login_id,o.legal_name,u.organisation_id,e.responsible_party from user as u, organisation_name as o,organisation_external as e  where (u.first_Name like :useruserNameToSearch or u.last_name like :useruserNameToSearch or login_id like :useruserNameToSearch and u.is_active != 0) and u.organisation_id = o.organisation_id and e.organisation_id = o.organisation_id  ");
			
			String query = "select id,first_name, last_name, login_id,(select legal_name from organisation_name where user.organisation_id = organisation_id),organisation_id,"+
							"(select responsible_party from organisation_external where user.is_internal = 0 and user.organisation_id = organisation_id) as 'Responsible Party',"+
							"(select login_id from user usr where usr.id = (select responsible_party from organisation_external where user.is_internal = 0 and user.organisation_id = organisation_id) ) as 'Resp. Party Mail'"+
							"from user where ((upper(first_name) like upper(:useruserNameToSearch) OR upper(last_name) like upper(:useruserNameToSearch) OR upper(login_id) like upper(:useruserNameToSearch))) and is_active=1";
			
			if(type.equalsIgnoreCase("B")){
				
				query = query + " and user.is_internal != 0 ;" ;
			} else {
				
				query = query + ";";
			}
			
			System.out.println(query.toString());
			
			SQLQuery sql = this.getSQLQuery(query);
		/*	SQLQuery query = getCurrentSession().createSQLQuery("select id,first_name, last_name, login_id,(select legal_name from organisation_name where user.organisation_id = organisation_id),organisation_id,"+
							"(select responsible_party from organisation_external where user.is_internal = 0 and user.organisation_id = organisation_id) as 'Responsible Party'"+
							"from user where (upper(first_name) like upper(:useruserNameToSearch) OR upper(last_name) like upper(:useruserNameToSearch) OR upper(login_id) like upper(:useruserNameToSearch));");*/
			
			sql.setParameter("useruserNameToSearch", userNameToSearch+"%");

			List<Object[]> obj = sql.list();
			
			for(Object[] o : obj){
				
				UserDTO u = new UserDTO();
				u.setId(((BigInteger)o[0]).longValue());
				u.setFirstName((String)o[1]);
				u.setLastName((String)o[2]);
				u.setLoginId((String)o[3]);
				u.setOrgName((String)o[4]);
				u.setOrganisationId(((BigInteger)o[5]).longValue());
				if(o[6] != null){
					u.setResponisblePartyId(((BigInteger)o[6]).longValue());
					u.setResponsiblePartyEmailId((String)o[7]);
				}
				
				
				userDTOList.add(u);
			}
			
			/*List<UserModel> userList = cri.list();
			for (int i = 0; i < userList.size(); i++) {
				userDTOList.add(userList.get(i).getUserDetail());
			}*/
		} catch (HibernateException he) {
			throw new DataBaseException("DE_02", he);
		}
		return userDTOList;
	}

	//Save Questionnaire details that has been distributed
	public Long saveDistributedQuestionnaire(Questionnaire questionnaireDTO){
		
		Long qsttQuestionnaire_2 = null;
		
		try{
			QsttQuestionnaire qsttQuestionnaire = new QsttQuestionnaire();
			qsttQuestionnaire.setId(questionnaireDTO.getId());
			qsttQuestionnaire.setSender(questionnaireDTO.getSender().toString());
			qsttQuestionnaire.setSentOn(questionnaireDTO.getSentOn());
			qsttQuestionnaire.setResponder(questionnaireDTO.getResponder().toString());
			StringBuilder s = new StringBuilder();
			if(questionnaireDTO.getRecipient() != null){
				for(BigInteger b : questionnaireDTO.getRecipient()){
					
					s.append(b.toString());
				}
			}
			qsttQuestionnaire.setRecipient(s.toString());
			qsttQuestionnaire.setStatus(questionnaireDTO.getStatus().getStatus());
			qsttQuestionnaire.setThirdParty(questionnaireDTO.getThirdParty().toString());
			if(questionnaireDTO.getIsActive() == 1)
				qsttQuestionnaire.setIsActive(true);
			else 
				qsttQuestionnaire.setIsActive(false);
			
			QsttQuestionnaireDef questionDef = new QsttQuestionnaireDef();
			questionDef.setId(questionnaireDTO.getQuestionnaireDef());
			qsttQuestionnaire.setQsttQuestionnaireDef(questionDef);
			
		//	saveOrUpdate(qsttQuestionnaire);	
			
		
			qsttQuestionnaire_2 = save(qsttQuestionnaire);
			//qsttQuestionnaire_2 = merge(qsttQuestionnaire);
			//System.out.println(qsttQuestionnaire_2.getId());
		}
		catch (HibernateException hq) {
			throw new DataBaseException("DBE_20", hq);
		}
		
		return qsttQuestionnaire_2;
		
	}
	
	//Get the details of selected questionnaire_def
	public Questionnaire getQuestionnaireDef(Questionnaire questionnaireDTO){
		Questionnaire questionnaire = new Questionnaire();
		try{
			
			String query ="select q.* from qstt_questionnaire as q where q.qstt_questionnaire_def_id=:qid and q.responder=:responderId ";
			
			SQLQuery sql = this.getSQLQuery(query);
			sql.setParameter("qid", questionnaireDTO.getQuestionnaireDef());
			sql.setParameter("responderId", questionnaireDTO.getResponder());
			/*Criteria cri = getCurrentSession().createCriteria(QuestionnaireDefDistribution.class);
			cri.add(Restrictions.like("id", 1L));*/
			//Object[] obj = (Object[])sql.uniqueResult();
			Object obj[] = null;
			List<Object[]> objectList=sql.list();
			int listSize=objectList.size();
			int k=0;
			for(int i=0;i<listSize;i++){
				obj=objectList.get(k++);
				/*for(int j=0;j<obj.length;j++){
					
				}*/
				
			}
			//QuestionnaireDefDistribution questionnaireDefDistribution = null;
			
			if(obj != null){
				

			questionnaire.setId(Long.parseLong(obj[0].toString()));
			questionnaire.setSender(Long.parseLong(obj[1].toString()));
			
			if(obj[2] != null) {
				questionnaire.setSentOn((Date)obj[2]);
			}
			
			if(obj[3] != null) {
				questionnaire.setSubmitedDate((Date)obj[3]);
			}
			
			questionnaire.setResponder(Long.parseLong(obj[4].toString()));
			if(obj[5].toString().length() != 0){
				
				questionnaire.setRecipient((obj[5].toString()).split(","));
			}
		//	questionnaire.setStatus(obj[6].toString());
			if(obj[7] != null) {
				questionnaire.setTotalScore(Short.parseShort(obj[7].toString()));
			}
			questionnaire.setThirdParty(Long.parseLong(obj[8].toString()));
			if(obj[9].toString().equals(true)){
				
				questionnaire.setIsActive((byte)1);
			}else{
				
				questionnaire.setIsActive((byte)0);
			}
			
			if(obj[10] != null) {
				questionnaire.setVersionNumber(Integer.parseInt(obj[10].toString()));
			}
			
			if(obj[11] != null) {
				questionnaire.setValidityStartDate((Date)obj[11]);
			}
			
			if(obj[12] != null) {
				questionnaire.setValidityEndDate((Date)obj[12]);
			}
			
			if(obj[17] != null) {
				questionnaire.setQuestionnaireDef(Long.parseLong(obj[17].toString()));
			}
			
			
			
	
			
			
		/*	Integer versionNumber = Integer.parseInt(obj[0].toString()); //java.math.BigInteger.valueOf(new Integer(String.valueOf(obj))).intValue();
			System.out.println("Version number -- "+versionNumber);
			Date validityStartDate = (Date)obj[1];
			System.out.println("Start date -- "+validityStartDate);
			Date validityEndDate = (Date)obj[2];
			System.out.println("End date -- "+validityEndDate);
			questionnaire.setVersionNumber(versionNumber);
			questionnaire.setValidityStartDate(validityStartDate);
			questionnaire.setValidityEndDate(validityEndDate);*/
			//questionnaire = questionnaireDefDistribution.getQuestionnaireDef();
			} else {
				
				questionnaire = null;
			}
		}
		catch (HibernateException hq) {
			throw new DataBaseException("DBE_20", hq);
		}
		return questionnaire;
	}
	
	//Update the questionnaire table after getting the response
	public void updateQuestionnaire(Questionnaire questionnaireDTO){
		/*try{
			SQLQuery query = getCurrentSession().createSQLQuery("update qstt_questionnaire q set q.submit_date =: submitDate, q.total_score =: totalScore where q.id =: qid");
			Connection conn = null;
			PreparedStatement pstmt = null;
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			try {
				pstmt.setTimestamp(1, date);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			query.setParameter("submitDate", questionnaireDTO.getSubmitedDate());
			query.setParameter("totalScore", questionnaireDTO.getTotalScore());
			query.setParameter("qid", questionnaireDTO.getId());
			query.executeUpdate();
		}
		catch (HibernateException hq) {
			throw new DataBaseException("DBE_20", hq);
		}*/
	}
	
	

	//@Override
	public Long getLinkId(Long qnrDefId) {
String query ="select q.link_id from qstt_questionnaire_def_qstt_link as q where q.questionnaire_def_id="+qnrDefId;
		
		SQLQuery sql = this.getSQLQuery(query);
		
		/*Criteria cri = getCurrentSession().createCriteria(QuestionnaireDefDistribution.class);
		cri.add(Restrictions.like("id", 1L));*/
		java.math.BigInteger id =(java.math.BigInteger) sql.uniqueResult();
		Long linkId = id.longValue();
		 return linkId;
		//QuestionnaireDefDistribution questionnaireDefDistribution = null;
	}
}
