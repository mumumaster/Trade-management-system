package com.mybatis.dao;

import com.mybatis.bean.Bill;
import com.mybatis.bean.BillExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BillMapper {
    long countByExample(BillExample example);

    int deleteByExample(BillExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bill record);

    int insertSelective(Bill record);

    List<Bill> selectByExample(Bill bill);
    
    /**
     * 按当前用户的id查询订单(由于数据库表当初没设计好，没有这个用户id,所以此步省略)
     */
    //List<Bill> selectByExamples(@Param("bill")Bill bill,@Param("myid")Integer myid);

    Bill selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByExample(@Param("record") Bill record, @Param("example") BillExample example);

    int updateByPrimaryKeySelective(Bill record);

    int updateByPrimaryKey(Bill record);
    
    Bill selectByName(@Param("orderid")String  orderid);
    
    //修改消费
    int updateCostAdd(Bill bill);
    
    int updateCostDel(Bill bill);
}