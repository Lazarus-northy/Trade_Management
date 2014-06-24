package JavaBean.cost;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import JavaBean.Contract.contract;

public class do_cost {
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

	public List<Object> selectAllCost()// ��ʾ���б�
	{
		// 
		List<Object> list = new ArrayList<Object>();
		// 
		String sql = "select * from Cost";
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
				cost cost1 = new cost();
				cost1.setCost_id(rs.getString("Cost_id"));
				cost1.setContract_id(rs.getString("Contract_id"));
				cost1.setCosttype(rs.getString("Costtype"));
				cost1.setCost_happened(rs.getString("Cost_happened"));
				cost1.setProjectName(rs.getString("ProjectName"));
				cost1.setMoney(rs.getFloat("Money"));
				cost1.setnote(rs.getString("note"));
				cost1.setCost_date(rs.getDate("Cost_date"));
				
				// System.out.println(rs.getInt("id"));
				// System.out.println(rs.getString("username"));

				list.add(cost1);
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

	public boolean select_cost(String Cost_id)//���Һ�ͬ
	{
		Connection conn = null;
		Statement ps = null;
		ResultSet rs=null;
		conn = db_getConnection();
		String s="select * from Cost where Cost_id='"+Cost_id+"'";
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

	public void addcost(cost cost1)// �����ͬ
	{
		Connection conn = null;
		Statement ps = null;
		conn = db_getConnection();
		String Cost_id = cost1.getCost_id();
		String Contract_id=cost1.getContract_id();
		String Costtype = cost1.getCosttype();
		String Cost_happened = cost1.getCost_happened();
		String ProjectName = cost1.getProjectName();
		float Money = cost1.getMoney();
		String note = cost1.getnote();
		Date Cost_date = cost1.getCost_date();
		
		String s1 = "insert into Cost(Cost_id,Contract_id,Costtype,Cost_happened,ProjectName,Money,note,Cost_date) values('"+Cost_id+"','"+Contract_id+"','"+Costtype+"','"+Cost_happened+"','"+ProjectName+"','"+Money+"','"+note+"','"+Cost_date+"')";
		try {
			ps = conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	}



	public boolean delete_cost(String Cost_id)//ɾ���ͬ
	{
		Connection conn=db_getConnection();
		Statement ps=null;

		
		String s1="delete from Cost where Cost_id='" + Cost_id + "'";
		
		try{
			
			ps=conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
			String s2 = "select * from Cost where Cost_id='" + Cost_id + "'";
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

	public boolean update_cost(cost cost1)
	{
		Connection conn=null;
		Statement ps=null,ps1=null;
		ResultSet rs=null;
		String Cost_id = cost1.getCost_id();
		String Contract_id=cost1.getContract_id();
		String Costtype = cost1.getCosttype();
		String Cost_happened = cost1.getCost_happened();
		String ProjectName = cost1.getProjectName();
		float Money = cost1.getMoney();
		String note = cost1.getnote();
		Date Cost_date = cost1.getCost_date();
		                        
		conn=db_getConnection();
		String s1="select * from Cost where Cost_id='" + Cost_id.trim() + "'";
		String s2="update Cost set Contract_id='"+Contract_id.trim()+"',Costtype='"+Costtype.trim()+"',Cost_happened='"+Cost_happened.trim()+"',ProjectName='"+ProjectName.trim()+"',Money='"+Money+"',note='"+note.trim()+"',Cost_date='"+Cost_date+"' where Cost_id='"+Cost_id.trim()+"'";
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
