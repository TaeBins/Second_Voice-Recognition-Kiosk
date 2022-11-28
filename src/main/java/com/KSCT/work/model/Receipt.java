package com.KSCT.work.model;

import java.util.Date;

import lombok.Data;

@Data
public class Receipt {

	// 영수증 번호 
    private int receipt_seq;

    // 주문 테이블 번호 
    private int tb_no;

    // 주문 시간 
    private Date receipt_date;

    // 메뉴 명 
    private String menu_name;

    // 메뉴 단가 
    private int menu_price;

    // 주문 수량 
    private int order_cnt;

    // 가격 합계 
    private int total_price;

    // 할인 금액 
    private int dc_amount;

    // 최종 결제 금액 
    private int total_amount;
}
