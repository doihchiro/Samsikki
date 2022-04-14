package com.ezen.samsikki.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.CriteriaVO;
import com.ezen.samsikki.vo.GoodsVO;
import com.ezen.samsikki.vo.GoodsViewVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;
import com.ezen.samsikki.vo.ReplyListVO;
import com.ezen.samsikki.vo.SearchCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO {

	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.ezen.samsikki.mappers.adminMapper";

	// 상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}

	// 상품 목록 (페이징, 검색)
	@Override
	public List<GoodsViewVO> goodsListPaging(CriteriaVO cri) throws Exception {
		return sql.selectList(namespace + ".goodsListPaging", cri);
	}

	// 상품 목록 개수
	@Override
	public int getCount() throws Exception {
		return sql.selectOne(namespace + ".getCount");
	}

	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}

	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsModify", vo);
	}

	// 상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}

	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return sql.selectList(namespace + ".allReply");
	}

	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		sql.delete(namespace + ".deleteReply", repNum);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception {
		return sql.selectList(namespace + ".orderList");
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

	// 배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		sql.update(namespace + ".delivery", order);
	}

	// 상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception {
		sql.update(namespace + ".changeStock", goods);
	}

	// 배송 완료 주문 삭제
	@Override
	public void deleteOrder(String orderId) throws Exception {
		sql.delete(namespace + ".deleteOrder", orderId);
	}

	// 공지사항
	@Override
	public void noticeWrite(BoardVO boardVO) throws Exception {
		sql.insert(namespace + ".notice", boardVO);
	}

	// 공지사항 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".noticeList", scri);
	}
	// 게시물 총 갯수

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".listCount", scri);
	}

	// 공지사항 수정view
	@Override
	public BoardVO noticeView(int brdNum) throws Exception {
		return sql.selectOne(namespace + ".noticeView", brdNum);
	}

	// 공지사항 수정
	@Override
	public void noticeUpdate(BoardVO board) throws Exception {
		sql.update(namespace + ".noticeUpdate", board);
	}

	// 공지사항 삭제
	@Override
	public void noticeDelete(int brdNum) throws Exception {
		sql.delete(namespace + ".noticeDelete", brdNum);
	}

	// 유저목록
	@Override
	public List<MemberVO> memberList(MemberVO member) throws Exception {
		return sql.selectList(namespace + ".memberList", member);
	}

	// 탈퇴유저목록
	@Override
	public List<MemberVO> deleteMemberList(MemberVO member) throws Exception {
		return sql.selectList(namespace + ".deleteMemberList", member);
	}

	// 탈퇴회원삭제
	@Override
	public void memberDelete(String userId) throws Exception {
		sql.delete(namespace + ".memberDelete", userId);
	}

} // end public class AdminDAOImpl
