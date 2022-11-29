package com.KSCT.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.KSCT.work.mapper.IndexMapper;
import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;

// @Transactional : 메소드 내부에서 일어나는 DB 로직이 전부성공 or 하나라도 실패시 다시롤백 해줌
// @Service : 서비스 Class에 사용
@Transactional
@Service
public class IndexService {

	@Autowired
	private IndexMapper indexMapper;
	
	//모든 메뉴 가져오기(컨트롤에서 보낸 menu_type int 형으로)
	public List<Menus> menulist(int menu_type){
		// 컨트롤에서 받은 menu_type mapper로 보내기
		List<Menus> menuList = indexMapper.menulist(menu_type);
		return menuList;
	}
	
	//손님이 주문한 목록 DB에 저장하기 (오른쪽에 뜨는 메뉴목록)
	public void order(Orders orders) {
		
		// 이번 순번에서 주문했었던 메뉴라면 update 시키기
		
		
		// 이번 순번에서 처음으로 주문한 메뉴라면 insert 시키기
		indexMapper.order(orders); 
		
		
		//DB 목록 출력해주기 위해 orders의 현재 순번에 있는 데이터 모두 가지고오기
		
	}
	
	


}
