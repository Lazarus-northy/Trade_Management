package JavaBean.Contract;

import java.sql.Connection;
//import java.sql.Date;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class newcontract {
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

	public List<Object> selectAllUser()// ��ʾ���б�
	{
		// 
		List<Object> list = new ArrayList<Object>();
		// 
		String sql = "select * from Contract";
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

	public boolean select_contract(String Contract_id)//���Һ�ͬ
	{
		Connection conn = null;
		Statement ps = null;
		ResultSet rs=null;
		conn = db_getConnection();
		String s="select * from Contract where Contract_id='"+Contract_id+"'";
		try{
			ps=conn.createStatement();
			rs=ps.executeQuery(s);
			if(rs.next()){
				rs.close();
				ps.close();
				conn.close();
				return true;}//
			else {
				rs.close();
				ps.close();
				conn.close();
				return false;
			}
		}catch(SQLException e){
			return false;
		}

	}

	public void addcontract(contract contract1)// �����ͬ
	{
		Connection conn = null;
		Statement ps = null;
		conn = db_getConnection();
		String Contract_id=contract1.getContract_id();
		String Company_id=contract1.getCompany_id();
		String shipper=contract1.getshipper();
		String consignee=contract1.getconsignee();
		String notify=contract1.getconsignee();
		String port_of_loading=contract1.getport_of_loading();
		String port_of_discharge=contract1.getport_of_discharge();
		String payment=contract1.getpayment();
		Date paytime=contract1.getpaytime();
		String price_terms=contract1.getprice_terms();
		String transport_method=contract1.gettransport_method();
		Date time_ship_flight=contract1.gettime_ship_flight();
		String shipment_flight=contract1.getshipment_flight();
		String state = contract1.getstate();
		
		String s1 = "insert into Contract(Contract_id,Company_id,shipper,consignee,notify,port_of_loading,port_of_discharge,payment,paytime,price_terms,transport_method,time_ship_flight,shipment_flight,state) values('"+Contract_id+"','"+Company_id+"','"+shipper+"','"+consignee+"','"+notify+"','"+port_of_loading+"','"+port_of_discharge+"','"+payment+"','"+paytime+"','"+price_terms+"','"+transport_method+"','"+time_ship_flight+"','"+shipment_flight+"','"+state+"')";
		try {
			ps = conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		Statement ps1 = null;
		String s2 = "insert into Time(Contract_id,time_ship_flight,paytime) values('"+Contract_id+"','"+time_ship_flight+"','"+paytime+"')";
		try {
			ps1 = conn.createStatement();
			ps1.executeUpdate(s2);
			ps1.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}



	public boolean delete_contract(String Contract_id)//ɾ���ͬ
	{
		Connection conn=db_getConnection();
		Statement ps=null;
		Statement ps0 =null;

		
		String s1="delete from Contract where Contract_id='" + Contract_id + "'";
		String s0="delete from Time where Contract_id='" + Contract_id + "'";
		
		try{
			ps0=conn.createStatement();
			ps0.executeUpdate(s0);
			ps0.close();
			ps=conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
			String s2 = "select * from Contract where Contract_id='" + Contract_id + "'";
			Statement ps1 = null;
			ResultSet rs1 = null;
			ps1 = conn.createStatement();
			rs1 = ps1.executeQuery(s2);
			
			if(rs1.next() ){
				rs1.close();
				ps1.close();
				conn.close();
				return false;
			}
			else{
				rs1.close();
				ps1.close();
				conn.close();
				return true;
			}
		}catch(Exception e){
			//System.out.println("exception!!");
			return false;
		}
		
	}

	public boolean update_contract(contract contract1)
	{
		Connection conn=null;
		Statement ps=null,ps1=null;
		ResultSet rs=null;
		String Contract_id=contract1.getContract_id();
		String Company_id=contract1.getCompany_id();
		String shipper=contract1.getshipper();
		String consignee=contract1.getconsignee();
		String notify=contract1.getconsignee();
		String port_of_loading=contract1.getport_of_loading();
		String port_of_discharge=contract1.getport_of_discharge();
		String payment=contract1.getpayment();
		Date paytime=contract1.getpaytime();
		String price_terms=contract1.getprice_terms();
		String transport_method=contract1.gettransport_method();
		Date time_ship_flight=contract1.gettime_ship_flight();
		String shipment_flight=contract1.getshipment_flight();
		String state=contract1.getstate();
		                        
		conn=db_getConnection();
		String s1="select * from Contract where Contract_id='" + Contract_id.trim() + "'";
		String s2="update Contract set Company_id='"+Company_id.trim()+"',shipper='"+shipper.trim()+"',consignee='"+consignee.trim()+"',notify='"+notify.trim()+"',port_of_loading='"+port_of_loading.trim()+"',port_of_discharge='"+port_of_discharge.trim()+"',payment='"+payment.trim()+"',paytime='"+paytime+"',price_terms='"+price_terms.trim()+"',transport_method='"+transport_method.trim()+"',time_ship_flight='"+time_ship_flight+"',shipment_flight='"+shipment_flight.trim()+"',state='"+state.trim()+"' where Contract_id='"+Contract_id.trim()+"'";
		try{
			ps=conn.createStatement();
			rs=ps.executeQuery(s1);
			if(rs.next()){
				ps1=conn.createStatement();
				ps1.executeUpdate(s2);
				ps1.close();
				rs.close();
				ps.close();
				conn.close();
				return true;
			}
			else{
				rs.close();
				ps.close();
				conn.close();
				return false;
			}
			
		}catch(SQLException e){
			return false;
		}
	}

	
	
}