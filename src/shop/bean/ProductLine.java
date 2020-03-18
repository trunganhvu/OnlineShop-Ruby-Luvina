package shop.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Productlines")
public class ProductLine {

	@Id
	@Column(name = "productLineId")
	private int productLineId;
	@Column(name = "productLine")
	private String productLine;
	@Column(name = "textDescription")
	private String textDescription;
	
	public ProductLine(String productLine, String textDescription) {
		super();
		this.productLine = productLine;
		this.textDescription = textDescription;
	}
	public ProductLine(int productLineId, String productLine, String textDescription) {
		super();
		this.productLineId = productLineId;
		this.productLine = productLine;
		this.textDescription = textDescription;
	}
	public ProductLine() {
		
	}
	public int getProductLineId() {
		return productLineId;
	}
	public void setProductLineId(int productLineId) {
		this.productLineId = productLineId;
	}
	public String getProductLine() {
		return productLine;
	}
	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}
	public String getTextDescription() {
		return textDescription;
	}
	public void setTextDescription(String textDescription) {
		this.textDescription = textDescription;
	}
	
}
