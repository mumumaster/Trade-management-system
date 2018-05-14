package com.mybatis.service.resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mybatis.bean.Resources;
import com.mybatis.bean.ResourcesExample;
import com.mybatis.dao.ResourcesMapper;

@Service("ResourceService")
public class ResourceServiceImpl implements ResourceService {

	@Resource
	private ResourcesMapper res;

	@Override
	public long countByExample(ResourcesExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(ResourcesExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Resources record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Resources record) {
		int insertSelective = 0;
		try {
			insertSelective = res.insertSelective(record);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertSelective;
	}

	@Override
	public List<Resources> selectByExample(ResourcesExample example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resources selectByPrimaryKey(Long id) {
		Resources selectByPrimaryKey = null;
		try {
			selectByPrimaryKey = res.selectByPrimaryKey(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectByPrimaryKey;
	}

	@Override
	public int updateByExampleSelective(Resources record, ResourcesExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Resources record, ResourcesExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Resources record) {
		int updateByPrimaryKeySelective = 0;
		try {
			updateByPrimaryKeySelective = res.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return updateByPrimaryKeySelective;
	}

	@Override
	public int updateByPrimaryKey(Resources record) {
		int updateByPrimaryKey = 0;
		try {
			updateByPrimaryKey = res.updateByPrimaryKey(record);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return updateByPrimaryKey;
	}

	@Override
	public List<Resources> selectResourceInfo(Resources info) {
		List<Resources> selectResourceInfo = null;
		try {
			selectResourceInfo = res.selectResourceInfo(info);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectResourceInfo;
	}

	@Override
	public List<Resources> selectResourceInfoAndChirdenCount(Resources info) {
		List<Resources> selectResourceInfo = null;
		try {
			selectResourceInfo = res.selectResourceInfoAndChirdenCount(info);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectResourceInfo;
	}

	@Override
	public Resources selectResourceIdByParentId(Resources info) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int changeAvailable(List<Resources> info, Integer isavailable) {
		int result = 0;
		try {
			result = res.changeAvailable(info, isavailable);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Resources> selectResourceInfoEqual(Resources info) {
		List<Resources> selectResourceInfoEqual = null;
		try {
			selectResourceInfoEqual = res.selectResourceInfoEqual(info);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectResourceInfoEqual;
	}

	@Override
	public List<Resources> selectResourceMenuInfo(Integer info) {
		List<Resources> selectResourceInfo = res.selectResourceMenuInfo(info);
		Map<Integer, Object> top = new HashMap<Integer, Object>();
		for (Resources resources : selectResourceInfo) {
			Integer parentid = resources.getParentid();
			if (parentid == 0) {
				top.put(resources.getId(), resources);
			} else {
				Object object = top.get(parentid);
				Resources res = null;
				if (object != null) {
					if (object.getClass().equals(Resources.class)) {
						res = (Resources) object;
					}
				}
				if (res != null) {
					List<Resources> menuChirden = res.getMenuChirden();
					menuChirden.add(resources);
				}
			}
		}
		Set<Integer> keySet = top.keySet();
		List<Resources> resAll = new ArrayList<Resources>();
		for (Integer parentid : keySet) {
			Object object = top.get(parentid);
			Resources res = null;
			if (object != null) {
				if (object.getClass().equals(Resources.class)) {
					res = (Resources) object;
				}
			}
			if (res != null) {
				resAll.add(res);
			}
		}
		return resAll;
	}

	@Override
	public List<Resources> selectResInfoToRJChange(Resources info, Integer isavailable, Integer roleId,
			Integer have) {
		List<Resources> selectResInfoToRJChange = null;
		try {
			selectResInfoToRJChange = res.selectResInfoToRJChange(info, isavailable, roleId, have);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectResInfoToRJChange;
	}

}
