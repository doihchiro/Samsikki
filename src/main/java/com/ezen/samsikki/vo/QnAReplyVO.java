package com.ezen.samsikki.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnAReplyVO {

	private int brdNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;

} // end public class QnAReplyVO
