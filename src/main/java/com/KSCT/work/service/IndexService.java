package com.KSCT.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.KSCT.work.mapper.IndexMapper;
import com.KSCT.work.model.Menus;
import com.KSCT.work.model.testMenu;

// @Transactional : 메소드 내부에서 일어나는 DB 로직이 전부성공 or 하나라도 실패시 다시롤백 해줌
// @Service : 서비스 Class에 사용
@Transactional
@Service
public class IndexService {

	@Autowired
	private IndexMapper indexMapper;

	public List<testMenu> getList() {
		List<testMenu> list = indexMapper.getList();
		return list;
	}
	public List<testMenu> getOrderList() {
		List<testMenu> OrderList = indexMapper.getOrderList();
		for( testMenu menu : OrderList) {
			menu.setTotalPrice(menu.getCount() * menu.getPrice());
		}
		return OrderList;
		
	}
	public void insertList(testMenu menu) {
		indexMapper.insertList(menu);
	}
	
	public List<Menus> gettlist(){
		List<Menus> menuList = indexMapper.gettlist();
		
		return menuList;
	}
	public List<Menus> sideList(){
		List<Menus> sideList = indexMapper.sideList();
		
		return sideList;
	}
	public List<Menus> beerList(){
		List<Menus> beerList = indexMapper.beerList();
		
		return beerList;
	}
	public List<Menus> drinkList(){
		List<Menus> drinkList = indexMapper.drinkList();
		
		return drinkList;
	}


}
