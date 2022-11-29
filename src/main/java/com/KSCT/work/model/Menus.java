package com.KSCT.work.model;

import lombok.Data;

@Data
// 메뉴 리스트
public class Menus {
	// 메뉴 순번 
    private int menu_seq;

    // 메뉴 명 
    private String menu_name;

    // 메뉴 타입 
    private int menu_type;

    // 메뉴 단가 
    private int menu_price;

    // 메뉴 재고수량 
    private int menu_stock_cnt;

    // 메뉴 주문횟수 
    private int menu_order_cnt;

    // 메뉴 사진 
    private String menu_img;

    // 주문 가능여부 
    private String menu_available;

    // 메뉴 불가사진 
    private String menu_soldout_img;

    // 평균 조리시간 
    private int menu_time;
    
    // 선호 성별
    private int menu_gender;

}
