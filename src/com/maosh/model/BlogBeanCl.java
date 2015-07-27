package com.maosh.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Timestamp;
public class BlogBeanCl {

	public BlogBeanCl() {
		// TODO Auto-generated constructor stub
	}

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
			ResultSet rs=sm.executeQuery("select count(*) from blog");
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
	public ArrayList getBlogByUser(String u){
		
		ArrayList al = new ArrayList();
		
		try {
			
			ct=new ConnDB().getConn();
			sm=ct.createStatement();
			ResultSet rs=sm.executeQuery("select * from blog where author='"+u+"'order by time desc");
			
			while(rs.next()){
				BlogBean bb=new BlogBean();
				bb.setBlogId(rs.getInt(1));
				bb.setAuthor(rs.getString(2));
				bb.setTitle(rs.getString(3));
				bb.setContent(rs.getString(4));
				bb.setTs(rs.getTimestamp(5));
				al.add(bb);
			}
			
			} catch (Exception e) {
				e.printStackTrace();
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
	
    public boolean deleteBlogById(int blogId){
    	boolean b=false;
    	try {
    		ct =new ConnDB().getConn();
    		sm=ct.createStatement();
    		int a=sm.executeUpdate("delete from blog where blogId ='"+blogId+"'");
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

    public boolean addBlog(String author, String title, String content, Timestamp ts){
      	boolean b=false;
    	try {
    		ct =new ConnDB().getConn();
    		sm=ct.createStatement();
    		int a=sm.executeUpdate("insert into blog(author,title,content,time) values('"+author+"','"+title+"','"+content+"','"+ts+"')");
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

    
 
    public boolean updateBlogById(int blogId, String author, String title, String content){
      	boolean b=false;
    	try {
    		ct =new ConnDB().getConn();
    		sm=ct.createStatement();
    		int a=sm.executeUpdate("update users set author='"+author+"', title='"+title+"', content='"+content+"' where blogId="+blogId);
    				
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
