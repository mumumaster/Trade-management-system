package com.mybatis.dao;

import com.mybatis.bean.RoleJurisdiction;
import com.mybatis.bean.RoleJurisdictionExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleJurisdictionMapper {
	long countByExample(RoleJurisdictionExample example);

	int deleteByExample(RoleJurisdictionExample example);

	int deleteByPrimaryKey(Long id);

	int insert(RoleJurisdiction record);

	int insertSelective(RoleJurisdiction record);

	List<RoleJurisdiction> selectByExample(RoleJurisdictionExample example);

	RoleJurisdiction selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") RoleJurisdiction record,
			@Param("example") RoleJurisdictionExample example);

	int updateByExample(@Param("record") RoleJurisdiction record, @Param("example") RoleJurisdictionExample example);

	int updateByPrimaryKeySelective(RoleJurisdiction record);

	int updateByPrimaryKey(RoleJurisdiction record);

	/**
	 * @Description: 通过roleId,res-type 找到其能操作的资源
	 * @Title: selectRoleJurisdictionInfo
	 * @param id
	 * @param type
	 * @return  List<RoleJurisdiction>    (返回类型)
	 */
	public List<RoleJurisdiction> selectRoleJurisdictionInfo(@Param("id") Integer id,@Param("type") Integer type);
}