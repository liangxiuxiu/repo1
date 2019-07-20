package com.hanweb.complat.entity;

import java.util.ArrayList;
import java.util.List;

import com.hanweb.common.annotation.Column;
import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.annotation.Id;
import com.hanweb.common.annotation.Table;
import com.hanweb.complat.constant.Tables;

/**
 * 办件实体
 * @author jiangzt
 *
 */
@Table(name = "task")
public class Accept {
	
	//办件编号
	@Id
	@Column(type = ColumnType.INT)
	public String ProjectNo;
	//办件摘要
	public String ProjectName;
	//事项名称
	public String TaskName;
	//实施编号
	public String TaskCode;
	//申请人名称
	public String ApplyerName;
	//申请人类型
	public String ApplyerType;
	//申请人证件类型
	public String ApplyerPageType;
	//申请人证件号码
//	public String ApplyerPageCode;
	//身份证散列值
	public String CertKey;
	//申请类型
	public String ApplyType;
	//办件类型
	public String ProjectType;
	//联系人/代理人姓名
	public String ContactName;
	//联系人手机号码
	public String ContactMobile;
	//通讯地址
	public String Address;
	//法人
	public String legal;
	//统一信用社会代码
	public String OrgCode;
	//区域代码
	public String AreaCode;
	//受理部门名称
	public String OrgName;
	//受理时间
	public String AcceptDate;	
	//申请时间
	public String ApplyDate;
	//承诺办结时间
	public String PromiseDate;	
	//办件目标部门
	public String TargetOrgName;
	//办件状态
	public String ZipCode;	
	//投诉状态
	public String CommitStatus;
	
	public String Cd_source;
	
	

	public String getCd_source() {
		return Cd_source;
	}
	public void setCd_source(String cd_source) {
		Cd_source = cd_source;
	}
	public String getProjectNo() {
		return ProjectNo;
	}
	public void setProjectNo(String projectNo) {
		ProjectNo = projectNo;
	}
	public String getProjectName() {
		return ProjectName;
	}
	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}
	public String getTaskName() {
		return TaskName;
	}
	public void setTaskName(String taskName) {
		TaskName = taskName;
	}
	public String getTaskCode() {
		return TaskCode;
	}
	public void setTaskCode(String taskCode) {
		TaskCode = taskCode;
	}
	public String getApplyerName() {
		return ApplyerName;
	}
	public void setApplyerName(String applyerName) {
		ApplyerName = applyerName;
	}
	public String getApplyerType() {
		return ApplyerType;
	}
	public void setApplyerType(String applyerType) {
		ApplyerType = applyerType;
	}
	public String getApplyerPageType() {
		return ApplyerPageType;
	}
	public void setApplyerPageType(String applyerPageType) {
		ApplyerPageType = applyerPageType;
	}
//	public String getApplyerPageCode() {
//		return ApplyerPageCode;
//	}
//	public void setApplyerPageCode(String applyerPageCode) {
//		ApplyerPageCode = applyerPageCode;
//	}
	public String getCertKey() {
		return CertKey;
	}
	public void setCertKey(String certKey) {
		CertKey = certKey;
	}
	public String getApplyType() {
		return ApplyType;
	}
	public void setApplyType(String applyType) {
		ApplyType = applyType;
	}
	public String getProjectType() {
		return ProjectType;
	}
	public void setProjectType(String projectType) {
		ProjectType = projectType;
	}
	public String getContactName() {
		return ContactName;
	}
	public void setContactName(String contactName) {
		ContactName = contactName;
	}
	public String getContactMobile() {
		return ContactMobile;
	}
	public void setContactMobile(String contactMobile) {
		ContactMobile = contactMobile;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getLegal() {
		return legal;
	}
	public void setLegal(String legal) {
		this.legal = legal;
	}
	public String getOrgCode() {
		return OrgCode;
	}
	public void setOrgCode(String orgCode) {
		OrgCode = orgCode;
	}
	public String getAreaCode() {
		return AreaCode;
	}
	public void setAreaCode(String areaCode) {
		AreaCode = areaCode;
	}
	public String getOrgName() {
		return OrgName;
	}
	public void setOrgName(String orgName) {
		OrgName = orgName;
	}
	public String getAcceptDate() {
		return AcceptDate;
	}
	public void setAcceptDate(String acceptDate) {
		AcceptDate = acceptDate;
	}
	public String getApplyDate() {
		return ApplyDate;
	}
	public void setApplyDate(String applyDate) {
		ApplyDate = applyDate;
	}
	public String getPromiseDate() {
		return PromiseDate;
	}
	public void setPromiseDate(String promiseDate) {
		PromiseDate = promiseDate;
	}
	public String getTargetOrgName() {
		return TargetOrgName;
	}
	public void setTargetOrgName(String targetOrgName) {
		TargetOrgName = targetOrgName;
	}
	public String getZipCode() {
		return ZipCode;
	}
	public void setZipCode(String zipCode) {
		ZipCode = zipCode;
	}
	public String getCommitStatus() {
		return CommitStatus;
	}
	public void setCommitStatus(String commitStatus) {
		CommitStatus = commitStatus;
	}
	
	
}
