package com.mybatis.service.role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.Role;
import com.mybatis.bean.RoleExample;
import com.mybatis.bean.User;
import com.mybatis.bean.UserExample;

public interface RoleService {

	long countByExample(RoleExample example);

	int deleteByExample(RoleExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	int insertSelective(Role record);

	List<Role> selectByExample(RoleExample example);

	Role selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Role record, @Param("example") RoleExample example);

	int updateByExample(@Param("record") Role record, @Param("example") RoleExample example);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

}
