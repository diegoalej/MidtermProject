package com.skilldistillery.urbangarden.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "garden_store_front")
public class GardenStoreFront {

	//
	// Fields begin
	//

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private double size;

	private boolean organic;

	@Column(name = "name_of_garden")
	private String nameOfGarden;

	// THIS IS S FOREIGN KEY AND NEEDS TO BE MAPPED
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;

	private boolean active;

	private String description;

	// THIS IS A FOREIGN KEY AND NEEDS TO BE MAPPED
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_garden_address_id")
	private Address address;

	@Column(name = "garden_url")
	private String gardenURL;

	@OneToMany(mappedBy = "garden")
	private List<GardenProduce> gardenProduces;

	//
	// Methods begin
	//

	public GardenStoreFront() {
	}

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

	public boolean getOrganic() {
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public List<GardenProduce> getGardenProduces() {
		return gardenProduces;
	}

	public void setGardenProduces(List<GardenProduce> gardenProduces) {
		this.gardenProduces = gardenProduces;
	}

	public void addGardenProduce(GardenProduce gp) {
		if (gardenProduces == null) {
			gardenProduces = new ArrayList<GardenProduce>();
		}
		if (!gardenProduces.contains(gp)) {
			gardenProduces.add(gp);
			if (gp.getGardenStoreFront() != null) {
				gp.getGardenStoreFront().getGardenProduces().remove(gp);
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "GardenStoreFront [id=" + id + ", size=" + size + ", organic=" + organic + ", nameOfGarden="
				+ nameOfGarden + ", user=" + user + ", active=" + active + ", description=" + description + ", address="
				+ address + ", gardenURL=" + gardenURL + "]";
	}

}
