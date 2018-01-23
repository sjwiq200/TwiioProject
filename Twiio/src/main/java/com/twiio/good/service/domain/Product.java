package com.twiio.good.service.domain;

import java.sql.Date;
import java.util.Arrays;

public class Product {
	
	private int productNo;
	private String productName;
	private int productPrice;
	private int productType;
	private Date[] tripDate;
	private Date regDate;
	private String country;
	private String city;
	private int hostNo;
	private String description;
	private int tourHeadCount;
	private String targetType="0";
	private int viewCount;
	private int productCount;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public Date[] getTripDate() {
		return tripDate;
	}

	public void setTripDate(Date[] tripDate) {
		this.tripDate = tripDate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTourHeadCount() {
		return tourHeadCount;
	}

	public void setTourHeadCount(int tourHeadCount) {
		this.tourHeadCount = tourHeadCount;
	}

	public String getTargetType() {
		return targetType;
	}

	public void setTargetType(String targetType) {
		this.targetType = targetType;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productType=" + productType + ", tripDate=" + Arrays.toString(tripDate) + ", regDate=" + regDate
				+ ", country=" + country + ", city=" + city + ", hostNo=" + hostNo + ", description=" + description
				+ ", tourHeadCount=" + tourHeadCount + ", targetType=" + targetType + ", viewCount=" + viewCount
				+ ", productCount=" + productCount + "]";
	}

}
