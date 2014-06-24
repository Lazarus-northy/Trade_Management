package JavaBean.user;

//import java.io.File;
//import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//import java.util.Properties;

public class db_op 
{
	
	public Connection db_getConnection() //
	{
		Connection conn = null;
		String db_driver = null;
		String db_connection = null;
		db_driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		db_connection = "jdbc:sqlserver://localhost:1433;databaseName=TradeDB";
		try {
			Class.forName(db_driver);
			conn = DriverManager.getConnection(db_connection, "sa", "sql");
			return conn;
		} catch (Exception e) {
			System.out.println("can not connect");
			System.out.println(e.getMessage());
			return null;
		}
	}

	public int select_1(user u)//
	{
		
		Connection conn = null;
		ResultSet rs = null, rs1 = null;
		Statement ps = null, ps1 = null;
		String xm = u.getUsername();
		String pass = u.getPassword();
		conn = db_getConnection();
		String s1 = "select * from usersheet where username='" + xm
				+ "' and password='" + pass + "'";
		String s2 = "select role from usersheet where username='" + xm
				+ "'";
		//System.out.println("test");
		try {
			ps = conn.createStatement();

			rs = ps.executeQuery(s1);

			if (rs.next()) {
				ps1 = conn.createStatement();
				rs1 = ps1.executeQuery(s2);
				String tr=null;
				while(rs1.next())
				tr=rs1.getString(1);
				 //System.out.println(tr);
				if(tr.trim().equals("admin")){
					
					rs1.close();
					ps1.close();
					rs.close();
					ps.close();
					conn.close();
					return 1;}//
				else
				{rs1.close();
				ps1.close();
				rs.close();
				ps.close();
				conn.close();
					return 2;}//
				
			} else {
				rs.close();
				ps.close();
				//System.out.println("no");
					return 3; // 
			}
		} catch (SQLException e) {
			return 3;
		}
	}

	public boolean select_2(String u) // 
	{
		
		Connection conn = null;
		ResultSet rs = null;
		Statement ps = null;
		conn = db_getConnection();
		String s1 = "select * from usersheet where username='" + u + "'";
		try {
			ps = conn.createStatement();
			rs = ps.executeQuery(s1);
			if (rs.next()) {
				rs.close();
				ps.close();
				conn.close();
				return false;//
			} else {
				rs.close();
				ps.close();
				conn.close();
				return true;
			}
		} catch (SQLException e) {
			return false;
		}
	}

	public void append(user u) 	// 
	{
	
		Connection conn = null;
		Statement ps = null,ps1=null;
		conn = db_getConnection();
		String xm = u.getUsername();
		String pass = u.getPassword();
		String role=u.getrole();
		int id=0;
		String s0="select id from usersheet";//
		try {
			ps = conn.createStatement();
			ResultSet rs=ps.executeQuery(s0);
			while(rs.next()) id=rs.getInt("id");
			rs.close();
			ps.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		id=id+1;
		String s1 = "insert into usersheet(id,username,password,role) values('" + id + "','" + xm + "','" + pass +"','" + role + "') ";
		try {
			ps1 = conn.createStatement();
			ps1.executeUpdate(s1);
			ps1.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	
	public List<Object> selectAllUser()//
	{
		//
		List<Object> list = new ArrayList<Object>();
		// 
		String sql = "select * from usersheet";
		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;

		try {
			conn = db_getConnection();
			ps = conn.createStatement();
			rs = ps.executeQuery(sql);

			while (rs.next()) {
				// 
				user user = new user();
				user.setID(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setrole(rs.getString("role"));
				// System.out.println(rs.getInt("id"));
				// System.out.println(rs.getString("username"));
				// System.out.println(rs.getString("password"));
				// System.out.println(rs.getString("role"));
				list.add(user);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteUser(int id) //
	{
		Connection conn = null;
		ResultSet rs = null;
		Statement ps = null;
		Statement ps1 = null;
		conn = db_getConnection();
		String s1 = "select * from usersheet where id='" + id
				+ "' and role='admin'";
		String s2 = "delete from usersheet where id='" + id + "'";
		try {
			ps = conn.createStatement();
			rs = ps.executeQuery(s1);
			if (rs.next()) {
				System.out.println("yes1");
				rs.close();
				ps.close();
				conn.close();
				return false;
			} else {
				try {
					ps1 = conn.createStatement();
					ps1.executeUpdate(s2);
					ps1.close();
					rs.close();
					ps.close();
					conn.close();
					System.out.println("yes2");
					return true;
				} catch (SQLException e) {
					return false;
				}// 
			}// 
		} catch (SQLException e) {
			return false;
		}
	}

	public boolean UpdateUser(user u)//
	{
		Connection conn=null;
		Statement ps=null,ps1=null;
		ResultSet rs=null;
		int id=u.getID();
		String password=u.getPassword();
		String role=u.getrole();                             
		conn=db_getConnection();
		String s1="select * from usersheet where id='" + id + "'";
		String s2="update usersheet set password='"+password+"', role='"+role+"' where id='"+id+"'";
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
