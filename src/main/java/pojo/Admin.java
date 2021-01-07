package pojo;

public class Admin {
	private int admin_id;
	private String admin_account;
	private String admin_password;
	private  int admin_supreme;
	private  int admin_isActive;

	public int getAdmin_supreme() {
		return admin_supreme;
	}

	public int getAdmin_isActive() {
		return admin_isActive;
	}

	public void setAdmin_isActive(int admin_isActive) {
		this.admin_isActive = admin_isActive;
	}

	public void setAdmin_supreme(int admin_supreme) {
		this.admin_supreme = admin_supreme;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_account() {
		return admin_account;
	}

	public void setAdmin_account(String admin_account) {
		this.admin_account = admin_account;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
}
