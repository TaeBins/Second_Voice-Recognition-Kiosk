package com.KSCT.work.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.KSCT.work.model.Menu;
import com.KSCT.work.service.IndexService;

@Controller
public class IndexController {

	@Autowired
	private IndexService indexService;

	@GetMapping("/menu")
	public String MenuList(Model model) {
		List<Menu> list = indexService.getList();
		model.addAttribute("list", list);
		return "list";
	}
}
