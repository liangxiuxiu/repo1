package com.hanweb.searchcore;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanweb.common.BaseInfo;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.search.Searcher;

@Controller
@RequestMapping("esTest")
public class esTest {

	@RequestMapping("es")
	@ResponseBody
	public List test3() {
		String appPath = "D:\\tomcat-7\\bjsjw\\webapps\\bjsjw";
		BaseInfo.initWithPath(appPath, "complat");
		Config.init(appPath);
		// sql 示例
		// SELECT **** FROM info WHERE iid=1 AND (group=1 or dept=5) AND age
		// BETWEEN 21 AND 35 AND name LIKE '张三' AND class='产品部'
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("*");
		searchQuery.setFrom("info");
		searchQuery.setP(1);
		searchQuery.setOffset(10);
		QueryParams where = new QueryParams("*:*");
		searchQuery.setWhere(where);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		List<ResultData> resultDatas = null;
		if (MapSearchResult.isValid(result)) {
			// 符合条件的总记录数（无视分页），可以看成 count结果
			long total = result.getTotal();
			System.out.println("total:"+total);
			// 获取结果集（分页结果）
			resultDatas = result.getItems();
			for (ResultData resultData : resultDatas) {
				System.out.println(resultData);
			}
			
		}else{
			System.out.println("error");
		}
		return resultDatas;
	}
	
	@RequestMapping("eee")
	@ResponseBody
	public String test() {
		return "123321";
	}
}
