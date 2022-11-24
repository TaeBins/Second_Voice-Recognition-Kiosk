package com.KSCT.work.model;

import lombok.Data;

@Data
// 메뉴 리스트
public class Menus {
	// 메뉴 순번
	private Double menu_seq;
	// 메뉴 명
	private String menu_name;
	// 메뉴 타입
	private String menu_type;
	// 메뉴 가격
	private int menu_price;
	// 메뉴 재고수량
	private Double menu_stock_cnt;
	// 메뉴 주문횟수
	private Double menu_order_cnt;
	// 메뉴 사진1
	private String menu_img1;
	// 주문 가능 여부
	private String menu_available;
	// 메뉴 불가 사진
	private String menu_soldout_img;
	// 업체 번호
	private String res_no;
	// 평균 조리시간
	private Double menu_time;

}
