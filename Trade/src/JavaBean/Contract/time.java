package JavaBean.Contract;

import java.util.Date;


public class time {
	private String Contract_id;
	private Date time_ship_flight;
	private Date lading_bill_date;
	private Date arriving_port_date;
	private Date bills_alert_date;
	private Date switch_bill_date;
	private Date paytime;
	
	public String getContract_id(){
		return Contract_id;
	}
	public void setContract_id(String Contract_id){
		this.Contract_id=Contract_id;
	}
	public Date gettime_ship_flight(){
		return time_ship_flight;
	}
	public void settime_ship_flight(Date time_ship_flight){
		this.time_ship_flight=time_ship_flight;
	}
	public Date getlading_bill_date(){
		return lading_bill_date;
	}
	public void setlading_bill_date(Date lading_bill_date){
		this.lading_bill_date=lading_bill_date;
	}
	public Date getarriving_port_date(){
		return arriving_port_date;
	}
	public void setarriving_port_date(Date arriving_port_date){
		this.arriving_port_date=arriving_port_date;
	}
	public Date getbills_alert_date(){
		return bills_alert_date;
	}
	public void setbills_alert_date(Date bills_alert_date){
		this.bills_alert_date=bills_alert_date;
	}
	public Date getswitch_bill_date(){
		return switch_bill_date;
	}
	public void setswitch_bill_date(Date switch_bill_date){
		this.switch_bill_date=switch_bill_date;
	}
	public Date getpaytime(){
		return paytime;
	}
	public void setpaytime(Date paytime){
		this.paytime = paytime;
	}
	
}
