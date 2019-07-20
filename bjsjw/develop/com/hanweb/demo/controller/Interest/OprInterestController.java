package com.hanweb.demo.controller.Interest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanweb.common.util.mvc.JsonResult;
import com.hanweb.common.validation.ValidationException;
import com.hanweb.common.validation.ValidationUtil;
import com.hanweb.demo.entity.Interest;
import com.hanweb.demo.exception.DemoException;
import com.hanweb.demo.service.InterestService;

@Controller
@RequestMapping("manager/demo/interest")
public class OprInterestController {

	@Autowired
	private InterestService interestService;

	@RequestMapping("add_show")
	public ModelAndView showAdd() {
		ModelAndView modelAndView = new ModelAndView("/demo/interest/interest_opr");
		modelAndView.addObject("url", "add_submit.do");
		return modelAndView;
	}

	@RequestMapping("add_submit")
	@ResponseBody
	public JsonResult submitAdd(InterestFormBean interestFormBean) {
		JsonResult jsonResult = JsonResult.getInstance();
		try {
			ValidationUtil.validation(interestFormBean);
			interestService.add(interestFormBean);
			jsonResult.setSuccess(true);
		} catch (ValidationException e) {
			jsonResult.setMessage(e.getMessage());
		} catch (DemoException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}

	@RequestMapping("modify_show")
	public ModelAndView showModify(Integer iid) {
		ModelAndView modelAndView = new ModelAndView("/demo/interest/interest_opr");
		modelAndView.addObject("url", "modify_submit.do");
		Interest interest = interestService.findById(iid);
		modelAndView.addObject("interest", interest);
		return modelAndView;
	}

	@RequestMapping("modify_submit")
	@ResponseBody
	public JsonResult submitModify(InterestFormBean interestFormBean) {
		JsonResult jsonResult = JsonResult.getInstance();
		try {
			ValidationUtil.validation(interestFormBean);
			interestService.modify(interestFormBean);
			jsonResult.setSuccess(true);
		} catch (ValidationException e) {
			jsonResult.setMessage(e.getMessage());
		} catch (DemoException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}

	@RequestMapping("remove")
	@ResponseBody
	public JsonResult remove(String ids) {
		JsonResult jsonResult = JsonResult.getInstance();
		try {
			interestService.remove(ids);
			jsonResult.setSuccess(true);
		} catch (DemoException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}
}
