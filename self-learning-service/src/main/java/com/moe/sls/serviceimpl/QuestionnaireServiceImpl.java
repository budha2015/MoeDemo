package com.moe.sls.serviceimpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.moe.sls.dao.QsttBoilerplateQuestionDao;
import com.moe.sls.dao.QsttQuestionDao;
import com.moe.sls.dao.QsttQuestionMapDao;
import com.moe.sls.dao.QsttQuestionOptionDao;
import com.moe.sls.dao.QsttQuestionOptionScoreDao;
import com.moe.sls.dao.QsttQuestionnaireDefDao;
import com.moe.sls.model.QsttBoilerplate;
import com.moe.sls.model.QsttBoilerplateQuestion;
import com.moe.sls.model.QsttLegaNames;
import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionCategory;
import com.moe.sls.model.QsttQuestionMap;
import com.moe.sls.model.QsttQuestionMapId;
import com.moe.sls.model.QsttQuestionOption;
import com.moe.sls.model.QsttQuestionOptionId;
import com.moe.sls.model.QsttQuestionOptionScore;
import com.moe.sls.model.QsttQuestionOptionScoreId;
import com.moe.sls.model.QsttQuestionType;
import com.moe.sls.model.QsttQuestionnaireDef;
import com.moe.sls.model.QuestionSetUpComponent;
import com.moe.sls.service.QuestionnaireService;
import com.rfg.tprm.questionnaire.util.QuestionnaireConstants;
import com.rfg.tprm.questionnaire.util.Utility;

@Service
public class QuestionnaireServiceImpl implements QuestionnaireService, QuestionnaireConstants {

	@Autowired
	QsttQuestionDao qsttQuestionDao;
	@Autowired
	QsttQuestionMapDao qsttQuestionMapDao;
	@Autowired
	QsttQuestionOptionDao qsttQuestionOptionDao;
	@Autowired
	QsttQuestionOptionScoreDao qsttQuestionOptionScoreDao;
	@Autowired
	private QsttQuestionCategory qsttQuestionCategory;
	@Autowired
	private QsttQuestion qsttQuestion;
	@Autowired
	private QsttQuestionType qsttQuestionType;
	@Autowired
	private QsttQuestionMap qsttQuestionMap;
	@Autowired
	private QsttQuestionMapId qsttQuestionMapId;
	@Autowired
	private QsttQuestionnaireDef qsttQuestionnaireDef;
	@Autowired
	private QsttQuestionOption qsttQuestionOption;
	@Autowired
	private QsttQuestionOptionId qsttQuestionOptionId;
	@Autowired
	private QsttQuestionOptionScore qsttQuestionOptionScore;
	@Autowired
	private QsttQuestionOptionScoreId qsttQuestionOptionScoreId;
	@Autowired
	private QsttQuestionnaireDefDao qsttQuestionnaireDefDao;
	@Autowired
	QsttBoilerplateQuestionDao qsttBoilerplateQuestionDao;
	@Autowired
	private QsttBoilerplate qsttBoilerplate;
	@Autowired
	private QsttBoilerplateQuestion qsttBoilerplateQuestion;
	@Autowired
	private DriverManagerDataSource parentdataSource;
	
	private JdbcTemplate jdbcTemplate;
	ArrayList<SqlParameter> params= new ArrayList<SqlParameter>();

	//@Override
	public Long createQuestion(QsttQuestion qsttQuestion) {
		Long questionId = null;
		try{
			if (qsttQuestion != null) {
				questionId = qsttQuestionDao.createQuestion(qsttQuestion);
			}
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		
		return questionId;
	}
	//@Override
	public void saveTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {

		try {
			if (qtemplatequestion != null) {
				qsttBoilerplateQuestionDao
						.saveTemplateQuestion(qtemplatequestion);
			} else {
			}
		} catch (Exception de) {
			de.printStackTrace();

		}
		
	}
	//@Override
	public void updateQuestion(QsttQuestion qsttQuestion) {
		try{
			if(qsttQuestion != null){
				//qsttQuestionDao.saveOrUpdate(qsttQuestion);
				
				qsttQuestionDao.modifyQuestion(qsttQuestion);
				
			}
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		
	}
	
	//@Override
	public void modifyQuestion(QsttQuestion qsttQuestion) {
		try{
			if(qsttQuestion != null){
				qsttQuestionDao.saveOrUpdate(qsttQuestion);
				
			}
		}catch(PartnerIntegrityException de){
			throw new PartnerIntegrityException(de.getMessage(), de);
		}
		
	}
	
	//@Override
	public QsttQuestionMapId createQsttQuestionMap(QsttQuestionMap qsttQuestionMap) {
		QsttQuestionMapId qsttQuestionMapId = null;
		try {
			if (qsttQuestionMap != null){
				
				qsttQuestionMapId = qsttQuestionMapDao.createQsttQuestionMap(qsttQuestionMap);
			}
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		
		return qsttQuestionMapId;
	}

	//@Override
	public QsttQuestionOptionId addAnswerOption(QsttQuestionOption qsttQuestionOption) {
		QsttQuestionOptionId qsttQuestionOptionId = null;
		try {
			if (qsttQuestionOption != null) {
				qsttQuestionOptionDao.addAnswerOption(qsttQuestionOption);
			}
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		return qsttQuestionOptionId;

	}
	//@Override
	public QsttQuestionOptionId saveAnswers(QsttQuestionOption qsttQuestionOption) {
		QsttQuestionOptionId qsttQuestionOptionId = null;
		try {
			if (qsttQuestionOption != null) {
				qsttQuestionOptionDao.saveAnswers(qsttQuestionOption);
			}
		}catch(Exception de){
			throw new Exception(de.getMessage(), de);
		}
		return qsttQuestionOptionId;
	}
	//@Override
	public QsttQuestionOptionScoreId addAnswerOptionScore(QsttQuestionOptionScore qsttQuestionOptionScore) {
		QsttQuestionOptionScoreId qsttQuestionOptionScoreId = null;
		if (qsttQuestionOptionScore != null) {
			
			qsttQuestionOptionScoreDao.addAnswerOptionScore(qsttQuestionOptionScore);
		}
		return qsttQuestionOptionScoreId;
	}
	
	//@Override
	public String checkDuplicateQuestion(QuestionSetUpComponent questionSetUpComponent) {
		
		return callProcedure(questionSetUpComponent);
	}
	private String callProcedure(QuestionSetUpComponent questionSetUpComponent){
		final List<String> OptionValues = questionSetUpComponent.getAnswerOptionValue();
		String options = Utility.getAnswerOptions(OptionValues);
		if((options.charAt(0))=='|'){
			
			options = options.substring(1, options.length());
		}else if(options.startsWith(" |") && !(questionSetUpComponent.getQuestionType().toString().equalsIgnoreCase("2")) && !(questionSetUpComponent.getQuestionType().toString().equalsIgnoreCase("3")) && !(questionSetUpComponent.getQuestionType().toString().equalsIgnoreCase("4"))){
			options = options.substring(2, options.length());
		}
		log.info("options============"+options);
		jdbcTemplate = new JdbcTemplate(parentdataSource);
		String result="";
		Connection con = null;
		CallableStatement cstmt = null;
		String questionText = questionSetUpComponent.getQuestionText();
		params.add(new SqlParameter(Types.VARCHAR));
		params.add(new SqlParameter(Types.VARCHAR));
		params.add(new SqlOutParameter(RESULT, Types.VARCHAR));
		try{
				con= jdbcTemplate.getDataSource().getConnection();
								
				cstmt = con.prepareCall("{call Proc_CheckQuestionS(?,?,?)}");
				cstmt.setString(1,questionText);
				cstmt.setString(2, options);
				cstmt.registerOutParameter(3, Types.VARCHAR);
				cstmt.execute();
				result = cstmt.getString(3);
				
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			
			try {
				if(cstmt != null){
					cstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(con != null){
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	
	//@Override
	//@Transactional
	public void createQuestionSetUp(QuestionSetUpComponent questionSetUpComponent) {
		
				// adding questions
		try {
				if(questionSetUpComponent.getQuestionCategory() != 0){
					
					qsttQuestionCategory.setId(questionSetUpComponent.getQuestionCategory());
					qsttQuestion.setQsttQuestionCategory(qsttQuestionCategory);
				}
				qsttQuestionType.setId(questionSetUpComponent.getQuestionType());
				qsttQuestion.setQsttQuestionType(qsttQuestionType);
				//qsttQuestion.setId(questionComponent.getQuestionId());
				qsttQuestion.setQtext(questionSetUpComponent.getQuestionText());
				//qsttQuestion.setIsBanked(questionComponent.getQuestionBanked());
				qsttQuestion.setDescription(questionSetUpComponent.getQuestionText());
				qsttQuestion.setIsActive(questionSetUpComponent.getIsActive());
				qsttQuestion.setIsBanked(questionSetUpComponent.getIsBanked());
				qsttQuestion.setId(questionSetUpComponent.getQuestionId());
				/*qsttQuestion.setCreateDate(new Date());
				qsttQuestion.setCreateBy(new Long(89));
				qsttQuestion.setUpdateDate(new Date());
				qsttQuestion.setUpdateBy(new Long(89));*/
				Long questionId = null;
				if(questionSetUpComponent.getQuestionId() != null && questionSetUpComponent.getQuestionId()>0) {
					this.modifyQuestion(qsttQuestion);
				}else
				{
					
					questionId = this.createQuestion(qsttQuestion);
				}
				
				// adding AnswerOptions and AnsweroptionScore
				int answerOptionId = 1;
				if (((questionSetUpComponent.getQuestionType().toString()).equals("6") || (questionSetUpComponent.getQuestionType().toString()).equals("8") || (questionSetUpComponent.getQuestionType().toString()).equals("5") || (questionSetUpComponent.getQuestionType().toString()).equals("7"))){
					answerOptionId = 0;
				}
				if (questionSetUpComponent != null && questionSetUpComponent.getAnswerOptionValue() != null && questionSetUpComponent.getAnswerOptionValue().size() > 0) {
					for (String answerOptionValues : questionSetUpComponent.getAnswerOptionValue()) {
							///qsttQuestionOptionId.setId(id);
						
						// adding AnswerOptions
						qsttQuestionOptionId.setId(answerOptionId);
						/*if(questionSetUpComponent.getQuestionId() != null && !(questionSetUpComponent.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
							qsttQuestionOptionId.setQsttQuestionId(questionSetUpComponent.getQuestionId());
						}else{
							
							qsttQuestionOptionId.setQsttQuestionId(questionId);
						}*/
						
							if (answerOptionValues != null){// && !answerOptionValues.equals(EMPTY)){
								if(((questionSetUpComponent.getQuestionType().toString()).equals("6") || (questionSetUpComponent.getQuestionType().toString()).equals("8") || (questionSetUpComponent.getQuestionType().toString()).equals("5") || (questionSetUpComponent.getQuestionType().toString()).equals("7")) && !((answerOptionValues.trim()).equals(""))){
									if(questionSetUpComponent.getQuestionId() != null && !(questionSetUpComponent.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
										
										qsttQuestionOptionId.setQsttQuestionId(questionSetUpComponent.getQuestionId());
									}else{
										qsttQuestionOptionId.setQsttQuestionId(questionId);
									}
							qsttQuestionOption.setId(qsttQuestionOptionId);
							qsttQuestionOption.setQsttQuestion(qsttQuestion);
							//qsttQuestionOption.setOptionOrder(questionSetUpComponent.getQuestionOrder());
							qsttQuestionOption.setOptionValue((answerOptionValues.trim()).equals("")?" ":answerOptionValues);
							//qsttQuestionOption.setAnswerWording("wordingwording of rfg");
							qsttQuestionOption.setIsActive(questionSetUpComponent.getIsActive());
			
							QsttQuestionOptionId qsttQuestionOptionId = this.addAnswerOption(qsttQuestionOption);
								}else if ((questionSetUpComponent.getQuestionType().toString()).equals("1") || (questionSetUpComponent.getQuestionType().toString()).equals("2") || (questionSetUpComponent.getQuestionType().toString()).equals("3") || (questionSetUpComponent.getQuestionType().toString()).equals("4") || (questionSetUpComponent.getQuestionType().toString()).equals("9") || (questionSetUpComponent.getQuestionType().toString()).equals("10") || (questionSetUpComponent.getQuestionType().toString()).equals("11") || (questionSetUpComponent.getQuestionType().toString()).equals("12")){
									if(questionSetUpComponent.getQuestionId() != null && !(questionSetUpComponent.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
										
										qsttQuestionOptionId.setQsttQuestionId(questionSetUpComponent.getQuestionId());
									}else{
										qsttQuestionOptionId.setQsttQuestionId(questionId);
									}
									qsttQuestionOption.setId(qsttQuestionOptionId);
									qsttQuestionOption.setQsttQuestion(qsttQuestion);
									//qsttQuestionOption.setOptionOrder(questionSetUpComponent.getQuestionOrder());
									qsttQuestionOption.setOptionValue((answerOptionValues.trim()).equals("")?" ":answerOptionValues);
									//qsttQuestionOption.setAnswerWording("wordingwording of rfg");
									qsttQuestionOption.setIsActive(questionSetUpComponent.getIsActive());
					
									QsttQuestionOptionId qsttQuestionOptionId = this.addAnswerOption(qsttQuestionOption);									
									
								}
								
					}
							answerOptionId++;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Override
	public Long createQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef) {
		Long qsttQuestionnaireDefId = null;
		if (qsttQuestionnaireDef != null) {
			
			qsttQuestionnaireDefId = qsttQuestionnaireDefDao.createQuestionnaire(qsttQuestionnaireDef);
		}
		return qsttQuestionnaireDefId;
	}
	//@Override
	public List<String> getAllQuestionnaire(QsttQuestionnaireDef qsttQuestionnaireDef) {
		List<String> questionnaireNames = null;
		if (qsttQuestionnaireDef != null){
			questionnaireNames = qsttQuestionnaireDefDao.getAllQuestionnaire(qsttQuestionnaireDef);
		}
		return questionnaireNames;
	}
	
	//@Override
	public List<String> getAllQuestionnaireWithDescription( QsttQuestionnaireDef qsttQuestionnaireDef) {
		List<String> questionnaireNames = null;
		if (qsttQuestionnaireDef != null){
			questionnaireNames = qsttQuestionnaireDefDao.getAllQuestionnaireWithDescription(qsttQuestionnaireDef);
		}
		return questionnaireNames;
	}
	//@Override
	//@Transactional
	public void createQuestionnaireSetUp(List<QuestionSetUpComponent> questionComponentList) {
		
		int id = 0;
		Long questionId = null;
		if (questionComponentList != null && questionComponentList.size() > 0) {
			
			for (QuestionSetUpComponent qc : questionComponentList) {
				
				try {
					
					if(qc.getQuestionCategory() != null){
						qsttQuestionCategory.setId(qc.getQuestionCategory());
						qsttQuestion.setQsttQuestionCategory(qsttQuestionCategory);
					}
					qsttQuestionType.setId(qc.getQuestionType());
					if (qc.getQuestionType().toString().equalsIgnoreCase("1") || qc.getQuestionType().toString().equalsIgnoreCase("2") || qc.getQuestionType().toString().equalsIgnoreCase("11") || qc.getQuestionType().toString().equalsIgnoreCase("12") ||qc.getQuestionType().toString().equalsIgnoreCase("13")){
						qsttQuestionMap.setIsBranch(false);
					}else{
						qsttQuestionMap.setIsBranch(true);
					}
					
					qsttQuestion.setQsttQuestionType(qsttQuestionType);
					qsttQuestion.setQtext(qc.getQuestionText());
					qsttQuestion.setCreateBy(qc.getUserId());
					if(null != qc.getIsBanked()) {
						String check = callProcedure(qc);
						if(check.equalsIgnoreCase(YES))
						{
							qsttQuestion.setIsBanked(false);
						}else{
							qsttQuestion.setIsBanked(qc.getIsBanked());
						}
						
					}else {
						
						qsttQuestion.setIsBanked(false);
					}
					qsttQuestion.setIsActive(qc.getIsActive());
					
					if(qc.getQuestionId() != null && !(qc.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
						qsttQuestion.setId(qc.getQuestionId());
						if(!(qc.getQuestionType().toString().equalsIgnoreCase("13"))){
							
							this.updateQuestion(qsttQuestion);
						}
						if (qc.getTemPlate() != null){
							qsttBoilerplate.setId(qc.getTemplatId());
							qsttQuestion.setId(qc.getQuestionId());
							qsttBoilerplateQuestion.setQsttBoilerplate(qsttBoilerplate);
							qsttBoilerplateQuestion.setQsttQuestion(qsttQuestion);
							qsttBoilerplateQuestion.setCreateBy(393L);
							qsttBoilerplateQuestion.setCreateDate(new Date());
							qsttBoilerplateQuestion.setUpdateBy(1L);
							qsttBoilerplateQuestion.setUpdateDate(new Date());
							this.saveTemplateQuestion(qsttBoilerplateQuestion);
						}
						qsttQuestionMapId.setQsttQuestionId(qc.getQuestionId());
						
						
					}else{
						
						questionId = this.createQuestion(qsttQuestion);
						if (qc.getTemPlate() != null){
							qsttBoilerplate.setId(qc.getTemplatId());
							qsttQuestion.setId(questionId);
							qsttBoilerplateQuestion.setQsttBoilerplate(qsttBoilerplate);
							qsttBoilerplateQuestion.setQsttQuestion(qsttQuestion);
							qsttBoilerplateQuestion.setCreateBy(393L);
							qsttBoilerplateQuestion.setCreateDate(new Date());
							qsttBoilerplateQuestion.setUpdateBy(1L);
							qsttBoilerplateQuestion.setUpdateDate(new Date());
							this.saveTemplateQuestion(qsttBoilerplateQuestion);
						}
						qsttQuestionMapId.setQsttQuestionId(questionId);
					// Adding QuestionnaireQuestion
					
					}	
					
					
					qsttQuestionMapId.setQsttQuestionnaireDefId(qc.getQuestionnaireId());
					qsttQuestionMap.setId(qsttQuestionMapId);
					qsttQuestionMap.setQsttQuestion(qsttQuestion);
					qsttQuestionnaireDef.setId(qc.getQuestionnaireId());
					qsttQuestionMap.setQsttQuestionnaireDef(qsttQuestionnaireDef);
					qsttQuestionMap.setSectionLabel(qc.getSectionLabel());
					qsttQuestionMap.setSectionOrder(qc.getSectionOrder());
					qsttQuestionMap.setQuestionOrder(qc.getQuestionOrder());
					qsttQuestionMap.setTagName(qc.getQuestionTag());
					qsttQuestionMap.setIsMandatory(qc.getQuestionMandatory());
					qsttQuestionMap.setIsAttachment(qc.getQuestionAttachment());
					//qsttQuestionMap.setIsBranch(true);
					createQsttQuestionMap(qsttQuestionMap);
					
					
					// adding AnswerOptions and AnsweroptionScore
					int answerOptionId = 1;
					
					if (questionComponentList.get(id) != null && questionComponentList.get(id).getAnswerOptionValue() != null && questionComponentList.get(id).getAnswerOptionValue().size() > 0) {
						for (int i = 0 , j = 0 ; i < questionComponentList.get(id).getAnswerOptionValue().size() || j < questionComponentList.get(id).getAnswerOptionScore().size(); i++ , j++) {
							
							/*if(questionComponentList.get(id).getAnswerOptionValue() != null && !(questionComponentList.get(id).getAnswerOptionValue().toString().equalsIgnoreCase(EMPTY))){
								this.updateAnswers(qsttQuestionOption);
							}else{*/
							
							// adding AnswerOptions
							qsttQuestionOptionId.setId(answerOptionId);
							if(qc.getQuestionId() != null && !(qc.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
								qsttQuestionOptionId.setQsttQuestionId(qc.getQuestionId());
							}else{
								
								qsttQuestionOptionId.setQsttQuestionId(questionId);
							}
							qsttQuestionOption.setId(qsttQuestionOptionId);
							qsttQuestionOption.setQsttQuestion(qsttQuestion);
							/*if(questionComponentList.get(id).getAnswerOptionValue().get(i).equalsIgnoreCase("dd-mm-yyyy")){
								qsttQuestionOption.setOptionValue("");
								
							}else{*/
								qsttQuestionOption.setOptionValue(questionComponentList.get(id).getAnswerOptionValue().get(i));
							//}
							qsttQuestionOption.setIsActive(true);
							if(qc.getQuestionId() != null && !(qc.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
								
								addAnswerOption(qsttQuestionOption);
							}else{
								QsttQuestionOptionId qsttQuestionOptionId = this.saveAnswers(qsttQuestionOption);
							}
			
							

							// adding AnswerOptionScore
							if(questionComponentList.get(id)!=null && questionComponentList.get(id).getAnswerOptionScore() != null && questionComponentList.get(id).getAnswerOptionScore().size() > 0)
							{
								
								if (!((questionComponentList.get(id).getAnswerOptionScore().get(j)).toString()).equals("0")){
									if(qc.getQuestionId() != null && !(qc.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
										
										qsttQuestionOptionScoreId.setQuestionId(qc.getQuestionId());
									}else{
										qsttQuestionOptionScoreId.setQuestionId(qsttQuestionOptionId.getQsttQuestionId());
									}
									qsttQuestionOptionScoreId.setQuestionOptionId(qsttQuestionOptionId.getId());
									qsttQuestionOptionScore.setId(qsttQuestionOptionScoreId);
									qsttQuestionOptionScore.setQsttQuestionMap(qsttQuestionMap);
									
									qsttQuestionOptionScore.setRiskScore(questionComponentList.get(id).getAnswerOptionScore().get(j));
									QsttQuestionOptionScoreId qsttQuestionOptionScoreId = this.addAnswerOptionScore(qsttQuestionOptionScore);
									}else{
										if(qc.getQuestionId() != null && !(qc.getQuestionId().toString().equalsIgnoreCase(EMPTY))){
											
											qsttQuestionOptionScoreId.setQuestionId(qc.getQuestionId());
										}else{
											qsttQuestionOptionScoreId.setQuestionId(qsttQuestionOptionId.getQsttQuestionId());
										}
										qsttQuestionOptionScoreId.setQuestionOptionId(qsttQuestionOptionId.getId());
										qsttQuestionOptionScore.setId(qsttQuestionOptionScoreId);
										qsttQuestionOptionScore.setQsttQuestionMap(qsttQuestionMap);
										
										qsttQuestionOptionScore.setRiskScore(questionComponentList.get(id).getAnswerOptionScore().get(j));
										QsttQuestionOptionScoreId qsttQuestionOptionScoreId = this.addAnswerOptionScore(qsttQuestionOptionScore);
									}
								
								
							}
							
							answerOptionId++;
							
						}
						
					}
					
					
					
			} catch (Exception e) {
				e.printStackTrace();
			}
				id++;
				
				qsttQuestionCategory = new QsttQuestionCategory();
				qsttQuestion = new QsttQuestion();
				qsttQuestionType = new QsttQuestionType();
				qsttQuestionMapId = new QsttQuestionMapId();
				qsttQuestionMap = new QsttQuestionMap();
				qsttQuestionnaireDef = new QsttQuestionnaireDef();
				qsttQuestionOptionId = new QsttQuestionOptionId();
				qsttQuestionOption = new QsttQuestionOption();
				qsttQuestionOptionScoreId = new QsttQuestionOptionScoreId();
				qsttQuestionOptionScore = new QsttQuestionOptionScore();
				
		}
			
			
		}
		
	}

	//@Override
	public void deleteQuestion() {
		
		qsttQuestionMapId.setQsttQuestionId(new Long(1));
		qsttQuestionMapId.setQsttQuestionnaireDefId(new Long(1));
		qsttQuestionMap.setId(qsttQuestionMapId);
		qsttQuestionOptionScoreId.setQuestionId(new Long(62));
		qsttQuestionOptionScoreId.setQuestionOptionId(new Long(4));
		qsttQuestionOptionScore.setId(qsttQuestionOptionScoreId);
		qsttQuestionOptionScore.setQsttQuestionMap(qsttQuestionMap);
		qsttQuestionOptionScoreDao.deleteQuestion(qsttQuestionOptionScore);
		
		qsttQuestionMapId.setQsttQuestionId(new Long(68));
		qsttQuestionMapId.setQsttQuestionnaireDefId(new Long(1));
		qsttQuestionMap.setId(qsttQuestionMapId);
		qsttQuestionMapDao.delete(qsttQuestionMap);
	}
	
	//@Override
	public List<QsttLegaNames> getLegaNameList(String legalNameToSearch) {
		
		try {
			 //String query = "SELECT CONCAT(id ,':', legal_name) from organisation_name";
			 //String query = "select id, legal_name from organisation_name where ((upper(legal_name) like upper(:legalNameToSearch) OR upper(id) like upper(:legalNameToSearch)))";
			 //String query = "select id, legal_name from organisation_name where legal_name like '"+legalNameToSearch+"%'";
			 String query = "select organisation_id, legal_name from organisation org , organisation_name orgn where org.id=orgn.organisation_id and org.is_internal=0 and orgn.legal_name like '"+legalNameToSearch+"%'";
			 SQLQuery sql = getSQLQuery(query);
			 List<QsttLegaNames> orginasationLegaNameList = new ArrayList<QsttLegaNames>();
			 //sql.setParameter("legalNameToSearch", legalNameToSearch+"%");
			 List<Object[]> orginasationLegaNameLists = sql.list();
			
			 System.out.println("orginasationLegaNameLists in service=============="+orginasationLegaNameLists.size());
			 QsttLegaNames qsttLegaNameList = null;
			 for(Object[] obj : orginasationLegaNameLists){
				 qsttLegaNameList = new QsttLegaNames();
				 qsttLegaNameList.setLegalNameId(obj[0]!=null?((java.math.BigInteger)obj[0]).toString():"");
				 qsttLegaNameList.setCompanyLegalName(obj[1]!=null?(java.lang.String)obj[1]:"");
				 orginasationLegaNameList.add(qsttLegaNameList);
			 }
			 
			 return orginasationLegaNameList;
			 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//@Override
	public List<String> getNamaDecs(Long id) {
		String hql = "select concat(name,'-',description) from QsttQuestionnaireDef where id="+id;
		Query query = this.getQuery(hql);
		List<String> namedescList = query.list();
		return namedescList;
	}
}
