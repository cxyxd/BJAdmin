package com.module.complain;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.model.Complain;
import com.model.Customer;
import com.model.Market;
import com.opensymphony.xwork2.inject.Scope.Strategy;


@Component
@Scope("prototype")
public class ComplainAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7739788372425435153L;

	private Complain complain;
	
	@Resource
	private UtilDAO utilDAO;
	
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	private List<Complain> list;
	
	private String resultObj;
	
	private int currentPage;
	
	private int itemPrePage=10;
	
	private int totalPage;
	private  int start;
	private int id;
	private int totalItem;
	private String  byPage;
	
	private String  customerName;
	private String clientName;
	private String status;
	
	public String  getById(){
		complain=(Complain) utilDAO.findListByProperty("Complain", "id", id, "").get(0);
		return SUCCESS;
	}
	
	public String insert(){
		int clientId=getSessionBranch().getId();
		complain.setClientId(clientId);
		complain.setClientName(getSessionBranch().getArea()+"/"+getSessionBranch().getTrueName());
		utilDAO.saveOrUpdate(complain);
		JSONObject object=new JSONObject();
		object.put("resultcode", 200);
		object.put("id", complain.getId());
		object.put("customerName", complain.getCustomerName());
		resultObj=object.toString();
		return SUCCESS;
	}
	
	
	public String delete(){
		Complain c=(Complain) utilDAO.findListByProperty("Complain", "id", id, "").get(0);
		String name=c.getCustomerName();
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
	
	public String showComplainPC(){
		
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
		return  SUCCESS;
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
			
			if (StringUtils.isNotEmpty(customerName) ) {
				getSession().put("customerName",customerName);
			}else {
				getSession().put("customerName", "");
			}
			
			if (StringUtils.isNotEmpty(status) ) {
				getSession().put("status",status);
			}else {
				getSession().put("status", "");
			}
			
			
		}else {   // 下一页查询
			customerName=(String) getSession().get("customerName");
			clientName=(String)getSession().get("clientName");
			status=(String)getSession().get("status");
		}
	
	//	System.out.println(clientName+"  sss");
	}
	/*
	 * 总公司 
	 */
	public  void type3(){

		String  sqlCount="select count(*) from Complain";
	   	String sqlString="SELECT * 	 FROM	complain WHERE	1=1 ";

			if (StringUtils.isNotEmpty(customerName)) {
				 sqlCount+=" and complain.customerName='"+customerName+"'";
				 sqlString+=" and complain.customerName='"+customerName+"'";
			}
			
			if (StringUtils.isNotEmpty(clientName)&&
					!clientName.equals("全部")) {
				sqlCount+=" and complain.clientName='"+clientName+"'";
				sqlString+=" and complain.clientName='"+clientName+"'";
			}
			if (StringUtils.isNotEmpty(status)
					&& !status.equals("全部")) {
				sqlCount+=" and complain.status='"+status+"'";
				sqlString+=" and complain.status='"+status+"'";
			}
			
			
			totalItem=jdbcTemplate.queryForInt("select count(*) from Complain");
			sqlString+="  order by clientid,id desc limit "+start+","+itemPrePage;
			list=jdbcTemplate.query(sqlString, new BeanPropertyRowMapper<Complain>(Complain.class));
			
			System.out.println(sqlString+"   ppp"+ sqlCount);
		
		
	}
	
	/*
	 * 分公司
	 */
	public void type2(){
		
		String  sqlCount="select count(*) from Complain,user where complain.clientid=user.id ";
	   	String sql="SELECT  complain.* FROM	complain,user WHERE	user.id=complain.clientid ";
		
	   	if (StringUtils.isNotEmpty(customerName)) {
			 sqlCount+=" and complain.customerName='"+customerName+"'";
			 sql+=" and complain.customerName='"+customerName+"'";
		}
		
		if (StringUtils.isNotEmpty(clientName)&&
				 !clientName.equals("全部")) {
			sqlCount+=" and complain.clientName='"+clientName+"'";
			sql+=" and complain.clientName='"+clientName+"'";
		}
		
		if (StringUtils.isNotEmpty(status)
				&& !status.equals("全部")) {
			sqlCount+=" and complain.status='"+status+"'";
			sql+=" and complain.status='"+status+"'";
		}
		
		
		totalItem=jdbcTemplate.queryForInt(sqlCount +
				" and user.branchId="+getSessionBranch().getBranchId()+" order by clientid,complain.id desc");
		sql+=" and  user.branchId="+getSessionBranch().getBranchId()+" limit "+start+","+itemPrePage;
		list=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Complain>(Complain.class));
		
	
			System.out.println(sql+"   ppp"+ sqlCount);
	}
	
	/*
	 * 业务员 
	 */
	public  void type1(){
		String  sqlCount="select count(*) from Complain where clientId="+getSessionBranch().getId();
	   	String sql="SELECT  * FROM	complain WHERE	1=1 and clientId="+getSessionBranch().getId();
	   			
	 
	   	if (StringUtils.isNotEmpty(customerName)) {
			 sqlCount+=" and complain.customerName='"+customerName+"'";
			 sql+=" and complain.customerName='"+customerName+"'";
		}
	
		
		if (StringUtils.isNotEmpty(status)
				&& !status.equals("全部")) {
			sqlCount+=" and complain.status='"+status+"'";
			sql+=" and complain.status='"+status+"'";
		}
		sql+=" order by id desc limit "+start+","+itemPrePage;
		list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Complain>(Complain.class));
		totalItem=jdbcTemplate.queryForInt(sqlCount);
		
	}
	
	public String showComplainAndroid(){
		if(currentPage==0)
			currentPage=1;
		int start=(currentPage-1)*itemPrePage;
		if (currentPage==-1) {
			start=0;
			itemPrePage=1000;
		}
		String sql="SELECT	complain.* " +
				" FROM	complain " +
				" WHERE	complain.clientId = ? " +
				"  order by complain.id desc limit "+start+","+itemPrePage;
		Object[] args=new Object[]{getSessionBranch().getId()};
		List<Complain> list=jdbcTemplate.query(sql, args, new BeanPropertyRowMapper<Complain>(Complain.class));
		
		sql="select count(*) from complain where clientId="+getSessionBranch().getId()+" limit "+start+","+itemPrePage;
		
		int totalItem=jdbcTemplate.queryForInt(sql);
		if (totalItem%itemPrePage==0) {
			totalPage=totalItem/itemPrePage;			
		}else {
			totalPage=(totalItem/itemPrePage)+1;
		}

		JSONObject jo;
	//	JSONObject joResult=new JSONObject();
		JSONArray joResult=new JSONArray();
		for (int i = 0; i <list.size(); i++) {
			jo=JSONObject.fromObject(list.get(i));
		//	System.out.println(jo.toString()+" jo");
			joResult.add(jo);
		}

		jo=new JSONObject();
		jo.put("totalPage", totalPage);
		jo.put("currentPage", currentPage);
		jo.put("totalItems", totalItem);
		jo.put("result", joResult);
		resultObj=jo.toString();
		System.out.println(resultObj+" resultObj");
		return SUCCESS;
	}

	public Complain getComplain() {
		return complain;
	}

	public void setComplain(Complain complain) {
		this.complain = complain;
	}

	public UtilDAO getUtilDAO() {
		return utilDAO;
	}

	public void setUtilDAO(UtilDAO utilDAO) {
		this.utilDAO = utilDAO;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Complain> getList() {
		return list;
	}

	public void setList(List<Complain> list) {
		this.list = list;
	}

	public String getResultObj() {
		return resultObj;
	}

	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
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


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public String getClientName() {
		return clientName;
	}


	public void setClientName(String clientName) {
		this.clientName = clientName;
	}


	public int getTotalItem() {
		return totalItem;
	}


	public void setTotalItem(int totalItem) {
		this.totalItem = totalItem;
	}


	public String getByPage() {
		return byPage;
	}


	public void setByPage(String byPage) {
		this.byPage = byPage;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


}
