package com.KSCT.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;
import com.KSCT.work.model.Receipt;
import com.KSCT.work.service.IndexService;

// @Controller : Controller 클래스에 쓰이며 API와 View를 같이 사용할경우
// @ResponseBody : API에서만 작동하고 View까지는 안갈경우
// @RestController : json, xml 과같은 API에서만 작동하여 data를 return 할경우(Controller + ResponseBody)

// @Autowired : 해당하는 Type에 따라서 자동으로 Bean(의존성) 주입(주로 Controller 클래스에서 mapper, service 에있는 객체주입)
// @Resource : Autowired와 같지만 Type이아니라 이름에따라 연결

// @RequestMapping : 요청된 url을 어떤 메소드가 처리할지 맵핑(Controller나 그안에 메소드에 적용) => 기본 Get
// 종류 : Get, Post, Put, Patch, Delete

// @ModelAttribute : View에서 보내주는 파라미터를 Class(VO/DTO)의 멤버변수로 바인딩 해줌(태그의 name값 == Class 멤버 변수명 == setmethod명)
// @SessionAttributes : Session에 Data를 넣을 때 사용(Model key값과 동일하면 자동으로 세션에저장)
// @RequestAttribute : Request에 설정되어있는 속성 값을 가져올 수 있음

// @RequestParam : Get요청으로 들어올 때 url에있는 값중에 작성한값 뒤에붙는 파라미터값을 가져옴
// @RequestBody : json, xml 데이터를 Class, model 로 맵핑하여 값들을 java타입으로 파싱
// @Required : setter 메소드에 적용해주면 Bean 생성시 필수 프로퍼티임을 알림(꼭 필요한 속성들 정의)
// @Lazy : Class가 로드될 때 바로 Bean등록을 마치지 않고 실제 사용될 때 로딩이 이루어져 지연로딩시킴
// @Cacheable : 메소드 앞에 지정하면 해당 메소드를 최초 호출하면 캐시에 적재하여 다음에도 그대로 사용되어 호출횟수 줄어듬
// @Scheduled : 정해진 시간에 사용해야하는 경우
@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;
	
	// "/" 주소로 가면 첫화면 뜨게 하기
	@GetMapping("/")
	public String index() {
		return "index";
	}

	// 메뉴 가져오기
	@RequestMapping(value = "/{menu_type}") // 페이지 들어갈때 가져올 각 페이지의 값
	// pathvariable 위에서 지정한 값을 가져와서 int형으로 저장
	public String menulist(@PathVariable("menu_type") int menu_type, Menus menus, HttpServletRequest request, HttpServletResponse response, Model model) {
		// 서비스로 menu_type 보내주기
		
		menus.setMenu_type(menu_type);
		System.out.println(menus.getMenu_gender());
		
		List<Menus> menuList  = indexService.menulist(menus);
		List<Orders> orderList = indexService.selectOrderList();
		model.addAttribute("menuList",menuList);
		model.addAttribute("orderList", orderList);
		// 맵핑값에 따라 리턴값도 바뀌어야 해서 if문으로 따로 설정
		String next=null;
		if(menu_type==1) {
			next="menu";
		}else if(menu_type==2) {
			next="side";
		}else if(menu_type==3) {
			next="beer";
		}else {
			next="drink";
		}		
		return next;
	}
	
	//손님이 주문한 목록 DB에 저장하기 (오른쪽에 뜨는 메뉴목록)
	@PostMapping("/order")
	@ResponseBody
	public String order(@RequestBody Orders orders) {
		//손님이 버튼 클릭 or 음성 주문 했을 경우
		System.out.println(orders.getOrder_cnt() + orders.getMenu_name());
			
		  indexService.order(orders); // 주문목록 테이블에 데이터 채워넣기
		 
		
		return "null";
	}

	@GetMapping("/time")
	public String time() {
		return "time";
	}
	
	@DeleteMapping("/deleteorder")
	@ResponseBody
	public String deleteOrder(@RequestBody Orders orders) {
		System.out.println(orders.getMenu_name());
		indexService.deleteOrder(orders);
		return null;
	}
	
	// 메뉴 화면에서 오른쪽 주문목록 주문 하기 버튼 누르면 실행
	@PostMapping("/ordercomplete")
	// 영수증 모델과 주문목록 모델을 사용해야해서 가져오기
	public String orderComplete(Receipt receipt, Orders orders) {
		// 영수증 모델 서비스로 보내기
		indexService.orderComplete(receipt);
		// 주문목록 모델 서비스로 보내기
		indexService.menusUpdate(orders);

		// 영수증 페이지로 가기전에 최신화 시키기위해 "/" 이걸 붙여서 맵핑 실행하도록
		return "redirect:/receipt";
	}
	
	// 위에서 마지막에 실행된 /receipt 로 와지면 실행
	@GetMapping("/receipt")
	// 리스트 가져오기위해 model 함수 가져오기
	public String receiptlist(Model model) {
		// 리스트 타입으로 영수증목록을 불러와야해서 영수증 모델 적용해서 receiptlist로 지정
		List<Receipt> receiptlist = indexService.receiptList();
		// receipt.jsp 에서 가져온 리스트값을 출력할수 있도록 addAttribute 해주기
		model.addAttribute("receiptList", receiptlist);
		return "receipt";
	}

}