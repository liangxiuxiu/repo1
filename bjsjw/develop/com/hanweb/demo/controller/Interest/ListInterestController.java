package com.hanweb.demo.controller.Interest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanweb.common.basedao.LikeType;
import com.hanweb.common.service.GridViewService;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.mvc.Script;
import com.hanweb.common.view.grid.Button;
import com.hanweb.common.view.grid.GridRow;
import com.hanweb.common.view.grid.GridView;
import com.hanweb.common.view.grid.GridViewDelegate;
import com.hanweb.common.view.grid.GridViewSql;
import com.hanweb.common.view.grid.Head;

@Controller
@RequestMapping("manager/demo/interest")
public class ListInterestController implements GridViewDelegate {

	@Autowired
	private GridViewService gridViewService;

	@RequestMapping("list")
	public GridView list(GridView gridView, String treeNodeName) {
		// 必须设置delegate
		gridView.setDelegate(this);
		// 设置jsp
		gridView.setViewName("/demo/interest/interest_list");
		// 创建按钮
		createToolBar(gridView);
		// 创建列表头
		createHead(gridView);
		// 创建列表体
		createBody(gridView);
		// 不显示高级检索
		gridView.setShowAdvSearch(false);

		gridView.addQueryParam("treeNodeName", treeNodeName);
		return gridView;
	}

	private void createToolBar(GridView gridView) {
		gridView.addButton(Button.ADD);
		gridView.addButton(Button.REMOVE);
	}

	private void createHead(GridView gridView) {
		gridView.addHead(Head.getInstance().setField("iid").setCheckbox(true));
		gridView.addHead(Head.getInstance().setField("name").setTitle("名称").setAlign("left")
				.setWidth(200));
		gridView.addHead(Head.getInstance().setField("persons").setTitle("人数").setWidth(100));
	}

	private void createBody(GridView gridView) {
		GridViewSql gridViewSql = GridViewSql.getInstance(gridView);
		gridViewSql
				.addSelectField("iid")
				.addSelectField("name")
				.addSelectField(
						"(SELECT COUNT(*) FROM demo_personinterest pi WHERE pi.interestid = i.iid) persons")
				.setTable("demo_interest i");
		String where = null;
		String searchText = gridView.getSearchText();
		if (StringUtil.isNotEmpty(searchText)) {
			where = " name LIKE :name";
			gridViewSql.addParam("name", searchText, LikeType.LR);
		}
		gridViewSql.setWhere(where);
		gridViewService.find(gridViewSql);
	}

	@Override
	public void createRow(GridRow gridRow, Map<String, Object> rowData, Integer index) {
		gridRow.addCell("iid", rowData.get("iid"));
		gridRow.addCell("name", rowData.get("name"),
				Script.createScript("edit", rowData.get("iid"), rowData.get("name")));
		gridRow.addCell("persons", rowData.get("persons"));
	}
}
