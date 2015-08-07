package com.moe.sls.daoimpl;

/*
 import org.hibernate.SessionFactory;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.stereotype.Repository;

 import com.rfg.tprm.questionnaire.crud.hibernate.CrudRepositoryImpl;
 import com.rfg.tprm.questionnaire.model.QuestionnaireTemplate;
 */
import java.util.List;

import com.moe.sls.dao.QsttBoilerplateDao;
import com.moe.sls.model.QsttBoilerplate;

public class QsttBoilerplateDaoImpl implements QsttBoilerplateDao {

	//@Override
	public Long saveTemplate(QsttBoilerplate qtemplate) {
		Long l = save(qtemplate);
		return l;
	}
	
	//@Override
	public void updateTemplate(QsttBoilerplate qtemplate) {
		try {
			
		
			System.out.println("Inside Update TemplateDao IMPL");
			Criteria criteria = getSession().createCriteria(
					QsttBoilerplate.class);
			Criterion criterion = Restrictions.eq("name", qtemplate.getName());
			Criterion criterion1 = Restrictions.eq("description",qtemplate.getDescription());
			criteria.add(criterion);
			List<QsttBoilerplate> list = criteria.list();
			if (list != null && list.size() != 0 && findByCriteria(criterion,criterion1).size() != 0) {
				throw new Exception(
						"Template name already exists in database");
			} else {
				this.merge(qtemplate);
			}
			
			
			
		} catch (Exception he) {
			
			throw new Exception("DB_Q_1", he);

		}
		
	}
	
	//@Override
	public void deleteTemplate(QsttBoilerplate qtemplate) {
		try {
			
			System.out.println("Inside DaoIMPL for delete template");
			Long id = qtemplate.getId();
			delete(qtemplate);
			
		} catch (Exception he) {
			
			throw new Exception("DB_Q_1", he);

		}

	}
	
	//@Override
	public List<QsttBoilerplate> getBoilerplateList() {
		List<QsttBoilerplate> list = findAll();
		return list;
		
	}

	//@Override
	public List getQuestionsByTemplateId(Long id) {
		SQLQuery query = this.getSQLQuery("select qstt_question_id from qstt_boilerplate_question where qstt_boilerplate_id = "+id);
		return query.list();
	}
	
	//@Override
	public List<java.math.BigInteger> getTemplateId(String tempName) {
		SQLQuery query = getSQLQuery("select id from qstt_boilerplate where name = '"+tempName+"'");
		return query.list();
	}
	
	
}
