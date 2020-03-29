package com.skilldistillery.urbangarden.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String street;
	
	private String street2;
	
	@Column(name = "zip_code")
	private Integer zipCode;
	
	private String city;
	
	private String state;
	
	private String country;
	
	@OneToOne(mappedBy = "user")
	private GardenStoreFront gardenStoreFront;
	
	//
	//Methods Begin
	//
	
	public Address() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getStreet2() {
		return street2;
	}

	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	public Integer getZipCode() {
		return zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}


	public GardenStoreFront getGardenStoreFront() {
		return gardenStoreFront;
	}

	public void setGardenStoreFront(GardenStoreFront gardenStoreFront) {
		this.gardenStoreFront = gardenStoreFront;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", street=" + street + ", street2=" + street2 + ", zipCode=" + zipCode + ", city="
				+ city + ", state=" + state + ", country=" + country + "]";
	}
	
	

}
