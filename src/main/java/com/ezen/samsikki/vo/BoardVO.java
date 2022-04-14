package com.ezen.samsikki.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {

	private int brdNum;
	private String brd_Title;
	private String brd_Content;
	private String userId;
	private Timestamp repDate;
	private int viewCnt;
	private String userName;
	private int secret;
	private int brd_type;
	private int gdsNum;
	private int verify;

} // end public class BoardVO
