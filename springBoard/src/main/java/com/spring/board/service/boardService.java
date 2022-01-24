package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	// 수정
	public int boardUpdate(BoardVo boardVo) throws Exception;
	
	// 삭제
	public int boardDelete(BoardVo boardVo) throws Exception;

	// BoardType변환을 위한 작업
	public List<ComCodeVo> codeNameList() throws Exception;
	

}
