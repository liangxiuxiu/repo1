package com.hanweb.appcheck.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanweb.appcheck.entity.App;
import com.hanweb.appcheck.service.AppCheckService;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.mvc.JsonResult;
import com.hanweb.common.util.mvc.ResultState;
import com.hanweb.common.util.security.RSAKey;
import com.hanweb.common.util.security.SecurityUtil;
import com.hanweb.complat.exception.OperationException;

@Controller
@RequestMapping("manager/_app")
public class OprAppController {

	@Autowired
	AppCheckService appCheckService;
	
	/**
	 * 打开新增
	 * @return
	 */
	@RequestMapping("add_show")
	public ModelAndView showAdd(){
		ModelAndView modelAndView = new ModelAndView("complat/app/app_opr");
		App app = new App();
		RSAKey key = SecurityUtil.createKey();
		app.setPuK(key.getPublicKey());
		app.setPrK(key.getPrivateKey());
		app.setAppid(StringUtil.getUUIDString());
		app.setAppsecret(StringUtil.getUUIDString());
		
		modelAndView.addObject("url", "add_submit.do");
		modelAndView.addObject("app", app);
		return modelAndView;
	}
	
	/**
	 * 提交新增
	 * @param app
	 * @param paramKey
	 * @param paramValue
	 * @return
	 */
	@RequestMapping("add_submit")
	@ResponseBody
	public JsonResult saveAdd(App app, String paramKey, String paramValue){
		if (StringUtil.isNotEmpty(paramKey) && StringUtil.isNotEmpty(paramValue)) {
			Map<String, String> map = app.getCusParam();
			map.put(paramKey, paramValue);
		}
		JsonResult jsonResult = JsonResult.getInstance();
		boolean isSuccess = false;
		try {
			isSuccess = appCheckService.add(app);
			if (isSuccess) {
				jsonResult.set(ResultState.ADD_SUCCESS);
			} else {
				jsonResult.set(ResultState.ADD_FAIL);
			}
		} catch (OperationException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}
	
	/**
	 * 打开编辑
	 * @param iid
	 * @return
	 */
	@RequestMapping("modify_show")
	public ModelAndView showModify(int iid){
		App app = appCheckService.findByIid(iid);
		ModelAndView modelAndView = new ModelAndView("complat/app/app_opr");
		modelAndView.addObject("url", "modify_submit.do");
		modelAndView.addObject("app", app);
		return modelAndView;
	}
	
	/**
	 * 提交编辑
	 * @param app
	 * @param paramKey
	 * @param paramValue
	 * @return
	 */
	@RequestMapping("modify_submit")
	@ResponseBody
	public JsonResult submitModify(App app, String paramKey, String paramValue){
		JsonResult jsonResult = JsonResult.getInstance();
		boolean isSuccess = false;
		if (StringUtil.isNotEmpty(paramKey) && StringUtil.isNotEmpty(paramValue)) {
			Map<String, String> map = app.getCusParam();
			map.put(paramKey, paramValue);
		}
		try {
			isSuccess = appCheckService.modify(app);
			if (isSuccess) {
				jsonResult.set(ResultState.MODIFY_SUCCESS);
			} else {
				jsonResult.set(ResultState.MODIFY_FAIL);
			}
		} catch (OperationException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@RequestMapping("remove")
	@ResponseBody
	public JsonResult remove(String ids){
		JsonResult jsonResult = JsonResult.getInstance();
		boolean isSuccess = false;
		try {
			isSuccess = appCheckService.removeByIds(ids);
			if (isSuccess) {
				jsonResult.set(ResultState.REMOVE_SUCCESS);
			} else {
				jsonResult.set(ResultState.REMOVE_FAIL);
			}
		} catch (OperationException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}
	
	/**
	 * 修改应用开关
	 * @param iid
	 * @param isOpen
	 * @return
	 */
	@RequestMapping("isopen_modify")
	@ResponseBody
	public JsonResult modifyOpen(Integer iid, String isOpen){
		JsonResult jsonResult = JsonResult.getInstance();
		boolean isSuccess = false;
		try {
			isSuccess = appCheckService.modifyOpen(iid, isOpen);
			jsonResult.setSuccess(isSuccess);
			if (isSuccess) {
				jsonResult.setMessage("opr.success");
			} else {
				jsonResult.setMessage("opr.fail");
			}
		} catch (OperationException e) {
			jsonResult.setMessage(e.getMessage());
		}
		return jsonResult;
	}
}
