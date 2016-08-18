package com.module.market;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.hql.ast.SqlASTFactory;
import org.json.JSONObject;
import org.omg.CORBA.INTERNAL;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.model.Customer;
import com.model.Market;
import com.model.Market;


@Component
@Scope("prototype")
public class MarketAction extends BaseAction{
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 3861279572611224546L;

	private Market market;
	
	private List<Market> list;
	
	
	@Resource
	private UtilDAO  utilDAO;
	
	@Resource
	private JdbcTemplate  jdbcTemplate;

	private String resultObj;
	
	
	private int totalPage;
	
	private int currentPage;
	
	private int itemPrePage=10;
	
	private int id;
	
	private String clientName;
	private String opponentName;
	
	private String byPage;
	private int totalItem;
	
	private int start;
	
	
	public String insert() {

		market.setClientId("" + getSessionBranch().getId());
		market.setClientName(getSessionBranch().getArea()+"/"+getSessionBranch().getTrueName());
		String info="";
		if (market.getId()!=0) {
			info="市场 "+market.getProductName()+" 更新成功";
		}else {
			info="市场 "+market.getProductName()+" 录入成功";
		}
		utilDAO.saveOrUpdate(market);
		writeJSON(info);
		System.out.println(resultObj);
		return SUCCESS;
	}
	
	public String delete(){
		Market c=(Market) utilDAO.findListByProperty("Market", "id", id, "").get(0);
		String name=c.getProductName();
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
	
	
	public void writeJSON(String info){
		JSONObject joCode=new JSONObject();
		try {
			joCode.put("resultcode", "200");
			joCode.put("info", info);
			joCode.put("id", market.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=joCode.toString();
	}
	
	public String show(){

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
			
			
		}else {   // 下一页查询
			opponentName=(String) getSession().get("opponentName");
			clientName=(String)getSession().get("clientName");
		}
	
	//	System.out.println(clientName+"  sss");
	}
	/*
	 * 总公司 
	 */
	public  void type3(){
		String sqlCount="select count(*) from Market,opponent where  opponentId=opponent.id ";
		String  sql="select Market.*,opponent.name opponentName from Market,opponent where  " +
				"  market.opponentid =opponent.id ";
		

			if (StringUtils.isNotEmpty(opponentName)) {
				 sqlCount+=" and opponent.name='"+opponentName+"'";
				 sql+=" and opponent.name='"+opponentName+"'";
			}
			
			if (StringUtils.isNotEmpty(clientName)&&
					!clientName.equals("全部")) {
				sqlCount+=" and Market.clientName = '"+clientName+"'";
				sql+=" and Market.clientName = '"+clientName+"'";
			}
			
			
			sql+=" order by Market.clientid,market.id desc limit "+start+","+itemPrePage ;
			totalItem=jdbcTemplate.queryForInt(sqlCount);
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Market>(Market.class));
	
			
			System.out.println(sql+"   ppp "+ sqlCount);
		
		
	}
	
	/*
	 * 分公司
	 */
	public void type2(){
		String sqlCount="select count(*) from Market,user,opponent where Market.clientId=user.id " +
					" and user.branchId="+getSessionBranch().getBranchId()+" and market.opponentid=opponent.id ";
		String  sql="select Market.*,opponent.name opponentName from Market,user,opponent where  Market.clientId=user.id and " +
					" user.branchId="+getSessionBranch().getBranchId()+" and market.opponentid =opponent.id ";
			
			if (StringUtils.isNotEmpty(opponentName)) {
				 sqlCount+=" and opponent.name='"+opponentName+"'";
				 sql+=" and opponent.name='"+opponentName+"'";
			}
			
			if (StringUtils.isNotEmpty(clientName)&&
					!clientName.equals("全部")) {
				sqlCount+=" and market.clientName='"+clientName+"'";
				sql+=" and market.clientName='"+clientName+"'";
			}
			
			sql+=" order by Market.clientid,market.id desc limit "+start+","+itemPrePage+" ";
			totalItem=jdbcTemplate.queryForInt(sqlCount);
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Market>(Market.class));	
			System.out.println(sql+"   ppp"+ sqlCount);
	}
	
	/*
	 * 业务员 
	 */
	public  void type1(){
		String sqlCount="select count(*) from Market,user,opponent where Market.clientId=user.id " +
				"and market.opponentid=opponent.id and user.id="+getSessionBranch().getId();

		String sql="select Market.*,opponent.name opponentName from Market,user,opponent where  " +
			 		" Market.clientId=user.id and user.id="+getSessionBranch().getId() +
			 				" and market.opponentId=opponent.id ";
		 
		if (StringUtils.isNotEmpty(opponentName)) {
			 sqlCount+=" and opponent.name='"+opponentName+"'";
			 sql+=" and opponent.name='"+opponentName+"'";
		}
		sql+="order by Market.clientid,id desc  limit "+start+","+itemPrePage;
		totalItem=jdbcTemplate.queryForInt(sqlCount);
		
		list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Market>(Market.class));
		// System.out.println(sql+"  sql");

		
	}
	
	
	public String getMarketByPage(){
		if(currentPage==0)
			currentPage=1;
		int start=(currentPage-1)*itemPrePage;
		if (currentPage==-1) {
			start=0;
			itemPrePage=1000;
		}
		String  sql="SELECT "+
				" market.*,opponent.`name` opponentName "+
				" FROM"+				   
				" market,opponent "+
				" WHERE  market.opponentId=opponent.id and  "+
				" market.clientId="+getSessionBranch().getId()+" order by id desc limit "+start+","+itemPrePage;
	
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql);
		net.sf.json.JSONObject joCode=new net.sf.json.JSONObject();
		net.sf.json.JSONArray jsonArray=new net.sf.json.JSONArray();
		
		sql="select count(*) from market where clientId="+getSessionBranch().getId()+" limit "+start+","+itemPrePage;
		
		int totalItem=jdbcTemplate.queryForInt(sql);
		if (totalItem%itemPrePage==0) {
			totalPage=totalItem/itemPrePage;			
		}else {
			totalPage=(totalItem/itemPrePage)+1;
		}
		joCode.put("totalPage", totalPage);
		joCode.put("currentPage", currentPage);
		joCode.put("totalItems", totalItem);
		
		net.sf.json.JSONObject joResult=new net.sf.json.JSONObject();
		for (Map<String, Object> m:list) {
			joResult=net.sf.json.JSONObject.fromObject(m);			
			jsonArray.add(joResult);
		}
		joCode.put("result", jsonArray);
		resultObj=joCode.toString();
		System.out.println(resultObj+"   *********");
		return SUCCESS;
	}
	
	public String getById(){
		market=(Market) utilDAO.findListByProperty("Market","id",id,"").get(0);
		return SUCCESS;
	}

	
	public Market getMarket() {
		return market;
	}

	public void setMarket(Market market) {
		this.market = market;
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

	public List<Market> getList() {
		return list;
	}

	public void setList(List<Market> list) {
		this.list = list;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getOpponentName() {
		return opponentName;
	}

	public void setOpponentName(String marketName) {
		this.opponentName = marketName;
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

	
}
