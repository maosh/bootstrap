package com.maosh.model;

public class Tools {
	
	public static String convertString(String input){
		String result="";
		try {
			result=new String(input.getBytes("ISO8859-1"),"utf-8");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}

}
