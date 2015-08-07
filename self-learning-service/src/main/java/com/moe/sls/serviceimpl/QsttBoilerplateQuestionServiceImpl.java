package com.moe.sls.serviceimpl;

import com.moe.sls.dao.QsttBoilerplateQuestionDao;
import com.moe.sls.model.QsttBoilerplateQuestion;
import com.moe.sls.service.QsttBoilerplateQuestionService;

public class QsttBoilerplateQuestionServiceImpl implements QsttBoilerplateQuestionService {
	
	@Autowired
	QsttBoilerplateQuestionDao qsttBoilerplateQuestionDao;

	//@Override
	public void saveTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {
			log.info("Inside saveTemplateQuestion serviceImpl");
			if (qtemplatequestion != null) {
				qsttBoilerplateQuestionDao
						.saveTemplateQuestion(qtemplatequestion);
			} else {
				//log.info("save not possible");
			}
		} catch (Exception de) {
			de.printStackTrace();

		}
	}

	//@Override
	public void deleteTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {

			//log.info("Inside deleteTemplateQuestion serviceImpl");
			if (qtemplatequestion != null) {
				qsttBoilerplateQuestionDao
						.deleteTemplateQuestion(qtemplatequestion);
			} else {
				//log.info("delete not possible");
			}
		} catch (Exception de) {
			de.printStackTrace();

		}

	}

	//@Override
	public void editTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {

			//log.info("inside editTemplateQuestion serviceImpl");
			qsttBoilerplateQuestionDao.editTemplateQuestion(qtemplatequestion);
		} catch (Exception de) {
			de.printStackTrace();

		}

	}

	//@Override
	public void updateTemplateQuestion(QsttBoilerplateQuestion qtemplatequestion) {
		try {

			//log.info("inside updateTemplateQuestion serviceImpl");
			qsttBoilerplateQuestionDao.updateTemplateQuestion(qtemplatequestion);
		} catch (Exception de) {
			de.printStackTrace();

		}
		
	}

}
