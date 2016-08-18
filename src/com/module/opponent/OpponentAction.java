package com.module.opponent;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.core.utils.DateConvert;
import com.model.Opponent;
import com.model.Opponent;


@Component
@Scope("prototype")
public class OpponentAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4281235279634892703L;


	private Opponent opponent;
	
	private List<Opponent> list;
	
	@Resource
	private UtilDAO utilDAO;

	private String resultObj;
	
	@Resource
	private JdbcTemplate  jdbcTemplate;
	
	private String opponentName;
	private String clientName;
	private String scale;
	private String byPage;
	
	
	private int id;
	
	private int totalPage;
	
	private int totalItem=0;
	private int start=0;
	
	private int currentPage=1;
	
	private int itemPrePage=10;
	
	public String insert(){
		opponent.setDate(DateConvert.getDate());
		opponent.setClientId(""+getSessionBranch().getId());
		opponent.setClientName(getSessionBranch().getArea()+"/"+getSessionBranch().getTrueName());
		utilDAO.saveOrUpdate(opponent);
		writeJSON();
		return SUCCESS;
	}
	
	public String getById(){
		opponent=(Opponent) utilDAO.findListByProperty("Opponent", "id", id, "").get(0);
		return SUCCESS;
	}
	

	public void writeJSON(){
		JSONObject joCode=new JSONObject();
		try {
			joCode.put("resultcode", "200");
			joCode.put("info", opponent.getName());
			joCode.put("id",opponent.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=joCode.toString();
	}
	
	public String delete(){
		Opponent c=(Opponent) utilDAO.findListByProperty("Opponent", "id", id, "").get(0);
		String name=c.getName();
		utilDAO.delete(c);
		
		JSONObject joCode=new JSONObject();
		
		try {
			joCode.put("resultcode", "200");
			joCode.put("name", name);
			joCode.put("id", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=joCode.toString();
		return SUCCESS;
	}

	
	@SuppressWarnings("unchecked")
	public String getAllOpponentAndroid(){
		list=(List<Opponent>) utilDAO.findListByProperty("Opponent", "clientId", 
					""+getSessionBranch().getId(),"order by id desc");
		
		JSONArray joresult=new JSONArray();
		
		JSONObject jo;
		for (int i = 0; i < list.size(); i++) {
			jo=JSONObject.fromObject(list.get(i));
			joresult.add(jo);
		}
		jo=new JSONObject();
		jo.put("result", joresult);
		resultObj=jo.toString();
		System.out.println(resultObj+"  ***s");
		return SUCCESS;
	}
	
	public String getAllOpponent(){
		if(currentPage==0)
			currentPage=1;
		start=(currentPage-1)*itemPrePage;
		
		
		
		getPrar();
		
		
		if (getSessionBranch().getType()==3) {
			type3();
		}
		if (getSessionBranch().getType()==2) {
			type2();
		}
		if (getSessionBranch().getType()==1) {
			type1();
		}
		
		
		
//		if (getSessionUser().getType()==3) { //总公司
//			totalItem=jdbcTemplate.queryForInt("select count(*) from Opponent");
//			String  sql="select * from Opponent limit "+start+","+itemPrePage;
//			System.out.println(sql+"  sql");
//			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Opponent>(Opponent.class));
//		}
//		
//		if (getSessionUser().getType()==2) { //分公司
//			totalItem=jdbcTemplate.queryForInt("select count(*) from Opponent,user where Opponent.clientId=user.id " +
//					" and user.branchId="+getSessionBranch().getBranchId());
//			String  sql="select * from Opponent,user where  Opponent.clientId=user.id and " +
//					" user.branchId="+getSessionBranch().getBranchId()+" limit "+start+","+itemPrePage;
//			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Opponent>(Opponent.class));
//		}
		
		if (totalItem%itemPrePage==0) {
			totalPage=totalItem/itemPrePage;
		}else {
			totalPage=totalItem/itemPrePage+1;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 获取参数
	 */
	public void getPrar(){
		System.out.println("scale "+scale);
		if (byPage==null) {  //搜索框查询
			if (StringUtils.isNotEmpty(clientName) ) {
				getSession().put("clientName",clientName);
			}else {
				getSession().put("clientName", "");
			}
			
			if (StringUtils.isNotEmpty(opponentName) ) {
				getSession().put("opponentName",opponentName);
			}else {
				getSession().put("opponentName", "");
			}
			
			if (StringUtils.isNotEmpty(scale) ) {
				getSession().put("scale",scale);
			}else {
				getSession().put("scale", "");
			}
			
		}else {   // 下一页查询
			opponentName=(String) getSession().get("opponentName");
			scale=(String) getSession().get("scale");
			clientName=(String)getSession().get("clientName");
		}
		System.out.println("scale "+scale);

		
	
	//	System.out.println(clientName+"  sss");
	}
	/*
	 * 总公司 
	 */
	public  void type3(){
		String sqlCount="select count(*) from Opponent where 1=1 ";
		String  sql="select Opponent.*,user.companyName from Opponent,user where  Opponent.clientId=user.id ";
		
			System.out.println("scale "+scale);
			if ( StringUtils.isNotEmpty(scale) &&
					!scale.equals("全部")) {
				 sqlCount+=" and Opponent.scale='"+scale+"'";
				 sql+=" and Opponent.scale='"+scale+"'";
			}
			
			if (StringUtils.isNotEmpty(opponentName)) {
				 sqlCount+=" and Opponent.name='"+opponentName+"'";
				 sql+=" and Opponent.name='"+opponentName+"'";
			}
			
			if (StringUtils.isNotEmpty(clientName)&&
					!clientName.equals("全部")) {
				sqlCount+=" and Opponent.clientName='"+clientName+"'";
				sql+=" and Opponent.clientName='"+clientName+"'";
			}
			
			
			sql+=" order by Opponent.clientid,opponent.id desc limit "+start+","+itemPrePage ;
			totalItem=jdbcTemplate.queryForInt(sqlCount);
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Opponent>(Opponent.class));
	
			
			System.out.println(sql+"   ppp"+ sqlCount);
		
		
	}
	
	/*
	 * 分公司
	 */
	public void type2(){
		String sqlCount="select count(*) from Opponent,user where Opponent.clientId=user.id " +
					" and user.branchId="+getSessionBranch().getBranchId();
		String  sql="select Opponent.*,user.companyName from Opponent,user where  Opponent.clientId=user.id and " +
					" user.branchId="+getSessionBranch().getBranchId();

			
			if ( StringUtils.isNotEmpty(scale) && !scale.equals("全部") ) {
				 sqlCount+=" and Opponent.scale='"+scale+"'";
				 sql+=" and Opponent.scale='"+scale+"'";
			}
			
			if (StringUtils.isNotEmpty(opponentName)) {
				 sqlCount+=" and Opponent.name='"+opponentName+"'";
				 sql+=" and Opponent.name='"+opponentName+"'";
			}
			
			if (StringUtils.isNotEmpty(clientName) &&
					!clientName.equals("全部")) {
				sqlCount+=" and Opponent.clientName='"+clientName+"'";
				sql+=" and Opponent.clientName='"+clientName+"'";
			}
			
			sql+=" order by Opponent.clientid,opponent.id desc limit "+start+","+itemPrePage+" ";
			totalItem=jdbcTemplate.queryForInt(sqlCount);
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Opponent>(Opponent.class));	
			System.out.println(sql+"   ppp"+ sqlCount);
	}
	
	/*
	 * 分公司 
	 */
	public  void type1(){
		String sqlCount="select count(*) from Opponent,user where Opponent.clientId=user.id " +
				" and user.id="+getSessionBranch().getId();
		
		String sql="select Opponent.*,user.companyName from Opponent,user where  Opponent.clientId=user.id and " +
					" user.id="+getSessionBranch().getId();
		
		if ( StringUtils.isNotEmpty(scale) && !scale.equals("全部") ) {
			 sqlCount+=" and Opponent.scale='"+scale+"'";
			 sql+=" and Opponent.scale='"+scale+"'";
		}
		
		if (StringUtils.isNotEmpty(opponentName)) {
			 sqlCount+=" and Opponent.name='"+opponentName+"'";
			 sql+=" and Opponent.name='"+opponentName+"'";
		}
	
		sql+=" order by Opponent.clientid,opponent.id desc" +
				"  limit "+start+","+itemPrePage;
		 totalItem=jdbcTemplate.queryForInt(sqlCount);
		
		 list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Opponent>(Opponent.class));
		// System.out.println(sql+"  sql");

		
	}

	public List<Opponent> getList() {
		return list;
	}


	public void setList(List<Opponent> list) {
		this.list = list;
	}


	public Opponent getOpponent() {
		return opponent;
	}

	public void setOpponent(Opponent opponent) {
		this.opponent = opponent;
	}

	public UtilDAO getUtilDAO() {
		return utilDAO;
	}

	public void setUtilDAO(UtilDAO utilDAO) {
		this.utilDAO = utilDAO;
	}

	public String getResultObj() {
		return resultObj;
	}

	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}


	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}


	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getItemPrePage() {
		return itemPrePage;
	}


	public void setItemPrePage(int itemPrePage) {
		this.itemPrePage = itemPrePage;
	}


	public String getOpponentName() {
		return opponentName;
	}


	public void setOpponentName(String opponentName) {
		this.opponentName = opponentName;
	}


	public String getClientName() {
		return clientName;
	}


	public void setClientName(String clientName) {
		this.clientName = clientName;
	}


	public String getScale() {
		return scale;
	}


	public void setScale(String scale) {
		this.scale = scale;
	}


	public String getByPage() {
		return byPage;
	}


	public void setByPage(String byPage) {
		this.byPage = byPage;
	}


	public int getTotalItem() {
		return totalItem;
	}


	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
