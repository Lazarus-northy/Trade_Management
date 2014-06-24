package JavaBean.company;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import JavaBean.company.*;;

public class company_op {

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
		String sql = "select * from Company";
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
				company company1=new company();
				company1.setCompany_id(rs.getString("Company_id"));
				company1.setCompany_name(rs.getString("Company_name"));
				company1.setCompany_shortname(rs.getString("Company_shortname"));
				company1.setCompany_address(rs.getString("Company_address"));
				company1.setCompany_contact_p(rs.getString("Company_contact_p"));
				company1.setCompany_contact(rs.getString("Company_contact"));
				company1.setCompany_work(rs.getString("Company_work"));
				company1.setCompany_note(rs.getString("Company_note"));

				list.add(company1);
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

	public boolean select_company(String Company_id)//���Һ�ͬ
	{
		Connection conn = null;
		Statement ps = null;
		ResultSet rs=null;
		conn = db_getConnection();
		String s="select * from Company where Company_id='"+Company_id+"'";
		try{
			ps=conn.createStatement();
			rs=ps.executeQuery(s);
			if(rs.next()){
				rs.close();
				ps.close();
				conn.close();
				return true;}//�н���true
			else {
				rs.close();
				ps.close();
				conn.close();
				return false;//�����ڷ���false
			}
		}catch(SQLException e){
			return false;
		}

	}

	public void addcompany(company company1)// ����company
	{
		Connection conn = null;
		Statement ps = null;
		conn = db_getConnection();
		String Company_id=company1.getCompany_id();
		String Company_name=company1.getCompany_name();
		String Company_shortname=company1.getCompany_shortname();
		String Company_address=company1.getCompany_address();
		String Company_contact_p=company1.getCompany_contact_p();
		String Company_contact=company1.getCompany_contact();
		String Company_work=company1.getCompany_work();
		String Company_note=company1.getCompany_note();
		System.out.println(Company_name);
		System.out.println(Company_shortname);
		
		String s1 = "insert into Company(Company_id,Company_name,Company_shortname,Company_address,Company_contact_p,Company_contact,Company_work,Company_note) values('"+ Company_id.trim() +"','"+ Company_name.trim() +"','"+ Company_shortname.trim() +"','"+ Company_address.trim() +"','"+ Company_contact_p.trim() +"','"+ Company_contact.trim() +"','"+ Company_work.trim() +"','"+ Company_note.trim() +"')";
		try {
			ps = conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

	}



	public boolean delete_company(String Company_id)//ɾ��˾
	{
		Connection conn=db_getConnection();
		Statement ps=null;

		
		String s2="delete from Company where Company_id='" + Company_id + "'";
		try{
			ps=conn.createStatement();
			ps.executeUpdate(s2);
			ps.close();
			conn.close();
			return true;
		}catch(Exception e){
			return false;
		}
		
	}

	public boolean update_company(company company1)
	{
		Connection conn=null;
		Statement ps=null,ps1=null;
		ResultSet rs=null;
		String Company_id=company1.getCompany_id();
		String Company_name=company1.getCompany_name();
		String Company_shortname=company1.getCompany_shortname();
		String Company_address=company1.getCompany_address();
		String Company_contact_p=company1.getCompany_contact_p();
		String Company_contact=company1.getCompany_contact();
		String Company_work=company1.getCompany_work();
		String Company_note=company1.getCompany_note();
		                        
		conn=db_getConnection();
		String s1="select * from Company where Company_id='" + Company_id + "'";
		String s2="update Company set Company_name='"+ Company_name +"',Company_shortname='"+ Company_shortname +"',Company_address='"+ Company_address +"',Company_contact_p='"+ Company_contact_p +"',Company_contact='"+ Company_contact +"',Company_work='"+ Company_work +"',Company_note='"+ Company_note +"' where Company_id='"+ Company_id +"'";
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
