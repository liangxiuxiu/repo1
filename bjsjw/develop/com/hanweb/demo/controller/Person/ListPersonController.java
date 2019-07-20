package com.hanweb.demo.controller.Person;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanweb.common.basedao.LikeType;
import com.hanweb.common.service.GridViewService;
import com.hanweb.common.util.DateUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.mvc.Script;
import com.hanweb.common.view.grid.Button;
import com.hanweb.common.view.grid.GridRow;
import com.hanweb.common.view.grid.GridView;
import com.hanweb.common.view.grid.GridViewDelegate;
import com.hanweb.common.view.grid.GridViewSql;
import com.hanweb.common.view.grid.Head;
import com.hanweb.demo.constant.Tables;

@Controller
@RequestMapping("manager/demo/person")
public class ListPersonController implements GridViewDelegate {

	@Autowired
	private GridViewService gridViewService;

	private Map<String, String> degrees = null;

	private ListPersonController() {
		super();
		degrees = new HashMap<String, String>();
		degrees.put("1", "一般");
		degrees.put("2", "熟练");
		degrees.put("3", "精通");
		degrees.put("4", "专家");
	}

	@RequestMapping("list")
	public GridView list(GridView gridView, String treeNodeName) {
		// 必须设置delegate
		gridView.setDelegate(this);
		// 设置jsp
		gridView.setViewName("/demo/person/person_list");
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
		gridView.addButton(Button.EDIT.setValue("显示名称"));
	}

	private void createHead(GridView gridView) {
		gridView.addHead(Head.getInstance().setField("iid").setCheckbox(true));
		gridView.addHead(Head.getInstance().setField("name").setTitle("名称").setAlign("left")
				.setWidth(200));
		gridView.addHead(Head.getInstance().setField("degree").setTitle("学历").setWidth(200));
		gridView.addHead(Head.getInstance().setField("create_date").setTitle("创建时间").setWidth(100)
				.setSortable(true));
	}

	private void createBody(GridView gridView) {
		GridViewSql gridViewSql = GridViewSql.getInstance(gridView);
		gridViewSql.addSelectField("iid").addSelectField("name")
				.addSelectField("createdate create_date").addSelectField("degree")
				.setTable(Tables.PERSON);
		String where = null;
		String searchText = gridView.getSearchText();
		if (StringUtil.isNotEmpty(searchText)) {
			where = " name LIKE :name";
			gridViewSql.addParam("name", searchText, LikeType.LR);
		}
		gridViewSql.setWhere(where);
		if (StringUtil.isNotEmpty(gridView.getSortName())) {
			gridViewSql.addOrderBy(gridView.getSortName(), gridView.getSortOrder());
		}
		gridViewSql.addOrderBy("iid", "DESC");
		gridViewService.find(gridViewSql);
	}

	@Override
	public void createRow(GridRow gridRow, Map<String, Object> rowData, Integer index) {
		gridRow.addCell("iid", rowData.get("iid"));
		gridRow.addCell("name", rowData.get("name"),
				Script.createScript("edit", rowData.get("iid"), rowData.get("name")));
		gridRow.addCell("degree", degrees.get(StringUtil.getString(rowData.get("degree"))));
		gridRow.addCell("create_date",
				DateUtil.dateToString((Date) rowData.get("create_date"), DateUtil.YYYY_MM_DD));
	}
}
