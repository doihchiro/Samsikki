package com.ezen.samsikki.dao;

import java.util.List;

import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;

public interface MemberDAO {

	// 회원가입
	public void signup(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;

	// 마이페이지(orderList)
	public List<OrderVO> orderList(OrderVO order) throws Exception;

	// 주문취소
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송 상태
	public void delivery(OrderVO order) throws Exception;

	// 마이페이지(memberList)
	public List<MemberVO> memberList(MemberVO member) throws Exception;

	// QnA
	public List<BoardVO> gdsQnA(BoardVO board) throws Exception;

	// 프로필 정보수정
	public void profileUpdate(MemberVO member) throws Exception;

	// 회원가입 이메일 중복검사
	public int idCheck(MemberVO member) throws Exception;

	// 회원탈퇴
	public void delete(String userId) throws Exception;

} // end plublic interface MemberDAO
