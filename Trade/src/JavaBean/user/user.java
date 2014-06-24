package JavaBean.user;

public class user {
	private String username;
	private String password;
	private String role;
	private int id;
	
	public String getUsername(){
		return username;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public int getID(){
		return id;
	}
	public void setID(int id){
		this.id=id;
	}
	public String getPassword(){
		return password;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getrole(){
		return role;
	}
	public void setrole(String role){
		this.role=role;
	}

}
