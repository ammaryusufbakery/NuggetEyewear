package model.customer;

public class Customer {
	private int custId;
	private String custName;
	private String custPhone;
	private String custEmail;
	private String custPass;
	private String custIc;
	private String custAddress;
	
	public Customer() {
		
	}

	public Customer(int custId, String custName, String custPhone, String custEmail, String custPass, String custIc, String custAddress) {
		this.custId = custId;
		this.custName = custName;
		this.custPhone = custPhone;
		this.custEmail = custEmail;
		this.custPass = custPass;
		this.custIc = custIc;
		this.custAddress = custAddress;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getCustPass() {
		return custPass;
	}

	public void setCustPass(String custPass) {
		this.custPass = custPass;
	}

	public String getCustIc() {
		return custIc;
	}

	public void setCustIc(String custIc) {
		this.custIc = custIc;
	}

	public String getCustAddress() {
		return custAddress;
	}

	public void setCustAddress(String custAddress) {
		this.custAddress = custAddress;
	}
}
