<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="hf" uri="/hanweb-front-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用开发平台3.0</title>
<hf:head select="true" placeholder="true" checkpwd="true" validity="true" message="true"></hf:head>
<script type="text/javascript">
$(function(){
	$('#form').validity(function() {
		$('#iid').require('iid必须填写');
		$('#loginName').require('登录名称必须填写');
	});
});
</script>
</head>
<body>
<div id="page-title">
	开发指南 / <span id="page-location">${treeNodeName}</span>
</div>
<div id="page-content">
<form id="form" action="">
	<table border="0" class="table" style="text-align: left;">
		<tr>
			<td align="right" class="label">用户id：</td>
			<td>
				<input type="text" id="iid" name="iid" maxlength="33" class="input-text"/>
			</td>
			<td align="right" class="label">登录名：</td>
			<td>
				<input type="text" name="loginName" id="loginName" class="input-text" placeholder="登录名" validity-error="loginname-error"/>
				<span id="loginname-error" class="validity-error"></span>
			</td>
		</tr>
		<tr>
			<td align="right" class="label">姓名：</td>
			<td><input type="text" id="name" name="name" maxlength="33" class="input-text"/></td>
			<td align="right" class="label">性别：</td>
			<td>
				<label>男：<input name="sex" type="radio" value="" checked="checked"></label>
				<label>女：<input name="sex" type="radio" value=""></label>
			</td>
		</tr>
		<tr>
			<td align="right" class="label">密码：</td>
			<td>
				<input type="password" id="password" name="password" maxlength="33" class="input-text" pwdpower="pwdpower"/>
				<ul id="pwdpower">
					<li class="pweak"></li>
					<li class="pmedium"></li>
					<li class="pstrong"></li>
				</ul>
			</td>
			<td align="right" class="label">重复密码：</td>
			<td>
				<input type="password" name="repassword" id="repassword" class="input-text"/>
			</td>
		</tr>
		<tr>
			<td align="right" class="label">证件类型：</td>
			<td>
				<select id="cert-type" style="font-size: 14px">
					<option value="1">身份证</option>
					<option value="2">军官证</option>
					<option value="3">学生证</option>
					<option value="4">房产证</option>
				</select>
			</td>
			<td align="right" class="label">证件编号：</td>
			<td>
				<input type="text" name="cert-no" id="cert-no" class="input-text" placeholder="证件编号"/>
			</td>
		</tr>
		<tr>
			<td align="right" class="label">自我介绍：</td>
			<td colspan="3">
				<textarea class="input-textarea" name="desc" id="desc" style="width: 715px" placeholder="自我介绍"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center;">
				<input type="submit" class="btn btn-primary" value="提 交">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn" value="重 置">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>