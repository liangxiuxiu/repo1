package com.hanweb.demo.controller.Person;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.hanweb.common.util.mvc.JsonResult;
import com.hanweb.common.validation.ValidationException;
import com.hanweb.common.validation.ValidationUtil;
import com.hanweb.demo.entity.Interest;
import com.hanweb.demo.entity.Person;
import com.hanweb.demo.exception.DemoException;
import com.hanweb.demo.service.InterestService;
import com.hanweb.demo.service.PersonService;

@Controller
@RequestMapping("manager/demo/person")
public class OprPersonController {

	@Autowired
	private PersonService personService;

	@Autowired
	private InterestService interestService;

	@RequestMapping("add_show")
	public ModelAndView showAdd() {
		ModelAndView modelAndView = new ModelAndView("/demo/person/person_opr");
		modelAndView.addObject("url", "add_submit.do");
		List<Interest> interests = interestService.findAll();
		if (interests != null) {
			modelAndView.addObject("interests", interests);
		}
		return modelAndView;
	}

	@RequestMapping("add_submit")
	@ResponseBody
	public JsonResult submitAdd(PersonFormBean personFormBean) {
		JsonResult jsonResult = JsonResult.getInstance();
		try {
			ValidationUtil.validation(personFormBean);
			personService.add(personFormBean);
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
		ModelAndView modelAndView = new ModelAndView("/demo/person/person_opr");
		modelAndView.addObject("url", "modify_submit.do");
		modelAndView.addObject("modify", true);
		try {
			Person person = personService.findById(iid);
			modelAndView.addObject("person", person);
			List<Interest> interests = interestService.findAll();
			if (interests != null) {
				modelAndView.addObject("interests", interests);
			}
		} catch (DemoException e) {
		}
		return modelAndView;
	}

	@RequestMapping("modify_submit")
	@ResponseBody
	public JsonResult submitModify(PersonFormBean personFormBean) {
		JsonResult jsonResult = JsonResult.getInstance();
		try {
			ValidationUtil.validation(personFormBean);
			personService.modify(personFormBean);
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
			personService.remove(ids);
			jsonResult.setSuccess(true);
		} catch (DemoException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}
}
