package com.mybatis.service.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.User;
import com.mybatis.bean.UserExample;

public interface UserService {

	// 按姓名查询
	User selectByName(String userCode, String userPassword);
	
	//查询用户是否存在
	public User checkName(String name);

	long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(User user);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
	

}
