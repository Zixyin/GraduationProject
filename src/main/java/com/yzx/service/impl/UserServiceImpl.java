package com.yzx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzx.mapper.UserMapper;
import com.yzx.pojo.User;
import com.yzx.service.UserService;

/**
 * @author YZX
 * @date 2020年4月26日
 * @time 上午10:04:26
 */
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	public List<User> selUser(int pageNumber, int pageSize) {
		return userMapper.selUser((pageNumber-1)*pageSize, pageSize);
	}
	
	public int addUser(User user) {
		return userMapper.addUser(user);
	}

	public int delUser(int id) {
		return userMapper.delUser(id);
	}

	public int updUser(User user) {
		return userMapper.updUser(user);
	}

	public User checkUser(String userid, String psw) {	
		return userMapper.checkUser(userid, psw);
	}

	public User selById(int id) {
		return userMapper.selById(id);
	}

	public int selUserCount() {
		return userMapper.selUserCount();
	}



	
}
