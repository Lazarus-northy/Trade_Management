package JavaBean.finder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import JavaBean.Contract.contract;

public class contract_finder {
//	String selectName;
//	String Contract_id;
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
	
//	public void setselectName(String selectName){
//		this.selectName = selectName;
//	}
//	public void setContract_id(String Contract_id){
//		this.Contract_id = Contract_id;
//	}
	

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
			sql = "select * from Contract where Contract_id like '%"+Contract_id+"%'";
		}
		else
		{
			sql = "select * from Contract where Contract_id = '"+Contract_id+"'";
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
				contract contract1=new contract();
				contract1.setContract_id(rs.getString("Contract_id"));
				contract1.setCompany_id(rs.getString("Company_id"));
				contract1.setshipper(rs.getString("shipper"));
				contract1.setconsignee(rs.getString("consignee"));
				contract1.setnotify(rs.getString("notify"));
				contract1.setport_of_loading(rs.getString("port_of_loading"));
				contract1.setport_of_discharge(rs.getString("port_of_discharge"));
				contract1.setpayment(rs.getString("payment"));
				contract1.setpaytime(rs.getDate("paytime"));
				contract1.setprice_terms(rs.getString("price_terms"));
				contract1.settransport_method(rs.getString("transport_method"));
				contract1.settime_ship_flight(rs.getDate("time_ship_flight"));
				contract1.setshipment_flight(rs.getString("shipment_flight"));
				contract1.setstate(rs.getString("state"));

				// System.out.println(rs.getInt("id"));
				// System.out.println(rs.getString("username"));

				list.add(contract1);
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
