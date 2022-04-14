package com.ezen.samsikki.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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

@Repository
public class ShopDAOImpl implements ShopDAO {

	private static final Logger logger = LoggerFactory.getLogger(ShopDAOImpl.class);

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.ezen.samsikki.mappers.shopMapper";

	// 카테고리별 상품 리스트 (페이징, 검색)
	@Override
	public List<GoodsViewVO> list(CriteriaVO cri) throws Exception {
		return sql.selectList(namespace + ".list", cri);
	}

	// 카테고리별 상품 리스트 (100, 페이징, 검색)
	@Override
	public List<GoodsViewVO> list1(CriteriaVO cri) throws Exception {
		return sql.selectList(namespace + ".list1", cri);
	}

	// 카테고리별 상품 리스트 (200, 페이징, 검색)
	@Override
	public List<GoodsViewVO> list2(CriteriaVO cri) throws Exception {
		return sql.selectList(namespace + ".list2", cri);
	}

	// 카테고리별 상품 리스트 (300, 페이징, 검색)
	@Override
	public List<GoodsViewVO> list3(CriteriaVO cri) throws Exception {
		return sql.selectList(namespace + ".list3", cri);
	}

	// 카테고리별 상품 리스트 (sale, 페이징, 검색)
	@Override
	public List<GoodsViewVO> saleList(CriteriaVO cri) throws Exception {
		return sql.selectList(namespace + ".saleList", cri);
	}

	// 상품 리스트 개수
	@Override
	public int listCount(CriteriaVO cri) throws Exception {
		return sql.selectOne(namespace + ".listCount", cri);
	}

	// 상품 리스트 개수 (100)
	@Override
	public int listCount1(CriteriaVO cri) throws Exception {
		return sql.selectOne(namespace + ".listCount1", cri);
	}

	// 상품 리스트 개수 (200)
	@Override
	public int listCount2(CriteriaVO cri) throws Exception {
		return sql.selectOne(namespace + ".listCount2", cri);
	}

	// 상품 리스트 개수 (300)
	@Override
	public int listCount3(CriteriaVO cri) throws Exception {
		return sql.selectOne(namespace + ".listCount3", cri);
	}

	// 상품 리스트 개수 (sale)
	@Override
	public int saleListCount(CriteriaVO cri) throws Exception {
		return sql.selectOne(namespace + ".saleListCount", cri);
	}

	// 상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("com.ezen.samsikki.mappers.adminMapper" + ".goodsView", gdsNum);
	}

	// 상품 소감(댓글) 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".registReply", reply);
	}

	// 상품 소감(댓글) 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		return sql.selectList(namespace + ".replyList", gdsNum);
	}

	// 상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
	}

	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}

	// 상품 소감(댓글) 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);
	}

	// 카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}

	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}

	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}

	// QnA
	@Override
	public List<BoardVO> gdsQnA(BoardVO board) throws Exception {
		return sql.selectList(namespace + ".gdsQnA", board);
	}

	// QnA 상세보기
	@Override
	public BoardVO QnAView(int brdNum) throws Exception {
		return sql.selectOne(namespace + ".QnAView", brdNum);
	}

	// 비밀글
	@Override
	public String secret(int brdNum) throws Exception {
		return sql.selectOne(namespace + ".secretUserIdCheck", brdNum);
	}

	// QnA수정
	@Override
	public void QnAUpdate(BoardVO board) throws Exception {
		sql.update(namespace + ".QnAUpdate", board);
	}

	// QnA삭제
	@Override
	public void QnADelete(int brdNum) throws Exception {
		sql.delete(namespace + ".QnADelete", brdNum);
	}

	// QnA 댓글 작성
	@Override
	public void QnAregistReply(QnAReplyVO QnAreply) throws Exception {
		sql.insert(namespace + ".QnAregistReply", QnAreply);
	}

	// QnA댓글 리스트
	@Override
	public List<QnAReplyListVO> QnAreplyList(int brdNum) throws Exception {
		return sql.selectList(namespace + ".QnAReplyList", brdNum);
	}

	// QnA 댓글 삭제
	@Override
	public void QnADeleteReply(QnAReplyVO QnAreply) throws Exception {
		sql.delete(namespace + ".QnAdeleteReply", QnAreply);
	}

	// QnA 댓글 아이디체크
	@Override
	public String QnAidCheck(int repNum) throws Exception {
		return sql.selectOne(namespace + ".QnAreplyuserIdCheck", repNum);
	}

	// QnA댓글 수정
	@Override
	public void QnAModifyReply(QnAReplyVO QnAreply) throws Exception {
		sql.update(namespace + ".QnAmodifyReply", QnAreply);
	}

} // end public class ShopDAOImpl
