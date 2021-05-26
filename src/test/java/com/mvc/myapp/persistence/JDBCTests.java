package com.mvc.myapp.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott",
				"tiger2")) {
			
			log.info(con);
			 System.out.println("ccccccc");
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
