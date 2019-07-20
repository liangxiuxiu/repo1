package com.hanweb.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.hanweb.common.util.StringUtil;
import com.hanweb.demo.dao.PersonDAO;
import com.hanweb.demo.dao.PersonInterestDAO;
import com.hanweb.demo.entity.Person;
import com.hanweb.demo.entity.PersonInterest;
import com.hanweb.demo.exception.DemoException;

public class PersonService {

	@Autowired
	private PersonDAO personDAO;

	@Autowired
	private PersonInterestDAO personInterestDAO;

	/**
	 * 新增一个人
	 * 
	 * @param person
	 *            人
	 * @throws DemoException
	 */
	public void add(Person person) throws DemoException {
		boolean isUnique = personDAO.isUnique(person.getIid(), person.getName());
		if (!isUnique) {
			throw new DemoException("名称重复");
		}
		try {
			Integer iid = personDAO.insert(person);
			List<Integer> interestIds = person.getInterestIds();
			PersonInterest personInterest = null;
			for (Integer interestId : interestIds) {
				personInterest = new PersonInterest();
				personInterest.setInterestId(interestId);
				personInterest.setPersonId(iid);
				personInterestDAO.insert(personInterest);
			}
		} catch (Exception e) {
			throw new DemoException("新增失败");
		}
	}

	/**
	 * 修改一个人
	 * 
	 * @param person
	 * @throws DemoException
	 */
	public void modify(Person person) throws DemoException {
		boolean isUnique = personDAO.isUnique(person.getIid(), person.getName());
		if (!isUnique) {
			throw new DemoException("名称重复");
		}
		try {
			// 更新会员信息
			personDAO.update(person);
			// 通过会员id删除会员兴趣
			personInterestDAO.deleteByPersonId(person.getIid());
			List<Integer> interestIds = person.getInterestIds();
			PersonInterest personInterest = null;
			for (Integer interestId : interestIds) {
				personInterest = new PersonInterest();
				personInterest.setInterestId(interestId);
				personInterest.setPersonId(person.getIid());
				personInterestDAO.insert(personInterest);
			}
		} catch (Exception e) {
			throw new DemoException("修改失败");
		}
	}

	/**
	 * 获得一个用户实体
	 * 
	 * @param iid
	 * @return
	 */
	public Person findById(Integer iid) throws DemoException {
		if (iid == null) {
			return null;
		}
		Person person = personDAO.queryForEntityById(iid);
		if (person == null) {
			throw new DemoException("获取会员失败");
		}
		// 获得所有会员与兴趣的关系
		List<PersonInterest> personInterests = personInterestDAO.findByPersonId(iid);
		List<Integer> interestIds = null;
		if (CollectionUtils.isNotEmpty(personInterests)) {
			interestIds = new ArrayList<Integer>();
			for (PersonInterest personInterest : personInterests) {
				interestIds.add(personInterest.getInterestId());
			}
			person.setInterestIds(interestIds);
		}
		return person;
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
			personDAO.deleteByIds(listId);
			personInterestDAO.deleteByPersonIds(listId);
		} catch (Exception e) {
			throw new DemoException("删除失败");
		}
	}
}
