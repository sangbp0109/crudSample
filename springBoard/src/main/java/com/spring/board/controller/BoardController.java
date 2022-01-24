package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;

	private com.spring.board.service.boardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(HttpServletRequest request, Locale locale, Model model,PageVo pageVo) throws Exception{
		// request 영역에서 codeId 배열주소 꺼내서 String 배열 변수를 선언
		String[] codeId = request.getParameterValues("codeId");
		if (codeId != null) {
			for (int i=0; i<codeId.length; i++) {
				System.out.println("String[] codeId : " + codeId[i].toString());
			}
		}

		System.out.println(Arrays.toString(codeId));
		
		// List 선언
		List<ComCodeVo> codeList = new ArrayList<ComCodeVo>();
		List<BoardVo> boardList = new ArrayList<BoardVo>();

		codeList = boardService.codeNameList();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		pageVo.setTotalRecord(totalCnt);
		pageVo.setPaging();
		//pageVo.setCodeId(codeId);
		
		System.out.println(boardList);
		
		model.addAttribute("codeName", codeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageVo", pageVo);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	
	//작성 하러 가기
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET) 
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		List<ComCodeVo> codeList = new ArrayList<ComCodeVo>();
		
		codeList = boardService.codeNameList();
		
		model.addAttribute("codeName", codeList);
		
		
		return "board/boardWrite";
	}
	
	
	
	// 작성 완료
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	/*
	// 수정 화면(실패)
	@RequestMapping(value= "/board/boardUpdate.do", method = RequestMethod.POST)
		public String boardUpdate(BoardVo boardVo) throws Exception{
			logger.info("boardUpdate");
			service.boardUpdate(boardVo);
			
			return "board/boardUpdate";
	}
	*/
	
	/*
	// 수정 완료
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String update(BoardVo boardVo) throws Exception{
		logger.info("boardUpdate");
		
		service.update(boardVo);
		
		return "redirect:/board/list";
	}
	 */
	
	// 수정하기 이동
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.POST)
	public String boardUpdate(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}

	
	/*
	 * 06-17
	// 수정 완료
	@RequestMapping(value = "board/boardUpdate", method = RequestMethod.POST)
	public String update(BoardVo boardVo) throws Exception{
		logger.info("boardUpdate");
		
		service.boardUpdate(boardVo);
		
		return "redirect:/board/list";
	}
	*/
	
	// 수정 완료
	 @RequestMapping(value="/board/boardUpdateAction.do", method= RequestMethod.POST)
	 @ResponseBody
	 public String boardUpdateAction(BoardVo boardVo) throws Exception {
	        System.out.println(boardVo.toString());
	        System.out.println("수정수정수정수정수정수정");
	        //boardService.boardUpdate(boardVo);
	    
			
	        HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			
			int resultCnt = boardService.boardUpdate(boardVo);
			
			result.put("success", (resultCnt > 0)?"Y":"N");
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			
			System.out.println("callbackMsg::"+callbackMsg);
			
			return callbackMsg;
	    }
	
	
	 /*
	 // 삭제하기(페이지이동)
	 @RequestMapping (value = "/board/{boardType}/{boardNum}/boardDelete.do", method = RequestMethod.POST)
	 	 public String boardDelete(Locale locale, Model model
	 			,@PathVariable("boardType")String boardType
				,@PathVariable("boardNum")int boardNum) throws Exception{
		 System.out.println(boardType.toString());
		 System.out.println(boardNum);	
		 System.out.println("삭제삭제삭제삭제삭제");
		 
	        BoardVo boardVo = new BoardVo();
	        boardVo.setBoardType(boardType);
	        boardVo.setBoardNum(boardNum);
	        
	        boardService.boardDelete(boardVo);
	        
			
			model.addAttribute("boardType", boardType);
			model.addAttribute("boardNum", boardNum);
			model.addAttribute("boardVo", boardVo);
			
			return "redirect:/board/boardList.do";
			
	 }
	 */
	 
	 // 삭제하기
	 @RequestMapping (value = "/board/{boardType}/{boardNum}/boardDelete.do", method = RequestMethod.POST)
	 @ResponseBody
	 	 public String boardDelete(Locale locale, Model model
	 			,@PathVariable("boardType")String boardType
				,@PathVariable("boardNum")int boardNum) throws Exception{
		 System.out.println(boardType.toString());
		 System.out.println(boardNum);	
		 System.out.println("삭제삭제삭제삭제삭제");
		 
	        BoardVo boardVo = new BoardVo();
	        boardVo.setBoardType(boardType);
	        boardVo.setBoardNum(boardNum);
	        
	        //boardService.boardDelete(boardVo);
	        
			
	        HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			
			int resultCnt = boardService.boardDelete(boardVo);
			
			
			result.put("success", (resultCnt > 0)?"Y":"N");
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			
			System.out.println("callbackMsg::"+callbackMsg);
			
			return callbackMsg;
			
	 }
	 
	 
	 
	 
			/*
	 @RequestMapping("boardDelete.do")
	 public String boardDelete(@RequestParam String boardType, int boardNum) throws Exception{
		 boardService.boardDelete(boardType, boardNum);
		 return "redirect:/board/boardList.do";
	  */
	 
	 
	 /* 회원가입 페이지 이동 실험
	 @RequestMapping(value = "/user/userJoin.do", method = RequestMethod.GET) //Write - GET
		public String userJoin(Locale locale, Model model) throws Exception{
			
			
			
			return "/user/userJoin";
		}
	 */
	 
	 
}
















