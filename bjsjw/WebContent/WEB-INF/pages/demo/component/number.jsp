<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>数值</title>
<h:head pagetype="page" highlighter="true"></h:head>
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
		<pre class='brush:java'>
			// 可以String转数字，可以设置默认值
			
			NumberUtil.getFloat(Object obj)
			
			NumberUtil.getLong(Object obj)
			
			NumberUtil.getDouble(Object obj)
			
			NumberUtil.getInt(Object obj)
			
			NumberUtil.getFloat(Object obj, float defaultValue)
			
			NumberUtil.getLong(Object obj, long defaultValue)
			
			NumberUtil.getDouble(Object obj, double defaultValue)
			
			NumberUtil.getInt(Object obj, int defaultValue)
			
			// 判断一个字符是不是 可以转成数字
			NumberUtil.isNumeric(String string)
			
			// 判断一个字符是不是 不可以转成数字
			NumberUtil.isNotNumeric(String string)
		</pre>
	</div>
</body>
</html>