package com.hanweb.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hanweb.common.util.StringUtil;
import com.hanweb.demo.dao.InterestDAO;
import com.hanweb.demo.entity.Interest;
import com.hanweb.demo.exception.DemoException;

public class InterestService {

	@Autowired
	private InterestDAO interestDAO;

	/**
	 * 新增兴趣
	 * 
	 * @param interest
	 * @throws DemoException
	 */
	public void add(Interest interest) throws DemoException {
		boolean isUnique = interestDAO.isUnique(interest.getIid(), interest.getName());
		if (!isUnique) {
			throw new DemoException("名称重复");
		}
		try {
			interestDAO.insert(interest);
		} catch (Exception e) {
			throw new DemoException("新增失败");
		}
	}

	/**
	 * 修改兴趣
	 * 
	 * @param interest
	 * @throws DemoException
	 */
	public void modify(Interest interest) throws DemoException {
		boolean isUnique = interestDAO.isUnique(interest.getIid(), interest.getName());
		if (!isUnique) {
			throw new DemoException("名称重复");
		}
		try {
			interestDAO.update(interest);
		} catch (Exception e) {
			throw new DemoException("修改失败");
		}
	}

	/**
	 * 通过id获得一个兴趣
	 * 
	 * @param iid
	 * @return
	 */
	public Interest findById(Integer iid) {
		if (iid == null) {
			return null;
		}
		return interestDAO.queryForEntityById(iid);
	}

	/**
	 * 获得所有的兴趣
	 * 
	 * @return
	 */
	public List<Interest> findAll() {
		return interestDAO.findAll();
	}

	/**
	 * 删除
	 * 
	 * @param ids
	 * @throws DemoException
	 */
	public void remove(String ids) throws DemoException {
		List<Integer> listId = StringUtil.toIntegerList(ids, ",");
		try {
			interestDAO.deleteByIds(listId);
		} catch (Exception e) {
			throw new DemoException("删除失败");
		}
	}
}
