package com.mybatis.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.Product;
import com.mybatis.bean.ProductExample;

public interface ProductService {

	long countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
    Product selectByName(String name);
	    
}
