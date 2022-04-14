package com.ezen.samsikki.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String userId;
	private String userPass;
	private String userName;
	private String userPhon;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private Date regDate;
	private int verify;
	private int birth;
	private String realName;

} // end public class MemberVO
