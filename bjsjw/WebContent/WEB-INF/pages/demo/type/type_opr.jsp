<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新增</title>
<h:head pagetype="dialog" validity="true" calendar="true" select="true"
	upload="true" tree="true"></h:head>
<!--使用${contextPath}可以获得应用路径，并无/结尾-->
<script>
	/**
	 * 表单验证
	 */
	$(function() {
		$('#oprform').validity(function() {

		}, {
			success : function(result) {
				if (result) {
					closeDialog(true);
				} else {
					alert(result.message);
				}
			},
			type : 'iframe'
		});
	});
</script>
<style>
input.file.input-text{
	width: 200px;
}
</style>
</head>
<body>
	<form action="${url }" method="post" id="oprform"
		enctype="multipart/form-data">
		<input type="hidden" name="integer_field" class="input-text"
						value="${type.integer_field }" />
		<div id="dialog-content">
			<!--表单主体-->
			<table border="0" align="center" class="table">
				<tr>
					<td align="right" class="label">单精度型</td>
					<td>&nbsp;</td>
					<td><input type="text" name="single_field" class="input-text"
						value="${type.single_field }" /></td>
				</tr>
				<tr>
					<td align="right" class="label">双精度型</td>
					<td class="required">&nbsp;</td>
					<td><input type="text" name="both_field" class="input-text"
						value="${type.both_field }" /></td>
				</tr>
				<tr>
					<td align="right" class="label">字符型</td>
					<td class="required">&nbsp;</td>
					<td><input type="text" name="character_field"
						class="input-text" value="${type.character_field }" /></td>
				</tr>
				<tr>
					<td align="right" class="label">字符串型</td>
					<td class="required">&nbsp;</td>
					<td><input type="text" name="string_field" class="input-text"
						value="${type.string_field }" /></td>
				</tr>
				<tr>
					<td align="right" class="label">布尔型</td>
					<td class="required">&nbsp;</td>
					<td>
						<label><input type="radio" name="judge_field" value="true" 
								data-value="${type.judge_field }">是</label>
						<label><input type="radio" name="judge_field" value="false" 
								data-value="${type.judge_field }">否</label>
					</td>
				</tr>
				<tr>
					<td align="right" class="label">日期</td>
					<td class="required">&nbsp;</td>
					<td><input type="text" name="date_field"
						class="jcalendar input-text" value="${type.date_field }"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly" /></td>
				</tr>
				<tr>
					<td align="right" class="label">时间</td>
					<td class="required">&nbsp;</td>
					<td><input type="text" name="datetime_field"
						value="<fmt:formatDate value='${type.datetime_field }' pattern='yyyy-MM-dd HH:mm:ss'/>"
						class="jcalendar input-text"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td align="right" class="label">JSON</td>
					<td class="required">&nbsp;</td>
					<td><input type="text" name="json_field" class=" input-text"
						value="${type.json_field }" /></td>
				</tr>
				<tr>
					<td align="right" class="label">大字段</td>
					<td class="required">&nbsp;</td>
					<td><textarea name="text_field" class="input-textarea">${type.text_field }</textarea></td>
				</tr>
				<tr>
					<td align="right" class="label">附件</td>
					<td class="required">&nbsp;</td>
					<td>
						<div>
							<c:if test="${hasblob }">
								<div id="pic">
									<img src="read.do?integer_field=${type.integer_field }"
										width="300px" />
								</div>
							</c:if>
							<div>
								<input type="file" id="blob_field" class="input-text"
									name="file"/>
							</div>
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