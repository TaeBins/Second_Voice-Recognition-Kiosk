package com.KSCT.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;
import com.KSCT.work.model.Receipt;

// @Repository : DAO class(mapper)같은 DataBase에 접근하는 method를 가진 클래스에 쓰임
@Repository
@Mapper
public interface IndexMapper {

	// 메뉴 가져오기(서비스에서 보낸 menu_type mapper.xml로)
	public List<Menus> manMenulist(Menus menus); //남자용

	public List<Menus> womanMenulist(Menus menus); //여자용
	

	
	//손님이 주문한 목록 출력
	@Select("select * from orders")
	public List<Orders> selectOrderList();
	
	
	//손님이 주문한 목록 DB에 저장하기 (오른쪽에 뜨는 메뉴목록)
	public void order(Orders orders);
	
	//손님이 삭제한 목록 DB에서도 삭제하기 (오른쪽)

	public void deleteOrder(Orders orders);

	public void orderComplete(Receipt receipt);
}
