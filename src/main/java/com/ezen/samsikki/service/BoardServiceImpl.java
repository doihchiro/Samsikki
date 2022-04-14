package com.ezen.samsikki.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.samsikki.dao.BoardDAO;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

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

	// QnA 작성
	@Override
	public void QnAWrite(BoardVO boardVO) throws Exception {
		dao.QnAWrite(boardVO);
	}

	// QnA 목록
	@Override
	public List<BoardVO> QnAlist(SearchCriteria scri) throws Exception {
		return dao.QnAlist(scri);
	}

} // end public class BoardServiceImpl
