package com.mybatis.service.provider;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.Provider;
import com.mybatis.bean.ProviderExample;

public interface ProviderService {

	long countByExample(ProviderExample example);

    int deleteByExample(ProviderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Provider record);

    int insertSelective(Provider record);

    List<Provider> selectByExample(ProviderExample example);

    Provider selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Provider record, @Param("example") ProviderExample example);

    int updateByExample(@Param("record") Provider record, @Param("example") ProviderExample example);

    int updateByPrimaryKeySelective(Provider record);

    int updateByPrimaryKey(Provider record);
}
