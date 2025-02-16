package model.order;

public class Order {
	private int orderId;
	private String shipAddress;
	private String orderStatus;
	private int frameId;
	private int lensId;
	private int custId;
	
	public Order() {
		
	}

	public Order(int orderId, String shipAddress, String orderStatus, int frameId, int lensId, int custId) {
		this.orderId = orderId;
		this.shipAddress = shipAddress;
		this.orderStatus = orderStatus;
		this.frameId = frameId;
		this.lensId = lensId;
		this.custId = custId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getFrameId() {
		return frameId;
	}

	public void setFrameId(int frameId) {
		this.frameId = frameId;
	}

	public int getLensId() {
		return lensId;
	}

	public void setLensId(int lensId) {
		this.lensId = lensId;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}	
}