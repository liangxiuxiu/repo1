package com.hanweb.demo.entity;

import java.util.List;

import net.sf.oval.constraint.Length;
import net.sf.oval.constraint.NotBlank;
import net.sf.oval.constraint.NotNull;

import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;
import com.hanweb.demo.constant.Tables;

@Table(name = Tables.INTEREST)
public class Interest {

	@Id
	@Column(type = ColumnType.INT)
	private Integer iid;

	@Column(type = ColumnType.VARCHAR)
	@NotNull(message = "兴趣名称不可以为空")
	@NotBlank(message = "兴趣名称不可以为空")
	@Length(max = 33, message = "兴趣名称不可以超过33字符")
	private String name;

	private List<Person> persons = null;

	public Integer getIid() {
		return iid;
	}

	public String getName() {
		return name;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Person> getPersons() {
		return persons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}
}
