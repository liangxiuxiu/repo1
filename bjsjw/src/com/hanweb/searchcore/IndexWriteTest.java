package com.hanweb.searchcore;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

//import org.junit.BeforeClass;
//import org.junit.Test;


import java.util.UUID;

import net.sf.ehcache.CacheOperationOutcomes.RemoveAllOutcome;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.DateUtil;
import com.hanweb.searchcore.bean.Constants;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.query.DeleteQuery;
import com.hanweb.searchcore.client.query.InsertQuery;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.UpdateQuery;
import com.hanweb.searchcore.client.write.Writer;

/**
 * 写索引测试
 * 
 * @author 李杰
 *
 */
public class IndexWriteTest {
	
	public static void main(String[] args) {
		String OrgCode = null;
//		init();
//		for (int j = 1; j <= 10000; j++) {
//			System.out.println("第"+j+"条数据开始导入");
//			if(j%50 == 1){
//				OrgCode = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0,12); 
//			}
//			bulkAdd(OrgCode);
//			System.out.println("第"+j+"条数据结束导入");
//		}
//		add();
		
//		removeAll();
	}

//	@BeforeClass
	public static void init() {
		String appPath = "D:\\tomcat-7\\bjsjw\\webapps\\bjsjw";
		BaseInfo.initWithPath(appPath, "complat");
		Config.init(appPath);
	}

	/**
	 * 普通新增
	 */
//	@Test
	public static void add() {
		for (int i = 1; i <= 100; i++) {
			Writer writer = Writer.getInstance();
			// 此处需要优先设置主键值，insertquery的第二个参数
			InsertQuery insertQuery = new InsertQuery("info", i + "");
			int colid = new Random().nextInt(100);
			insertQuery.addInt("colid", colid);
			boolean isref = false;
			if (i % 3 == 0) {
				int b = new Random().nextInt(3);
				if (b > 1) {
					int refid = new Random().nextInt(10);
					if (refid == 0) {
						refid = 1;
					}
					insertQuery.addInt("refid", refid);
					isref = true;
				}
			}
			insertQuery.addString("colname", "栏目" + colid);

			insertQuery.addDate("date", new Date());
			String day = (new Random().nextInt(29) + 1) + "";
			if (day.length() == 1) {
				day = "0" + day;
			}
			insertQuery.addDateTime("pubdate", DateUtil.stringtoDate("2017-07-" + day, DateUtil.YYYY_MM_DD));
			if (!isref) {
				insertQuery.addString("title", "2016年6月部门经理绩效考核" + i);
				insertQuery.addString("content",
						"欢迎访问济南人社智询通，我是智能回复机器人。我现在可以为您自动解答公共就业 、社会保险、劳动维权、人事人才、职业技能培训等方面的问题。非常期待与您互动，希望人社智询通的服务能对您有所帮助。在提问时，请将问题简化，这样我会更快地回答您的问题。例如：如您要咨询如何办理和查询医疗保险？可提问：“怎么办理医疗保险？”和“怎么查询医疗保险？”");
			}
			insertQuery.addString("tag", "办事服务,行政审批");
			boolean success = writer.add(insertQuery);
			System.out.println(success);
		}
	}

	/**
	 * 批量新增
	 * @param orgCode 
	 */
//	@Test
	public static void bulkAdd(String orgCode) {
		Writer writer = Writer.getInstance();
		List<InsertQuery> insertQueries = new ArrayList<InsertQuery>();
		String CatalogCode = null;  //实施编码 1000
//		String OrgCode = null;		//受理部门 100
		String CertKey = null;		//用户散列值1000
		String ProjectNo = null;	//办件编号
		String TaskName = "事项测试";		//事项名称
		String ApplyerName = "梁宵鹏";  //申请人名称
		String ApplyDate = "";	//申请时间
		String ApplyType = "";	//申请类型
		String ContactName = "张俊港";	//联系人名称
		String ContactMobile = "152xxxx5983";//联系方式
		String Address = "北京市xxxx";		//联系地址
		String AcceptDate = "";	//受理时间
		String ProjectType = "即办型";	//事项类型
		String PromiseDate = "";	//承诺时间
		String OrgName = "发改委";
		String TargetOrgName = "发改委";//目标部门
		
		for (int i = 1; i <= 100; i++) {
//			System.out.println("第"+i+"条记录开始插入");
			// 此处需要优先设置主键值，insertquery的第二个参数
			InsertQuery insertQuery = new InsertQuery("pro_accept", i + "");
//			if(i%5000 == 1) {
				
//			}
//			if(i%100 == 1) {
				CatalogCode = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0,20);  
//			}
//			if(i%100 ==1 ) {
				CertKey = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "").substring(0,18);
//			}
			ProjectNo = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
			insertQuery.addString("CatalogCode", CatalogCode);
			insertQuery.addString("OrgCode", orgCode);
			insertQuery.addString("CertKey", CertKey);
			insertQuery.addString("ProjectNo", ProjectNo);
			insertQuery.addString("TaskName", TaskName);
			insertQuery.addString("ApplyerName", ApplyerName);
			insertQuery.addDate("ApplyDate", new Date());
//			insertQuery.addString("ApplyDate", ApplyDate);
			insertQuery.addString("ApplyType", ApplyType);
			insertQuery.addString("ContactName", ContactName);
			insertQuery.addString("ContactMobile", ContactMobile);
			insertQuery.addString("Address", Address);
			insertQuery.addDate("AcceptDate", new Date());
//			insertQuery.addString("AcceptDate", AcceptDate);
			insertQuery.addString("ProjectType", ProjectType);
			insertQuery.addDate("PromiseDate", new Date());
//			insertQuery.addString("PromiseDate", PromiseDate);
			insertQuery.addString("OrgName", OrgName);
			insertQuery.addString("TargetOrgName", TargetOrgName);
//			int colid = new Random().nextInt(100);
//			insertQuery.addInt("colid", colid);
//			boolean isref = false;
//			if (i % 3 == 0) {
//				int b = new Random().nextInt(3);
//				if (b > 1) {
//					int refid = new Random().nextInt(10);
//					if (refid == 0) {
//						refid = 1;
//					}
//					insertQuery.addInt("refid", refid);
//					isref = true;
//				}
//			}
//			insertQuery.addString("colname", "栏目" + colid);
//
//			insertQuery.addDate("date", new Date());
//			String day = (new Random().nextInt(29) + 1) + "";
//			if (day.length() == 1) {
//				day = "0" + day;
//			}
//			insertQuery.addDateTime("pubdate", DateUtil.stringtoDate("2017-07-" + day, DateUtil.YYYY_MM_DD));
//			if (!isref) {
//				insertQuery.addString("title", "2016年6月部门经理绩效考核" + i);
//				insertQuery.addString("content",
//						"欢迎访问济南人社智询通，我是智能回复机器人。我现在可以为您自动解答公共就业 、社会保险、劳动维权、人事人才、职业技能培训等方面的问题。非常期待与您互动，希望人社智询通的服务能对您有所帮助。在提问时，请将问题简化，这样我会更快地回答您的问题。例如：如您要咨询如何办理和查询医疗保险？可提问：“怎么办理医疗保险？”和“怎么查询医疗保险？”");
//			}
//			insertQuery.addString("tag", "办事服务,行政审批");
//			System.out.println("第"+i+"条记录结束插入");
			insertQueries.add(insertQuery);
		}
		boolean success = writer.add(insertQueries);
		System.out.println(success);
	}

	/**
	 * 根据主键修改索引
	 */
//	@Test
	public void modify() {
		Writer writer = Writer.getInstance();
		UpdateQuery updateQuery = new UpdateQuery("info", "14");
		updateQuery.addString("title", "2016年6月部门经理绩效考核3改");
		updateQuery.addString("se_title", "沃尔玛证明了开源是大生意");
		updateQuery.addString("th_title", "tomcat 高并发配置");
		updateQuery.addDate("date", new Date());
		updateQuery.addString("content",
				"1欢迎访问济南人社智询通，我是智能回复机器人。我现在可以为您自动解答公共就业 、社会保险、劳动维权、人事人才、职业技能培训等方面的问题。非常期待与您互动，希望人社智询通的服务能对您有所帮助。在提问时，请将问题简化，这样我会更快地回答您的问题。例如：如您要咨询如何办理和查询医疗保险？可提问：“怎么办理医疗保险？”和“怎么查询医疗保险？”");
		boolean success = writer.modify(updateQuery);
		System.out.println(success);
	}

	/**
	 * 根据主键删除
	 */
//	@Test
	public void removeByIid() {
		Writer writer = Writer.getInstance();
		// 根据主键删除
		DeleteQuery deleteQuery = new DeleteQuery("info", "92");
		boolean success = writer.remove(deleteQuery);
		System.out.println(success);
	}

	/**
	 * 根据query语法删除
	 */
//	@Test
	public void removeByQuery() {
		Writer writer = Writer.getInstance();
		// 根据query语法删除
		QueryParams params = new QueryParams("colid:${colid}");
		params.addNumber("colid", 4);
		DeleteQuery deleteQuery = new DeleteQuery("info", params);
		boolean success = writer.remove(deleteQuery);
		System.out.println(success);
	}
	
	/**
	 * 多值删除
	 */
//	@Test
	public void removeByIds() {
		Writer writer = Writer.getInstance();
		// 根据query语法删除
		// 类似数据库的 IN (xx,xx,xx,xx)
		QueryParams params = new QueryParams(Constants.DEFAULT_PK_NAME + ":${ids}");
		params.addArray("ids", "99", "98", "97", "96", "95");
		DeleteQuery deleteQuery = new DeleteQuery("info", params);
		boolean success = writer.remove(deleteQuery);
		System.out.println(success);
	}

	/**
	 * 删除所有数据
	 */
//	@Test
	public static void removeAll() {
		Writer writer = Writer.getInstance();
		DeleteQuery deleteQuery = new DeleteQuery("info", new QueryParams("*:*"));
		boolean success = writer.remove(deleteQuery);
		System.out.println(success);
	}
}
