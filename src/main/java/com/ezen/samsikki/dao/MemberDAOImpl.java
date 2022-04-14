package com.ezen.samsikki.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.ezen.samsikki.mappers.memberMapper";

	// 회원 가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
	}

	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}

	// 마이페이지(orderList)
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {

		return sql.selectList(namespace + ".orderList", order);
	}

	// 주문 취소
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);
	}

	@Override
	public List<MemberVO> memberList(MemberVO member) throws Exception {

		return sql.selectList(namespace + ".memberList", member);
	}

	// QnA
	@Override
	public List<BoardVO> gdsQnA(BoardVO board) throws Exception {

		return sql.selectList(namespace + ".gdsQnA", board);
	}

	// 프로필 정보수정
	@Override
	public void profileUpdate(MemberVO member) throws Exception {

		sql.update(namespace + ".profileUpdate", member);
	}

	// 회원가입시 이메일 검사
	@Override
	public int idCheck(MemberVO member) throws Exception {

		return sql.selectOne(namespace + ".emalCheck", member);
	}

	// 회원탈퇴
	@Override
	public void delete(String userId) throws Exception {
		sql.update(namespace + ".deleteUserId", userId);

	}

}// end public class MemberDAOImpl
