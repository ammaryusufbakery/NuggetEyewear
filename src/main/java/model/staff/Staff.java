package model.staff;

public class Staff {
	private int staffId;
	private String staffName;
	private String staffPhone;
	private String staffEmail;
	private String staffPass;
	private String staffRole;
	private int managerId;
	
	public Staff() {
		
	}

	public Staff(int staffId, String staffName, String staffPhone, String staffEmail, String staffPass, String staffRole, int managerId) {
		this.staffId = staffId;
		this.staffName = staffName;
		this.staffPhone = staffPhone;
		this.staffEmail = staffEmail;
		this.staffPass = staffPass;
		this.staffRole = staffRole;
		this.managerId = managerId;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getStaffPhone() {
		return staffPhone;
	}

	public void setStaffPhone(String staffPhone) {
		this.staffPhone = staffPhone;
	}

	public String getStaffEmail() {
		return staffEmail;
	}

	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}

	public String getStaffPass() {
		return staffPass;
	}

	public void setStaffPass(String staffPass) {
		this.staffPass = staffPass;
	}

	public String getStaffRole() {
		return staffRole;
	}

	public void setStaffRole(String staffRole) {
		this.staffRole = staffRole;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}	
}