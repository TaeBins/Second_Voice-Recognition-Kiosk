package com.KSCT.work.model;

import lombok.Data;

@Data
public class Orders {

	// 주문 테이블 번호 
    private int order_tb;

    // 메뉴 순번 
    private int menu_seq;

    // 주문 번호 
    private int order_seq;

    // 메뉴 명 
    private String menu_name;

    // 메뉴 단가 
    private int menu_price;

    // 주문 수량 
    private int order_cnt;

    // 예상 조리시간 
    private int order_time;
}
