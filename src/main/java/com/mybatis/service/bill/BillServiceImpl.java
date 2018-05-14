package com.mybatis.service.bill;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.mybatis.bean.Bill;
import com.mybatis.bean.BillExample;
import com.mybatis.dao.BillMapper;



@Service("BillService")
public class BillServiceImpl implements BillService {
	
	@Resource
	private BillMapper mapper;
	
	public Bill checkName(String orderid) {
		try {
			return mapper.selectByName(orderid);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public long countByExample(BillExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(BillExample example) {
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
	public int insert(Bill record) {
		try {
			return mapper.insert(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int insertSelective(Bill record) {
		try {
			return mapper.insertSelective(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Bill> selectByExample(Bill bill) {
		try {
			return mapper.selectByExample(bill);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Bill selectByPrimaryKey(Integer id) {
		try {
			return mapper.selectByPrimaryKey(id);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByExampleSelective(Bill record, BillExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Bill record, BillExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Bill record) {
		try {
			return mapper.updateByPrimaryKeySelective(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateByPrimaryKey(Bill record) {
		try {
			return mapper.updateByPrimaryKey(record);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int updateCostAdd(Bill bill) {
		try {
			return mapper.updateCostAdd(bill);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int updateCostDel(Bill bill) {
		try {
			return mapper.updateCostDel(bill);
		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
	}

	

}
