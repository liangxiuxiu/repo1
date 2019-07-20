package com.hanweb.appcheck.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanweb.appcheck.entity.App;
import com.hanweb.common.basedao.LikeType;
import com.hanweb.common.service.GridViewService;
import com.hanweb.common.util.NumberUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.mvc.Script;
import com.hanweb.common.view.grid.Button;
import com.hanweb.common.view.grid.GridRow;
import com.hanweb.common.view.grid.GridView;
import com.hanweb.common.view.grid.GridViewDelegate;
import com.hanweb.common.view.grid.GridViewSql;
import com.hanweb.common.view.grid.Head;

@Controller
@RequestMapping("manager/_app")
public class ListAppController implements GridViewDelegate {
	
	@Autowired
	private GridViewService gridViewService;
	
	@RequestMapping("list")
	public GridView list(GridView gridView){
		gridView.setDelegate(this);
		gridView.setViewName("complat/app/app_list");
		gridView.setShowAdvSearch(false);
		gridView.setSearchPlaceholder("请输入应用名称或appid");

		createButton(gridView);
		createHead(gridView);
		createBody(gridView);
		return gridView;
	}
	
	private void createButton(GridView gridView){
		gridView.addButton(Button.getAdd());
		gridView.addButton(Button.getRemove());
	}
	
	private void createHead(GridView gridView){
		gridView.addHead(Head.getInstance().setCheckbox(true).setField("iid"));
		gridView.addHead(Head.getInstance().setField("appname").setTitle("应用名称")
				.setAlign("left"));
		gridView.addHead(Head.getInstance().setField("appid").setTitle("Appid")
				.setAlign("center").setWidth(200));
		gridView.addHead(Head.getInstance().setField("ipadd").setTitle("ip地址")
				.setAlign("center").setWidth(200));
		gridView.addHead(Head.getInstance().setField("isOpen").setTitle("是否开启")
				.setAlign("center").setWidth(100));
	}
	
	private void createBody(GridView gridView){
		GridViewSql gridViewSql = GridViewSql.getInstance(gridView);
		String searchText = StringUtil.trim(gridView.getSearchText());
		gridViewSql.addSelectField("iid").addSelectField("appname")
			.addSelectField("appid").addSelectField("ipadd").addSelectField("isOpen")
			.setTable(App.TABLE);
		String where = " 1 = 1";
		if (StringUtil.isNotEmpty(searchText)){
			where += " AND (appName LIKE :searchText OR appid LIKE :searchText)";
			gridViewSql.addParam("searchText", searchText, LikeType.LR);
		}
		gridViewSql.setWhere(where);
		gridViewSql.addOrderBy("iid", "DESC");
		gridViewService.find(gridViewSql);
	}

	@Override
	public void createRow(GridRow gridRow, Map<String, Object> rowData, Integer index) {
		Integer iid = NumberUtil.getInt(StringUtil.getString(rowData.get("iid")));
		String appname = StringUtil.getString(rowData.get("appname"));
		String appid = StringUtil.getString(rowData.get("appid"));
		String ipadd = StringUtil.getString(rowData.get("ipadd"));
		String isOpen = StringUtil.getString(rowData.get("isOpen"));
		
		gridRow.addCell("iid", iid);
		gridRow.addCell("appname", appname, Script.createScript("edit", iid));
		gridRow.addCell("appid", appid);
		gridRow.addCell("ipadd", ipadd);
		gridRow.addCell("isOpen", "<input name=\"isOpen\" type=\"hidden\" value=\""
				+ isOpen +"\" data=\"{iid:" + iid + "}\"/>", false);
	}

}
