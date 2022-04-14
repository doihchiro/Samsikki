package com.ezen.samsikki.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.ezen.samsikki.dao.MemberDAO;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	// 회원 가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);
	}

	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}

	// 마이페이지(orderList)
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return dao.orderList(order);
	}

	// 주문 취소
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}

	// 마이페이지(memberList)
	@Override
	public List<MemberVO> memberList(MemberVO member) throws Exception {
		return dao.memberList(member);
	}

	@Override
	public List<BoardVO> gdsQnA(BoardVO board) throws Exception {
		return dao.gdsQnA(board);
	}

	// 프로필 정보수정
	@Override
	public void profileUpdate(MemberVO member) throws Exception {
		dao.profileUpdate(member);
	}

	@Override
	public int idCheck(MemberVO member) throws Exception {

		int result = dao.idCheck(member);
		return result;
	}

	@Override
	public void delete(String userId) throws Exception {
		dao.delete(userId);

	}

} // end public class MemberServicImpl
