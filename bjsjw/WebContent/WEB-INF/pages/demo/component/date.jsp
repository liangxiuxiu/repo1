<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>日期时间</title>
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
		<h4>这里只列出了常用的，具体参看API</h4>
		<pre class='brush:java'>
			// 获得当前日期和时间，格式"yyyy-MM-dd HH:mm:ss"
			DateUtil.getCurrDateTime();
			
			// 获取当前的日期(yyyy-MM-dd)
			DateUtil.getCurrDate()
			
			// 获得指定格式的当前时间
			DateUtil.getCurrDate(format)
			
			// 将给定的时间转换为指定格式的字符串
			DateUtil.dateToString(date,format)
			
			// 将字符串转换为指定格式的时间
			DateUtil.stringtoDate(string,format)
			
			// DateUtil常量
			DateUtil.YYYY_MM_DD_HH_MM_SS
			DateUtil.YYYY_MM_DD_HH_MM
			DateUtil.YYYYMMDD_HHMMSS
			DateUtil.YYYY_MM_DD
			DateUtil.MM_DD
			DateUtil.HH_MM_SS
			DateUtil.YYYY_MM
		</pre>
	</div>
</body>
</html>