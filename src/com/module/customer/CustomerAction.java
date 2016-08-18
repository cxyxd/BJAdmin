package com.module.customer;

import java.util.List;
import java.util.Map;

import javassist.expr.NewArray;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.model.Customer;

@Component
@Scope("prototype")
public class CustomerAction  extends BaseAction{
	
	private Customer customer;
	
	private List<Customer> list;
	
	@Resource
	private UtilDAO utilDAO;
	
	@Resource
	private JdbcTemplate  jdbcTemplate;
	
	private String clientName="";
	
	private String byPage;

	private String resultObj;
	
	private int id;
	
	private int totalPage;
	
	private int currentPage;
	
	private int itemPrePage=10;
	
	int totalItem=0;
	
	int start=0;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7314086509486213058L;
	
	
	public String insert(){

		customer.setClientId(""+getSessionBranch().getId());
		customer.setClientName(getSessionBranch().getArea()+"/"+getSessionBranch().getTrueName());
		String info="";
		if (customer.getId()!=0) {
			info="客户 "+customer.getName()+" 更新完成";
		}else{
			info="客户 "+customer.getName()+" 插入成功";
		}
			
		utilDAO.saveOrUpdate(customer);
	//	utilDAO.saveOrUpdate(customer);
		writeJSON(info);
		System.out.println(resultObj);
		
		return SUCCESS;
	}
	
	public String getById(){
	//	System.out.println(id+  "id  ");
		customer=(Customer) utilDAO.findListByProperty("Customer", "id", id, "").get(0);

		return SUCCESS;
	}
	
	public String delete(){
		Customer c=(Customer) utilDAO.findListByProperty("Customer", "id", id, "").get(0);
		String name=c.getName();
		utilDAO.delete(c);
		
		JSONObject joCode=new JSONObject();
		
		try {
			joCode.put("resultcode", "200");
			joCode.put("name", name);
			joCode.put("id", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultObj=joCode.toString();
		return SUCCESS;
	}
	
	public void writeJSON(String info){
		JSONObject joCode=new JSONObject();
		//获得刚插入数据的id
		try {
			joCode.put("resultcode", "200");
			joCode.put("name", customer.getName());
			joCode.put("id", customer.getId());
			joCode.put("info", info);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultObj=joCode.toString();
	}


	public String getAllCustomer(){
	
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
			if (customer!=null  &&
					StringUtils.isNotEmpty(customer.getType())  ) {
				getSession().put("customer_type", customer.getType());
			}else {
				if (customer==null) {
					customer=new Customer();
				}
				getSession().put("customer_type", customer.getType());
			}
			
			if (customer!=null  &&
					StringUtils.isNotEmpty(customer.getName())  ) {
				getSession().put("customer_name", customer.getName());
			}else  {
				if (customer==null) {
					customer=new Customer();
				}
				getSession().put("customer_name", customer.getName());
			}
			
			if (customer!=null  &&
					StringUtils.isNotEmpty(customer.getStatus())  ) {
				getSession().put("customer_status", customer.getStatus());
			}else  {
				if (customer==null) {
					customer=new Customer();
				}
				getSession().put("customer_status", customer.getStatus());
			}
			
			
			if (clientName!=null  &&
					StringUtils.isNotEmpty(clientName)  ) {
				getSession().put("clientName", clientName);
			}else  {
				if (customer==null) {
					customer=new Customer();
				}
				getSession().put("clientName",null);
			//	clientName=(String)getSession().get("clientName");
				
				
			}
			
		}else {   // 下一页查询
			if (customer==null) {
				customer=new Customer();
			}
			customer.setType((String)getSession().get("customer_type"));
			customer.setStatus((String)getSession().get("customer_status"));
			customer.setName((String)getSession().get("customer_name"));
			clientName=(String)getSession().get("clientName");
		//	getSession().put("customer_type", customer.getType());
			
		}
	

		
	
	//	System.out.println(clientName+"  sss");
	}
	/*
	 * 总公司 
	 */
	public  void type3(){
		String sqlCount="select count(*) from customer where 1=1";
		String  sql="select customer.*,user.companyName from customer,user where  customer.clientId=user.id ";
		if (customer!=null) {
			
			if (StringUtils.isNotEmpty(customer.getType())
					&& !customer.getType().equals("全部")
					  ) {
				 sqlCount+=" and customer.type='"+customer.getType()+"'";
				 sql+=" and customer.type='"+customer.getType()+"'";
			}
			System.out.println(customer.getName()+"  name");
			if (StringUtils.isNotEmpty(customer.getName())) {
				 sqlCount+=" and customer.name='"+customer.getName()+"'";
				 sql+=" and customer.name='"+customer.getName()+"'";
			}
			if (StringUtils.isNotEmpty(clientName)&&
					!clientName.equals("全部")) {
				sqlCount+=" and customer.clientName='"+clientName+"'";
				sql+=" and customer.clientName='"+clientName+"'";
			}
			
			if (StringUtils.isNotEmpty(customer.getStatus())&&
					!customer.getStatus().equals("全部")) {
				sqlCount+=" and customer.status='"+customer.getStatus()+"'";
				sql+=" and customer.status='"+customer.getStatus()+"'";
			}
			
			
			sql+=" order by customer.clientid limit "+start+","+itemPrePage ;
			totalItem=jdbcTemplate.queryForInt(sqlCount);
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
		//	System.out.println(sql+"   sss");
		}else{
			totalItem=jdbcTemplate.queryForInt("select count(*) from customer");
			sql="select customer.*,user.companyName from customer,user order by customer.clientid,id desc limit "+start+","+itemPrePage;
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
			System.out.println(sql+"   ppp");
		}
	//	System.out.println(sql+"   sss");
		
	}
	
	/*
	 * 分公司
	 */
	public void type2(){
		String sqlCount="select count(*) from customer,user where customer.clientId=user.id " +
					" and user.branchId="+getSessionBranch().getBranchId();
		String  sql="select customer.*,user.companyName from customer,user where  customer.clientId=user.id and " +
					" user.branchId="+getSessionBranch().getBranchId();
		if (customer!=null) {
			
			if (StringUtils.isNotEmpty(customer.getType())
					&& !customer.getType().equals("全部")
					  ) {
				 sqlCount+=" and customer.type='"+customer.getType()+"'";
				 sql+=" and customer.type='"+customer.getType()+"'";
			}
			if (StringUtils.isNotEmpty(customer.getName())) {
				 sqlCount+=" and customer.name='"+customer.getName()+"'";
				 sql+=" and customer.name='"+customer.getName()+"'";
			}
			if (StringUtils.isNotEmpty(clientName)&&
					!clientName.equals("全部")) {
				sqlCount+=" and customer.clientName='"+clientName+"'";
				sql+=" and customer.clientName='"+clientName+"'";
			}
			
			if (StringUtils.isNotEmpty(customer.getStatus())&&
					!customer.getStatus().equals("全部")) {
				sqlCount+=" and customer.status='"+customer.getStatus()+"'";
				sql+=" and customer.status='"+customer.getStatus()+"'";
			}
			sql+=" order by customer.clientid,id desc limit "+start+","+itemPrePage+" ";
			totalItem=jdbcTemplate.queryForInt(sqlCount);
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
		}else {
			 totalItem=jdbcTemplate.queryForInt("select count(*) from customer,user where customer.clientId=user.id " +
					" and user.branchId="+getSessionBranch().getBranchId());
			 sql="select customer.*,user.companyName from customer,user where  customer.clientId=user.id and " +
					" user.branchId="+getSessionBranch().getBranchId()+" order by customer.clientid  limit "+start+","+itemPrePage;
			list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
		}
	//	System.out.println(sql+"   sss");
		
	}
	
	/*
	 * 业务员
	 */
	public  void type1(){
		String sqlCount="select count(*) from customer,user where customer.clientId=user.id " +
				" and user.id="+getSessionBranch().getId();

		 String sql="select customer.*,user.companyName from customer,user where  customer.clientId=user.id and " +
				" user.id="+getSessionBranch().getId();
		 
		 
		 if (customer!=null) {
				
				if (StringUtils.isNotEmpty(customer.getType())
						&& !customer.getType().equals("全部")
						  ) {
					 sqlCount+=" and customer.type='"+customer.getType()+"'";
					 sql+=" and customer.type='"+customer.getType()+"'";
				}
				if (StringUtils.isNotEmpty(customer.getName())) {
					 sqlCount+=" and customer.name='"+customer.getName()+"'";
					 sql+=" and customer.name='"+customer.getName()+"'";
				}
				
				if (StringUtils.isNotEmpty(customer.getStatus())&&
						!customer.getStatus().equals("全部")) {
					sqlCount+=" and customer.status='"+customer.getStatus()+"'";
					sql+=" and customer.status='"+customer.getStatus()+"'";
				}
				
				sql+=" order by customer.clientid,id desc limit "+start+","+itemPrePage+" ";
				totalItem=jdbcTemplate.queryForInt(sqlCount);
				list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
			}else {
				 totalItem=jdbcTemplate.queryForInt("select count(*) from customer,user where customer.clientId=user.id " +
						" and user.id="+getSessionBranch().getId());
				 sql="select customer.*,user.companyName from customer,user where  customer.clientId=user.id and " +
						" user.id="+getSessionBranch().getId()+" order by customer.clientid  limit "+start+","+itemPrePage;
				list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Customer>(Customer.class));
			}

		
	}
	
	
	public String getAllCustomerAndroid(){

		String sql="select * from customer  where clientId="+getSessionBranch().getId()+" order by id desc";

		List<Map<String, Object>> customers=jdbcTemplate.queryForList(sql);
		net.sf.json.JSONObject joCode=new net.sf.json.JSONObject();
		net.sf.json.JSONArray jsonArray=new net.sf.json.JSONArray();

		net.sf.json.JSONObject joResult=new net.sf.json.JSONObject();
		for (Map<?, ?> c:customers) {
			joResult=net.sf.json.JSONObject.fromObject(c);
			jsonArray.add(joResult);
		}
		joCode.put("result", jsonArray);
		resultObj=joCode.toString();
		System.out.println(resultObj+"   *********");
		return SUCCESS;
	}
	


	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
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

	public List<Customer> getList() {
		return list;
	}

	public void setList(List<Customer> list) {
		this.list = list;
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

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getByPage() {
		return byPage;
	}

	public void setByPage(String byPageString) {
		this.byPage = byPageString;
	}

}
