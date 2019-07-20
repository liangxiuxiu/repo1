package com.hanweb.complat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.complat.entity.Accept;


public class TaskDAO extends BaseJdbcDAO<Integer, Accept>{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	private String getsql(){
		
		String sql = "SELECT * FROM up_pro_accept WHERE Cd_source = 'p34' AND OrgCode LIKE '%340000%';";
		
		return sql;
	} 
	
	
	public List<Map<String, Object>>  getTask(){
		String sql = "SELECT * FROM up_pro_accept WHERE Cd_source = 'p31' AND OrgCode LIKE '%310000%' AND is_sync = '0' AND LENGTH(OrgCode) = 18 AND date_format(update_time,'%Y-%m-%d') = '2018-09-21' order by AcceptDate";
//		String sql = "SELECT * FROM up_pro_accept";
		List<Map<String, Object>> task = jdbcTemplate.queryForList(sql);
		return task;
	}
	
}
