package com.hanweb.demo.dao;

import java.util.List;
import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.common.basedao.Query;
import com.hanweb.demo.constant.Tables;
import com.hanweb.demo.entity.PersonInterest;

public class PersonInterestDAO extends BaseJdbcDAO<Integer, PersonInterest> {
	/**
	 * 通过人的id删除人与兴趣的关系
	 * 
	 * @param personId
	 *            人的id
	 */
	public void deleteByPersonId(Integer personId) {
		String sql = "DELETE FROM " + Tables.PERSON_INTEREST + " WHERE personid = :personId";
		Query query = createQuery(sql);
		query.addParameter("personId", personId);
		this.delete(query);
	}

	/**
	 * 通过人的id删除人与兴趣的关系
	 * 
	 * @param personIds
	 *            人的id
	 */
	public void deleteByPersonIds(List<Integer> personIds) {
		String sql = "DELETE FROM " + Tables.PERSON_INTEREST + " WHERE personid IN (:personIds)";
		Query query = createQuery(sql);
		query.addParameter("personIds", personIds);
		this.delete(query);
	}

	/**
	 * 通过兴趣的id删除人与兴趣的关系
	 * 
	 * @param interestId
	 *            兴趣id
	 */
	public void deleteByInterestId(Integer interestId) {
		String sql = "DELETE FROM " + Tables.PERSON_INTEREST + " WHERE interestid = :interestId";
		Query query = createQuery(sql);
		query.addParameter("interestId", interestId);
		this.delete(query);
	}

	/**
	 * 通过会员id获得会员的爱好
	 * 
	 * @param personId
	 * @return
	 */
	public List<PersonInterest> findByPersonId(Integer personId) {
		String sql = getEntitySql() + " WHERE personid =:personId";
		Query query = createQuery(sql);
		query.addParameter("personId", personId);
		return queryForEntities(query);
	}
}
