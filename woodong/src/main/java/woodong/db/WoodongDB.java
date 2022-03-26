package woodong.db;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WoodongDB {

static DataSource ds;

	static {
		try {
			Context initconContext=new InitialContext();
			Context envContext=(Context)initconContext.lookup("java:/comp/env");
			ds=(DataSource)envContext.lookup("jdbc/myoracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn() throws Exception{
		
		return ds.getConnection();
	}
	
}
