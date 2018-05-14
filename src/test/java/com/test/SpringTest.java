package com.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mybatis.bean.User;
import com.mybatis.dao.UserMapper;
import com.mybatis.utils.UtilDate;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class SpringTest {

	@Autowired
	UserMapper dao;

	@Autowired
	SqlSession sqlSession;// 可以使用批量的sqlSession

	@Test
	public void select() {
		
		List<User> list = new ArrayList<User>();
		list = dao.selectByExample(null);

		for (User info : list) {
			System.out.println("姓名 ：" + info.getUsername());
		}
	}

	@Test
	public void insertOne() {
		User info =new User();
		info.setUsername("李小龙");
		info.setUsercode("aaaabbcc");
		info.setGender(1);
//		info.setUserrole(1);
		info.setBirthday(UtilDate.getDate());
		int i = dao.insert(info);
		System.out.println("插入成功" + i);
	}

	/**
	 * 批量插入
	 */
	@Test
	public void insertMany() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		for (int i = 0; i < 1000; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 6);
			User info =new User();
			info.setUsercode(uid);
			info.setUsername("CHINESE"+uid);	
			info.setGender(1);
//			info.setUserrole(1);
			info.setBirthday(UtilDate.getDate());
			mapper.insert(info);		
		}
		System.out.println("批量插入成功！");
	}

}
