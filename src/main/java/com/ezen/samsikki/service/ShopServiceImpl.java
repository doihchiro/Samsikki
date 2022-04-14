package com.ezen.samsikki.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.samsikki.dao.ShopDAO;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.CartListVO;
import com.ezen.samsikki.vo.CartVO;
import com.ezen.samsikki.vo.CriteriaVO;
import com.ezen.samsikki.vo.GoodsViewVO;
import com.ezen.samsikki.vo.OrderDetailVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;
import com.ezen.samsikki.vo.QnAReplyListVO;
import com.ezen.samsikki.vo.QnAReplyVO;
import com.ezen.samsikki.vo.ReplyListVO;
import com.ezen.samsikki.vo.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;

	// 카테고리별 상품 리스트 (페이징, 검색)
	@Override
	public List<GoodsViewVO> list(CriteriaVO cri) throws Exception {
		return dao.list(cri);
	}

	// 카테고리별 상품 리스트 (100, 페이징, 검색)
	@Override
	public List<GoodsViewVO> list1(CriteriaVO cri) throws Exception {
		return dao.list1(cri);
	}

	// 카테고리별 상품 리스트 (200, 페이징, 검색)
	@Override
	public List<GoodsViewVO> list2(CriteriaVO cri) throws Exception {
		return dao.list2(cri);
	}

	// 카테고리별 상품 리스트 (300, 페이징, 검색)
	@Override
	public List<GoodsViewVO> list3(CriteriaVO cri) throws Exception {
		return dao.list3(cri);
	}

	// 카테고리별 상품 리스트 (sale, 페이징, 검색)
	@Override
	public List<GoodsViewVO> saleList(CriteriaVO cri) throws Exception {
		return dao.saleList(cri);
	}

	// 상품 리스트 개수
	@Override
	public int listCount(CriteriaVO cri) throws Exception {
		return dao.listCount(cri);
	}

	// 상품 리스트 개수 (100)
	@Override
	public int listCount1(CriteriaVO cri) throws Exception {
		return dao.listCount1(cri);
	}

	// 상품 리스트 개수 (200)
	@Override
	public int listCount2(CriteriaVO cri) throws Exception {
		return dao.listCount2(cri);
	}

	// 상품 리스트 개수 (300)
	@Override
	public int listCount3(CriteriaVO cri) throws Exception {
		return dao.listCount3(cri);
	}

	// 상품 리스트 개수 (sale)
	@Override
	public int saleListCount(CriteriaVO cri) throws Exception {
		return dao.saleListCount(cri);
	}

	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}

	// 상품 소감(댓글) 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}

	// 상품 소감(댓글) 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return dao.replyList(gdsNum);
	}

	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}

	// 상품 소감(댓글) 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}

	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// QnA
	@Override
	public List<BoardVO> gdsQnA(BoardVO board) throws Exception {
		return dao.gdsQnA(board);
	}

	// QnA 상세보기
	@Override
	public BoardVO QnAView(int brdNum) throws Exception {
		return dao.QnAView(brdNum);
	}

	// 비밀글
	@Override
	public String secret(int brdNum) throws Exception {
		return dao.secret(brdNum);
	}

	// 게시글 수정
	@Override
	public void QnAUpdate(BoardVO board) throws Exception {
		dao.QnAUpdate(board);
	}

	// 게시글 삭제
	@Override
	public void QnADelete(int brdNum) throws Exception {
		dao.QnADelete(brdNum);
	}

	// QnA 댓글
	@Override
	public void QnAregistReply(QnAReplyVO QnAreply) throws Exception {
		dao.QnAregistReply(QnAreply);
	}

	// QnA 댓글리스트
	@Override
	public List<QnAReplyListVO> QnAreplyList(int brdNum) throws Exception {
		return dao.QnAreplyList(brdNum);
	}

	// QnA 댓글 삭제
	@Override
	public void QnAdeleteReply(QnAReplyVO QnAreply) throws Exception {
		dao.QnADeleteReply(QnAreply);
	}

	// QnA 아이디 체크
	@Override
	public String QnAidCheck(int repNum) throws Exception {
		return dao.QnAidCheck(repNum);
	}

	// QnA 댓글 수정
	@Override
	public void QnAModifyReply(QnAReplyVO QnAreply) throws Exception {
		dao.QnAModifyReply(QnAreply);
	}

} // end public class ShopServiceImpl
