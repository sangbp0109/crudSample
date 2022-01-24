package com.spring.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.common.CommonUtil;
import com.spring.user.service.userService;
import com.spring.user.vo.UserInfoVo;


@Controller
public class UserController {

	
	@Autowired
	userService userService;
	
	private com.spring.user.service.userService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
             
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/user/userJoin.do", method = RequestMethod.GET) //Write - GET
		public String userJoin(Locale locale, Model model) throws Exception{
		 	
		 
			 List<ComCodeVo> phoneList = new ArrayList<ComCodeVo>();
			 
			 phoneList = userService.phoneNumberList();
			 
			 model.addAttribute("phoneList", phoneList);
		 
		 
			 return "/user/userJoin";
	}
	
	// 아이디 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST) //Write - GET
	@ResponseBody
		public Map<String,Object> userIdCheck(HttpServletRequest request) throws Exception{
			 
			String id = request.getParameter("id");
				 
			UserInfoVo userInfoVo = userService.findById(id);
				 
			Map<String,Object> result = new HashedMap();
				 
			if(userInfoVo != null) {
					 result.put("isExist", true);
			} else {
					 result.put("isExist", false);
			}
			 
			return result;
		}
	 
	// 회원가입 완료
	@RequestMapping(value = "/user/userJoinAction.do", method = RequestMethod.POST)
	@ResponseBody
		public String userJoinAction(Locale locale,UserInfoVo userInfoVo) throws Exception{
	 		
			HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			
			int resultCnt = userService.userJoin(userInfoVo);
			
			result.put("success", (resultCnt > 0)?"Y":"N");
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			
			System.out.println("callbackMsg::"+callbackMsg);
			
			return callbackMsg;
		 }
	 	
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/user/userLogin.do", method= {RequestMethod.GET, RequestMethod.POST}) //Write - GET
		public String login(Locale locale, Model model) throws Exception{
			 
			return "/user/userLogin";
		 }
	
	/*
	// 로그인 실행
	@RequestMapping(value = "/user/loginAction.do", method= {RequestMethod.GET, RequestMethod.POST})
		public String userLogin(UserInfoVo userInfoVo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		System.out.println("로그인실행111111");
			HttpSession session = request.getSession();
			UserInfoVo userInfo = userService.userLogin(userInfoVo);
			
			System.out.println("로그인실행222222222222");
			if(userInfoVo == null) {
				session.setAttribute("userInfoVo", null);
				rttr.addFlashAttribute("msg", false);
			} else {
				session.setAttribute("userInfoVo", userInfoVo);
			}
			System.out.println("로그인실행33333333333333333333");
			
			return "redirect:/board/boardList.do";
	
		}
	*/
	
	@RequestMapping(value = "/user/userLogin.do")
	public ModelAndView boardLoginCheck(@ModelAttribute UserInfoVo userInfoVo, HttpSession session) throws Exception {
		
		boolean result = userService.userLogin(userInfoVo) != null;
		
		ModelAndView mv = new ModelAndView();
		
		if(result == true) { //로그인 성공
			//boardList로 이동
			mv.setViewName("menu");
			mv.addObject("msg", "success");
		} else { //로그인 실패
			mv.setViewName("user/userLogin");
			mv.addObject("msg", "failure");
		}
		
		return mv;
	}
	
	/*
	// 로그아웃 실행
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/user/userLogin";
	}
	*/
	/*
	// 로그아웃 실행
	@RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout() throws Exception {
        
        return "/board/boardList.do";
    }
 	*/


	 	 
	 	
	 	 
	 
	
}
