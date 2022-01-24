package com.spring.user.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.vo.ComCodeVo;
import com.spring.user.dao.UserDao;
import com.spring.user.vo.UserInfoVo;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	// 회원가입
	@Override
	public int userJoin(UserInfoVo userInfoVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.userJoin", userInfoVo);
	}
	
	// 핸드폰 번호 타입 받아오기
	@Override
	public List<ComCodeVo> phoneNumberList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.phoneNumberList");
	}

	// 아이디 중복 체크
	@Override
	public UserInfoVo findById(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.findById", id);
	}
	
	// 로그인
	@Override
	public UserInfoVo userLogin(UserInfoVo userInfoVo) throws Exception {
		
		return sqlSession.selectOne("user.userLogin");
	}
	
	// 로그아웃
	
	
	

}
