package com.skilldistillery.urbangarden.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Offer {
	
	// f i e l d s
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="offer_date")
	private LocalDateTime offerDate;
	@Column(name="accepted_rejected")
	private Boolean accepeted;
	@ManyToOne
	@JoinColumn(name="garden_produce_id")
	private GardenProduce desired;
	@ManyToOne
	@JoinColumn(name="offered_produce_id")
	private GardenProduce offered;
	private String comment;
	
	// m e t h o d s 
	
	public Offer() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getOfferDate() {
		return offerDate;
	}

	public void setOfferDate(LocalDateTime offerDate) {
		this.offerDate = offerDate;
	}

	public Boolean getAccepeted() {
		return accepeted;
	}

	public void setAccepeted(Boolean accepeted) {
		this.accepeted = accepeted;
	}

	public GardenProduce getDesired() {
		return desired;
	}

	public void setDesired(GardenProduce desired) {
		this.desired = desired;
	}

	public GardenProduce getOffered() {
		return offered;
	}

	public void setOffered(GardenProduce offered) {
		this.offered = offered;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Offer [id=" + id + ", offerDate=" + offerDate + ", accepeted=" + accepeted + ", desired=" + desired
				+ ", offered=" + offered + ", comment=" + comment + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accepeted == null) ? 0 : accepeted.hashCode());
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((desired == null) ? 0 : desired.hashCode());
		result = prime * result + id;
		result = prime * result + ((offerDate == null) ? 0 : offerDate.hashCode());
		result = prime * result + ((offered == null) ? 0 : offered.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Offer other = (Offer) obj;
		if (accepeted == null) {
			if (other.accepeted != null)
				return false;
		} else if (!accepeted.equals(other.accepeted))
			return false;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (desired == null) {
			if (other.desired != null)
				return false;
		} else if (!desired.equals(other.desired))
			return false;
		if (id != other.id)
			return false;
		if (offerDate == null) {
			if (other.offerDate != null)
				return false;
		} else if (!offerDate.equals(other.offerDate))
			return false;
		if (offered == null) {
			if (other.offered != null)
				return false;
		} else if (!offered.equals(other.offered))
			return false;
		return true;
	}

	



	
}
