package com.ezen.samsikki.service;

import java.util.List;

import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.SearchCriteria;

public interface BoardService {

	// 공지사항 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;

	// 공지사항 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 공지사항 상세보기
	public BoardVO noticeView(int brdNum) throws Exception;

	// QnA 작성
	public void QnAWrite(BoardVO boardVO) throws Exception;

	// QnA 목록
	public List<BoardVO> QnAlist(SearchCriteria scri) throws Exception;

} // end public interface BoardService
