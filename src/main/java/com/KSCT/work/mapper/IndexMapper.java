package com.KSCT.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;

// @Repository : DAO class(mapper)같은 DataBase에 접근하는 method를 가진 클래스에 쓰임
@Repository
@Mapper
public interface IndexMapper {

	// 메뉴 가져오기
	public List<Menus> menulist(int menu_type);

	//손님이 주문한 목록 DB에 저장하기 (오른쪽에 뜨는 메뉴목록)
	public void order(Orders orders);
}
