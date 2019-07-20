package com.hanweb.demo.entity;

import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;
import com.hanweb.demo.constant.Tables;

@Table(name = Tables.PERSON_INTEREST)
public class PersonInterest {
	@Id
	@Column(type = ColumnType.INT)
	private Integer iid;

	@Column(type = ColumnType.INT)
	private Integer personId;

	@Column(type = ColumnType.INT)
	private Integer interestId;

	public Integer getIid() {
		return iid;
	}

	public Integer getPersonId() {
		return personId;
	}

	public Integer getInterestId() {
		return interestId;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public void setPersonId(Integer personId) {
		this.personId = personId;
	}

	public void setInterestId(Integer interestId) {
		this.interestId = interestId;
	}
}
