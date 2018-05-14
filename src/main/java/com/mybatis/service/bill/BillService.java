package com.mybatis.service.bill;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.Bill;
import com.mybatis.bean.BillExample;

public interface BillService {

	long countByExample(BillExample example);

    int deleteByExample(BillExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bill record);

    int insertSelective(Bill record);

    List<Bill> selectByExample(Bill bill);

    Bill selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByExample(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
    
    public Bill checkName(String orderid);
    
    int updateCostAdd(Bill bill);
    
    int updateCostDel(Bill bill);

}
