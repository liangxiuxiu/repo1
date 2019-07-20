package com.hanweb.appcheck.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanweb.appcheck.entity.App;
import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.common.basedao.Query;
import com.hanweb.common.basedao.UpdateSql;
import com.hanweb.common.util.NumberUtil;

@Repository("com.hanweb.appcheck.dao.AppDAO")
public class AppDAO extends BaseJdbcDAO<Integer, App> {

	/**
	 * 根据appid判断该应用是否存在
	 * @param appid
	 * @return
	 */
	public Integer checkByAppidAndName(App app){
		String sql = "SELECT iid FROM " + App.TABLE + " WHERE (appid = :appid OR appname = :appname)";
		if(NumberUtil.getInt(app.getIid()) > 0) {
			sql += " AND iid <> :iid";
		}
		Query query = createQuery(sql);
		query.addParameter("appid", app.getAppid());
		query.addParameter("appname", app.getAppname());
		if(NumberUtil.getInt(app.getIid()) > 0) {
			query.addParameter("iid", NumberUtil.getInt(app.getIid()));
		}
		return NumberUtil.getInt(queryForInteger(query));
	}
	
	/**
	 * 根据iid查出实体
	 * @param iid
	 * @return
	 */
	public App findByIid(int iid){
		String sql = getEntitySql() + " WHERE iid=:iid";
		Query query = createQuery(sql);
		query.addParameter("iid", iid);
		return queryForEntity(query);
	}
	
	/**
	 * 根据appid查出实体
	 * @param appid
	 * @return
	 */
	public App findByAppid(String appid){
		String sql = getEntitySql() + " WHERE appid = :appid";
		Query query = createQuery(sql);
		query.addParameter("appid", appid);
		return queryForEntity(query);
	}
	
	/**
	 * 修改应用管理开关状态位
	 * @param iid
	 * @param isOpen
	 * @return
	 */
	public boolean updateOpen(Integer iid, String isOpen){
		UpdateSql sql = new UpdateSql(App.TABLE);
		
		sql.addString("isOpen", isOpen);
		sql.setWhere("iid = :iid");
		sql.addWhereParamInt("iid", iid);
		
		return super.update(sql);
	}
	
	/**
	 * 查出全部应用实体
	 * @return
	 */
	public List<App> findAll(){
		Query query = createQuery(this.getEntitySql());
		return queryForEntities(query);
	}
	
	/**
	 * 根据id传查出实体list
	 * @param ids
	 * @return
	 */
	public List<App> findByids(String ids){
		String sql = this.getEntitySql() + " WHERE iid IN (:ids)";
		Query query = createQuery(sql);
		query.addParameter("ids", ids);
		return queryForEntities(query);
	}
}
