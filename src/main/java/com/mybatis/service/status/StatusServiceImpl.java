package com.mybatis.service.status;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.Status;
import com.mybatis.bean.StatusExample;
import com.mybatis.dao.StatusMapper;


@Service("StatusService")
public class StatusServiceImpl implements StatusService {
	
	@Resource
	private StatusMapper mapper;

	@Override
	public long countByExample(StatusExample example) {
		try {
			return mapper.countByExample(example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int deleteByExample(StatusExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Status record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Status record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Status> selectByExample(StatusExample example) {
		try {
			return mapper.selectByExample(example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Status selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByExampleSelective(Status record, StatusExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Status record, StatusExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Status record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Status record) {
		// TODO Auto-generated method stub
		return 0;
	}

	
		

}
