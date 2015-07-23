package com.maosh.model;

import java.sql.*;

public class ConnDB {
	
	private Connection ct=null;
	
	public Connection getConn(){
		try{
			
			Class.forName("org.gjt.mm.mysql.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://dmaoshl0:3306/test", "root", "root");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ct;
	}

}
