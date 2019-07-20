<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>弹出窗OPR</title>
<h:head highlighter="true" pagetype="dialog"></h:head>
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
</script>
</head>
<body>
	<form action="${url }" method="post" id="oprform">
		<!--隐藏变量区-->
		<!--<input type="hidden" name="pid" id="pid" value="${group.pid}" /> -->
		<div id="dialog-content">
			<!--表单主体-->
			<table border="0" align="center" class="table">
				<!--每行-->
				<tr>
					<td align="right" class="label">机构名称</td>
					<td class="required">*</td>
					<td>
						<input type="text" id="name" name="name" maxlength="33" class="input-text" value="" />
					</td>
				</tr>
				<tr>
					<td align="right" class="label">机构简介</td>
					<td class="required"></td>
					<td>
						<textarea class="input-textarea"></textarea>
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