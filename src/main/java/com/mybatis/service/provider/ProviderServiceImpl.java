package com.mybatis.service.provider;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.Provider;
import com.mybatis.bean.ProviderExample;
import com.mybatis.dao.ProviderMapper;

@Service("ProviderService")
public class ProviderServiceImpl implements ProviderService {
	
	@Resource
	private ProviderMapper mapper;

	@Override
	public long countByExample(ProviderExample example) {
		try {
			return mapper.countByExample(example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int deleteByExample(ProviderExample example) {
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
	public int insert(Provider record) {
		try {
			return mapper.insert(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insertSelective(Provider record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Provider> selectByExample(ProviderExample example) {
		try {
			return mapper.selectByExample(example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Provider selectByPrimaryKey(Integer id) {
		try {
			return mapper.selectByPrimaryKey(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByExampleSelective(Provider record, ProviderExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Provider record, ProviderExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Provider record) {
		try {
			return mapper.updateByPrimaryKey(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByPrimaryKey(Provider record) {
		try {
			return mapper.updateByPrimaryKey(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	

}
