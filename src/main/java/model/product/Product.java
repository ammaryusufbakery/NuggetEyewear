package model.product;

public class Product {
	private int productId;
    private String productName;
    private String productBrand;
    private String frameShape;
    private String frameColor;
    private String lensPrescription;
    private String lensAstigmatism;
    private double productPrice;

    public Product() {
    	
    }
    
    public Product(int productId, String productName, String productBrand, String frameShape, String frameColor, String lensPrescription, String lensAstigmatism, double productPrice) {
		this.productId = productId;
		this.productName = productName;
		this.productBrand = productBrand;
		this.frameShape = frameShape;
		this.frameColor = frameColor;
		this.lensPrescription = lensPrescription;
		this.lensAstigmatism = lensAstigmatism;
		this.productPrice = productPrice;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public String getFrameShape() {
		return frameShape;
	}

	public void setFrameShape(String frameShape) {
		this.frameShape = frameShape;
	}

	public String getFrameColor() {
		return frameColor;
	}

	public void setFrameColor(String frameColor) {
		this.frameColor = frameColor;
	}
	
	public String getLensPrescription() {
		return lensPrescription;
	}
	
	public void setLensPrescription(String lensPrescription) {
		this.lensPrescription = lensPrescription;
	}
	
	public String getLensAstigmatism() {
		return lensAstigmatism;
	}
	
	public void setLensAstigmatism(String lensAstigmatism) {
		this.lensAstigmatism = lensAstigmatism;
	}
	
	public double getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}
}