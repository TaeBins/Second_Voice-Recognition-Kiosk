package com.KSCT.work.model;

import lombok.Data;

@Data
// 메뉴 리스트
public class Menus {
	// 메뉴 순번
	private Double menuseq;
	// 메뉴 명
	private String menuname;
	// 메뉴 타입
	private String menutype;
	// 메뉴 가격
	private Double menuprice;
	// 메뉴 재고수량
	private Double menustockcnt;
	// 메뉴 주문횟수
	private Double menuordercnt;
	// 메뉴 사진1
	private String menuimg1;
	// 주문 가능 여부
	private String menuavailable;
	// 메뉴 불가 사진
	private String menusoldoutimg;
	// 업체 번호
	private String resno;
	// 평균 조리시간
	private Double menutime;

}
