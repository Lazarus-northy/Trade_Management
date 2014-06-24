
package JavaBean.Contract;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Format;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.Calendar;


public class do_time {
	protected static Format format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
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

	public List<Object> selectAllUser()// 将进行中的项目的时间列表放入一个list中
	{
		// 建立一个list
		List<Object> list = new ArrayList<Object>();
		// 提取出进行中的合同的合同ID并按照时间升序排列
		String s1 = "select * from Contract where state= 'open' order by time_ship_flight";
		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;

		try {
			conn = db_getConnection();
			ps = conn.createStatement();
			rs = ps.executeQuery(s1);
			// ******  ******* //
			while(rs.next()) {
				String Contract_id = rs.getString("Contract_id");
				String s2 = "select * from Time where Contract_id = '"+ Contract_id +"'";
//				//s2查询所需的时间表
				Connection conn1 = null;
				Statement ps1 = null;
				ResultSet rs1 = null;
				try{
					conn1 = db_getConnection();
					ps1 = conn1.createStatement();
					rs1 = ps1.executeQuery(s2);
					while(rs1.next())
					{
						time time1 = new time();
						time1.setContract_id(rs1.getString("Contract_id"));
						time1.settime_ship_flight(rs1.getDate("time_ship_flight"));
						time1.setlading_bill_date(rs1.getDate("lading_bill_date"));
						time1.setarriving_port_date(rs1.getDate("arriving_port_date"));
						time1.setbills_alert_date(rs1.getDate("bills_alert_date"));
						time1.setswitch_bill_date(rs1.getDate("switch_bill_date"));
						time1.setpaytime(rs1.getDate("paytime"));
						list.add(time1);
						//System.out.println("haha "+rs1.getDate("time_ship_flight"));
					}
					rs1.close();
					ps1.close();
					conn1.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public boolean select_time(String Contract_id)//查询是否存在Contract_id
	{
		Connection conn = null;
		Statement ps = null;
		ResultSet rs=null;
		conn = db_getConnection();
		String s="select * from Time where Contract_id='"+Contract_id+"'";
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
	
	//更新一个属性值
	public boolean updateproperty(String Contract_id, String name, Date timey)
	{
		Connection conn = null;
		Statement ps = null;
		conn = db_getConnection();
		String s1="update Time set "+name+"='"+timey+"' where Contract_id='"+Contract_id.trim()+"'";
		try {
			ps = conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		String s2 = "select "+name+" from Time where Contract_id='"+Contract_id.trim()+"'";
		Statement ps1 = null;
		ResultSet rs1 = null;
	    try{
	    	ps1=conn.createStatement();
	    	rs1=ps1.executeQuery(s2);
	    	if(rs1.next()){
	    		rs1.close();
		    	ps1.close();
		    	conn.close();
	    			return true;
	    		
	    	}else
	    	{	
	    	rs1.close();
	    	ps1.close();
	    	conn.close();
	    	return false;}
	    }catch (SQLException e) {
			System.out.println(e);
			return false;
		}
	}

	//获取报关提醒日期   报关单提醒日期=到港日期-7
public java.sql.Date getbills_alert_date(Date arriving_port_date){
	Date bills_alert_date = null;
	Calendar time=Calendar.getInstance();
	time.setTime(arriving_port_date);
	
	System.out.println(time.YEAR);
	System.out.println(time.MONTH);
	System.out.println(time.DAY_OF_MONTH);
	switch(time.MONTH+1){
	case 12:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
		if(time.DAY_OF_MONTH > 7)
		{
			time.add(time.DAY_OF_MONTH, -7);
		}
		else
		{
			time.add(time.DAY_OF_MONTH, -7+31);
			time.add(time.MONTH, -1);	
		}
		bills_alert_date = time.getTime();
		break;
	case 4:
	case 6:
	case 9:
	case 11:
		if(time.DAY_OF_MONTH > 7)
		{
			time.add(time.DAY_OF_MONTH, -7);
		}
		else
		{
			time.add(time.DAY_OF_MONTH, -7+30);
			time.add(time.MONTH, -1);	
		}
		bills_alert_date = time.getTime();
		break;
	case 2:
		
		if(time.YEAR%4==0&&time.YEAR%100!=0||time.YEAR%400==0)
		{//闰年28天
			if(time.DAY_OF_MONTH > 7)
			{
				time.add(time.DAY_OF_MONTH, -7);
			}
			else
			{
				time.add(time.DAY_OF_MONTH, -7+28);
				time.add(time.MONTH, -1);	
			}
			
		}
		else
		{
			//29天
			if(time.DAY_OF_MONTH > 7)
			{
				time.add(time.DAY_OF_MONTH, -7);
			}
			else
			{
				time.add(time.DAY_OF_MONTH, -7+29);
				time.add(time.MONTH, -1);	
			}
		}
		bills_alert_date = time.getTime();
		break;
	case 1:
		if(time.DAY_OF_MONTH > 7)
		{
			time.add(time.DAY_OF_MONTH, -7);
		}
		else
		{
			time.add(time.DAY_OF_MONTH, -7+31);
			time.add(time.MONTH, +11);
			time.add(time.YEAR, -1);
			
		}
		bills_alert_date = time.getTime();
		break;
	default:
		break;
	
	}
	java.sql.Date bills_alert_date1 = new java.sql.Date(bills_alert_date.getTime());;
	
	//System.out.println(bills_alert_date1);
	return bills_alert_date1;
}
	
	
//switch_bill_date;//换单日期（到港日期+1）
public java.sql.Date getswitch_bill_date(Date arriving_port_date){
	Date switch_bill_date = null;
	Calendar time=Calendar.getInstance();
	time.setTime(arriving_port_date);
	switch(time.MONTH){
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
		if(time.DAY_OF_MONTH <= 30)
		{
			time.add(time.DAY_OF_MONTH, 1);
		}
		else
		{
			time.add(time.DAY_OF_MONTH, 1-31);
			time.add(time.MONTH, 1);	
		}
		switch_bill_date = time.getTime();
		break;
	case 4:
	case 6:
	case 9:
	case 11:
		if(time.DAY_OF_MONTH <= 29)
		{
			time.add(time.DAY_OF_MONTH, 1);
		}
		else
		{
			time.add(time.DAY_OF_MONTH, 1-30);
			time.add(time.MONTH, 1);	
		}
		switch_bill_date = time.getTime();
		break;
	case 2:
		if(time.YEAR%4==0&&time.YEAR%100!=0||time.YEAR%400==0)
		{//闰年28天
			if(time.DAY_OF_MONTH <= 27)
			{
				time.add(time.DAY_OF_MONTH, 1);
			}
			else
			{
				time.add(time.DAY_OF_MONTH, 1-28);
				time.add(time.MONTH, 1);	
			}
			
		}
		else
		{
			//29天
			if(time.DAY_OF_MONTH <= 28)
			{
				time.add(time.DAY_OF_MONTH, 1);
			}
			else
			{
				time.add(time.DAY_OF_MONTH, 1-29);
				time.add(time.MONTH, 1);	
			}
		}
		switch_bill_date = time.getTime();
		break;
	case 12:
		if(time.DAY_OF_MONTH <= 30)
		{
			time.add(time.DAY_OF_MONTH, 1);
		}
		else
		{
			time.add(time.DAY_OF_MONTH, 1-31);
			time.add(time.MONTH, -11);
			time.add(time.YEAR, 1);
			
		}
		switch_bill_date = time.getTime();
		break;
	default:
		break;
	
	}
java.sql.Date switch_bill_date1 = new java.sql.Date(switch_bill_date.getTime());;
	
	//System.out.println(switch_bill_date1);
	
	return switch_bill_date1;
}



//更新到港日期
	public boolean updatedaogang(String Contract_id, String name, Date timey){
		Date arriving_port_date=timey;		
		
		Date bills_alert_date=getbills_alert_date(arriving_port_date);
		Date switch_bill_date=getswitch_bill_date(arriving_port_date);
		
		
		System.out.println(bills_alert_date);
		System.out.println(switch_bill_date);
		System.out.println(arriving_port_date);
		if(updateproperty(Contract_id,name,arriving_port_date)==true && updateproperty(Contract_id,"bills_alert_date",bills_alert_date)==true && updateproperty(Contract_id,"switch_bill_date",switch_bill_date)==true)
		{
			return true;
		}
		else
		{
			return false;
		}
			
	}

	
	//关闭合同
	public boolean closecontract(String Contract_id){
		Connection conn = null;
		Statement ps = null;
		conn = db_getConnection();
		String s1="update Contract set state='close' where Contract_id='"+Contract_id.trim()+"'";
		try {
			ps = conn.createStatement();
			ps.executeUpdate(s1);
			ps.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		String s2 = "select * from Contract where Contract_id='"+Contract_id.trim()+"' and state = 'close'";
		Statement ps1 = null;
		ResultSet rs1 = null;
	    try{
	    	ps1=conn.createStatement();
	    	rs1=ps1.executeQuery(s2);
	    	//System.out.println(rs1.getString("state"));
	    	if(rs1.next()){
	    	
	    		rs1.close();
		    	ps1.close();
		    	conn.close();
	    			return true;
	    		
	    	}else
	    	{	
	    	rs1.close();
	    	ps1.close();
	    	conn.close();
	    	return false;}
	    }catch (SQLException e) {
			System.out.println(e);
			System.out.println("exption");
			return false;
		}
		
	}
}
