package com.KSCT.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.KSCT.work.model.Menu;
import com.KSCT.work.model.test;

// @Repository : DAO class(mapper)같은 DataBase에 접근하는 method를 가진 클래스에 쓰임
@Repository
@Mapper
public interface IndexMapper {

	public List<Menu> getList();

	@Insert("insert into order_list values(#{id}, #{menu}, #{count})")
	public void insertList(test Menu);
	
	public List<test> getOrderList();

}
