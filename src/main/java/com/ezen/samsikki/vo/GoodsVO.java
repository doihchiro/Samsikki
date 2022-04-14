package com.ezen.samsikki.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {

	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private String cateName;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private Date gdsDate;
	private int gdsRate;
	private String gdsThumbImg;

} // end public class GoodsVO
