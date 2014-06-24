package JavaBean.cost;

import java.util.Date;

public class cost {
//费用编号，合同ID，费用类型（-预付/-预收/+发生），费用发生地（北京/天津/检疫标签），费用项目名称，金额，备注，费用发生日期
	private String Cost_id;
	private String Contract_id;//��ͬID
	private String Costtype;//�ͻ���˾
	private String Cost_happened;//������
	private String ProjectName;//�ջ���
	private float Money;//֪ͨ��
	private String note;//װ�˸�
	private Date Cost_date;//ж���

    public String getCost_id(){
    	return Cost_id;
    }
    public void setCost_id(String Cost_id){
    	this.Cost_id = Cost_id;
    }
	
	public String getContract_id(){
		return Contract_id;
	}
	public void setContract_id(String Contract_id){
		this.Contract_id=Contract_id;
	}
	public void setCosttype(String Costtype){
		this.Costtype = Costtype;
	}
	public String getCosttype(){
		return Costtype;
	}
	public void setCost_happened(String Cost_happened){
		this.Cost_happened = Cost_happened;
	}
	public String getCost_happened(){
		return Cost_happened;
	}
	public void setProjectName(String ProjectName){
		this.ProjectName = ProjectName;
	}
	public String getProjectName(){
		return ProjectName;
	}
	public void setMoney(float money){
		this.Money = money;
	}
	public float getMoney(){
		return Money;
	}
	public void setnote(String note){
		this.note = note;
	}
	public String getnote(){
		return note;
	}
	public void setCost_date(Date Cost_date){
		this.Cost_date = Cost_date;
	}
	public Date getCost_date(){
		return Cost_date;
	}
}
