package com.core.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyProperty{
	  public static String getKey(String key){
	    Properties props = new Properties();
	    InputStream in = MyProperty.class.getResourceAsStream("../../../config.properties");

	    try {
			props.load(in);
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    String value = props.getProperty(key);
	    return value;
	    
	    // 遍历所有属性，方式一
//	    Set<?> keys = props.keySet();
//	    for (Iterator<?> it = keys.iterator(); it.hasNext();){
//	        String k = (String) it.next();
//	        System.out.println(k + ":" + props.getProperty(k));
//	    }

	  }
	}