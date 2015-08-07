/**
 * 
 */
package com.moe.sls.service;

import java.util.List;




import com.rfg.tprm.common.dto.UserDTO;
import com.moe.sls.model.QsttQuestionnaire;
import com.moe.sls.model.Questionnaire;

/**
 * @author bhavya_b
 *
 */
public interface QuestionnaireDistribtionService {

	//Get the user details
	public List<UserDTO> getUserDetails(String userNameFromSearch, String type);
	
	//Save Questionnaire details that has been distributed
	public Long saveDistributedQuestionnaire(Questionnaire questionnaireDTO);
	
	//Get the details of questionnaire_def
	public Questionnaire getQuestionnaireDef(Questionnaire questionnaireDTO);
	
	//Update the questionnaire table after getting the response
	public void updateQuestionnaire(Questionnaire questionnaireDTO);
	
	public Long getLinkId(Long qnrDefId);
}
