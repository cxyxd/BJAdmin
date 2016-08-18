package com.module.center;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

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
public class CenterAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8686776915746356089L;
	
	@Resource
	private UtilDAO utilDAO;

	private File file;

	// 提交过来的file的名字
	private String fileFileName;

	private String versionMsg;
	
	private String resultObj;
	
	private Version version=new Version();
	
	public String update() {
		try {
			doUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject jo=new JSONObject();
		jo.put("resultcode", "200");
		jo.put("id",version.getId());
		resultObj=jo.toString();
		return SUCCESS;
	}

	public void doUpdate() throws IOException {
		String root = ServletActionContext.getServletContext().getRealPath(
				"/upload");
		
		
		version.setDate(DateConvert.getDate());
		version.setVersionMsg(versionMsg);
		version.setPath("/upload/"+fileFileName);
		System.out.println(versionMsg+" msg");
		utilDAO.saveOrUpdate(version);
		
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(new File(root, fileFileName));

		System.out.println("fileFileName: " + fileFileName);
		
		byte[] buffer = new byte[500];
		while (-1 != (is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}

		os.close();
		is.close();

	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getResultObj() {
		return resultObj;
	}

	public void setResultObj(String resultObj) {
		this.resultObj = resultObj;
	}

	public String getVersionMsg() {
		return versionMsg;
	}

	public void setVersionMsg(String versionMsg) {
		this.versionMsg = versionMsg;
	}


	
}
