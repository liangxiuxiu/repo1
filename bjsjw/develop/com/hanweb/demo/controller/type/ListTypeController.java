package com.hanweb.demo.controller.type;

import java.util.Date;
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
@RequestMapping("manager/demo/type")
public class ListTypeController implements GridViewDelegate {

    @Autowired
    private GridViewService gridViewService;

    @RequestMapping("list")
    public GridView list(GridView gridView) {
        gridView.setDelegate(this);
        gridView.setViewName("demo/type/type_list");
        createButton(gridView);
        createHead(gridView);
        createBody(gridView);
        gridView.setShowAdvSearch(false);
        gridView.setPosition("表格操作");
        return gridView;
    }

    private void createButton(GridView gridView) {
        gridView.addButton(Button.getAdd());
        gridView.addButton(Button.getRemove());
    }

    private void createBody(GridView gridView) {
        GridViewSql gridViewSql = GridViewSql.getInstance(gridView);
        gridViewSql.addSelectField("integer_field")
                .addSelectField("single_field").addSelectField("both_field")
                .addSelectField("character_field")
                .addSelectField("string_field").addSelectField("judge_field")
                .addSelectField("date_field").addSelectField("datetime_field")
                .addSelectField("json_field").addSelectField("text_field")
                .addSelectField("blob_field").setTable(Tables.TYPE);
        String where = null;
        String searchText = gridView.getSearchText();
        if (StringUtil.isNotEmpty(searchText)) {
            where = " integer_field LIKE :integer_field";
            gridViewSql.addParam("integer_field", searchText, LikeType.LR);
        }
        gridViewSql.setWhere(where);
        gridViewService.find(gridViewSql);
    }

    private void createHead(GridView gridView) {
        gridView.addHead(Head.getInstance().setCheckbox(true)
                .setField("integer_field"));
        gridView.addHead(Head.getInstance().setField("single_field")
                .setTitle("单精度型").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("both_field")
                .setTitle("双精度型").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("character_field")
                .setTitle("字符型").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("string_field")
                .setTitle("字符串型").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("judge_field")
                .setTitle("布尔型").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("date_field")
                .setTitle("日期").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("datetime_field")
                .setTitle("时间").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("json_field")
                .setTitle("JSON").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("text_field")
                .setTitle("大字段").setAlign("left").setWidth(200));
        gridView.addHead(Head.getInstance().setField("blob_field")
                .setTitle("附件").setAlign("left").setWidth(200));
    }

    @Override
    public void createRow(GridRow gridRow, Map<String, Object> rowData,
            Integer index) {
        String integer_field = StringUtil.getString(rowData
                .get("integer_field"));
        String single_field = StringUtil.getString(rowData.get("single_field"));
        String both_field = StringUtil.getString(rowData.get("both_field"));
        String character_field = StringUtil.getString(rowData
                .get("character_field"));
        String string_field = StringUtil.getString(rowData.get("string_field"));
        String judge_field = StringUtil.getString(rowData.get("judge_field"));
        String date_field = DateUtil.dateToString(
                (Date) rowData.get("date_field"), DateUtil.YYYY_MM_DD);
        String datetime_field = DateUtil.dateToString(
                (Date) rowData.get("datetime_field"),
                DateUtil.YYYY_MM_DD_HH_MM_SS);
        String json_field = StringUtil.getString(rowData.get("json_field"));

        gridRow.addCell("integer_field", integer_field);
        gridRow.addCell("single_field", single_field,
                Script.createScript("edit", integer_field));
        gridRow.addCell("both_field", both_field);
        gridRow.addCell("character_field", character_field);
        gridRow.addCell("string_field", string_field);
        gridRow.addCell("judge_field", judge_field);
        gridRow.addCell("date_field", date_field);
        gridRow.addCell("datetime_field", datetime_field);
        gridRow.addCell("json_field", json_field);
        gridRow.addCell("text_field", "clob");
        gridRow.addCell("blob_field", "blob");
    }
}
