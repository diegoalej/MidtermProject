package com.skilldistillery.urbangarden.entities;

import javax.persistence.*;

@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String type;
	
	private String description;
	
	@Column(name = "size_of_product")
	@Enumerated(EnumType.STRING)
	private SizeOfProduct sizeOfProduct;
	
	@Column(name = "image_url")
	private String imageURL;
	
	//
	//Methods Begin
	//
	public Product() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public SizeOfProduct getSizeOfProduct() {
		return sizeOfProduct;
	}

	public void setSizeOfProduct(SizeOfProduct sizeOfProduct) {
		this.sizeOfProduct = sizeOfProduct;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", type=" + type + ", description=" + description
				+ ", sizeOfProduct=" + sizeOfProduct + ", imageURL=" + imageURL + "]";
	}
	
	

}
