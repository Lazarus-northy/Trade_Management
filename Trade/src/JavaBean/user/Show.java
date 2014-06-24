package JavaBean.user;
import javax.swing.JOptionPane;
public class Show {
	public void erroBox(){
		JOptionPane.showMessageDialog(null, "密码错误，请重新输入", "Message", JOptionPane.ERROR_MESSAGE);
	}
	public static void main(String[] args){
		Show a=new Show();
		a.erroBox();
	}

}
