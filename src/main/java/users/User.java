package users;

public class User {
	private int user_id;
	private String role;
	private String username;
	private String useremail;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int user_id, String role, String username, String useremail) {
		super();
		this.user_id = user_id;
		this.role = role;
		this.username = username;
		this.useremail = useremail;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
}
