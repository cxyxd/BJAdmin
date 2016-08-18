package com.module.map;

import java.util.List;

import javax.annotation.Resource;


import net.sf.json.JSONArray;
import net.sf.json.JSONException;
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
import com.model.Visit;

@Component
@Scope("prototype")
public class MapAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7843367607896288344L;

	@Resource
	private UtilDAO utilDAO;
	
	@Resource
	private JdbcTemplate jdbcTemplate;

	private String resultObj;
	
	private List<Visit> list;

	
	private int totalPage;
	
	private int currentPage;
	
	private int itemPrePage=10;
	
	private  int totalItem;
	
	private int start;
	
	private String customerName;
	private String clientName;
	private String  byPage;
	
	private int id;
	
	public String delete(){
		Visit visit=(Visit) utilDAO.findListByProperty("Visit","id", id, "").get(0);
		utilDAO.delete(visit);
		
		JSONObject joCode=new JSONObject();
		
		try {
			joCode.put("resultcode", "200");
			joCode.put("name", visit.getCustomerName());
			joCode.put("id", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=joCode.toString();
		
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String getAllVisit(){
	//	 list=(List<Visit>) utilDAO.findAllList("Visit");
		
	//	return SUCCESS;
		
		
		
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
		 setJSON();
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
			
			if (StringUtils.isNotEmpty(customerName) ) {
				getSession().put("customerName",customerName);
			}else {
				getSession().put("customerName", "");
			}			
		}else {   // 下一页查询
			customerName=(String) getSession().get("customerName");
			clientName=(String)getSession().get("clientName");
		}

		
	
	//	System.out.println(clientName+"  sss");
	}
	/*
	 * 总公司 
	 */
	public  void type3(){
		String sqlCount="select count(*) from visit where 1=1";
		String  sqlString="select * from visit where 1=1 ";

		if (StringUtils.isNotEmpty(customerName)) {
			 sqlCount+=" and customerName='"+customerName+"'";
			 sqlString+=" and customerName='"+customerName+"'";
		}
		
		if (StringUtils.isNotEmpty(clientName)) {
			sqlCount+=" and clientName  ='"+clientName+"'";
			sqlString+=" and clientName = '"+clientName+"'";
		}
		
		
		totalItem=jdbcTemplate.queryForInt("select count(*) from visit");
		sqlString+="order by visit.clientid,id desc limit "+start+","+itemPrePage;
		list=jdbcTemplate.query(sqlString, new BeanPropertyRowMapper<Visit>(Visit.class));
		
	//	System.out.println(sqlString+"   ppp"+ sqlCount);
	}
	
	/*
	 * 分公司
	 */
	public void type2(){
		String sqlCount="select count(*) from visit,user where visit.clientId=user.id " +
					" and user.branchId="+getSessionBranch().getBranchId();
		String  sqlString="select visit.* from visit,user where  visit.clientId=user.id and " +
					" user.branchId="+getSessionBranch().getBranchId();
		
		
		if (StringUtils.isNotEmpty(customerName)) {
			 sqlCount+=" and customerName='"+customerName+"'";
			 sqlString+=" and customerName='"+customerName+"'";
		}
		
		if (StringUtils.isNotEmpty(clientName)&&
				!clientName.equals("全部")) {
			sqlCount+=" and clientName='"+clientName+"'";
			sqlString+=" and clientName='"+clientName+"'";
		}
		
		totalItem=jdbcTemplate.queryForInt(sqlCount);
		sqlString+=" order by visit.clientid,visit.id desc  limit "+start+","+itemPrePage;
		list=jdbcTemplate.query(sqlString, new BeanPropertyRowMapper<Visit>(Visit.class));
}
	

	/*
	 * 分公司 
	 */
	public  void type1(){
		String sqlCount="select count(*) from visit where " +
				" visit.clientId="+getSessionBranch().getId();

		 totalItem=jdbcTemplate.queryForInt(sqlCount);
		 String sql="select * from visit where visit.clientId="+getSessionBranch().getId() +
				 " order by id desc  limit "+start+","+itemPrePage;
		 list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Visit>(Visit.class));
		// System.out.println(sql+"  sql");

		
	}
	
	@SuppressWarnings("unchecked")
	public String  getMyVisit(){
		if(currentPage==0)
			currentPage=1;
		int start=(currentPage-1)*itemPrePage;
		int end=currentPage*itemPrePage-1;
		list=(List<Visit>) utilDAO.findListByProperty("Visit","clientId" , ""+getSessionBranch().getId(),
				"order by id desc limit "+start+","+end);
		String sql="select count(*) from visit where clientId="+getSessionBranch().getId()+" limit "+start+","+end;
		totalItem=jdbcTemplate.queryForInt(sql);
		setJSON();
		return SUCCESS;
	}
	
	public void setJSON(){
        JSONObject result;
		
		JSONArray array=new JSONArray();
		for (Visit c:list) {
			if (StringUtils.isNotEmpty(c.getLatitude()) &&
					StringUtils.isNotEmpty(c.getLongitude())
					) {
				result=JSONObject.fromObject(c);
				result.put("pic0", "/upload/"+c.getId()+"_0.jpg");
				result.put("pic1", "/upload/"+c.getId()+"_1.jpg");
				result.put("pic2", "/upload/"+c.getId()+"_2.jpg");
				
				array.add(result);
			}
		}
		result=new JSONObject();
		try {
			
			result.put("result", array);
			result.put("totalPage", totalPage);
			result.put("currentPage", currentPage);
			result.put("totalItems", totalItem);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resultObj=result.toString();
	//	System.out.println(resultObj);
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

	public List<Visit> getList() {
		return list;
	}

	public void setList(List<Visit> list) {
		this.list = list;
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

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getByPage() {
		return byPage;
	}

	public void setByPage(String byPage) {
		this.byPage = byPage;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
