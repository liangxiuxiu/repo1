package com.hanweb.elasticsearch.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.common.basedao.Query;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.complat.entity.Accept;

/**
 * ES数据库访问层
 * @author jiangzt
 *
 */
public class ESDao extends BaseJdbcDAO<Integer, Accept> {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//通用查询语句
	private String getsql(){
		
		String sql = "SELECT * FROM up_pro_accept WHERE Cd_source = 'p34' AND OrgCode LIKE '%340000%';";
		
		return sql;
	} 
	
	
	public List<Map<String, Object>>  getTask(){
//		num = num*50+1;
		String sql = "SELECT * FROM up_pro_accept WHERE Cd_source = 'p31' AND OrgCode LIKE '%310000%' AND is_sync = '0' AND LENGTH(OrgCode) = 18 AND date_format(update_time,'%Y-%m-%d') = '2018-09-21' order by AcceptDate";
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		Map<String, Object> map = task.get(0);
		System.out.println(map);
		return task;
	}

	public List<Map<String, Object>> getProProcessValue() {
		String sql = "SELECT * FROM up_pro_accept limit 2";
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
//		Map<String, Object> map = task.get(0);
		System.out.println(JsonUtil.objectToString(task));
		return task;
	}


	public List<Map<String, Object>> getAcceptList(int limitLength, String is_sync) {
//		String sql = "SELECT * FROM up_pro_accept where is_sync !=:is_sync limit :limitLength";
//		Query query = createQuery(sql);
//		query.addParameter("is_sync", is_sync);
//		query.addParameter("limitLength", limitLength);
//		return this.queryForEntities(query);
		String sql = "SELECT * FROM up_pro_accept where is_sync ="+is_sync+" limit "+limitLength;
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		return task;
	}


	public boolean updateAccept(Long id) {
		String sql = "UPDATE `up_pro_accept` SET`is_sync`='1' WHERE (`ID`='"+id+"')";
		return jdbcTemplate.update(sql)>0? true:false;
	}


	public List<Map<String, Object>> getMaterialList(int limitLength, String is_sync) {
		String sql = "SELECT * FROM up_pro_material where is_sync ="+is_sync+" limit "+limitLength;
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		return task;
	}


	public boolean updateMaterial(Long id) {
		String sql = "UPDATE `up_pro_material` SET`is_sync`='1' WHERE (`ID`='"+id+"')";
		return jdbcTemplate.update(sql)>0? true:false;
	}

	public List<Map<String, Object>> getProcessList(int limitLength, String is_sync) {
		String sql = "SELECT * FROM up_pro_process where is_sync ="+is_sync+" limit "+limitLength;
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		return task;
	}


	public boolean updateProcess(Long id) {
		String sql = "UPDATE `up_pro_process` SET`is_sync`='1' WHERE (`ID`='"+id+"')";
		return jdbcTemplate.update(sql)>0? true:false;
	}

	
	public List<Map<String, Object>> getResultList(int limitLength, String is_sync) {
		String sql = "SELECT * FROM up_pro_result where is_sync ="+is_sync+" limit "+limitLength;
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		return task;
	}


	public boolean updateResult(Long id) {
		String sql = "UPDATE `up_pro_result` SET`is_sync`='1' WHERE (`ID`='"+id+"')";
		return jdbcTemplate.update(sql)>0? true:false;
	}


	public List<Map<String, Object>> getSpecialProcedureList(int limitLength, String is_sync) {
		String sql = "SELECT * FROM up_pro_specialprocedure where is_sync ="+is_sync+" limit "+limitLength;
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		return task;
	}


	public boolean updateSpecialProcedure(Long id) {
		String sql = "UPDATE `up_pro_specialprocedure` SET`is_sync`='1' WHERE (`ID`='"+id+"')";
		return jdbcTemplate.update(sql)>0? true:false;
	}


	public long getDataLong(String tableName) {
		String sql = "SELECT count(1) from "+tableName ;
		Query query = createQuery(sql) ;
		return this.queryForInteger(query);
	}

	public boolean deleteAccept(String is_sync,String newTime) {
		String sql = "DELETE FROM up_pro_accept WHERE is_sync = :is_sync AND update_time<:newTime";
		Query query = createQuery(sql);
		query.addParameter("is_sync", is_sync);
		query.addParameter("newTime", newTime);
		return this.delete(query);
	}

	public boolean deleteProaccept(String is_sync, String newTime) {
		String sql = "DELETE FROM up_pro_process WHERE is_sync = :is_sync AND update_time<:newTime";
		Query query = createQuery(sql);
		query.addParameter("is_sync", is_sync);
		query.addParameter("newTime", newTime);
		return this.delete(query);
	}


	public boolean deleteResult(String is_sync, String newTime) {
		String sql = "DELETE FROM up_pro_result WHERE is_sync = :is_sync AND update_time<:newTime";
		Query query = createQuery(sql);
		query.addParameter("is_sync", is_sync);
		query.addParameter("newTime", newTime);
		return this.delete(query);
	}


	public boolean deleteMaterial(String is_sync, String newTime) {
		String sql = "DELETE FROM up_pro_material WHERE is_sync = :is_sync AND update_time<:newTime";
		Query query = createQuery(sql);
		query.addParameter("is_sync", is_sync);
		query.addParameter("newTime", newTime);
		return this.delete(query);
	}


	public Integer getAccetpCount(String is_sync) {
		String sql = "select count(is_sync) from up_pro_accept where is_sync= :is_sync ";
		Query query = createQuery(sql);
		query.addParameter("is_sync", is_sync);
	
		return this.queryForInteger(query);
	}


	public Integer getResultCount(String is_sync) {
		String sql = "select count(is_sync) from up_pro_result where is_sync= :is_sync ";
		Query query = createQuery(sql);
		query.addParameter("is_sync", is_sync);
		return this.queryForInteger(query);
	}

}
