package model.profile;

public class Profile {
	private int profileId;
	private double profileLeft;
	private double profileRight;
	private String profilePrescription;
	private String profileAstigmatism;
	private int custId;
	
	public Profile() {
		
	}

	public Profile(int profileId, double profileLeft, double profileRight, String profilePrescription, String profileAstigmatism, int custId) {
		this.profileId = profileId;
		this.profileLeft = profileLeft;
		this.profileRight = profileRight;
		this.profilePrescription = profilePrescription;
		this.profileAstigmatism = profileAstigmatism;
		this.custId = custId;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public double getProfileLeft() {
		return profileLeft;
	}

	public void setProfileLeft(double profileLeft) {
		this.profileLeft = profileLeft;
	}

	public double getProfileRight() {
		return profileRight;
	}

	public void setProfileRight(double profileRight) {
		this.profileRight = profileRight;
	}

	public String getProfilePrescription() {
		return profilePrescription;
	}

	public void setProfilePrescription(String profilePrescription) {
		this.profilePrescription = profilePrescription;
	}

	public String getProfileAstigmatism() {
		return profileAstigmatism;
	}

	public void setProfileAstigmatism(String profileAstigmatism) {
		this.profileAstigmatism = profileAstigmatism;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}	
}