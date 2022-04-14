package com.ezen.samsikki.service;

import java.util.List;

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

public interface ShopService {

	// 카테고리별 상품 리스트 (페이징, 검색)
	public List<GoodsViewVO> list(CriteriaVO cri) throws Exception;

	// 카테고리별 상품 리스트 (100, 페이징, 검색)
	public List<GoodsViewVO> list1(CriteriaVO cri) throws Exception;

	// 카테고리별 상품 리스트 (200, 페이징, 검색)
	public List<GoodsViewVO> list2(CriteriaVO cri) throws Exception;

	// 카테고리별 상품 리스트 (300, 페이징, 검색)
	public List<GoodsViewVO> list3(CriteriaVO cri) throws Exception;

	// 카테고리별 상품 리스트 (sale, 페이징, 검색)
	public List<GoodsViewVO> saleList(CriteriaVO cri) throws Exception;

	// 상품 리스트 개수
	public int listCount(CriteriaVO cri) throws Exception;

	// 상품 리스트 개수 (100)
	public int listCount1(CriteriaVO cri) throws Exception;

	// 상품 리스트 개수 (200)
	public int listCount2(CriteriaVO cri) throws Exception;

	// 상품 리스트 개수 (300)
	public int listCount3(CriteriaVO cri) throws Exception;

	// 상품 리스트 개수 (sale)
	public int saleListCount(CriteriaVO cri) throws Exception;

	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	// 상품 소감(댓글) 작성
	public void registReply(ReplyVO reply) throws Exception;

	// 상품 소감(댓글) 리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;

	// 상품 소감(댓글) 삭제
	public void deleteReply(ReplyVO reply) throws Exception;

	// 아이디 체크
	public String idCheck(int repNum) throws Exception;

	// 상품 소감(댓글) 수정
	public void modifyReply(ReplyVO reply) throws Exception;

	// 카트 담기
	public void addCart(CartVO cart) throws Exception;

	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;

	// 카트 삭제
	public void deleteCart(CartVO cart) throws Exception;

	// 주문 정보
	public void orderInfo(OrderVO order) throws Exception;

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;

	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// QnA
	public List<BoardVO> gdsQnA(BoardVO board) throws Exception;

	// QnA 상세보기
	public BoardVO QnAView(int BrdNum) throws Exception;

	// 비밀글
	public String secret(int brdNum) throws Exception;

	// 게시물 수정
	public void QnAUpdate(BoardVO board) throws Exception;

	// 게시물 삭제
	public void QnADelete(int brdNum) throws Exception;

	// QnA 댓글
	public void QnAregistReply(QnAReplyVO QnAreply) throws Exception;

	// QnA 리스트
	public List<QnAReplyListVO> QnAreplyList(int brdNum) throws Exception;

	// QnA 댓글 삭제
	public void QnAdeleteReply(QnAReplyVO QnAreply) throws Exception;

	// QnA 아이디체크
	public String QnAidCheck(int repNum) throws Exception;

	// QnA 댓글 수정
	public void QnAModifyReply(QnAReplyVO QnAreply) throws Exception;

}// end public interface ShopService
