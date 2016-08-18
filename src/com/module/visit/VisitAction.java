package com.module.visit;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.core.utils.DateConvert;
import com.model.Complain;
import com.model.Customer;
import com.model.Visit;


@Component
@Scope("prototype")
public class VisitAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 879358148443421306L;
	private Visit visit;
    private List<File> file1 ;  
    private List<String> file1FileName ;  
    private List<String> file1ContentType ;  
    
    private List<Visit> list;
    
    private int visitId;
    
    private int id;
    
    private String resultObj;
    
    @Resource
    private UtilDAO utilDAO;
    
    @Resource
    private JdbcTemplate jdbcTemplate;
    
	private int totalPage;
	
	private int currentPage;
	
	private int itemPrePage=10;
          
    public String execute() throws Exception {  
    	
    	if (StringUtils.isNotEmpty(visit.getAddress())) {
    		String add=URLDecoder.decode(visit.getAddress(), "utf-8");
    		 visit.setAddress(add);
		}
    	if (StringUtils.isNotEmpty(visit.getMsg())) {
    		String msg=URLDecoder.decode(visit.getMsg(), "utf-8");
    		 visit.setMsg(msg);
		}
    	
    	//获取文件存储路径  
    	setPara();
    	savePicture();
        JSONObject jo=new JSONObject();
        jo.put("resultcode", 200);
        jo.put("id", visit.getId());
        jo.put("msg", visit.getId()+"保存成功");
        resultObj=jo.toString();
        System.out.println(resultObj+"  upLoad");
        return SUCCESS;  
    }  

	public String delete(){
		Visit c=(Visit) utilDAO.findListByProperty("Visit", "id", id, "").get(0);
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
    

	public  void setPara(){

    	int customerId=visit.getCustomerId();

    	String  sql="select * from customer where id=?";
    	Customer c=jdbcTemplate.queryForObject(sql, new Object[]{customerId},
    			new BeanPropertyRowMapper<Customer>(Customer.class));
    	visit.setCustomerName(c.getName());

    	visit.setClientId(""+getSessionBranch().getId());
    	visit.setClientName(getSessionBranch().getArea()+"/"+getSessionBranch().getTrueName());
    	visit.setDate(DateConvert.getAccurateDate());
    	
    	utilDAO.save(visit);
    }
    
    public  void savePicture() throws IOException{
    	 String path =  ServletActionContext.getServletContext().getRealPath("/upload");
         for(int i = 0 ; file1!=null &&i < file1.size() ; i++ ){  
         	 System.out.println(file1FileName.get(i)+"   文件"+i);
         	 String picName=""+visit.getId()+"_"+i+".jpg";
         	 System.out.println(path+picName+"  pathName");
             OutputStream os = new FileOutputStream(new File(path,picName));  
             InputStream is = new FileInputStream(file1.get(i));  
             
             byte[] buf = new byte[1024];  
             int length = 0 ;  
             while(-1 != (length = is.read(buf) ) )  {  
                 os.write(buf, 0, length) ;  
             }  

             is.close();  
             os.close();  
         }  
    }
    
    @SuppressWarnings("unchecked")
	public String show(){
    	list=(List<Visit>) utilDAO.findAllList("Visit");
    	return SUCCESS;
    }
    
    public String showAndroid(){
		if(currentPage==0)
			currentPage=1;
		int start=(currentPage-1)*itemPrePage;
		int end=currentPage*itemPrePage;
		if (currentPage==-1) {
			start=0;
			end=1000;
		}
		totalPage=jdbcTemplate.queryForInt("select count(*) from visit where clientId="+getSessionBranch().getId());
		int totalItem=totalPage;
		if (totalPage%itemPrePage==0) {
			totalPage=totalPage/itemPrePage;
		}else {
			totalPage=totalPage/itemPrePage+1;
		}
    	String sql="select * from visit where clientId="+getSessionBranch().getId()+" order by id desc limit "+start+","+end;
    	list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Visit>(Visit.class));
    	JSONArray ja=new JSONArray();
    	net.sf.json.JSONObject jo=null;
    	for (int i = 0; i < list.size(); i++) {
			jo=net.sf.json.JSONObject.fromObject(list.get(i));
			ja.add(jo);
		}
    	jo=new net.sf.json.JSONObject();
    	jo.put("result", ja);
    	jo.put("totalPage", totalPage);
    	jo.put("currentPage", currentPage);
    	jo.put("totalItems", totalItem);
    	resultObj=jo.toString();
    	System.out.println(resultObj);
    	return SUCCESS;
    }
    
    public String getPic(){
    	String path = ServletActionContext.getServletContext().getRealPath("/upload"); 
    	JSONObject object=new JSONObject();
    	for (int i = 0; i < 3; i++) {
			try {
				object.put("pic"+i, path+"/"+visitId+"_"+i+".jpg");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    	resultObj=object.toString();
    	System.out.println(resultObj);
    	return SUCCESS;
    }



	public Visit getVisit() {
		return visit;
	}



	public void setVisit(Visit visit) {
		this.visit = visit;
	}



	public List<File> getFile1() {
		return file1;
	}



	public void setFile1(List<File> file1) {
		this.file1 = file1;
	}



	public List<String> getFile1FileName() {
		return file1FileName;
	}



	public void setFile1FileName(List<String> file1FileName) {
		this.file1FileName = file1FileName;
	}



	public List<String> getFile1ContentType() {
		return file1ContentType;
	}



	public void setFile1ContentType(List<String> file1ContentType) {
		this.file1ContentType = file1ContentType;
	}



	public List<Visit> getList() {
		return list;
	}



	public void setList(List<Visit> list) {
		this.list = list;
	}



	public int getVisitId() {
		return visitId;
	}



	public void setVisitId(int visitId) {
		this.visitId = visitId;
	}



	public String getResultObj() {
		return resultObj;
	}



	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
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
	
}
