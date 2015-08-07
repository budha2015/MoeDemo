/**
 * 
 */
package com.moe.sls.serviceimpl;

import java.util.List;

import com.rfg.tprm.common.dto.UserDTO;
import com.moe.sls.dao.QuestionnaireDao;
import com.moe.sls.model.QsttQuestionnaire;
import com.moe.sls.model.Questionnaire;


public class QuestionnaireDistribtionServiceImpl implements QuestionnaireDistribtionService {

	@Autowired
	QuestionnaireDao qstQuestionnaireDistribution;

	// Get the user details
	public List<UserDTO> getUserDetails(String userNameFromSearch, String type) {
		try {

			return this.qstQuestionnaireDistribution.getUserDetails(userNameFromSearch,type);
			
		} catch (DataBaseException de) {
			throw new Exception(de.getMessage(), de);
		} 
	}
	
	//Save Questionnaire details that has been distributed
	public Long saveDistributedQuestionnaire(Questionnaire questionnaireDTO){
		Transaction transaction = null;
		
		Long qsttQuestionaire = null;
		try {
			
			qsttQuestionaire = qstQuestionnaireDistribution.saveDistributedQuestionnaire(questionnaireDTO);
			
		} catch (Exception de) {
			transaction.rollback();
			throw new Exception(de.getMessage(), de);
		} 
		
		return qsttQuestionaire;
	}
	
	//Get the details of questionnaire_def
	public Questionnaire getQuestionnaireDef(Questionnaire questionnaireDTO){
		try {
			
			return qstQuestionnaireDistribution.getQuestionnaireDef(questionnaireDTO);
		} catch (Exception de) {
			throw new Exception(de.getMessage(), de);
		} 
	}
	
	//Update the questionnaire table after getting the response
	public void updateQuestionnaire(Questionnaire questionnaireDTO){
		Transaction transaction = null;
		try {
			
			qstQuestionnaireDistribution.updateQuestionnaire(questionnaireDTO);
			transaction.commit();
		} catch (Exception de) {
			transaction.rollback();
			throw new Exception(de.getMessage(), de);
		}
	}
	
	public Long getLinkId(Long qnrDefId){
		return qstQuestionnaireDistribution.getLinkId(qnrDefId);
	}
}
