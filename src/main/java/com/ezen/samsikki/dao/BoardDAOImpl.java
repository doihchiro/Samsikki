package com.ezen.samsikki.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.ezen.samsikki.mappers.boardMapper";

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

	// 공지사항 상세조회
	@Override
	public BoardVO noticeView(int brdNum) throws Exception {
		return sql.selectOne(namespace + ".noticeView", brdNum);
	}

	// QnA 작성
	@Override
	public void QnAWrite(BoardVO boardVO) throws Exception {
		sql.insert(namespace + ".QnAWirte", boardVO);
	}

	// QnA 목록
	@Override
	public List<BoardVO> QnAlist(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".QnAList", scri);
	}

} // end public class BoardDAOImpl
