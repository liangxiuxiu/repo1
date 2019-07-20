package com.hanweb.demo.entity;

import java.util.Date;
import java.util.List;
import net.sf.oval.constraint.Length;
import net.sf.oval.constraint.NotBlank;
import net.sf.oval.constraint.NotNull;
import net.sf.oval.constraint.Size;
import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;
import com.hanweb.demo.constant.Tables;

@Table(name = Tables.PERSON)
public class Person {

	@Id
	@Column(type = ColumnType.INT)
	private Integer iid;

	@Column(type = ColumnType.VARCHAR)
	@NotBlank(message = "姓名不能为空")
	@NotNull(message = "姓名不能为空")
	@Length(max = 80, message = "姓名不能大于80个字")
	private String name;

	@Column(type = ColumnType.INT)
	private Integer degree;

	@Column(type = ColumnType.DATETIME, update = false)
	private Date createDate;

	@NotNull(message = "兴趣必须选择")
	@Size(min = 1, message = "兴趣必须选择")
	private List<Integer> interestIds = null;

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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public List<Integer> getInterestIds() {
		return interestIds;
	}

	public void setInterestIds(List<Integer> interestIds) {
		this.interestIds = interestIds;
	}

	public Integer getDegree() {
		return degree;
	}

	public void setDegree(Integer degree) {
		this.degree = degree;
	}
}
