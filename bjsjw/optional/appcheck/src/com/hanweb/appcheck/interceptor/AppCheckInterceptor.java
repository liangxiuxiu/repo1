package com.hanweb.appcheck.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.hanweb.appcheck.entity.App;
import com.hanweb.appcheck.exception.AppCheckException;
import com.hanweb.appcheck.service.AppCheckService;
import com.hanweb.common.interceptor.BaseInterceptor;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.ip.IpUtil;
import com.hanweb.common.util.mvc.ControllerUtil;

public class AppCheckInterceptor extends BaseInterceptor {
	
	//private static final String cacheName = "_app_cache";
	
	@Override
	public void after(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) {
	}

	@Override
	public boolean before(HttpServletRequest request, HttpServletResponse response,
			Object arg2) {
		String appid = StringUtil.trim(request.getParameter("appid"));
		String appsecret = StringUtil.trim(request.getParameter("appsecret"));
		String errorMessage = "";
		if(StringUtil.isEmpty(appid) || StringUtil.isEmpty(appsecret)){
			errorMessage = "appid或appsecret为空";
			ControllerUtil.showJson(errorMessage, response);
			return false;
		}
		AppCheckService appCheckService = SpringUtil.getBean(AppCheckService.class);
		String ip = IpUtil.getIp();
		try {
			//校验
			App app = appCheckService.check(appid, appsecret, ip);
			if (app != null && app.getIid() > 0){
				request.setAttribute("_app", app);
				return true;
			}else{
				errorMessage = "校验不成功";
			}
		} catch (AppCheckException e) {
			errorMessage = e.getMessage();
		}
		ControllerUtil.showJson(errorMessage, response);
		return false;
	}

	@Override
	public void complete(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, Exception arg3) {
	}

}
