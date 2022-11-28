package com.KSCT.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.KSCT.work.model.Menus;

// @Repository : DAO class(mapper)같은 DataBase에 접근하는 method를 가진 클래스에 쓰임
@Repository
@Mapper
public interface IndexMapper {

	// 메뉴 가져오기
	public List<Menus> menulist();

}
