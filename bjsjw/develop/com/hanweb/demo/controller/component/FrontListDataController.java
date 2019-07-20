package com.hanweb.demo.controller.component;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanweb.common.basedao.LikeType;
import com.hanweb.common.service.AjaxGridDataService;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.view.grid.AjaxGridDataDelegate;
import com.hanweb.common.view.grid.AjaxGridResult;
import com.hanweb.common.view.grid.GridViewSql;

/**
 * 前台ajax列表页数据
 * 
 * @author 李杰
 *
 */
@Controller
@RequestMapping("demo/component/front")
public class FrontListDataController implements AjaxGridDataDelegate {

	@Autowired
	private AjaxGridDataService dataService;

	/**
	 * 获取列表中的数据
	 * @param result	AjaxGridResult
	 * @param user		自己的参数
	 * @return			AjaxGridResult
	 */
	@RequestMapping("listdata")
	@ResponseBody
	public AjaxGridResult listData(AjaxGridResult result, InfoNews infoNews) { // 实现AjaxGridDataDelegate，需要重写makeResult方法
		GridViewSql gridViewSql = GridViewSql.getInstance();	// GridViewSql.getInstance() 这里GridViewSql与后台的一样
		gridViewSql.addSelectField("info_title").addSelectField("info_date").addSelectField("info_content")
				.addSelectField("info_type");
		gridViewSql.setTable(InfoNews.TABLE_NAME);
		String where = "1=1";
		if (StringUtil.isNotEmpty(infoNews.getInfo_title())) {
			where += " AND info_title LIKE :title ";
		}
		// 这里可以往result里面设置值，可以在makeResult中调用，可以用来传递参数
		result.addObject("msg", "新年快乐"); // 这个方法可以用来传值给makeResult方法
		gridViewSql.setWhere(where);
		gridViewSql.addParam("title", infoNews.getInfo_title(), LikeType.LR);
		dataService.find(gridViewSql, result, this);	// 这里必须要调用dataService.find方法。
		return result;
	}

	@Override
	public Object makeResult(AjaxGridResult gridResult, List<Map<String, Object>> rows) {
		// 获取listData方法中result里面设置值
		gridResult.getObject("msg");
		return rows;
	}
}
