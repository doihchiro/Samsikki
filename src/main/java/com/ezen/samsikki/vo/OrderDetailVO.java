package com.ezen.samsikki.vo;

import lombok.Data;

@Data
public class OrderDetailVO {

	private int orderDetailsNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;
	private int gdsRate;

} // end public class OrderDetailVO
