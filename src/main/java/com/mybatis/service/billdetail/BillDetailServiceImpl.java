package com.mybatis.service.billdetail;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.Bill;
import com.mybatis.bean.BillDetail;
import com.mybatis.bean.BillDetailExample;
import com.mybatis.dao.BillDetailMapper;


@Service("BillDetailService")
public class BillDetailServiceImpl implements BillDetailService {
	
	@Resource
	private BillDetailMapper mapper;

	@Override
	public long countByExample(BillDetailExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(BillDetailExample example) {
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
	public int insert(BillDetail record) {
		try {
			return mapper.insert(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insertSelective(BillDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BillDetail> selectByExample(BillDetail billDetail) {
		try {
			return mapper.selectByExample(billDetail);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public BillDetail selectByPrimaryKey(Integer id) {
		try {
			return mapper.selectByPrimaryKey(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByExampleSelective(BillDetail record, BillDetailExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(BillDetail record, BillDetailExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(BillDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(BillDetail record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BillDetail selectByPrimaryKeys(Integer id) {
		try {
			return mapper.selectByPrimaryKeys(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByDill(BillDetail record) {
		try {
			return mapper.updateByDill(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<BillDetail> selectByExamples(Integer id) {
		try {
			return mapper.selectByExamples(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int deleteByOrderId(Integer id) {
		try {
			return mapper.deleteByOrderId(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	

}
