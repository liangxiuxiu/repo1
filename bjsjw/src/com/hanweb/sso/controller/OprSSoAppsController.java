package com.hanweb.sso.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.TemplateParser;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.complat.listener.UserSessionInfo;
import com.hanweb.jis.expansion.webservice.SSoAuthApp;
import com.hanweb.sso.bean.App;
import com.hanweb.sso.bean.AppsResult;

@Controller
@RequestMapping("manager/sso")
public class OprSSoAppsController {
	private final static String USER_APPS_SEESION_KEY = "userAppMap";
	
	private final static String SSO_APPS_STYLE = "<a class=\"sso-app\" onclick=\"ssoLogin('${app.uuid}')\">${app.name}</a>";
	
	@RequestMapping("apps_show")
	@ResponseBody
	public String showApps(HttpSession httpSession){
		String result = null;
		if(BaseInfo.isSso()){
			try{
				String userName = UserSessionInfo.getCurrentUser().getLoginName();
				String appsString = SSoAuthApp.findUserApps(userName, "5");
				AppsResult appsResult = JsonUtil.StringToObject(appsString, AppsResult.class);
				if(appsResult == null){
					return result;
				}
				if(StringUtil.equals(appsResult.getHead().get("state"), "2")){
					result = appsResult.getHead().get("errormsg");
					return result;
				}
				List<App> apps = appsResult.getApps();
				if(CollectionUtils.isNotEmpty(apps)){
					StringBuffer buffer = new StringBuffer();
					Map<String, App> userAppMap = new HashMap<String, App>();
					for (App app : apps) {
						buffer.append(TemplateParser.parserTemplate(SSO_APPS_STYLE, "app", app));
						userAppMap.put(app.getUuid(), app);
					}
					httpSession.setAttribute(USER_APPS_SEESION_KEY, userAppMap);
					result = buffer.toString();
				}
			}catch(Exception e){
				LogWriter.error("showApps error", e);
			}
		}
		return result;
	}
	
	/**
	 * 开始单点登录
	 * @param uuid
	 * @param httpSession
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("sso_login")
	@ResponseBody
	public String ssoLogin(String uuid, HttpSession httpSession, HttpServletResponse response){
		String result = null;
		String userName = UserSessionInfo.getCurrentUser().getLoginName();
		String resultStr = SSoAuthApp.getTicket(uuid, userName);
		if(StringUtil.isNotEmpty(resultStr)){
			Map<String, String> resultMap = JsonUtil.StringToObject(resultStr, Map.class);
			if(resultMap != null){
				if(StringUtil.isNotEmpty(resultMap.get("errormsg"))){
					result = resultMap.get("errormsg");
				}else{
					userName = resultMap.get("username");
					String ticket = resultMap.get("ticket");
					Map<String, App> apps = (Map<String, App>) httpSession.getAttribute(USER_APPS_SEESION_KEY);
					App app = apps.get(uuid);
					try{
						String url = app.getUrl() + "?ticket=" + ticket;
						response.sendRedirect(url);
					}catch(Exception e){
					}
				}
			}
		}
		return result;
	}
}
