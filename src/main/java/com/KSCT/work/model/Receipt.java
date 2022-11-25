package com.KSCT.work.model;

import lombok.Data;

@Data
public class Receipt {

	// Menus 테이블(메뉴이름, 메뉴가격)
	private String menu_name;
	private String menu_price;
	
	// Order_Detail 테이블(주문 수량)
	private int od_cnt;
	
	// 메뉴가격 * 주문수량
	private int 
	
	// 주문 총금액
}
