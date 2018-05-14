package com.mybatis.service.user;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.User;
import com.mybatis.bean.UserExample;
import com.mybatis.dao.UserMapper;


@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper mapper;

	@Override
	public User selectByName(String userCode, String userPassword) {
		User user = mapper.selectByName(userCode);
		
		//匹配密码
		if(null != user){
			if(!user.getUserpassword().equals(userPassword))
				user = null;
		}
		return user;		
	}
	
	public User checkName(String name) {
		try {
			return mapper.selectByName(name);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public long countByExample(UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		try {
			return mapper.deleteByPrimaryKey(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insert(User record) {
		try {
			return mapper.insert(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insertSelective(User record) {
		try {
			return mapper.insertSelective(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<User> selectByExample(User user) {
		try {
			return mapper.selectByExample(user);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		try {
			return mapper.selectByPrimaryKey(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByExampleSelective(User record, UserExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(User record, UserExample example) {
		try {
			return mapper.updateByExample(record, example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		try {
			return mapper.updateByPrimaryKeySelective(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByPrimaryKey(User record) {
		try {
			return mapper.updateByPrimaryKey(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}
		

}
