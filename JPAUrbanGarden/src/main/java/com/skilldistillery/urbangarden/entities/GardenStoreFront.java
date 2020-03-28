package com.skilldistillery.urbangarden.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="garden_store_front")
public class GardenStoreFront {
	
	//
	//Fields begin
	//
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private double size;
	
	private boolean organic;
	
	@Column(name = "name_of_garden")
	private String nameOfGarden;
	
	//THIS IS S FOREIGN KEY AND NEEDS TO BE MAPPED
	@Column(name = "user_id")
	private int userId;
	
	private String description;
	
	//THIS IS A FOREIGN KEY AND NEEDS TO BE MAPPED
	@Column(name = "fk_garden_address_id")
	private Integer gardenAddressId;
	
	@Column(name = "garden_url")
	private String gardenURL;
	
	@OneToOne
	private Address address;
	
	@OneToOne
	private User user;
	
	@OneToMany(mappedBy = "garden")
	private List<GardenProduce> gardenProduces;
	
	//
	//Methods begin
	//
	
	public GardenStoreFront() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getSize() {
		return size;
	}

	public void setSize(double size) {
		this.size = size;
	}

	public boolean isOrganic() {
		return organic;
	}

	public void setOrganic(boolean organic) {
		this.organic = organic;
	}

	public String getNameOfGarden() {
		return nameOfGarden;
	}

	public void setNameOfGarden(String nameOfGarden) {
		this.nameOfGarden = nameOfGarden;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getGardenAddressId() {
		return gardenAddressId;
	}

	public void setGardenAddressId(Integer gardenAddressId) {
		this.gardenAddressId = gardenAddressId;
	}

	public String getGardenURL() {
		return gardenURL;
	}

	public void setGardenURL(String gardenURL) {
		this.gardenURL = gardenURL;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<GardenProduce> getGardenProduce() {
		return gardenProduces;
	}

	public void setGardenProduce(List<GardenProduce> gardenProduces) {
		this.gardenProduces = gardenProduces;
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
			gp.setGardenStoreFront(this);
		}
	}
	public void removeGardenProduce(GardenProduce gp) {
		gp.setGardenStoreFront(null);
		if (gardenProduces != null) {
			gardenProduces.remove(gp);
		}
	}

	@Override
	public String toString() {
		return "GardenStoreFront [id=" + id + ", size=" + size + ", organic=" + organic + ", nameOfGarden="
				+ nameOfGarden + ", userId=" + userId + ", description=" + description + ", gardenAddressId="
				+ gardenAddressId + ", gardenURL=" + gardenURL + ", address=" + address + ", user=" + user + "]";
	}
	
	

}
