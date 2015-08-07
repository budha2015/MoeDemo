package com.moe.sls.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moe.sls.dao.QsttScoreSchemeDao;
import com.moe.sls.model.QsttScoreScheme;
import com.moe.sls.model.QsttScoreSchemeHelper;


public class QsttScoreSchemeDaoImpl implements QsttScoreSchemeDao{


	public List<QsttScoreSchemeHelper> retrieveQsttLink(Long qId,Long lId){
		List<QsttScoreSchemeHelper> qlList = new ArrayList<QsttScoreSchemeHelper>();
		Map<String,String> colorMap = new HashMap<String, String>();
		String qrId = qId==null?"is null":("= "+qId.toString());
		String lkId = lId==null?"is null":("= "+lId.toString());
		try{
			
	
	            /*String query = "select qndef1.id as qrid, qndef1.name as qrname, lnk.link_name as linkName, qnscore.id as scoreid ,qnscore.min_score as minscore, qnscore.max_score as maxscore "
	            		 		+"from qstt_score_scheme qnscore "
	            		 		+"left join qstt_link lnk on qnscore.qstt_link_id = lnk.id "
	            		 		+"left join qstt_questionnaire_def_qstt_link qndeflnk on qndeflnk.link_id = lnk.id "
	            		 		+"left join qstt_questionnaire_def qndef1 on qndef1.id = qndeflnk.questionnaire_def_id or qndef1.id = qnscore.qstt_questionnaire_def_id "
	            		 		+"where qnscore.qstt_questionnaire_def_id "+qrId+" and qnscore.qstt_link_id "+lkId + " ORDER BY qndef1.id DESC, qnscore.id";*/
	             
			 
			/*String query= "select qnscore.qstt_questionnaire_def_id as qrid, qndef1.name as qrname, qnscore1.id "
			 		+"as scoreid, lnk.link_name as linkName, qnscore1.min_score as minscore, qnscore1.max_score "
			 		+"as maxscore from qstt_score_scheme qnscor left join qstt_questionnaire_def_qstt_link qndeflnk "
			 		+" on (qndeflnk.link_id = qnscore.qstt_link_id OR qndeflnk.questionnaire_def_id = qnscore.qstt_questionnaire_def_id) "
	                +"left join qstt_score_scheme qnscore1 on qnscore1.qstt_questionnaire_def_id = qndeflnk.questionnaire_def_id"
	                +"left join qstt_link lnk on qnscore.qstt_link_id = lnk.id "
	                +"left join qstt_questionnaire_def qndef1 on qndef1.id = qndeflnk.questionnaire_def_id " 
	                +"where qnscore.qstt_questionnaire_def_id "+qrId+" and qnscore.qstt_link_id "+lkId;*/
			
			String query= "select qndef1.id as qrid, qndef1.name as qrname, " 
			+"(select link_name from qstt_link where id = (select distinct link_id from qstt_questionnaire_def_qstt_link where questionnaire_def_id = qndef1.id ) )as linkName, "
			+"qnscore.id as scoreid , "
			+"(select min_score from qstt_score_scheme where qstt_questionnaire_def_id = qndef1.id) as 'Min Score', "
			+"(select max_score from qstt_score_scheme where qstt_questionnaire_def_id = qndef1.id) as 'Max Score' "
			       +"from qstt_score_scheme qnscore "
			       +"left join qstt_link lnk on qnscore.qstt_link_id = lnk.id "
			       +"left join qstt_questionnaire_def_qstt_link qndeflnk on qndeflnk.link_id = lnk.id "
			       +"left join qstt_questionnaire_def qndef1 on qndef1.id = qndeflnk.questionnaire_def_id or qndef1.id = qnscore.qstt_questionnaire_def_id "
			       +"where qnscore.qstt_questionnaire_def_id "+qrId+" and qnscore.qstt_link_id "+lkId +" and qndef1.validity_end_date is null";

			System.out.println(qrId+"service"+lkId);






	
	 SQLQuery sql = this.getSQLQuery(query);
	 QsttScoreSchemeHelper qsttScoreSchemeHelper = null;
	 List<Object[]> questionnaireScoreDetails = sql.list();
	 System.out.println("Dao Impl"+questionnaireScoreDetails.size());
	 Object temp=null;
	 int p=-1;
	
	
	 for(Object[] obj:questionnaireScoreDetails){
		 int minScore = 0;
		 int maxScore = 0;
		 
		 int i = 0;
		 qsttScoreSchemeHelper = new QsttScoreSchemeHelper();
		 temp = obj[i++];
		
		 temp = obj[i++];
		 qsttScoreSchemeHelper.setQuestionnaireName(temp!=null?temp.toString():"");
		 temp = obj[i++];
		 qsttScoreSchemeHelper.setLinkName(temp!=null?temp.toString():"");
		 temp = obj[i++];
		 qsttScoreSchemeHelper.setScoreSchemeId((temp!=null?temp.toString():""));
		 temp = obj[i++];
		 qsttScoreSchemeHelper.setMinScore(((java.lang.Short) (temp!=null?temp:((short) 0))));
		 temp = obj[i++];
		 qsttScoreSchemeHelper.setMaxScore(((java.lang.Short) (temp!=null?temp:(short)0)));
		
		 
		 if(null == qsttScoreSchemeHelper.getLinkName() || qsttScoreSchemeHelper.getLinkName().equals("")){
			 qsttScoreSchemeHelper.setLinkName(qsttScoreSchemeHelper.getQuestionnaireName());
		 }
		 
		
		 qsttScoreSchemeHelper.setMinScoreAddition(minScore +=qsttScoreSchemeHelper.getMinScore());
		 qsttScoreSchemeHelper.setMaxScoreAddition(maxScore+=qsttScoreSchemeHelper.getMaxScore());
	
	
       	 qlList.add(qsttScoreSchemeHelper);
		 
	 }
	 
}
catch(Exception e){
	e.printStackTrace();
}
System.out.println("From Dao Impl....."+qlList.size());
return qlList;

}
	
	//@Override
	public void saveScoreScheme(QsttScoreScheme qsttScoreScheme){
		try {

			this.save(qsttScoreScheme);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public void deleteScoreScheme(QsttScoreScheme qsttLink) {
		{
			try {
				System.out
						.println("Inside DaoIMPL for delete template Question");
				delete(qsttLink);

			} catch (Exception he) {
				// t.rollback();
				he.printStackTrace();

			}
		}

	}
	
	@Override
	public int deleteScoreSchemeByLinkId(Long id) {
		int count = 0;
		try {
			 count = getSQLQuery("delete  from qstt_score_scheme where qstt_link_id ="+id).executeUpdate();
			System.out.println("Delete Count:"+count);

		} catch (Exception he) {
			// t.rollback();
			he.printStackTrace();

		}
		return count;
	}


}

