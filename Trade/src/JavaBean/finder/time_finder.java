package JavaBean.finder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import JavaBean.Contract.contract;
import JavaBean.Contract.do_time;
import JavaBean.Contract.time;

public class time_finder {
	public Connection db_getConnection() // 
	{
		Connection conn = null;
		String db_driver = null;
		String db_connection = null;
		db_driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		db_connection = "jdbc:sqlserver://localhost:1433;DatabaseName=TradeDB";
		try {
			Class.forName(db_driver);
			conn = DriverManager.getConnection(db_connection, "sa", "sql");
			return conn;
		} catch (Exception e) {
			System.out.println("can not connect");
			return null;
		}
	}
	


	public List<Object> getselectAllUser(String Contract_id,String selectName)// tp="mohu","jingque"
	{
		if(Contract_id=="")
		{
			return null;
		}
		//
		List<Object> list = new ArrayList<Object>();
		// 
		String sql =null;
		if(selectName.equals("mohu"))
		{
			sql = "select * from Time where Contract_id like '%"+Contract_id+"%'";
		}
		else
		{
			sql = "select * from Time where Contract_id = '"+Contract_id+"'";
		}
		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;

		try {
			conn = db_getConnection();
			ps = conn.createStatement();
			rs = ps.executeQuery(sql);
			// ******  ******* //
			while (rs.next()) {
				// 
				time time1 = new time();
				time1.setContract_id(rs.getString("Contract_id"));
				time1.settime_ship_flight(rs.getDate("time_ship_flight"));
				time1.setlading_bill_date(rs.getDate("lading_bill_date"));
				time1.setarriving_port_date(rs.getDate("arriving_port_date"));
				time1.setbills_alert_date(rs.getDate("bills_alert_date"));
				time1.setswitch_bill_date(rs.getDate("switch_bill_date"));
				time1.setpaytime(rs.getDate("paytime"));
				

				list.add(time1);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ****************** ****************** //
		return list;
	}
}
