package com.kitri.single.sns.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.single.sns.dao.SnsDao;
import com.kitri.single.sns.model.SnsDto;
import com.kitri.single.user.model.UserDto;


public interface NaverLoginService {
	
	
	SnsDto getSnsLogin(SnsDto snsDto);
	void registSnsLogin(SnsDto snsDto);
	//backup 2019-07-08 
//	int registerUser(SnsDto naverUserDto);
	UserDto getUser(UserDto userDto);


	
	
	
	
	

	
}
