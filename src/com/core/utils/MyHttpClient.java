package com.core.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import com.model.User;

public class MyHttpClient{

	/**
	 * 获得控制中心的user对象
	 * 可用来判定该用户的权限
	 * @param args
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public static User getUser(int id) throws ClientProtocolException, IOException
	{
		// 创建HttpClient实例   
	    HttpClient httpclient = new DefaultHttpClient();
	    // 创建post方法实例   
	    String address=MyProperty.getKey("address");
	    String module=MyProperty.getKey("module_getid");
        HttpPost httpPost= new HttpPost(address+module);

      //  http://daledong.java.jspee.net/module/login/loginAndroid?appClient.Name=xxx&appClient.password=123123
        List<NameValuePair> params = new ArrayList<NameValuePair>();  
        params.add(new BasicNameValuePair("user.id", ""+id));  
        httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8)); 
        
        HttpResponse response = httpclient.execute(httpPost);  
        HttpEntity entity = response.getEntity();  
        if (entity != null) {  
            InputStream instreams = entity.getContent();  
            String str = convertStreamToString(instreams); 
         //   System.out.println(str);
            JSONObject jo=JSONObject.fromObject(str);
            httpPost.abort();  
            User user=(User) JSONObject.toBean(jo, User.class);
            return user;
        }
        return null;
	}
	
	public static void update(User u) throws ClientProtocolException, IOException {
		HttpClient httpclient = new DefaultHttpClient();
		String address = MyProperty.getKey("address");
		String module = MyProperty.getKey("module_update");
		HttpPost httpPost = new HttpPost(address + module);
		System.out.println(address+module);
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		
		//可用内省
		//程序员的优良品质就是懒惰
//		params.add(new BasicNameValuePair("user.id",""+u.getId() ));
//		params.add(new BasicNameValuePair("user.password", "" +u.getPassword() ));
//		params.add(new BasicNameValuePair("user.userName", "" +u.getUserName() ));
//		params.add(new BasicNameValuePair("user.companyMsg", "" +u.getCompanyMsg() ));
//		params.add(new BasicNameValuePair("user.companyName", "" +u.getCompanyName() ));
//		
//		params.add(new BasicNameValuePair("user.appCount", "" +u.getAppCount() ));
//		params.add(new BasicNameValuePair("user.usedCount", "" +u.getUsedCount() ));
//		params.add(new BasicNameValuePair("user.enddate", "" +u.getEnddate() ));
//		params.add(new BasicNameValuePair("user.address", "" +u.getAddress() ));
//		params.add(new BasicNameValuePair("user.phone", "" +u.getPhone()));
//		
//		params.add(new BasicNameValuePair("user.tureName", "" +u.getTrueName() ));
//		params.add(new BasicNameValuePair("user.branchId", "" +u.getBranchId() ));
//		params.add(new BasicNameValuePair("user.companyId", "" +u.getCompanyId()));
//		params.add(new BasicNameValuePair("user.idCard", "" +u.getId() ));
//		params.add(new BasicNameValuePair("user.sex", "" +u.getSex() ));
		
		params.add(new BasicNameValuePair("user.id",""+u.getId() ));
		params.add(new BasicNameValuePair("user.usedCount", "" +u.getUsedCount() ));
		
		httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
		

		HttpResponse response = httpclient.execute(httpPost);
	}
	public static void main(String[] args) {
		try {
			User user=new User();
			user.setId(19);
			user.setUsedCount(10);
			MyHttpClient.update(user);
		//	MyHttpClient.getUser(11);
			System.out.println(user.getType());
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	public static String convertStreamToString(InputStream is) {    
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));    
        StringBuilder sb = new StringBuilder();    
     
        String line = null;    
        try {    
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");    
            }    
        } catch (IOException e) {    
            e.printStackTrace();    
        } finally {    
            try {    
                is.close();    
            } catch (IOException e) {    
               e.printStackTrace();    
            }    
        }    
       String newString=new String(sb);
       newString=newString.replace("\\", "\"");
       newString=newString.replace("\"\"", "\"");
       newString=newString.substring(1, newString.length()-2);
        return newString;    
    }

}