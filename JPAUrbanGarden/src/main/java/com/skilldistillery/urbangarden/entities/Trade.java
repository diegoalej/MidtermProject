package com.skilldistillery.urbangarden.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Trade {
	
	// f i e l d s
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="trade_date")
	private LocalDateTime tradeDate;
	@OneToOne
	@JoinColumn(name="offer_id")
	private Offer offer;
	@Column(name="rating_by_buyer")
	private Integer buyerRating;
	@Column(name="rating_by_seller")
	private Integer sellerRating;
	@Column(name="comment_by_buyer")
	private String buyerComment;
	@Column(name="comment_by_seller")
	private String sellerComment;
	
	// m e t h o d s 
	
	public Trade() {}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public LocalDateTime getTradeDate() {
		return tradeDate;
	}


	public void setTradeDate(LocalDateTime tradeDate) {
		this.tradeDate = tradeDate;
	}


	public Offer getOffer() {
		return offer;
	}


	public void setOffer(Offer offer) {
		this.offer = offer;
	}


	public Integer getBuyerRating() {
		return buyerRating;
	}


	public void setBuyerRating(Integer buyerRating) {
		this.buyerRating = buyerRating;
	}


	public Integer getSellerRating() {
		return sellerRating;
	}


	public void setSellerRating(Integer sellerRating) {
		this.sellerRating = sellerRating;
	}


	public String getBuyerComment() {
		return buyerComment;
	}


	public void setBuyerComment(String buyerComment) {
		this.buyerComment = buyerComment;
	}


	public String getSellerComment() {
		return sellerComment;
	}


	public void setSellerComment(String sellerComment) {
		this.sellerComment = sellerComment;
	}


	@Override
	public String toString() {
		return "Trade [id=" + id + ", tradeDate=" + tradeDate + ", offer=" + offer + ", buyerRating=" + buyerRating
				+ ", sellerRating=" + sellerRating + ", buyerComment=" + buyerComment + ", sellerComment="
				+ sellerComment + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((buyerComment == null) ? 0 : buyerComment.hashCode());
		result = prime * result + ((buyerRating == null) ? 0 : buyerRating.hashCode());
		result = prime * result + id;
		result = prime * result + ((offer == null) ? 0 : offer.hashCode());
		result = prime * result + ((sellerComment == null) ? 0 : sellerComment.hashCode());
		result = prime * result + ((sellerRating == null) ? 0 : sellerRating.hashCode());
		result = prime * result + ((tradeDate == null) ? 0 : tradeDate.hashCode());
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
		Trade other = (Trade) obj;
		if (buyerComment == null) {
			if (other.buyerComment != null)
				return false;
		} else if (!buyerComment.equals(other.buyerComment))
			return false;
		if (buyerRating == null) {
			if (other.buyerRating != null)
				return false;
		} else if (!buyerRating.equals(other.buyerRating))
			return false;
		if (id != other.id)
			return false;
		if (offer == null) {
			if (other.offer != null)
				return false;
		} else if (!offer.equals(other.offer))
			return false;
		if (sellerComment == null) {
			if (other.sellerComment != null)
				return false;
		} else if (!sellerComment.equals(other.sellerComment))
			return false;
		if (sellerRating == null) {
			if (other.sellerRating != null)
				return false;
		} else if (!sellerRating.equals(other.sellerRating))
			return false;
		if (tradeDate == null) {
			if (other.tradeDate != null)
				return false;
		} else if (!tradeDate.equals(other.tradeDate))
			return false;
		return true;
	}

	
	


	
}
