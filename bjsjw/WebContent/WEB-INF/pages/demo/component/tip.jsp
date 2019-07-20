<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>提示帮助</title>
<h:head pagetype="page" highlighter="true" tip="true"></h:head>
<h:import type="js" path="/ui/script/ui.js"></h:import>
<script type="text/javascript">
	$(function(){
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<table border="0" class="table">
			<tr>
				<td align="right" class="label"><h:tip title="不超过6个字"></h:tip>密码</td>
				<td class="required">*</td>
				<td><input type="password" id="password" name="password" maxlength="33"
					class="input-text"/></td>
				<td></td>
			</tr>
		</table>
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head tip="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>HTML</h3>
		<pre class='brush:html'>
			<!-- 在需要显示这个问号图标的地方加入如下标签，title表示要显示的提示信息 -->
			&lt;h:tip title="不超过6个字"&gt;&lt;/h:tip&gt;
		</pre>
	</div>
</body>
</html>