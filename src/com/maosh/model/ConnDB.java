package com.maosh.model;

import java.sql.*;

public class ConnDB {
	
	private Connection ct=null;
	
	public Connection getConn(){
		try{
			
			Class.forName("org.gjt.mm.mysql.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "maosh");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ct;
	}

}
