package com.KSCT.work.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.KSCT.work.model.Menu;
import com.KSCT.work.model.test;
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

	
	@GetMapping("/list")
	public String MenuList(Model model) {
		List<Menu> list = indexService.getList();
		model.addAttribute("list", list);
		return "list";
	}
	
	@PostMapping("/menu")
	public String InsertMenu(test menu, Model model) {
		
		indexService.insertList(menu);
	
		return "index";
	}
	@GetMapping("/order_list")
	public String OrderList(Model model) {
		List<test> OrderList = indexService.getOrderList();
		model.addAttribute("OrderList", OrderList);
		return "list";
	}
	
	@GetMapping("/")
	public String index() {

		
		return "index";
	}
	
	@GetMapping("/menu")
	public String start() {
		return "menu";
	}
	
	@GetMapping("/sltest")
	public String sl(Model model) {
		List<test> sllist = indexService.getsllist();
		model.addAttribute("sllist", sllist);
		return "sltest";
	}
	

	@GetMapping("/animation")
	public String ani() {
		return "animation";
	}
	
	@GetMapping("/menu2")
	public String menu2() {
		return "menu2";
	}

}


