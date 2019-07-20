package com.hanweb.demo.controller.prototype;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 原型预览用的Controller
 * 
 * @author 陈健
 * 
 */
@Controller
@RequestMapping("demo_view")
public class Preview {

	/**
	 * 预览
	 */
	@RequestMapping("{viewName}")
	public ModelAndView viewPrototype(HttpServletRequest request, String treeNodeName, @PathVariable String viewName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/" + viewName);
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}
}
