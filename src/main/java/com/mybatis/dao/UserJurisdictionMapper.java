package com.mybatis.dao;

import com.mybatis.bean.UserJurisdiction;
import com.mybatis.bean.UserJurisdictionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserJurisdictionMapper {
    long countByExample(UserJurisdictionExample example);

    int deleteByExample(UserJurisdictionExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserJurisdiction record);

    int insertSelective(UserJurisdiction record);

    List<UserJurisdiction> selectByExample(UserJurisdictionExample example);

    UserJurisdiction selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserJurisdiction record, @Param("example") UserJurisdictionExample example);

    int updateByExample(@Param("record") UserJurisdiction record, @Param("example") UserJurisdictionExample example);

    int updateByPrimaryKeySelective(UserJurisdiction record);

    int updateByPrimaryKey(UserJurisdiction record);


	/**
	 * @Description: 寻找所有的用户权限信息
	 * @Title: selectUserJurisdictionInfo
	 * @return  List<UserJurisdiction>    (返回类型)
	 */
	public List<UserJurisdiction> selectUserJurisdictionInfo();
	
	/**
	 * @Description: 通过user表的Id寻找其拥有的所有角色
	 * @Title: selectById
	 * @param id
	 * @return  List<UserJurisdiction>    (返回类型)
	 */
	public List<UserJurisdiction> selectById(@Param("id")Long id);
}