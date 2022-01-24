package com.spring.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.board.vo.ComCodeVo;
import com.spring.user.vo.UserInfoVo;

public interface userService {
	
	// 회원가입
	public int userJoin(UserInfoVo userInfoVo) throws Exception;
	
	// 핸드폰번호 타입 받아오기
	public List<ComCodeVo> phoneNumberList() throws Exception;
	 
	// 아이디 중복체크
	public UserInfoVo findById(String id) throws Exception;

	// 로그인
	public UserInfoVo userLogin(UserInfoVo userInfovo) throws Exception;
	
	// 로그아웃
	

}
