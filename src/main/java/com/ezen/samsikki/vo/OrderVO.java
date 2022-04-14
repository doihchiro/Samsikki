package com.ezen.samsikki.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private String amount;
	private Date orderDate;
	private int gdsRate;

	private String delivery;

	private int account;

} // end public class OrderVO
