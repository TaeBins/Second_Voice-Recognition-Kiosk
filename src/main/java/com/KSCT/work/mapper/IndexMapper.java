package com.KSCT.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;
import com.KSCT.work.model.Receipt;
import com.KSCT.work.model.TableInfo;

// @Repository : DAO class(mapper)같은 DataBase에 접근하는 method를 가진 클래스에 쓰임
@Repository
@Mapper
public interface IndexMapper {

	//테이블 정보 가져오기(시작 될 때 테이블 정보 받아오기)
	public TableInfo getTable();
	
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

	
	//주문하기 눌렀을 경우 최초 주문인지 추가 주문인지 체크
	public int checkReceiptNum(Orders orders);
	// 주문하기 누르면 영수증에 주문한 내용 추가
	public void orderComplete(Receipt receipt);
	// 주문한 내용 토대로 menus 테이블에서는 재고, 주문횟수 수정
	public void menusUpdate(Orders orders);
	
	//주문접수 되면 주문목록 초기화시키기
	public void menusTruncate();
	// 영수증 목록 가져오기
	public List<Receipt> receiptList(TableInfo table);
	
	public void updatereceipt();
	// 재고 리셋
	public void stockReset();
}
