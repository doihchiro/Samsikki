package com.ezen.samsikki.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.samsikki.dao.AdminDAO;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.CriteriaVO;
import com.ezen.samsikki.vo.GoodsVO;
import com.ezen.samsikki.vo.GoodsViewVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;
import com.ezen.samsikki.vo.ReplyListVO;
import com.ezen.samsikki.vo.SearchCriteria;

@Service
public class AdminSericeImpl implements AdminService {

	@Inject
	private AdminDAO dao;

	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);
	}

	// 상품 목록 (페이징, 검색)
	@Override
	public List<GoodsViewVO> goodsListPaging(CriteriaVO cri) throws Exception {
		return dao.goodsListPaging(cri);
	}

	// 상품 목록 개수
	@Override
	public int getCount() throws Exception {
		return dao.getCount();
	}

	// 상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	// 상품수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}

	// 상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}

	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}

	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		dao.deleteReply(repNum);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
	}

	// 상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		dao.changeStock(goods);
	}

	// 배송 완료 주문 삭제
	@Override
	public void deleteOrder(String orderId) throws Exception {
		dao.deleteOrder(orderId);
	}

	// 공지사항
	@Override
	public void noticeWrite(BoardVO boardVO) throws Exception {
		dao.noticeWrite(boardVO);
	}

	// 공지사항 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	// 공지사항 상세보기
	@Override
	public BoardVO noticeView(int brdNum) throws Exception {
		return dao.noticeView(brdNum);
	}

	// 게시물 수정
	@Override
	public void noticeUpdate(BoardVO board) throws Exception {
		dao.noticeUpdate(board);
	}

	// 게시물 삭제
	@Override
	public void noticeDelete(int brdNum) throws Exception {
		dao.noticeDelete(brdNum);
	}

	// 회원 목록
	@Override
	public List<MemberVO> memberList(MemberVO member) throws Exception {
		return dao.memberList(member);
	}

	// 회원 목록
	@Override
	public List<MemberVO> deleteMemberList(MemberVO member) throws Exception {
		return dao.deleteMemberList(member);
	}

	@Override
	public void memberDelete(String userId) throws Exception {
		dao.memberDelete(userId);
	}

} // end public class AdminServiceImpl
