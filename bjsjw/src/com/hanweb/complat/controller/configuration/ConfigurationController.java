package com.hanweb.complat.controller.configuration;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.hanweb.common.annotation.Permission;
import com.hanweb.common.util.mvc.JsonResult;
import com.hanweb.common.util.mvc.ResultState;
import com.hanweb.complat.constant.Settings;

/**
 * 系统参数设置控制器
 * 
 * @author 李杰
 * 
 */
@Controller
@Permission(module = "configuration")
@RequestMapping("manager/configuration")
public class ConfigurationController {

	/**
	 * 打开系统参数设置页面
	 * 
	 * @return
	 */
	@RequestMapping("modify_show")
	public ModelAndView showModify() {
		ModelAndView modelAndView = new ModelAndView("/complat/configuration/configuration_opr");
		modelAndView.addObject("setting", Settings.getSettings());
		modelAndView.addObject("url", "update_submit.do");
		return modelAndView;
	}

	/**
	 * 保存系统参数
	 * 
	 * @param settings
	 *            系统参数实体
	 * @return
	 */
	@Permission(function = "update_submit")
	@RequestMapping("update_submit")
	@ResponseBody
	public JsonResult submitUpdate(Settings settings) {
		Settings.save(settings);
		JsonResult jsonResult = JsonResult.getInstance();
		jsonResult.set(ResultState.MODIFY_SUCCESS);
		return jsonResult;
	}
}
