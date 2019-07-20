<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="hf" uri="/hanweb-front-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用开发平台3.0</title>
<hf:head grid="true" cookie="true" select="true"></hf:head>
<script type="text/javascript">
function beforeList(){
	alert('准备调用');
}
function listUser(result, listBody){
	var html = '';
	if(result.total > 0){
		$.each(result.data, function(index, data){
			var iid = data.iid;
			var loginname = data.loginname;
			var name = data.name;
			html += '<div>';
			html += iid + '&nbsp;' + loginname + '&nbsp;' + name;
			html += '</div>';
		});
	}
	return html;
}
function completeList(){
	alert('完成调用');
}
</script>
<style>
</style>
</head>
<body>
<div id="page-title">
	开发指南 / <span id="page-location">${treeNodeName}</span>
</div>
<div id="page-content">
	<div>
	<hf:grid form="userForm" url="listdata.do" callback="listUser" before="beforeList" complete="completeList">
		<form id="userForm">
			<table border="0" class="table">
				<tr>
					<td align="right" class="label">用户id</td>
					<td><input type="text" id="iid" name="iid" maxlength="33" class="input-text" style="width: 100px" placeholder="用户id"/></td>
					<td align="right" class="label">登录名</td>
					<td>
						<input type="text" name="loginName" id="loginName" class="input-text" style="width: 100px" placeholder="登录名"/>
					</td>
					<td>
						<input type="submit" class="btn btn-primary" value="提交" />
					</td>
				</tr>
			</table>
		</form>
	</hf:grid>
	</div>
</div>
</body>
</html>