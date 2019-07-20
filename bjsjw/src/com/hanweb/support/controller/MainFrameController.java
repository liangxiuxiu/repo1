package com.hanweb.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.mvc.ControllerUtil;
import com.hanweb.common.view.menu.Menu;
import com.hanweb.common.view.menu.MenuItem;

@Controller
@RequestMapping(value = "manager")
public class MainFrameController {
	private static final String PAGE = "home/index.do"; // 登录后第一个页面

	private static final String MENU = ""; // 登录后第一个下拉菜单

	@RequestMapping("index")
	public ModelAndView showMainPage() {
		ModelAndView modelAndView = new ModelAndView("support/mainframe");
		modelAndView.addObject("pageUrl", PAGE);
		modelAndView.addObject("menuUrl", MENU);

		Menu menu = Menu.getInstance();

		menu.addMenuItem(MenuItem.getInstance("index", null, "首页",
				ControllerUtil.getAbsolutePath("/manager/home/index.do")).setChannel("index"));

		menu.addMenuItem(MenuItem.getInstance(
				"develop",
				null,
				"开发指南",
				ControllerUtil.getAbsolutePath("/manager/demo/menu/show.do"),
				ControllerUtil.getAbsolutePath("/manager/demo/person/list.do?treeNodeName="
						+ StringUtil.encoder("会员管理"))).setChannel("develop"));

		menu.addMenuItem(MenuItem.getInstance("sys", null, "系统管理").setChannel("sysconfig")
				.setSeparator(true).setAllowed(true, true));

		menu.addMenuItem(MenuItem.getInstance("group", "sys", "机构管理",
				ControllerUtil.getAbsolutePath("/manager/menu/groupmenu_show.do"),
				ControllerUtil.getAbsolutePath("/manager/group/list.do")).setAllowed(true, true));

		menu.addMenuItem(MenuItem.getInstance("user", "sys", "用户管理",
				ControllerUtil.getAbsolutePath("/manager/menu/usermenu_show.do"),
				ControllerUtil.getAbsolutePath("/manager/user/list.do")).setAllowed(true, true));

		menu.addMenuItem(MenuItem.getInstance("role", "sys", "角色管理",
				ControllerUtil.getAbsolutePath("/manager/role/list.do")).setAllowed(true, false));

		menu.addMenuItem(MenuItem.getInstance("sysparam", "sys", "系统设置",
				ControllerUtil.getAbsolutePath("/manager/menu/config_show.do"),
				ControllerUtil.getAbsolutePath("/manager/configuration/modify_show.do"))
				.setAllowed(true, false));

		menu.addMenuItem(MenuItem
				.getInstance("account", null, "<i class=\"iconfont nav-account-btn\">&#xf503f;</i>")
				.setStyle("width: 40px;").setSeparator(true));

		menu.addMenuItem(MenuItem.getInstance("modify", "account", "账户设置").setOnClick(
				"openDialog('"
						+ ControllerUtil.getAbsolutePath("/manager/user/modify_self_show.do")
						+ "',500,515,{title:'账户设置'})"));

		menu.addMenuItem(MenuItem.getInstance("online", "account", "在线用户").setOnClick(
				"openDialog('"
						+ ControllerUtil.getAbsolutePath("/manager/onlineuser/list.do")
						+ "',960,500,{title:'在线用户'})"));

		menu.addMenuItem(MenuItem.getInstance("logout", "account", "系统退出").setOnClick(
				"top.location.href='" + ControllerUtil.getAbsolutePath("/logout.do") + "'"));
		modelAndView.addObject("sso", BaseInfo.isSso());
		modelAndView.addObject("topMenuHtml", menu.parse());
		return modelAndView;
	}
}
