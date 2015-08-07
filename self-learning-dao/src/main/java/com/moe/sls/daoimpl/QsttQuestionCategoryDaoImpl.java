package com.moe.sls.daoimpl;

import java.util.List;

import com.moe.sls.dao.QsttQuestionCategoryDao;
import com.moe.sls.model.QsttQuestion;
import com.moe.sls.model.QsttQuestionCategory;


public class QsttQuestionCategoryDaoImpl implements QsttQuestionCategoryDao {
	
	//@Override
	public List<QsttQuestion> viewQuestionForCategory(Integer category) {

		List<QsttQuestion> categoryQuestionDetails = null;
		try {

			QsttQuestionCategory quesCategory = new QsttQuestionCategory();
			quesCategory.setId(category);
			Criterion criterion = Restrictions.eq("qsttQuestionCategory",
					quesCategory);
			Criteria crit = this.getSession()
					.createCriteria(QsttQuestion.class).add(criterion);
			categoryQuestionDetails = crit.list();

		} catch (Exception hb) {
			hb.printStackTrace();

			//throw new DataBaseException("DB_Q_1View", hb);
			throw new Exception(hb.getMessage(), hb);
		}
		return categoryQuestionDetails;
	}

	//@Transactional
	//@Override
	public void deleteCategory(QsttQuestionCategory category) {

		try {

			delete(category);

		} catch (Exception hb) {
			hb.printStackTrace();

			//throw new DataBaseException("DB_Q_1Delete", hb);
			throw new Exception(hb.getMessage(), hb);
		}

	}

	//@Transactional
	//@Override
	public void updateCategory(QsttQuestionCategory category) {

		try {

			QsttQuestionCategory catObj = (QsttQuestionCategory)getSession().load(QsttQuestionCategory.class, category.getId());
			
			if((catObj.getName().equals(category.getName())) && (catObj.getDescription().equals(category.getDescription()))){
				throw new Exception("Category name already exists");
			}else if(catObj.getName().equals(category.getName())){
				merge(category);
			}else{
				Criteria criteria= getSession().createCriteria(QsttQuestionCategory.class);
				Criterion criterion = Restrictions.eq("name" , category.getName());
				criteria.add(criterion);
				List<QsttQuestionCategory> list =  criteria.list();
				if(list!= null && list.size() != 0){
					throw new Exception("Category name already exits");
			   	}else{
			   		merge(category);
			   	}
			}

		} catch (Exception hb) {
			hb.printStackTrace();

			//throw new DataBaseException("DB_Q_1Update", hb);
			throw new Exception(hb.getMessage(), hb);
		}
	}

	//@Transactional
	//@Override
	public void addQuestionCategory(QsttQuestionCategory questionCategory) {
		try {

			Criteria criteria = getSession().createCriteria(
					QsttQuestionCategory.class);
			Criterion criterion = Restrictions.eq("name",
					questionCategory.getName());
			criteria.add(criterion);
			List<QsttQuestionCategory> list = criteria.list();
			if (list != null && list.size() != 0) {

				throw new Exception(
						"Category name already exists");
			} else {
				this.save(questionCategory);
			}

		} catch (Exception hb) {
			hb.printStackTrace();

			//throw new DataBaseException("DB_Q_1", hb);
			throw new Exception(hb.getMessage(), hb);
		}

	}

	@SuppressWarnings("unchecked")
	//@Override
	public List<QsttQuestionCategory> viewQuestionCategoryAll() {
		List<QsttQuestionCategory> list = null;
		try {

			Criteria criteria = getSession().createCriteria(
					QsttQuestionCategory.class).setResultTransformer(
					Criteria.DISTINCT_ROOT_ENTITY);
			list = criteria.list();
			System.out.println("List Size::" + list.size());

		} catch (Exception he) {
			he.printStackTrace();

			//new DataBaseException("DataBase query Exception", he);
			throw new Exception(he.getMessage(), he);
		}
		return list;
	}

}
