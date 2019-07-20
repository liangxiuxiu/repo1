package com.hanweb.searchcore;

import java.util.Date;
import java.util.List;
import java.util.Map;

//import org.junit.BeforeClass;
//import org.junit.Test;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.search.Searcher;

/**
 * 搜索
 * 
 * @author 李杰
 *
 */
public class IndexSearchTest {

//	@BeforeClass
	public static void init() {
		String appPath = "E:\\workspaces1.8\\bjsjw\\WebContent";
		BaseInfo.initWithPath(appPath, "complat");
		Config.init(appPath);
	}

//	@Test
	public void test3() {
		// sql 示例
		// SELECT **** FROM info WHERE iid=1 AND (group=1 or dept=5) AND age
		// BETWEEN 21 AND 35 AND name LIKE '张三' AND class='产品部'
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, title, date");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		QueryParams where = new QueryParams(
				"iid:${iid} AND (group:${groupid} OR dept:${deptid}) AND age:${ageRange} AND name:${name} AND class:${class}");
		where.addNumber("iid", 1);
		where.addNumber("groupid", 1);
		where.addNumber("deptid", 5);
		where.addRange("ageRange", 21, 35);
		// name 的字段类型为 text
		where.addStringPhrase("name", "张三");
		// class 的字段类型为 string
		where.addString("class", "产品部");
		searchQuery.setWhere(where);
		searchQuery.addOrderBy("date", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (MapSearchResult.isValid(result)) {
			// 符合条件的总记录数（无视分页），可以看成 count结果
			long total = result.getTotal();
			// 获取结果集（分页结果）
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("title") + "\t"
						+ resultData.getDate("date").getTime());
			}
		}
	}

	/**
	 * text字段下的全文搜索
	 */
//	@Test
	public void textSearch() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, title, date, colid");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		// 同时包含 考核47 这4个字的 可以分开不一定是连在一起的
		searchQuery.setWhere(new QueryParams("title:${title}").addString("title", "考核47"));
		searchQuery.addOrderBy("colid", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (result != null) {
			System.out.println("总共命中：" + result.getTotal());
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("title") + "\t"
						+ resultData.getDate("date").getTime() + "\t" + resultData.getInt("colid"));
			}
		}
	}

	/**
	 * text字段下的左右like搜索
	 */
//	@Test
	public void likeSearch() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, title, date, colid");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		// 等同于 like '%考核47%'
		searchQuery.setWhere(new QueryParams("title:${title}").addStringPhrase("title", "考核47"));
		searchQuery.addOrderBy("colid", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (result != null) {
			System.out.println("总共命中：" + result.getTotal());
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("title") + "\t"
						+ resultData.getDate("date").getTime() + "\t" + resultData.getInt("colid"));
			}
		}
	}

	/**
	 * 型精确搜索
	 */
//	@Test
	public void intSearch() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, title, date, colid");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		searchQuery.setWhere(new QueryParams("date:${date}").addRangeDate("date", new Date(), new Date()));
		searchQuery.addOrderBy("colid", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (result != null) {
			System.out.println("总共命中：" + result.getTotal());
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("title") + "\t"
						+ resultData.getDate("date").getTime() + "\t" + resultData.getInt("colid"));
			}
		}
	}

	/**
	 * 范围搜索
	 */
//	@Test
	public void rangeSearch() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, title, date, colid");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(100);
		// searchQuery.setWhere(new QueryParams("title:\"${title}\"
		// -title:${not_title}").add("title", "经理").add("not_title", "的"));
		// searchQuery.setWhere(new QueryParams("uuid:*${uuid}*").add("uuid",
		// "80ef4361973e"));
		// searchQuery.setWhere(new
		// QueryParams("date:${date}").addNumber("date", 1487563046279l));
		searchQuery.setWhere(new QueryParams("colid:${colid}").addRange("colid", 4, 8));
		searchQuery.addOrderByScore(true);
		searchQuery.addOrderBy("colid", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (result != null) {
			System.out.println("总共命中：" + result.getTotal());
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getScore());
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("title") + "\t"
						+ resultData.getDate("date").getTime() + "\t" + resultData.getInt("colid"));
			}
		}
	}

	/**
	 * 相关度搜索
	 */
//	@Test
	public void searchScore() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, title, date, colid");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(100);
		// 这里设置各个id的权重 ^后的数字表示权重，*：* 是必须要添加的
		searchQuery.setScoreQuery(new QueryParams("*:* OR _id:${iid}^10 OR _id:${iid1}^9 OR _id:${iid2}^15")
				.addString("iid", "66").addString("iid1", "9").addString("iid2", "97"));

		// searchQuery.setWhere(new QueryParams("title:\"${title}\"
		// -title:${not_title}").add("title", "经理").add("not_title", "的"));
		// searchQuery.setWhere(new QueryParams("uuid:*${uuid}*").add("uuid",
		// "80ef4361973e"));
		// searchQuery.setWhere(new
		// QueryParams("date:${date}").addNumber("date", 1487563046279l));
		// searchQuery.setWhere(new
		// QueryParams("colid:${colid}").addRange("colid", 4, 8));
		// 这里设置指定先按照相关度排序
		searchQuery.addOrderByScore(true);
		searchQuery.addOrderBy("colid", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (result != null) {
			System.out.println("总共命中：" + result.getTotal());
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getScore());
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("title") + "\t"
						+ resultData.getDate("date").getTime() + "\t" + resultData.getInt("colid"));
			}
		}
	}

	/**
	 * String字段下的通配符搜索
	 */
//	@Test
	public void wildcardSearch() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("iid, colname, date, colid");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		// 类似 like 'xxx%'
		searchQuery.setWhere(new QueryParams("colname:${colname}").addStringLikeLeft("colname", "栏目1"));
		searchQuery.addOrderBy("colid", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (result != null) {
			System.out.println("总共命中：" + result.getTotal());
			List<ResultData> resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData.getString("iid") + "\t" + resultData.getString("colname") + "\t"
						+ resultData.getDate("date").getTime() + "\t" + resultData.getInt("colid"));
			}
		}
	}

	/**
	 * 单独计算总数
	 */
//	@Test
	public void count() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setWhere(new QueryParams("colname:${colname}").addStringLikeLeft("colname", "栏目1"));
		searchQuery.setFrom("info");
		long result = Searcher.getInstance().searchCount(searchQuery);
		System.out.println(result);
	}

	/**
	 * 分组统计
	 */
//	@Test
	public void groupCount() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setFrom("info");
		searchQuery.setGroupBy("tag");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		Map<String, Long> result = Searcher.getInstance().searchGroupCount(searchQuery);
		System.out.println(result);
	}
	
	/**
	 * 
	 */
//	@Test
	public void test4() {
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("*");
		searchQuery.setFrom("info");
		QueryParams where = new QueryParams("_id:1");
		searchQuery.setWhere(where);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		System.out.println(JsonUtil.objectToString(result));
		List<ResultData> resultDatas = null;
		if (MapSearchResult.isValid(result)) {
			long total = result.getTotal();
			resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println("11111");
				System.out.println(resultData);
			}
		}else{
			System.out.println("error");
		}
		
		
	}
}
