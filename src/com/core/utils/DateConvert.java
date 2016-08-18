package com.core.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert {
	
	public static String getDate(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}
	public static String getAccurateDate(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(date);
	}
	public static void main(String[] args) {
		System.out.println(DateConvert.getAccurateDate());
	}
}
