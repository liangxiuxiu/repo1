package com.hanweb.elasticsearch.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.hanweb.common.BaseInfo;
import com.hanweb.common.datasource.DataSourceSwitch;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.Properties;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.complat.dao.UserDAO;
import com.hanweb.elasticsearch.common.Escommon;
import com.hanweb.searchcore.bean.Constants;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.command.CmdResponse;
import com.hanweb.searchcore.client.command.IndexCmdFactory;
import com.hanweb.searchcore.client.command.IndexTableCmd;
import com.hanweb.searchcore.client.query.DeleteQuery;
import com.hanweb.searchcore.client.query.InsertQuery;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.query.UpdateQuery;
import com.hanweb.searchcore.client.search.Searcher;
import com.hanweb.searchcore.client.write.Writer;
import com.hanweb.searchcore.entity.IndexColumn;
import com.hanweb.searchcore.entity.IndexColumnType;
import com.hanweb.searchcore.entity.IndexTable;
import com.sun.xml.internal.bind.v2.util.DataSourceSource;

/**
 * ES控制层
 * @author jiangzt
 *
 */
@RequestMapping("EsTable")
@Controller
public class ESController {
	
	Properties properties = new Properties(BaseInfo.getRealPath()
			+ "/WEB-INF/config/esdata.properties");
	
	/**
	 * 批量新增
	 * @param orgCode 
	 * @param j 
	 */
//	public static void bulkAdd() {
//		Writer writer = Writer.getInstance();
//		List<InsertQuery> insertQueries = new ArrayList<InsertQuery>();
//		String CatalogCode = null;  //实施编码 1000
//		String OrgCode = null;		//受理部门 100
//		String CertKey = null;		//用户散列值1000
//		String ProjectNo = null;	//办件编号
//		String TaskName = "事项测试";		//事项名称
//		String ApplyerName = "梁宵鹏";  //申请人名称
//		String ApplyDate = "";	//申请时间
//		String ApplyType = "";	//申请类型
//		String ContactName = "张俊港";	//联系人名称
//		String ContactMobile = "152xxxx5983";//联系方式
//		String Address = "北京市xxxx";		//联系地址
//		String AcceptDate = "";	//受理时间
//		String ProjectType = "即办型";	//事项类型
//		String PromiseDate = "";	//承诺时间
//		String OrgName = "发改委";
//		String TargetOrgName = "发改委";//目标部门
//		
//		for (int i = 1; i <= 10000; i++) {
////			System.out.println("第"+i+"条记录开始插入");
//			// 此处需要优先设置主键值，insertquery的第二个参数
//			InsertQuery insertQuery = new InsertQuery("pro_accept", "");
//			InsertQuery insertQuery1 = new InsertQuery("pro_process", "");
//			InsertQuery insertQuery2 = new InsertQuery("pro_result", "");
//			InsertQuery insertQuery3 = new InsertQuery("pro_materialcatalogue", "");
//			if(i%5000 == 1) {
//				OrgCode = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0,12); 
//			}
//			if(i%100 == 1) {
//				CatalogCode = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0,20);  
//			}
//			if(i%100 ==1 ) {
//				CertKey = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0,18);
//			}
//			ProjectNo = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
//			insertQuery.addString("CatalogCode", CatalogCode);
//			insertQuery.addString("OrgCode", OrgCode);
//			insertQuery.addString("CertKey", CertKey);
//			insertQuery.addString("ProjectNo", ProjectNo);
//			insertQuery.addString("TaskName", TaskName);
//			insertQuery.addString("ApplyerName", ApplyerName);
//			insertQuery.addDate("ApplyDate", new Date());
////			insertQuery.addString("ApplyDate", ApplyDate);
//			insertQuery.addString("ApplyType", ApplyType);
//			insertQuery.addString("ContactName", ContactName);
//			insertQuery.addString("ContactMobile", ContactMobile);
//			insertQuery.addString("Address", Address);
//			insertQuery.addDate("AcceptDate", new Date());
////			insertQuery.addString("AcceptDate", AcceptDate);
//			insertQuery.addString("ProjectType", ProjectType);
//			insertQuery.addDate("PromiseDate", new Date());
////			insertQuery.addString("PromiseDate", PromiseDate);
//			insertQuery.addString("OrgName", OrgName);
//			insertQuery.addString("TargetOrgName", TargetOrgName);
//			
//			
//			//pro_process
//			insertQuery1.addString("ProjectNo", ProjectNo);
//			insertQuery1.addString("EventName","111");
//			insertQuery1.addString("ProcessName","111");
//			insertQuery1.addString("NextProcessName","111");
//			insertQuery1.addString("HandleExplain","111");
//			insertQuery1.addDate("EventStartTime",new Date());
//			insertQuery1.addDate("EventEndTime",new Date());
//			insertQuery1.addDate("CreateDate",new Date());
//			insertQuery1.addString("Remark","111");
//			
//			//pro_result
//			insertQuery2.addString("ProjectNo", ProjectNo);
//			insertQuery2.addString("HandleResultType","111");
//			insertQuery2.addString("ResultCetrNo","111");
//			insertQuery2.addString("ResultsElectronicFile","111");
//			insertQuery2.addString("ResultExplain","111");
//			insertQuery2.addDate("ResultDate",new Date());
//			insertQuery2.addString("ResultTimespan","111");
//			
//			//pro_materialcatalogue
//			insertQuery3.addString("ProjectNo", ProjectNo);
//			insertQuery3.addString("MaterialName","111");
//			insertQuery3.addString("GetType","111");
//			insertQuery3.addString("GetNum","111");
//			insertQuery3.addString("MaterialAttachName","111");
//			insertQuery3.addString("MaterialAttachGuid","111");
//			insertQuery3.addString("Remark","111");
//
//			insertQueries.add(insertQuery);
//			insertQueries.add(insertQuery1);
//			insertQueries.add(insertQuery2);
//			insertQueries.add(insertQuery3);
//		}
//		boolean success = writer.add(insertQueries);
//		System.out.println(success);
//	}
	
	/**
	 * 根据主键修改索引
	 */
//	public void modify() {
//		Writer writer = Writer.getInstance();
//		UpdateQuery updateQuery = new UpdateQuery("info", "14");
//		updateQuery.addString("title", "2016年6月部门经理绩效考核3改");
//		updateQuery.addString("se_title", "沃尔玛证明了开源是大生意");
//		updateQuery.addString("th_title", "tomcat 高并发配置");
//		updateQuery.addDate("date", new Date());
//		updateQuery.addString("content",
//				"1欢迎访问济南人社智询通，我是智能回复机器人。我现在可以为您自动解答公共就业 、社会保险、劳动维权、人事人才、职业技能培训等方面的问题。非常期待与您互动，希望人社智询通的服务能对您有所帮助。在提问时，请将问题简化，这样我会更快地回答您的问题。例如：如您要咨询如何办理和查询医疗保险？可提问：“怎么办理医疗保险？”和“怎么查询医疗保险？”");
//		boolean success = writer.modify(updateQuery);
//		System.out.println(success);
//	}

	/**
	 * 根据主键删除es库的数据
	 * @param tableName
	 * 库名称
	 * @param uuid
	 * 主键id即表中的_id
	 */
	public void removeByIid(String tableName, String uuid) {
		Writer writer = Writer.getInstance();
		// 根据主键删除(第一个参数放的是表名)
		DeleteQuery deleteQuery = new DeleteQuery(tableName, uuid);
		boolean success = writer.remove(deleteQuery);
		System.out.println(success);
	}

	/**
	 * 根据query语法删除
	 */
//	@Test
//	public void removeByQuery() {
//		Writer writer = Writer.getInstance();
//		// 根据query语法删除
//		QueryParams params = new QueryParams("colid:${colid}");
//		params.addNumber("colid", 4);
//		DeleteQuery deleteQuery = new DeleteQuery("info", params);
//		boolean success = writer.remove(deleteQuery);
//		System.out.println(success);
//	}
	
	/**
	 * 多值删除
	 */
//	@Test
//	public void removeByIds() {
//		Writer writer = Writer.getInstance();
//		// 根据query语法删除
//		// 类似数据库的 IN (xx,xx,xx,xx)
//		QueryParams params = new QueryParams(Constants.DEFAULT_PK_NAME + ":${ids}");
//		params.addArray("ids", "99", "98", "97", "96", "95");
//		DeleteQuery deleteQuery = new DeleteQuery("info", params);
//		boolean success = writer.remove(deleteQuery);
//		System.out.println(success);
//	}

	/**
	 * 删除所有数据
	 */
	
//	@RequestMapping("delete")
//	@ResponseBody
//	public String  removeAll(String table) {
//		Writer writer = Writer.getInstance();
//		DeleteQuery deleteQuery = new DeleteQuery(table, new QueryParams("*:*"));
//		boolean success = writer.remove(deleteQuery);
//		return success+"" ;
//	}
	
	/**
	 * 向es中添加办件过程数据
	 * @param task
	 * @return
	 */
	public static boolean addProcess(Map<String, Object> task) {
		Writer writer = Writer.getInstance();
		InsertQuery insertQuery = new InsertQuery("pro_process","");
		
		String EventName = String.valueOf(task.get("EventName"));
		EventName = EventName.replace("1", "通过")
				.replace("2", "退回")
				.replace("3", "其他");
		insertQuery.addString("Iid", String.valueOf(task.get("ID")));
		insertQuery.addDateTime("update_time", (Date)(task.get("update_time")));
		insertQuery.addString("RowGuid", String.valueOf(task.get("RowGuid")));
		insertQuery.addString("ProjectNo", String.valueOf(task.get("ProjectNo")));
		insertQuery.addString("EventName", EventName);
		insertQuery.addString("ProcessName", String.valueOf(task.get("ProcessName")));
		insertQuery.addString("HandleUserName", String.valueOf(task.get("HandleUserName")));
		insertQuery.addString("HandleExplain", String.valueOf(task.get("HandleExplain")));
		insertQuery.addDateTime("EventStartTime", (Date)(task.get("EventStartTime")));
		insertQuery.addDateTime("EventEndTime", (Date)(task.get("EventEndTime")));
		insertQuery.addDateTime("CreateDate", (Date)(task.get("CreateDate")));
		insertQuery.addString("Remark", String.valueOf(task.get("Remark")));
		insertQuery.addString("Cd_operation", String.valueOf(task.get("Cd_operation")));
		insertQuery.addDateTime("Cd_time", (Date)(task.get("Cd_time")));
		insertQuery.addString("Cd_batch", String.valueOf(task.get("Cd_batch")));
		insertQuery.addString("DataSource", String.valueOf(task.get("DataSource")));
		insertQuery.addString("Cd_source", String.valueOf(task.get("Cd_source")));
		insertQuery.addString("is_sync", String.valueOf(task.get("is_sync")));
		return writer.add(insertQuery);
	}
	
	/**
	 * 添加结果数据
	 * @param map
	 * @return
	 */
	public static boolean addResult(Map<String, Object> task) {
		Writer writer = Writer.getInstance();
		InsertQuery insertQuery = new InsertQuery("pro_result","");
		insertQuery.addString("Iid", String.valueOf(task.get("ID")));
		insertQuery.addDateTime("update_time", (Date)task.get("update_time"));
		insertQuery.addString("RowGuid", String.valueOf(task.get("RowGuid")));
		insertQuery.addString("ProjectNo", String.valueOf(task.get("ProjectNo")));
		insertQuery.addString("HandleUserName", String.valueOf(task.get("HandleUserName")));
		insertQuery.addDateTime("ResultDate", (Date)(task.get("ResultDate")));
		insertQuery.addString("ResultType", String.valueOf(task.get("ResultType")));
		insertQuery.addString("Satisfaction", String.valueOf(task.get("Satisfaction")));
		insertQuery.addString("ResultCetrName", String.valueOf(task.get("ResultCetrName")));
		insertQuery.addString("ResultCetrNo", String.valueOf(task.get("ResultCetrNo")));
		insertQuery.addString("ResultExplain", String.valueOf(task.get("ResultExplain")));
		insertQuery.addString("IsDeliveryResults", String.valueOf(task.get("IsDeliveryResults")));
		insertQuery.addString("Remark", String.valueOf(task.get("Remark")));
		insertQuery.addString("Cd_operation", String.valueOf(task.get("Cd_operation")));
		insertQuery.addDateTime("Cd_time", (Date)(task.get("Cd_time")));
		insertQuery.addString("Cd_batch", String.valueOf(task.get("Cd_batch")));
		insertQuery.addString("DataSource", String.valueOf(task.get("DataSource")));
		insertQuery.addString("Cd_source", String.valueOf(task.get("Cd_source")));
		return writer.add(insertQuery);
	}


	
	/**
	 * 建立别名
	 */
	@RequestMapping("bieming")
	@ResponseBody
	public void addAlias() {
//		init();
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		CmdResponse cmdResponse = indexTableCmd.addAlias("alias_pro", "pro_materialcatalogue");
		cmdResponse = indexTableCmd.addAlias("alias_pro", "pro_process");
		cmdResponse = indexTableCmd.addAlias("alias_pro", "pro_result");
		cmdResponse = indexTableCmd.addAlias("alias_pro", "pro_accept");
		System.out.println(JsonUtil.objectToString(cmdResponse));
	}
	
	/**
	 * 普通新增办件受理表
	 * @param task
	 */
	public static boolean add(Map<String, Object> task, String areaCode) {
		if(task==null || task.isEmpty() || StringUtil.isEmpty(areaCode)){
			return false;
		}
		
	    String projectNo = (String)task.get("ProjectNo");
		Writer writer = Writer.getInstance();
		InsertQuery insertQuery = new InsertQuery("pro_accept","");
		String ApplyerType = (String)task.get("ApplyerType");
		ApplyerType = ApplyerType.replace("1", "自然人")
								.replace("2", "企业法人")
								.replace("3", "事业法人")
								.replace("4", "社团法人")
								.replace("5", "行政机关")
								.replace("6", "其他组织");
		String ApplyType = (String)task.get("ApplyType");
		ApplyType = ApplyType.replace("1", "窗口办理")
							.replace("2", "网上办理")
							.replace("3", "快递申请");
		
		String ProjectType = (String)task.get("ProjectType");
		ProjectType = ProjectType.replace("1", "即办件")
								.replace("2", "承诺件");
		
		insertQuery.addString("ID", String.valueOf(task.get("ID")));
		insertQuery.addDateTime("update_time", (Date)task.get("update_time"));
		insertQuery.addString("RowGuid", (String)task.get("RowGuid"));
		insertQuery.addString("ProjectNo", projectNo);
		insertQuery.addString("CatalogCode", (String)task.get("CatalogCode"));
		insertQuery.addString("LocalCatalogCode", (String)task.get("LocalCatalogCode"));
		insertQuery.addString("TaskCode", (String)task.get("TaskCode"));
		insertQuery.addString("LocalTaskCode", (String)task.get("LocalTaskCode"));
		insertQuery.addString("TaskHandleItem", (String)task.get("TaskHandleItem"));
		insertQuery.addString("TaskName", (String)task.get("TaskName"));
		insertQuery.addString("TaskVersion", task.get("TaskVersion")+"");
		insertQuery.addString("ApplyerName", (String)task.get("ApplyerName"));
		insertQuery.addString("ApplyerType", ApplyerType);
		insertQuery.addString("ApplyerPageType", (String)task.get("ApplyerPageType"));
		insertQuery.addString("ApplyerPageCode", (String)task.get("ApplyerPageCode"));
		insertQuery.addDate("ApplyDate", (Date)task.get("ApplyDate"));
		insertQuery.addString("ApplyType", ApplyType);
		insertQuery.addString("Legal", (String)task.get("Legal"));
		insertQuery.addString("ContactName", (String)task.get("ContactName"));
		insertQuery.addString("ContactType", (String)task.get("ContactType"));
		insertQuery.addString("ContactCode", (String)task.get("ContactCode"));
		insertQuery.addString("ContactMobile", (String)task.get("ContactMobile"));
		insertQuery.addString("ZipCode", (String)task.get("ZipCode"));
		insertQuery.addString("Address", (String)task.get("Address"));
		insertQuery.addString("OrgName", (String)task.get("OrgName"));
		insertQuery.addString("OrgCode", (String)task.get("OrgCode"));
		insertQuery.addString("HandleUserName", (String)task.get("HandleUserName"));
		insertQuery.addDate("AcceptDate", (Date)task.get("AcceptDate"));
		insertQuery.addString("AcceptDocNo", (String)task.get("AcceptDocNo"));
		insertQuery.addString("ProjectName", (String)task.get("ProjectName"));
		insertQuery.addString("ProjectType", ProjectType);
		insertQuery.addDate("PromiseDate", (Date)task.get("PromiseDate"));
		insertQuery.addString("Cd_operation", (String)task.get("Cd_operation"));
		insertQuery.addDateTime("Cd_time", (Date)task.get("Cd_time"));
		insertQuery.addString("Cd_batch", (String)task.get("Cd_batch"));
		insertQuery.addString("DataSource", (String)task.get("DataSource"));
		insertQuery.addString("Cd_source", (String)task.get("Cd_source"));
		insertQuery.addString("CertKey", (String)task.get("ApplyerPageKey"));
		insertQuery.addString("AreaCode", areaCode);
		insertQuery.addString("TargetOrgName", (String)task.get("TargetOrgName"));
		insertQuery.addString("Status", "1");
		insertQuery.addString("ComplaintStatus", "0");
		insertQuery.addString("Iid", String.valueOf(task.get("ID")));
		return writer.add(insertQuery);
	}
	
	
	/**
	 * 添加办件特殊情况表数据用类
	 * @param task
	 * @param areaCode
	 * @return
	 */
	public static boolean add_specialprocedure(Map<String, Object> task, String areaCode) {
		if(task==null || task.isEmpty() || StringUtil.isEmpty(areaCode)){
			return false;
		}
			Writer writer = Writer.getInstance();
			InsertQuery insertQuery = new InsertQuery("pro_specialprocedure","");
			insertQuery.addString("Iid", String.valueOf(task.get("ID")));
			insertQuery.addDateTime("update_time", (Date)task.get("update_time"));
			insertQuery.addString("ProjectNo", (String)task.get("ProjectNo"));
			insertQuery.addString("SpecialType", (String)task.get("SpecialType"));
			insertQuery.addString("SpecialName", (String)task.get("SpecialName"));
			insertQuery.addDateTime("SpecialTime", (Date)task.get("SpecialTime"));
			insertQuery.addString("SpecialReason", (String)task.get("SpecialReason"));
			insertQuery.addString("ApplyerUserName", (String)task.get("ApplyerUserName"));
			insertQuery.addDateTime("EndTime", (Date)task.get("EndTime"));
			insertQuery.addString("Result", (String)task.get("Result"));
			insertQuery.addString("SpecialExplain", (String)task.get("SpecialExplain"));
			insertQuery.addString("HandleUser", (String)task.get("HandleUser"));
			insertQuery.addString("Remark", (String)task.get("Remark"));
			insertQuery.addString("Cd_operation", (String)task.get("Cd_operation"));
			insertQuery.addDateTime("Cd_time", (Date)task.get("Cd_time"));
			insertQuery.addString("Cd_batch", (String)task.get("Cd_batch"));
			insertQuery.addString("DataSource", (String)task.get("DataSource"));
			insertQuery.addString("Cd_source", (String)task.get("Cd_source"));
			insertQuery.addString("RowGuid", (String)task.get("RowGuid"));
			return writer.add(insertQuery);
		}
	
	/**
	 * 添加测试数据
	 * @param task
	 */
	public static void add1(Map<String, Object> task, String areaCode) {
//		for (int i = 1; i <= 10; i++) {
			Writer writer = Writer.getInstance();
			// 此处需要优先设置主键值，insertquery的第二个参数
			InsertQuery insertQuery = new InsertQuery("pro_accept","");
			String ApplyerType = (String)task.get("ApplyerType");
			ApplyerType = ApplyerType.replace("1", "自然人")
									.replace("2", "企业法人")
									.replace("3", "事业法人")
									.replace("4", "社团法人")
									.replace("5", "行政机关")
									.replace("6", "其他组织");
			
//			String ApplyerPageType = (String)task.get("ApplyerPageType");
//			ApplyerPageType = ApplyerPageType.replace("", "")
//											.replace("", "")
//											.replace("", "")
//											.replace("", "")
//											.replace("", "")
//											.replace("", "");
			
			String ApplyType = (String)task.get("ApplyType");
			ApplyType = ApplyType.replace("1", "窗口办理")
								.replace("2", "网上办理")
								.replace("3", "快递申请");
			
			String ProjectType = (String)task.get("ProjectType");
			ProjectType = ProjectType.replace("1", "即办件")
									.replace("2", "承诺件");

			
			insertQuery.addString("ProjectNo", (String)task.get("ProjectNo"));
//			insertQuery.addString("ProjectName", (String)task.get("ProjectName"));
			insertQuery.addString("TaskName", (String)task.get("TaskName"));
			insertQuery.addString("TaskCode", "11341800A72824253Z3340117021000");
//			insertQuery.addString("TaskCode", (String)task.get("TaskCode"));
			insertQuery.addString("ApplyerName", (String)task.get("ApplyerName"));
			insertQuery.addString("ApplyerType", ApplyerType);
			insertQuery.addString("ApplyerPageType", (String)task.get("ApplyerPageType"));
			//zyf
//			insertQuery.addString("CertKey", (String)task.get("ApplyerPageKey"));
			//zcl
			insertQuery.addString("CertKey", "7db69a4d82dc434e55c187a6c121e1e7a294f5241e1d3d754e9b884505b56536");
			insertQuery.addString("ApplyType", ApplyType);
			insertQuery.addString("ProjectType", ProjectType);
			insertQuery.addString("ContactName", (String)task.get("ContactName"));
			insertQuery.addString("ContactMobile", (String)task.get("ContactMobile"));
			insertQuery.addString("ApplyerPageKey", (String)task.get("ApplyerPageKey"));
			insertQuery.addString("Address", (String)task.get("Address"));
			insertQuery.addString("legal", (String)task.get("legal"));
			insertQuery.addString("OrgCode", (String)task.get("OrgCode"));
//			insertQuery.addString("AreaCode", ((String)task.get("OrgCode")).substring(2, 8));
			insertQuery.addString("AreaCode", areaCode);
			insertQuery.addString("OrgName", (String)task.get("OrgName"));
			insertQuery.addDate("AcceptDate", (Date)task.get("AcceptDate"));
			insertQuery.addDate("ApplyDate", (Date)task.get("ApplyDate"));
			insertQuery.addDate("PromiseDate", (Date)task.get("PromiseDate"));
			insertQuery.addString("TargetOrgName", (String)task.get("TargetOrgName"));
			insertQuery.addString("AcceptDocNo", (String)task.get("AcceptDocNo"));
			insertQuery.addString("ZipCode", (String)task.get("ZipCode"));
			Random r = new Random();
			
			insertQuery.addString("Status",(r.nextInt(3)+1)+"");
			insertQuery.addString("ComplaintStatus", "0");
			writer.add(insertQuery);
		}
	
	/**
	 * 查询办件结果表
	 * @param projectNo
	 * @return
	 */
	public static String getBjStatus(String projectNo){
		String bjStatus = "";
		if(StringUtil.isEmpty(projectNo)){
			return bjStatus ;
		}
		//查询办件结果表
		Integer numFromResult = SpringUtil.getBean(UserDAO.class).getCount("up_pro_result",projectNo) ;
			if(numFromResult>0){
				bjStatus = "3" ;
				return bjStatus ;
			}
		//查询办件过程表
		Integer numFromProcess = SpringUtil.getBean(UserDAO.class).getCount("up_pro_process",projectNo) ;
			if(numFromProcess>0){
				bjStatus = "2" ;
				return bjStatus ;
			}
        
		if(StringUtil.isEmpty(bjStatus)){
			bjStatus = "1" ;
		}
		
		return bjStatus ;
	}
	/**
	 * 建表（索引库）
	 * index：pro_accept
	 * 办件受理信息
	 * 
	 */
	@RequestMapping("acceptTable")
	@ResponseBody
	public void createTableAccept() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		int node = Integer.parseInt(properties.getString("node"));
		IndexTable indexTable = new IndexTable("pro_accept", node, 0);
		indexTable.addColumn(new IndexColumn("ID", "主键", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("update_time", "修改时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("RowGuid", "记录唯一标识", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectNo", "办件编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("CatalogCode", "基本编码", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("LocalCatalogCode", "地方基本编码", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("TaskCode", "实施编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("LocalTaskCode", "地方实施编码", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("TaskHandleItem", "业务办理项编码", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("TaskName", "事项名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("TaskVersion", "事项版本", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("ApplyerName", "申请人名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ApplyerType", "申请人类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ApplyerPageType", "申请人证件类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ApplyerPageCode", "申请人证件号码", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ApplyDate", "申请时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("ApplyType", "申请类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Legal", "法人代表", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("ContactName", "联系人/代理人姓名", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ContactType", "联系人证件类型", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("ContactCode", "联系人证件号码", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ContactMobile", "联系人手机号码", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ZipCode", "邮编", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Address", "通讯地址", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("OrgName", "受理部门名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("OrgCode", "统一信用社会代码", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("HandleUserName", "受理人员", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("AcceptDate", "受理时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("AcceptDocNo", "受理文书编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectName", "办件摘要", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectType", "办件类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("PromiseDate", "承诺办结时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("Cd_operation", "同步类型", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("Cd_time", "同步时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("Cd_batch", "批次号", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("DataSource", "数据来源", IndexColumnType.STRING)); 
		indexTable.addColumn(new IndexColumn("Cd_source", "所属来源", IndexColumnType.STRING));
		//
		indexTable.addColumn(new IndexColumn("CertKey", "身份证散列值", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("AreaCode", "区域代码", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("TargetOrgName", "办件目标部门", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Status", "办件状态", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ComplaintStatus", "投诉状态", IndexColumnType.STRING));
		
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
	}
	
	/**
	 * 建表（索引库）
	 * index：pro_process
	 * 办件过程信息
	 */
	@RequestMapping("processTable")
	@ResponseBody
	public void createTableProcess() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		int node = Integer.parseInt(properties.getString("node"));
		IndexTable indexTable = new IndexTable("pro_process", node, 0);
		indexTable.addColumn(new IndexColumn("Iid", "主键", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("update_time", "修改时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("RowGuid", "记录唯一标识", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectNo", "办件编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("EventName", "业务动作", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProcessName", "办理环节名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("HandleUserName", "办理人姓名", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("HandleExplain", "审批意见", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("EventStartTime", "环节开始时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("EventEndTime", "环节结束时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("CreateDate", "数据产生时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("Remark", "备注", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_operation", "同步类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_time", "同步时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("Cd_batch", "批次号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("DataSource", "数据来源", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_source", "所属来源", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("is_sync", "同步状态", IndexColumnType.STRING));
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
		
	}
	
	/**
	 * 建表（索引库）
	 * index：pro_result
	 * 办件结果信息
	 */
	@RequestMapping("resultTable")
	@ResponseBody
	public void createTableProcessResult() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		int node = Integer.parseInt(properties.getString("node"));
		IndexTable indexTable = new IndexTable("pro_result", node, 0);
		indexTable.addColumn(new IndexColumn("Iid", "主键", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("update_time","插入时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("RowGuid","记录唯一标识", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectNo", "办件编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("HandleUserName", "办结人员姓名", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ResultDate", "办结时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("ResultType", "办理结果", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Satisfaction", "满意度", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ResultCetrName", "结果证照名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ResultCetrNo", "结果证照编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ResultExplain", "办件结果描述", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("IsDeliveryResults", "是否快递递送结果", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Remark", "备注", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_operation", "同步类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_time","同步时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("Cd_batch", "批次号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("DataSource", "数据来源", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_source", "所属来源", IndexColumnType.STRING));
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
	}
	
	/**
	 * 建表（索引库）
	 * pro_materialcatalogue
	 * 办件材料目录信息
	 */
	@RequestMapping("materialcatalogueTable")
	@ResponseBody
	public void createTableProcessMaterialcatalogue() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		int node = Integer.parseInt(properties.getString("node"));
		IndexTable indexTable = new IndexTable("pro_materialcatalogue", node, 0);
		indexTable.addColumn(new IndexColumn("Iid", "主键", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("update_time","插入时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("RowGuid","记录唯一标识", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectNo", "办件编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("MaterialName", "材料名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("GetType", "收取方式", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("GetNum", "收取数量", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("MaterialAttachName", "附件名称", IndexColumnType.STRING));  //带后缀
		indexTable.addColumn(new IndexColumn("Remark", "备注", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_operation", "同步类型", IndexColumnType.STRING));  //带后缀
		indexTable.addColumn(new IndexColumn("Cd_time", "同步时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("Cd_batch", "批次号", IndexColumnType.STRING));  //带后缀
		indexTable.addColumn(new IndexColumn("DataSource", "数据来源", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_source", "所属来源", IndexColumnType.STRING));  //带后缀
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
	}
	
	
	
	
	/**
	 * 建表（索引库）
	 * index：pro_specialprocedure
	 * 办件结果信息
	 */
	@RequestMapping("specialprocedureTable")
	@ResponseBody
	public void createTableSpecialprocedure() throws Exception {
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		int node = Integer.parseInt(properties.getString("node"));
		IndexTable indexTable = new IndexTable("pro_specialprocedure1", node, 0);
		indexTable.addColumn(new IndexColumn("Iid", "主键", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("update_time","插入时间", IndexColumnType.DATE));
		indexTable.addColumn(new IndexColumn("RowGuid", "记录唯一标识", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ProjectNo", "办件编号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("SpecialType", "特别程序种类", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("SpecialName", "特别程序种类名称", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("SpecialTime", "特别程序开始日期", IndexColumnType.DATETIME));
		indexTable.addColumn(new IndexColumn("SpecialReason", "特别程序启动理由或依据", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("ApplyerUserName", "申请人", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("EndTime", "特别程序结束日期", IndexColumnType.DATETIME));
		indexTable.addColumn(new IndexColumn("Result", "特别程序结果", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("SpecialExplain", "特别程序办理意见", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("HandleUser", "办理人", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Remark", "备注", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_operation", "同步类型", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_time", "同步时间", IndexColumnType.DATETIME));
		indexTable.addColumn(new IndexColumn("Cd_batch", "批次号", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("DataSource", "数据来源", IndexColumnType.STRING));
		indexTable.addColumn(new IndexColumn("Cd_source", "所属来源", IndexColumnType.STRING));
		CmdResponse cmdResponse = indexTableCmd.add(indexTable);
	}

	/**
	 * 修改办件处理状态
	 * @param ProjectNo
	 * 办件编号
	 * @return
	 */
	public static boolean updateAcceptStatus(String ProjectNo,String status) {
		
		if(StringUtil.isEmpty(ProjectNo)){
			return false;
		}
		if (status.equals("2")) {
			Integer numFromResult = SpringUtil.getBean(UserDAO.class).getCount("up_pro_result",ProjectNo) ;
			if(numFromResult>0){
				status = "3" ;
			}
		}
		
		//查询结果表中是否cunza
		//办件信息查询
		//获取search客户端
		Searcher searcher = Searcher.getInstance();
		SearchQuery searchAccept= new SearchQuery();
		searchAccept.setSelect("*");
		searchAccept.setFrom("pro_accept");
		QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
		whereAccept.addString("ProjectNo", ProjectNo);
		searchAccept.setWhere(whereAccept);
		//searchAccept.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultAccept = searcher.search(searchAccept);
		if (MapSearchResult.isValid(resultAccept)) {
			// 获取结果集
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id = resultDatasAccept.get(0).getPkValue();
			Writer writer = Writer.getInstance();
			UpdateQuery updateQuery = new UpdateQuery("pro_accept", id);
			updateQuery.addString("Status", status);
			return writer.modify(updateQuery);
		}else{
			return false;
		}
	}

	/**
	 * 添加办件材料信息
	 * @param map
	 * @return
	 */
	public static boolean addMaterial(Map<String, Object> map) {
		Writer writer = Writer.getInstance();
		InsertQuery insertQuery = new InsertQuery("pro_materialcatalogue","");
		insertQuery.addString("Iid", String.valueOf(map.get("ID")));
		insertQuery.addDateTime("update_time", (Date)map.get("update_time"));
		insertQuery.addString("RowGuid", String.valueOf(map.get("RowGuid")));
		insertQuery.addString("ProjectNo", String.valueOf(map.get("ProjectNo")));
		insertQuery.addString("MaterialName", String.valueOf(map.get("MaterialName")));
		insertQuery.addString("GetType", String.valueOf(map.get("GetType")));
		insertQuery.addString("GetNum", String.valueOf(map.get("GetNum")));
		insertQuery.addString("MaterialAttachName", String.valueOf(map.get("MaterialAttachName")));
		insertQuery.addString("Remark", String.valueOf(map.get("Remark")));
		insertQuery.addString("Cd_operation", String.valueOf(map.get("Cd_operation")));
		insertQuery.addDateTime("Cd_time", (Date)(map.get("Cd_time")));
		insertQuery.addString("Cd_batch", String.valueOf(map.get("Cd_batch")));
		insertQuery.addString("DataSource", String.valueOf(map.get("DataSource")));
		insertQuery.addString("Cd_source", String.valueOf(map.get("Cd_source")));
		return writer.add(insertQuery);
	}

}
