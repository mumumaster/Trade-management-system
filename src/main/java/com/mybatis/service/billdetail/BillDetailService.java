package com.mybatis.service.billdetail;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybatis.bean.BillDetail;
import com.mybatis.bean.BillDetailExample;
import com.mybatis.bean.User;
import com.mybatis.bean.UserExample;

public interface BillDetailService {
	long countByExample(BillDetailExample example);

	int deleteByExample(BillDetailExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(BillDetail record);

	int insertSelective(BillDetail record);

	List<BillDetail> selectByExample(BillDetail billDetail);

	BillDetail selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") BillDetail record, @Param("example") BillDetailExample example);

	int updateByExample(@Param("record") BillDetail record, @Param("example") BillDetailExample example);

	int updateByPrimaryKeySelective(BillDetail record);

	int updateByPrimaryKey(BillDetail record);
	
    //按ID查询
    BillDetail selectByPrimaryKeys(Integer id);
    
    //按对象查询
    List<BillDetail> selectByExamples(Integer id);
    
    //更新数量和总价
	int updateByDill(BillDetail record);
	
	//根据订单号删除
	int deleteByOrderId(Integer id);

}
