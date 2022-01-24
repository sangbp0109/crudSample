package com.spring.user.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.vo.ComCodeVo;
import com.spring.user.dao.UserDao;
import com.spring.user.service.userService;
import com.spring.user.vo.UserInfoVo;

@Service
public class userServiceImpl implements userService {

	@Autowired
	UserDao userDao;
	
	@Override
	public int userJoin(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userJoin(userInfoVo);
	}

	@Override
	public List<ComCodeVo> phoneNumberList() throws Exception {
		// TODO Auto-generated method stub
		return userDao.phoneNumberList();
	}

	@Override
	public UserInfoVo findById(String id) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}
	
	@Override
	public UserInfoVo userLogin(UserInfoVo userInfoVo) throws Exception {
		
		return userDao.userLogin(userInfoVo);
	}
	

	
	
	
	
}
