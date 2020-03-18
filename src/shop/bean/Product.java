package shop.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "Products")
public class Product {
	@Id
	@Column(name = "productCode")
	private int productId;
	@Column(name = "productName")
	private String productName;
	@Column(name = "productLine")
	private String productLine;
	@Column(name = "productDescription")
	private String productDescription;
	@Column(name = "quantityInStock")
	private int quantityInStock;
	@Column(name = "buyPrice")
	private float buyPrice;
	
	
	public Product(int productId, String productName, String productLine, String productDescription,
			int quantityInStock, float buyPrice) {
		this.productId = productId;
		this.productName = productName;
		this.productLine = productLine;
		this.productDescription = productDescription;
		this.quantityInStock = quantityInStock;
		this.buyPrice = buyPrice;
	}
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
	public String getProductLine() {
		return productLine;
	}
	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public int getQuantityInStock() {
		return quantityInStock;
	}
	public void setQuantityInStock(int quantityInStock) {
		this.quantityInStock = quantityInStock;
	}
	public float getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(float buyPrice) {
		this.buyPrice = buyPrice;
	}
	
	
}
