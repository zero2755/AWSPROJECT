package com.mvc.myapp.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class mydbConnTest {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	//MySQL Driver 6.0 이상	"com.mysql.cj.jdbc.Driver";
	
	private static final String URL = "jdbc:mysql://127.0.0.1:3307/mydb?useSSL=false&serverTimezone=Asia/Seoul";
	//MySQL 6.1 이상 "jdbc:mysql://127.0.0.1:3307/mydb?useSSL=false&serverTimezone=Asia/Seoul";
	
	private static final String USER = 
			"scott";
	private static final String PW = 
			"tiger2";
			
	
	@Test
	public void testConnection() throws Exception{
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			
			System.out.println(con);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
