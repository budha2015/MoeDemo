package com.moe.sls.serviceimpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.moe.sls.dao.QsttBoilerplateDao;
import com.moe.sls.model.QsttBoilerplate;
import com.moe.sls.model.QsttQuestionBank;
import com.moe.sls.service.QsttBoilerplateService;
//import com.rfg.tprm.questionnaire.service.QsttBoilerplateService;

@Service
public class QsttBoilerplateServiceImpl implements QsttBoilerplateService {
	@Autowired
	QsttBoilerplateDao qsttBoilerplateDao;

	//@Override
	public void saveTemplate(QsttBoilerplate questionnaireTemplate) {
		qsttBoilerplateDao.save(questionnaireTemplate);

	}

	//@Override
	public void updateTemplate(QsttBoilerplate questionnaireTemplate) {
		try {

			//log.info("inside service");
			// qsttBoilerplateDao.saveOrUpdate(questionnaireTemplate);
			qsttBoilerplateDao.updateTemplate(questionnaireTemplate);

		} catch (Exception de) {
			de.printStackTrace();

		}

	}

	//@Override
	public void deleteTemplate(QsttBoilerplate questionnaireTemplate) {
		try {

			//log.info("Inside delete serviceImpl");
			// qsttBoilerplateDao.delete(questionnaireTemplate);
			qsttBoilerplateDao.deleteTemplate(questionnaireTemplate);
		} catch (Exception de) {
			de.printStackTrace();

		}

	}

	//@Override
	public QsttBoilerplate viewTemplate(Long id) {

		return qsttBoilerplateDao.get(id);
	}

	//@Override
	public List<QsttQuestionBank> viewQuestionBank() {

		QsttQuestionBank qsttQuestionBank = null;

		String query = "select q.id as 'QUESTION ID', q.qtext as 'QUESTION TEXT', t.id as 'QUESTION TYPE ID',t.name as 'QUESTION TYPE', c.id as 'CATEGORY ID',"
				+ " c.name as 'CATEGORY NAME', temp.id as 'Template id', temp.name as 'Template Name', qtemp.id as 'templateQuestion id', temp.description as 'description'"
				+ " from qstt_question q"
				+ " left join qstt_question_type t on q.question_type_id=t.id"
				+ " left join qstt_question_category c on q.question_category_id=c.id"
				+ " left join qstt_boilerplate_question qtemp on qtemp.qstt_question_id =q.id"
				+ " left join qstt_boilerplate temp on temp.id = qtemp.qstt_boilerplate_id"
				+ " where q.is_banked = 1"
				+ " order by q.id";

		SQLQuery que = qsttBoilerplateDao.getSQLQuery(query);

		List<Object[]> l =que.list();
		
		System.out.println("List Size Came From Database is:"+l.size());

		List<QsttQuestionBank> qsttQuestionBankList = new ArrayList<QsttQuestionBank>();

		//log.info("List Size:" + l.size());

		Iterator iterator = l.iterator();

		Object obj = null;
		while (iterator.hasNext()) {
			Object[] o = (Object[]) iterator.next();
			qsttQuestionBank = new QsttQuestionBank();
			int i = 0;
			qsttQuestionBank.setQuestionId(o[i++].toString() + "#");
			if(o[i]!=null && !o[i].equals("")){
			qsttQuestionBank.setQuestionText((java.lang.String) o[i++]);
			}else{
				i++;
			}
			qsttQuestionBank.setQuestionTypeId(((java.lang.Short) o[i++])
					.longValue());
			qsttQuestionBank.setQuestionType((String) o[i++]);
			if(o[i]!=null){
			qsttQuestionBank.setCategoryId(((java.lang.Integer) o[i++])
					.longValue());
			}
			else{
				i++;
			}
			qsttQuestionBank.setCategoryName((String) o[i++]);
			obj = o[i++];
			//log.info("obc" + obj);
			if (obj != null) {
				qsttQuestionBank.setTemplateId(((java.math.BigInteger) obj)
						.longValue());
				qsttQuestionBank.setTemplateName((String) o[i++]);
				// qsttQuestionBank.setTemplateQuestionId((String)o[i++]);
				qsttQuestionBank.setQuestionId(qsttQuestionBank.getQuestionId()
						+ o[i++].toString());
				qsttQuestionBank.setDescription((String) o[i++]);
			}

			qsttQuestionBankList.add(qsttQuestionBank);

		}

		//log.info("From Service....." + qsttQuestionBankList.size());

		return qsttQuestionBankList;
	}
//THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU
	
	//@Override
	public List<QsttQuestionBank> viewQuestionOfBank() {

		QsttQuestionBank qsttQuestionBank = null;

		String query = " select distinct q.id as 'QUESTION ID', q.qtext as 'QUESTION TEXT',c.id as 'CATEGORY ID', c.name as 'CATEGORY NAME' from qstt_question q left join qstt_question_type t on q.question_type_id=t.id left join qstt_question_category c on q.question_category_id=c.id left join qstt_boilerplate_question qtemp on qtemp.qstt_question_id =q.id left join qstt_boilerplate temp on temp.id = qtemp.qstt_boilerplate_id where q.is_banked = 1 order by q.id";

		SQLQuery que = qsttBoilerplateDao.getSQLQuery(query);

		List<Object[]> l = que.list();

		List<QsttQuestionBank> qsttQuestionBankList = new ArrayList<QsttQuestionBank>();

		//log.info("List Size:" + l.size());

		Iterator iterator = l.iterator();

		Object obj = null;
		while (iterator.hasNext()) {
			Object[] o = (Object[]) iterator.next();
			qsttQuestionBank = new QsttQuestionBank();
			int i = 0;
			qsttQuestionBank.setQuestionId(o[i++].toString());
			qsttQuestionBank.setQuestionText((java.lang.String) o[i++]);
			if(o[i]!=null){
			qsttQuestionBank.setCategoryId(((java.lang.Integer) o[i++]).longValue());
			
			qsttQuestionBank.setCategoryName((String) o[i++]);
			
			
			}
			

			qsttQuestionBankList.add(qsttQuestionBank);

		}

		//log.info("From Service....." + qsttQuestionBankList.size());

		return qsttQuestionBankList;
	}
	//THIS IS THE CODE TO CREATE INSERT FROM BANK BUTTON BY SATYA & TRIPU


	//@Override
	public List getQuestionsByTemplateId(Long id) {
		List list = qsttBoilerplateDao.getQuestionsByTemplateId(id);
		return list;
	}

	public List<QsttBoilerplate> getBoilerplateList() {
		List<QsttBoilerplate> list = qsttBoilerplateDao.getBoilerplateList();
		return list;
	}

	public Long getTemplateId(String tempName) {
		Long l = null;
		List<java.math.BigInteger> list = qsttBoilerplateDao
				.getTemplateId(tempName);
		if (list.size() > 0) {
			l = (list.get(0)).longValue();
			return l;
		} else
			return null;
	}

}
