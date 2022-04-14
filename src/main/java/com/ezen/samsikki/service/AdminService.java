package com.ezen.samsikki.service;

import java.util.List;

import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.CriteriaVO;
import com.ezen.samsikki.vo.GoodsVO;
import com.ezen.samsikki.vo.GoodsViewVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;
import com.ezen.samsikki.vo.ReplyListVO;
import com.ezen.samsikki.vo.SearchCriteria;

public interface AdminService {

	// 상품등록
	public void register(GoodsVO vo) throws Exception;

	// 상품 목록 (페이징, 검색)
	public List<GoodsViewVO> goodsListPaging(CriteriaVO cri) throws Exception;

	// 상품 목록 개수
	public int getCount() throws Exception;

	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	// 상품수정
	public void goodsModify(GoodsVO vo) throws Exception;

	// 상품삭제
	public void goodsDelete(int gdsNum) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList() throws Exception;

	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송 상태
	public void delivery(OrderVO order) throws Exception;

	// 상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;

	// 모든 소감(댓글)
	public List<ReplyListVO> allReply() throws Exception;

	// 소감(댓글) 삭제
	public void deleteReply(int repNum) throws Exception;

	// 배송 완료 주문 삭제
	public void deleteOrder(String orderId) throws Exception;

	// 공지사항
	public void noticeWrite(BoardVO boardVO) throws Exception;

	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 공지사항 상세보기
	public BoardVO noticeView(int brdNum) throws Exception;

	// 게시물 수정
	public void noticeUpdate(BoardVO board) throws Exception;

	// 게시물 삭제
	public void noticeDelete(int brdNum) throws Exception;

	// 유저목록
	public List<MemberVO> memberList(MemberVO member) throws Exception;

	// 탈퇴회원목록
	public List<MemberVO> deleteMemberList(MemberVO member) throws Exception;

	// 탈퇴회원삭제
	public void memberDelete(String userId) throws Exception;

} // end public interface AdminService
