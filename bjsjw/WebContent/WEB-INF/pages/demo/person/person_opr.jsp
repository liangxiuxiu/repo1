<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员</title>
<h:head pagetype="dialog" validity="true" calendar="true" select="true"></h:head>
<!--使用${contextPath}可以获得应用路径，并无/结尾-->
<script>
	/**
	 * 表单验证
	 */
	$(function() {
		$('#oprform').validity(function() {

			$('#name').require('会员名称不能为空').match('username1', '会员名称只能由字母、数字、下划线、中文组成').maxLength(33, '会员名称不能超过33个字');

		}, {
			success : function(result) {
				if (result) {
					closeDialog(true);
				} else {
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
		<input type="hidden" name="iid" id="iid" value="${person.iid}" />
		<div id="dialog-content">
			<!--表单主体-->
			<table border="0" align="center" class="table">
				<tr>
					<td align="right" class="label">会员名称</td>
					<td class="required">*</td>
					<td>
						<input type="text" id="name" name="name" maxlength="33" class="input-text" value="${person.name }" />
					</td>
				</tr>
				<tr>
					<td align="right" class="label">会员学历</td>
					<td class="required">&nbsp;</td>
					<td>
						<select name="degree" data-value="${person.degree }">
							<option value="1">一般</option>
							<option value="2">熟练</option>
							<option value="3">精通</option>
							<option value="4">专家</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" class="label">会员兴趣</td>
					<td class="required">&nbsp;</td>
					<td>
						<c:if test="${empty interests}"><span style="color:red;">请先在兴趣管理中添加兴趣</span></c:if>
						<c:forEach items="${interests}" var="interest">
							<label><input type="checkbox" name="interestIds" value="${interest.iid }" data-value="${person.interestIds }" />${interest.name }</label>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td align="right" class="label">创建时间</td>
					<td class="required">&nbsp;</td>
					<td>
						<fmt:formatDate value="${person.createDate}" var="createDate" pattern="yyyy-MM-dd" />
						<c:choose>
							<c:when test="${modify}">
								<input type="text" name="createDate" value="${createDate }" disabled="disabled" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly" />
							</c:when>
							<c:otherwise>
								<input type="text" name="createDate" value="${createDate }" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly" />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>
		<!--表单按钮区-->
		<div id="dialog-toolbar">
			<div id="dialog-toolbar-panel">
				<input type="submit" class="btn btn-primary" value="保存" />
				<input type="button" class="btn" value="取消" onclick="closeDialog();" />
			</div>
		</div>
	</form>
</body>
</html>