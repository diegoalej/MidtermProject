package com.skilldistillery.urbangarden.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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
	
	@OneToMany(mappedBy = "product")
	private List<GardenProduce> gardenProduces;
	
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

	public List<GardenProduce> getGardenProduces() {
		return gardenProduces;
	}

	public void setGardenProduces(List<GardenProduce> gardenProduces) {
		this.gardenProduces = gardenProduces;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", type=" + type + ", description=" + description
				+ ", sizeOfProduct=" + sizeOfProduct + ", imageURL=" + imageURL + "]";
	}
	
	public void addGardenProduce(GardenProduce gp) {
		if (gardenProduces == null) {
			gardenProduces = new ArrayList<GardenProduce>();
		}
		if (!gardenProduces.contains(gp)) {
			gardenProduces.add(gp);
			if(gp.getGardenStoreFront() != null) {
				gp.getGardenStoreFront().getGardenProduce().remove(gp);
			}
			gp.setProduct(this);
		}
	}
	public void removeGardenProduce(GardenProduce gp) {
		gp.setGardenStoreFront(null);
		if (gardenProduces != null) {
			gardenProduces.remove(gp);
		}
	}
	
	

}
