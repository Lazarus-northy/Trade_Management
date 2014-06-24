package JavaBean.Contract;

import java.sql.*;
import java.util.Calendar;
import java.util.Date;
//import java.sql.Date;


public class contract {
	private String Contract_id;//��ͬID
	private String Company_id;//�ͻ���˾
	private String shipper;//������
	private String consignee;//�ջ���
	private String notify;//֪ͨ��
	private String port_of_loading;//װ�˸�
	private String port_of_discharge;//ж���
	private String payment;//���ʽ
	private Date paytime;//付款时间
	private String price_terms;//�۸����
	private String transport_method;
	private Date time_ship_flight;//装船/装机时间
	private String shipment_flight;//����/����
	private String state;
//	private Date lading_bill_date;//得到提单时间=装船+7
//	private Date arriving_port_date;//到港日期
//	private Date bills_alert_date;//报关单提醒日期=到港日期-7
//	private Date switch_bill_date;//换单日期（到港日期+1）
	
	
	
////	public Date getlading_bill_date(){
//		
//		Calendar time=Calendar.getInstance();
//		time.setTime(time_ship_flight);
//		switch(time.MONTH){
//		case 1:
//		case 3:
//		case 5:
//		case 7:
//		case 8:
//		case 10:
//			if(time.DAY_OF_MONTH <= 24)
//			{
//				time.add(time.DAY_OF_MONTH, 7);
//			}
//			else
//			{
//				time.add(time.DAY_OF_MONTH, 7-31);
//				time.add(time.MONTH, 1);	
//			}
//			lading_bill_date = time.getTime();
//			break;
//		case 4:
//		case 6:
//		case 9:
//		case 11:
//			if(time.DAY_OF_MONTH <= 23)
//			{
//				time.add(time.DAY_OF_MONTH, 7);
//			}
//			else
//			{
//				time.add(time.DAY_OF_MONTH, 7-30);
//				time.add(time.MONTH, 1);	
//			}
//			lading_bill_date = time.getTime();
//			break;
//		case 2:
//			if(time.YEAR%4==0&&time.YEAR%100!=0||time.YEAR%400==0)
//			{//闰年28天
//				if(time.DAY_OF_MONTH <= 21)
//				{
//					time.add(time.DAY_OF_MONTH, 7);
//				}
//				else
//				{
//					time.add(time.DAY_OF_MONTH, 7-28);
//					time.add(time.MONTH, 1);	
//				}
//				
//			}
//			else
//			{
//				//29天
//				if(time.DAY_OF_MONTH <= 22)
//				{
//					time.add(time.DAY_OF_MONTH, 7);
//				}
//				else
//				{
//					time.add(time.DAY_OF_MONTH, 7-29);
//					time.add(time.MONTH, 1);	
//				}
//			}
//			lading_bill_date = time.getTime();
//			break;
//		case 12:
//			if(time.DAY_OF_MONTH <= 24)
//			{
//				time.add(time.DAY_OF_MONTH, 7);
//			}
//			else
//			{
//				time.add(time.DAY_OF_MONTH, 7-31);
//				time.add(time.MONTH, -11);
//				time.add(time.YEAR, 1);
//				
//			}
//			lading_bill_date = time.getTime();
//			break;
//		default:
//			break;
//		
//		}
//		return lading_bill_date;
//	}
	
	public String getContract_id(){
		return Contract_id;
	}
	public void setContract_id(String Contract_id){
		this.Contract_id=Contract_id;
	}
	
	public String getCompany_id(){
	    return Company_id;
	}
	public void setCompany_id(String Company_id){
		this.Company_id=Company_id;
	}
	public String getshipper(){
		return shipper;
	}
	public void setshipper(String shipper){
		this.shipper=shipper;
	}
	public String getconsignee(){
		return consignee;
	}
	public void setconsignee(String consignee){
		this.consignee=consignee;
	}
	public String getnotify(){
		return notify;
	}
	public void setnotify(String notify){
		this.notify=notify;
	}
	public String getport_of_loading(){
		return port_of_loading;
	}
	public void setport_of_loading(String port_of_loading){
		this.port_of_loading=port_of_loading;
	}
	public String getport_of_discharge(){
		return port_of_discharge;
	}
	public void setport_of_discharge(String port_of_discharge){
		this.port_of_discharge=port_of_discharge;
	}
	public String getpayment(){
		return payment;
	}
	public void setpayment(String payment){
		this.payment=payment;
	}
	public Date getpaytime(){
		return paytime;
	}
	public void setpaytime(Date paytime){
		this.paytime=paytime;
	}
	public String getprice_terms(){
		return price_terms;
	}
	public void setprice_terms(String price_terms){
		this.price_terms=price_terms;
	}
	public Date gettime_ship_flight(){
		return time_ship_flight;
	}
	public void settime_ship_flight(Date time_ship_flight){
		this.time_ship_flight=time_ship_flight;
	}
	public String getshipment_flight(){
		return shipment_flight;
	}
	public void setshipment_flight(String shipment_flight){
		this.shipment_flight=shipment_flight;
	}
	public String gettransport_method(){
		return transport_method;
	}
	public void settransport_method(String transport_method){
		this.transport_method=transport_method;
	}
	public String getstate(){
		return state;
	}
	public void setstate(String state){
		this.state = state;
	}
	
	
	

}
