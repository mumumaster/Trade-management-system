package com.mybatis.service.product;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.Product;
import com.mybatis.bean.ProductExample;
import com.mybatis.dao.ProductMapper;


@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	
	@Resource
	private ProductMapper mapper;

	@Override
	public long countByExample(ProductExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(ProductExample example) {
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
	public int insert(Product record) {
		try {
			return mapper.insert(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insertSelective(Product record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> selectByExample(ProductExample example) {
		try {
			return mapper.selectByExample(example);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Product selectByPrimaryKey(Integer id) {
		try {
			return mapper.selectByPrimaryKey(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByExampleSelective(Product record, ProductExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Product record, ProductExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Product record) {
		try {
			return mapper.updateByPrimaryKeySelective(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByPrimaryKey(Product record) {
		try {
			return mapper.updateByPrimaryKey(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Product selectByName(String name) {
		try {
			return mapper.selectByName(name);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	
}
