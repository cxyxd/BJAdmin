package com.module.version;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.core.BaseAction;
import com.core.dao.UtilDAO;
import com.core.utils.DateConvert;
import com.model.Version;


@Component
@Scope("prototype")
public class VersionAction  extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3871631290488990460L;

	private  Version version;
	
	@Resource
	private UtilDAO utilDAO;
	
	 private List<File> file1;  
	 private List<String> file1FileName ;  
	 private List<Version> list;
	 
	 private String resultObj;
	
	
	public String insert(){
		System.out.println("OK");

		version.setDate(DateConvert.getAccurateDate());
		utilDAO.save(version);
		
		try {
			saveFile();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		utilDAO.saveOrUpdate(version);
		return SUCCESS;
		
	}
	@SuppressWarnings("unchecked")
	public String getHistory(){
		list=(List<Version>) utilDAO.findAllList("Version");
		return SUCCESS;
	}
	
	public String getNew(){
		getHistory();
		version=list.get(0);
		JSONObject json=JSONObject.fromObject(version);
		resultObj=json.toString();
		return SUCCESS;
	}


	public void saveFile() throws Exception {
		// TODO Auto-generated method stub
		 String path =  ServletActionContext.getServletContext().getRealPath("/apps");
         for(int i = 0 ; file1!=null &&i < file1.size() ; i++ ){  
         	 System.out.println(file1FileName.get(i)+"   文件"+i);
         	 String fileName="BJAdmin-version-"+version.getId()+".apk";
         	 System.out.println(path+fileName+"  fileName");
             OutputStream os = new FileOutputStream(new File(path,fileName));  
             InputStream is = new FileInputStream(file1.get(i));  
             
             byte[] buf = new byte[1024];  
             int length = 0 ;  
             while(-1 != (length = is.read(buf) ) )  {  
                 os.write(buf, 0, length) ;  
             } 

             is.close();  
             os.close();  
             path = request.getContextPath();
             String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
             version.setPath(basePath+"apps/"+fileName);
         }  
		
	}
	public Version getVersion() {
		return version;
	}
	public void setVersion(Version version) {
		this.version = version;
	}
	public UtilDAO getUtilDAO() {
		return utilDAO;
	}
	public void setUtilDAO(UtilDAO utilDAO) {
		this.utilDAO = utilDAO;
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
	public List<Version> getList() {
		return list;
	}
	public void setList(List<Version> list) {
		this.list = list;
	}
	public String getResultObj() {
		return resultObj;
	}
	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}

}
