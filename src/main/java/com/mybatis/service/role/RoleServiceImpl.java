package com.mybatis.service.role;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.Role;
import com.mybatis.bean.RoleExample;
import com.mybatis.bean.User;
import com.mybatis.bean.UserExample;
import com.mybatis.dao.RoleMapper;
import com.mybatis.dao.UserMapper;


@Service("RoleService")
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleMapper mapper; 

	@Override
	public long countByExample(RoleExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(RoleExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		try {
			return mapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insert(Role record) {
		try {
			return  mapper.insert(record);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insertSelective(Role record) {
		// TODO Auto-generated method stub
		return 0;
	}

	//查询
	@Override
	public List<Role> selectByExample(RoleExample example) {
		try {
			return mapper.selectByExample(example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Role selectByPrimaryKey(Integer id) {
		try {
			return mapper.selectByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int updateByExampleSelective(Role record, RoleExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Role record, RoleExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Role record) {
		try {
			return mapper.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		// TODO Auto-generated method stub
		return 0;
	}

	
		

}
