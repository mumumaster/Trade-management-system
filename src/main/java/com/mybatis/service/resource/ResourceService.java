package com.mybatis.service.resource;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.Resources;
import com.mybatis.bean.ResourcesExample;

public interface ResourceService {
	
	/**
	 * @Description: 查询出资源，用于角色资源分配
	 * @Title: selectResInfoToRJChange
	 * @param info
	 * @param isavailable
	 * @param roleId
	 * @return  int    (返回类型)
	 */
	public List<Resources> selectResInfoToRJChange(@Param("info") Resources info, @Param("rjAvailable") Integer isavailable,
			@Param("roleId") Integer roleId,Integer have);
	/**
	 * @Description: 查询出顶级菜单，和其子项
	 * @Title: selectResourceMenuInfo
	 * @param info
	 * @return  List<Resources>    (返回类型)
	 */
	public List<Resources> selectResourceMenuInfo(@Param("info")Integer info);
	/**
	 * @Description: 将一些资源禁用或者启用
	 * @Title: changeAvailable 
	 * @param info List<Resources>
	 * @param isavailable 0或1，禁用/启用
	 * @return  int    (返回类型)
	 */
	public int changeAvailable(@Param("info")List<Resources> info,@Param("isAvailable")Integer isavailable);
	/**
	 * @Description: 按条件获取资源信息
	 * @Title: selectResourceInfo
	 * @return  ResourcesInfo    (返回类型)
	 */
	public List<Resources> selectResourceInfo(Resources info);
	
	/**
	 * @Description: 和上面那个唯一区别是，这个查询的条件全部都是xxx=xxx
	 * @Title: selectResourceInfoEqual
	 * @param info
	 * @return  List<Resources>    (返回类型)
	 */
	public List<Resources> selectResourceInfoEqual(@Param("info")Resources info);
	
	/**
	 * @Description: 通过parentId查询所属上级菜单id
	 * @Title: selectResourceIdByParentId
	 * @param info
	 * @return  List<Resources>    (返回类型)
	 */
	public Resources selectResourceIdByParentId(Resources info);
	
	/**
	 * @Description: 能顺便查出子项菜单的数量
	 * @Title: selectResourceInfoAndChirdenCount
	 * @param info
	 * @return  List<Resources>    (返回类型)
	 */
	public List<Resources> selectResourceInfoAndChirdenCount(Resources info);
	
    long countByExample(ResourcesExample example);

    int deleteByExample(ResourcesExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Resources record);

    int insertSelective(Resources record);

    List<Resources> selectByExample(ResourcesExample example);

    Resources selectByPrimaryKey(Long id);

    int updateByExampleSelective( Resources record, ResourcesExample example);

    int updateByExample(Resources record, ResourcesExample example);

    int updateByPrimaryKeySelective(Resources record);

    int updateByPrimaryKey(Resources record);
}
