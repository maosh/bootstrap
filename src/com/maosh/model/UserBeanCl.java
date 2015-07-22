package com.maosh.model;

import java.sql.*;
import java.util.*;

public class UserBeanCl {
	
	private Connection ct=null;
	private ResultSet rs=null;		
	private Statement sm=null;
	
	private int pageSize=10;
	private int pageCount=0;
	private int rowCount=0;
	
	
	public int getPageCount(){
		
		
		try {
			ct=new ConnDB().getConn();
			sm=ct.createStatement();
			ResultSet rs=sm.executeQuery("select count(*) from users");
			if(rs.next()){
				rowCount=rs.getInt(1);	
			}
			
			if(rowCount%pageSize==0){
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close();
		}
		
		return pageCount;
	}
	
	//get the user info
	public ArrayList getUserByPage(int pageNow){
		
		ArrayList al = new ArrayList();
		
		try {
			
			ct=new ConnDB().getConn();
			sm=ct.createStatement();
			ResultSet rs=sm.executeQuery("select * from users limit "+pageNow*pageSize+","+pageSize);
			
			while(rs.next()){
				UserBean ub=new UserBean();
				ub.setUserID(rs.getInt(1));
				ub.setUserName(rs.getString(2));
				ub.setPassword(rs.getString(3));
				ub.setEmail(rs.getString(4));
				ub.setGrade(rs.getString(5));
				
				al.add(ub);
			}
			
			} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		
		return al;
		
	}
	
	

	public boolean checkUser(String u, String p){
		boolean b=false;


		try{
			ct=new ConnDB().getConn();
			sm=ct.createStatement();
			rs = sm.executeQuery("select passwd from users where username='"+u+"'");
			
			if(rs.next()){
				
				if(rs.getString(1).equals(p)){
					b=true;
				}
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close();
		}
		
		return b;
	}

	public UserBean getUser(String u){
		
		//ArrayList al = new ArrayList();
		UserBean ub=new UserBean();
		try {
			
			ct=new ConnDB().getConn();
			sm=ct.createStatement();
			ResultSet rs=sm.executeQuery("select * from users where username='"+u+"'");
			
			if(rs.next()){	
				ub.setUserID(rs.getInt(1));
				ub.setUserName(rs.getString(2));
				ub.setPassword(rs.getString(3));
				ub.setEmail(rs.getString(4));
				ub.setGrade(rs.getString(5));
				ub.setProfile(rs.getString(6));
			}
			
			} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		
		return ub;
		
	}
	
	
    public void close(){

    	try{
       		if(rs!=null){
    			rs.close();
    		}
    		
 
    		if(sm!=null){
    			sm.close();
    		}
    		
    		if(ct!=null){
    			ct.close();
    		}
			
		}catch(Exception e){
			e.printStackTrace();
		}
    }
	
    public boolean deleteUserById(int userId){
    	boolean b=false;
    	try {
    		ct =new ConnDB().getConn();
    		sm=ct.createStatement();
    		int a=sm.executeUpdate("delete from users where userId ='"+userId+"'");
    		if(a==1){
    			b=true;
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
			
		}
    	return b;
    }
    
    /**
     * 
     * @param name
     * @param passwd
     * @param email
     * @param grade
     * @return
     */

    public boolean addUser(String name, String passwd, String email, String grade){
      	boolean b=false;
    	try {
    		ct =new ConnDB().getConn();
    		sm=ct.createStatement();
    		int a=sm.executeUpdate("insert into users(username,passwd,email,grade) values('"+name+"','"+passwd+"','"+email+"','"+grade+"')");
    		if(a==1){
    			b=true;
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
			
		}
    	return b;
    }

    
 
    public boolean updateUser(String userId, String name, String passwd, String email, String grade){
      	boolean b=false;
    	try {
    		ct =new ConnDB().getConn();
    		sm=ct.createStatement();
    		int a=sm.executeUpdate("update users set username='"+name+"',passwd='"+passwd+"',email='"+grade+"' where userId="+userId);
    				
    		if(a==1){
    			b=true;
    		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
			
		}
    	return b;
    }

 
}
