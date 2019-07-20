package com.hanweb.demo.controller.menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("manager/demo/menu")
public class DemoMenuController {

	@RequestMapping("show")
	public ModelAndView showMenu() {
		ModelAndView modelAndView = new ModelAndView("/demo/menu/menu");
		return modelAndView;
	}
}
