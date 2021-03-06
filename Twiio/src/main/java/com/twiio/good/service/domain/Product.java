package com.twiio.good.service.domain;

import java.sql.Date;
import java.util.Arrays;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.springframework.web.multipart.MultipartFile;
@JsonIgnoreProperties(ignoreUnknown=true)
public class Product {
	
	private int productNo;
	private String productName;
	private int productPrice;
	private String productType;
	private String tripDate;//배열
	private Date regDate;
	private String country;
	private String city;
	private int hostNo;
	private String description;
	private int tourHeadCount;
	private String targetType="0";
	private int viewCount;
	private int productCount;
	private String productDelete;
	//썸네일
	private String thumbnail;
	private MultipartFile file;
	//호스트 사진,이름
	private String hostName;
	private String hostImage;
	
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

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getTripDate() {
		return tripDate;
	}

	public void setTripDate(String tripDate) {
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

	public String getProductDelete() {
		return productDelete;
	}

	public void setProductDelete(String productDelete) {
		this.productDelete = productDelete;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getHostImage() {
		return hostImage;
	}

	public void setHostImage(String hostImage) {
		this.hostImage = hostImage;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productType=" + productType + ", tripDate=" + tripDate + ", regDate=" + regDate + ", country="
				+ country + ", city=" + city + ", hostNo=" + hostNo + ", description=" + description
				+ ", tourHeadCount=" + tourHeadCount + ", targetType=" + targetType + ", viewCount=" + viewCount
				+ ", productCount=" + productCount + ", productDelete=" + productDelete + "]";
	}

}
