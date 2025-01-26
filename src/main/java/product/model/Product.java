package product.model;

public class Product {
	private int productId;
    private String productName;
    private String productBrand;
    private String frameShape;
    private String frameColor;

    public Product() {
    	
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

    
   
}