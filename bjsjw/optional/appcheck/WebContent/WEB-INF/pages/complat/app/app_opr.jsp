<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>应用管理_opr</title>
<h:head pagetype="dialog" validity="true" tip="true"></h:head>
<!--使用${contextPath}可以获得应用路径，并无/结尾-->
<style type="text/css">
.cusparam{
	float: left;
}
.cusparam-input{
	width: 110px;
	margin-left: 5px;
}
.text_wrap{
	width: 300px;
	word-break: break-all;
	word-wrap: break-word;
}
</style>
<script>
/**
* 表单验证
*/
$(function(){
	$('#oprform').validity(function() {
		$("#appname").require('应用名称不能为空').maxLength(255, '应用名称不能超过255个字');
		//$("#ipadd").require('ip地址不能为空');
		if($("#paramKey").val().length > 0 || $("#paramValue").val().length > 0){
			$("#paramKey").require('自定义参数名称不能为空').maxLength(255, '自定义参数名称不能超过255个字');
			$("#paramValue").require('自定义参数值不能为空').maxLength(255, '自定义参数值不能超过255个字');
		}
	},{
		success:function(result){
			if(result.success){
				closeDialog(true);
			}else{
				alert(result.message);
			}
		}
	});
});
</script>
</head>
<body>
	<form action="${url }" method="post" id="oprform">
		<!--隐藏变量区-->
		<input type="hidden" name="iid" id="iid" value="${app.iid}" />
		<input type="hidden" name="prK" id="prK" value="${app.prK}"/>
		<div id="dialog-content">
        	<!--表单主体-->
			<table border="0" align="center" cellpadding="10" cellspacing="0"
				class="table">
                <tr>
					<td align="right" class="label">应用名称</td>
					<td class="required">*</td>
					<td><input type="text" id="appname" name="appname" maxlength="255"
						class="input-text" value="${app.appname }" /></td>
				</tr>
				<tr>
					<td align="right" class="label">appid</td>
					<td class="required">*</td>
					<td><div class="text_wrap">${app.appid}</div>
					<input type="hidden" id="appid" name="appid" value="${app.appid}" /></td>
				</tr>
				<tr>
					<td align="right" class="label">appsecret</td>
					<td class="required">*</td>
					<td><div class="text_wrap">${app.appsecret}</div>
					<input type="hidden" id="appsecret" name="appsecret" value="${app.appsecret}" /></td>
				</tr>
				<tr>
					<td align="right" class="label">公钥</td>
					<td class="required">*</td>
					<td><div class="text_wrap">${app.puK}</div>
					<input type="hidden" name="puK" id="puK" value="${app.puK}"/></td>
				</tr>
				<tr>
					<td align="right" class="label">ip地址</td>
					<td><h:tip title="多个用英文逗号“,”分隔，留空则不校验ip地址"></h:tip></td>
					<td><textarea id="ipadd" name="ipadd"
						class="input-textarea">${app.ipadd }</textarea></td>
				</tr>
				<tr>
					<td align="right" class="label">自定义参数</td>
					<td class="required"></td>
					<td>
						<div class="cusparam">
							名称<input type="text" id="paramKey" name="paramKey"
								maxlength="255" class="input-text cusparam-input"
								<c:forEach items="${app.cusParam}" 
						var="item">value="${item.key}"</c:forEach>/>
						</div>
						<div class="cusparam" style="margin-left: 5px;">
							数值<input type="text" id="paramValue" name="paramValue"
								maxlength="255" class="input-text cusparam-input"
								<c:forEach items="${app.cusParam}" var="item">value="${item.value}"</c:forEach>/>
						</div>
					</td>
				</tr>
			</table>
		</div>
        <!--表单按钮区-->
		<div id="dialog-toolbar">
			<div id="dialog-toolbar-panel">
				<input type="submit" class="btn btn-primary" value="保存" /> <input
					type="button" class="btn" value="取消" onclick="closeDialog();" />
			</div>
		</div>
	</form>
</body>
</html>