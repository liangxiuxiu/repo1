package com.hanweb.searchcore;

import java.util.List;

//import org.junit.BeforeClass;
//import org.junit.Test;


import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.command.CmdResponse;
import com.hanweb.searchcore.client.command.IndexCmdFactory;
import com.hanweb.searchcore.client.command.IndexColumnCmd;
import com.hanweb.searchcore.client.command.IndexTableCmd;
import com.hanweb.searchcore.entity.IndexColumn;
import com.hanweb.searchcore.entity.IndexColumnType;
import com.hanweb.searchcore.entity.IndexTable;

/**
 * 索引库操作
 * 
 * @author 李杰
 *
 */
public class IndexTableTest {
	
	public static void main(String[] args) {
		init();
		try {
//			createTable();
			removeTable();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

//	@BeforeClass
	public static void init() {
		String appPath = "D:\\tomcat-7\\bjsjw\\webapps\\bjsjw";
		BaseInfo.initWithPath(appPath, "complat");
		Config.init(appPath);
	}

	/**
	 * 建表（索引库）
	 * 
	 * @throws Exception
	 */
//	@Test
	public static void createTable() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		IndexTable indexTable = new IndexTable("info", 10, 5);

		indexTable.addColumn(new IndexColumn("title", "标题", IndexColumnType.TEXT));
		indexTable.addColumn(new IndexColumn("content", "内容", IndexColumnType.TEXT));
		indexTable.addColumn(new IndexColumn("colid", "栏目id", IndexColumnType.INT));
		indexTable.addColumn(new IndexColumn("refid", "引用id", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("date", "时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("url", "链接", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("pubdate", "发布时间", IndexColumnType.DATETIME));
		indexTable.addColumn(new IndexColumn("tag", "标签", IndexColumnType.ENUM));
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
		System.out.println(JsonUtil.objectToString(cmdResponse));
		// 创建附表--给下面的测试用
//		createAssistantTable();
	}

	private static void createAssistantTable() {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		IndexTable indexTable = new IndexTable("info1", 10, 5);

		indexTable.addColumn(new IndexColumn("title", "标题", IndexColumnType.TEXT));
		indexTable.addColumn(new IndexColumn("content", "内容", IndexColumnType.TEXT));
		indexTable.addColumn(new IndexColumn("colid", "栏目id", IndexColumnType.INT));
		indexTable.addColumn(new IndexColumn("refid", "引用id", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("date", "时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("url", "链接", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("pubdate", "发布时间", IndexColumnType.DATETIME));
		indexTable.addColumn(new IndexColumn("tag", "标签", IndexColumnType.ENUM));
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}

	/**
	 * 增加字段
	 * 
	 * @throws Exception
	 */
//	@Test
	public void addColumn() throws Exception {
		IndexColumnCmd indexColumnCmd = IndexCmdFactory.getIndexColumnCmd();
		CmdResponse cmdResponse = indexColumnCmd.add("info", new IndexColumn("se_title", "副标题", IndexColumnType.TEXT));
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}

	/**
	 * 获取字段
	 * 
	 * @throws Exception
	 */
//	@Test
	public void getColumn() throws Exception {
		IndexColumnCmd indexColumnCmd = IndexCmdFactory.getIndexColumnCmd();
		IndexColumn indexColumn = indexColumnCmd.getColumn("info", "title");
		System.out.println(JsonUtil.objectToString(indexColumn));
	}

	/**
	 * 获取所有字段
	 * 
	 * @throws Exception
	 */
//	@Test
	public void getColumns() throws Exception {
		IndexColumnCmd indexColumnCmd = IndexCmdFactory.getIndexColumnCmd();
		List<IndexColumn> columns = indexColumnCmd.getColumns("info");
		System.out.println(JsonUtil.objectToString(columns));
	}

	/**
	 * 删除表
	 * 
	 * @throws Exception
	 */
//	@Test
	public static void removeTable() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		CmdResponse cmdResponse = indexTableCmd.remove("info");
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}

	/**
	 * 是否存在
	 */
//	@Test
	public void exist() {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		System.out.println(indexTableCmd.exist("info"));
		System.out.println(indexTableCmd.exist("info1"));
	}

	/**
	 * 重建索引
	 */
//	@Test
	public void reIndex() {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		CmdResponse cmdResponse = indexTableCmd.reIndex("info", "info1");
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}

	/**
	 * 建立别名
	 */
//	@Test
	public void addAlias() {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		CmdResponse cmdResponse = indexTableCmd.addAlias("alias_info", "info", "info1");
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}

	/**
	 * 建立别名
	 */
//	@Test
	public void removeAlias() {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		CmdResponse cmdResponse = indexTableCmd.removeAlias("alias_info", "info");
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}
}
