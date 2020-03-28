package com.skilldistillery.urbangarden.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="garden_produce")
public class GardenProduce {
	
	// f i e l d s
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@Column(name = "garden_id")
	private GardenStoreFront garden;
	
	@ManyToOne
	@Column(name = "product_id")
	private Product product;
	
	private Integer amount;
	
	private Boolean active;
	
	@Column(name = "date_expected_available")
	private LocalDate dateAvailable;
	
	@Column(name = "date_harvested")
	private LocalDate harvested;
	
	@Column(name = "date_expires")
	private LocalDate expires;
	
	@OneToMany(mappedBy = "offered")
	private List<Offer> offeredProduct;
	
	@OneToMany(mappedBy = "desired")
	private List<Offer> requestedProduct;
	
	// m e t h o d s 
	
	public GardenProduce() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public GardenStoreFront getGardenStoreFront() {
		return garden;
	}

	public void setGardenStoreFront(GardenStoreFront garden) {
		this.garden = garden;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public LocalDate getDateAvailable() {
		return dateAvailable;
	}

	public void setDateAvailable(LocalDate dateAvailable) {
		this.dateAvailable = dateAvailable;
	}

	public LocalDate getHarvested() {
		return harvested;
	}

	public void setHarvested(LocalDate harvested) {
		this.harvested = harvested;
	}

	public LocalDate getExpires() {
		return expires;
	}

	public void setExpires(LocalDate expires) {
		this.expires = expires;
	}

	public GardenStoreFront getGarden() {
		return garden;
	}

	public void setGarden(GardenStoreFront garden) {
		this.garden = garden;
	}

	public List<Offer> getOfferedProduct() {
		return offeredProduct;
	}

	public void setOfferedProduct(List<Offer> offeredProduct) {
		this.offeredProduct = offeredProduct;
	}

	public List<Offer> getRequestedProduct() {
		return requestedProduct;
	}

	public void setRequestedProduct(List<Offer> requestedProduct) {
		this.requestedProduct = requestedProduct;
	}

	@Override
	public String toString() {
		return "GardenProduce [id=" + id + ", amount=" + amount + ", active=" + active + ", dateAvailable="
				+ dateAvailable + ", harvested=" + harvested + ", expires=" + expires + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((active == null) ? 0 : active.hashCode());
		result = prime * result + ((amount == null) ? 0 : amount.hashCode());
		result = prime * result + ((dateAvailable == null) ? 0 : dateAvailable.hashCode());
		result = prime * result + ((expires == null) ? 0 : expires.hashCode());
		result = prime * result + ((harvested == null) ? 0 : harvested.hashCode());
		result = prime * result + id;
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
		GardenProduce other = (GardenProduce) obj;
		if (active == null) {
			if (other.active != null)
				return false;
		} else if (!active.equals(other.active))
			return false;
		if (amount == null) {
			if (other.amount != null)
				return false;
		} else if (!amount.equals(other.amount))
			return false;
		if (dateAvailable == null) {
			if (other.dateAvailable != null)
				return false;
		} else if (!dateAvailable.equals(other.dateAvailable))
			return false;
		if (expires == null) {
			if (other.expires != null)
				return false;
		} else if (!expires.equals(other.expires))
			return false;
		if (harvested == null) {
			if (other.harvested != null)
				return false;
		} else if (!harvested.equals(other.harvested))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	public void addProductOffer(Offer offeredGP) {
		if (offeredProduct == null) {
			offeredProduct = new ArrayList<Offer>();
		}
		if (!offeredProduct.contains(offeredGP)) {
			offeredProduct.add(offeredGP);
			if(offeredGP.getOffered() != null) {
				offeredGP.getOffered().getOfferedProduct().remove(offeredGP);
			}
			offeredGP.setOffered(this);
		}
	}
	public void removeGardenProduce(Offer offeredGP) {
		offeredGP.setOffered(null);
		if (offeredProduct != null) {
			offeredProduct.remove(offeredGP);
		}
	}
	
	public void addRequestedOffer(Offer requestedGP) {
		if (requestedProduct == null) {
			requestedProduct = new ArrayList<Offer>();
		}
		if (!requestedProduct.contains(requestedGP)) {
			requestedProduct.add(requestedGP);
			if(requestedGP.getDesired() != null) {
				requestedGP.getDesired().getOfferedProduct().remove(requestedGP);
			}
			requestedGP.setOffered(this);
		}
	}
	
	public void removeRequestedOffer(Offer requestedGP) {
		requestedGP.setDesired(null);
		if (requestedProduct != null) {
			requestedProduct.remove(requestedGP);
		}
	}

}
