package com.skilldistillery.urbangarden.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
	@Column(name = "user_id")
	private int userId;
	
	private String description;
	
	@Column(name = "fk_garden_address_id")
	private Integer gardenAddressId;
	
	@Column(name = "garden_url")
	private String gardenURL;
	
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

	@Override
	public String toString() {
		return "GardenStoreFront [id=" + id + ", size=" + size + ", organic=" + organic + ", nameOfGarden="
				+ nameOfGarden + ", userId=" + userId + ", description=" + description + ", gardenAddressId="
				+ gardenAddressId + ", gardenURL=" + gardenURL + "]";
	}
	
	

}
