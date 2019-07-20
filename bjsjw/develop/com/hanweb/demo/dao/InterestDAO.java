package com.hanweb.demo.dao;

import java.util.List;
import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.common.basedao.Query;
import com.hanweb.common.util.StringUtil;
import com.hanweb.demo.constant.Tables;
import com.hanweb.demo.entity.Interest;

public class InterestDAO extends BaseJdbcDAO<Integer, Interest> {
	/**
	 * 是否唯一
	 * 
	 * @param iid
	 * @param name
	 * @return
	 */
	public boolean isUnique(Integer iid, String name) {
		String sql = "SELECT COUNT(*) FROM " + Tables.INTEREST + " WHERE 1=1";
		if (iid != null) {
			sql += " AND iid <> :iid";
		}
		if (StringUtil.isNotEmpty(name)) {
			sql += " AND name=:name";
		}
		Query query = createQuery(sql);
		query.addParameter("iid", iid);
		query.addParameter("name", name);
		int count = queryForInteger(query);
		if (count > 0) {
			// 不唯一
			return false;
		} else {
			// 唯一
			return true;
		}
	}

	/**
	 * 获得所有兴趣
	 * 
	 * @return
	 */
	public List<Interest> findAll() {
		String sql = getEntitySql();
		Query query = createQuery(sql);
		return queryForEntities(query);
	}
}
