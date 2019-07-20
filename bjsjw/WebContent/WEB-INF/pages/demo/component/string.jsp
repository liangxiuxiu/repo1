<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>字符串</title>
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
			// 判断是否为空  自动trim
			StringUtil.isEmpty(str)
			
			// 判断是否   不为空  自动trim
			StringUtil.isNotEmpty(str)
			
			// encoder
			StringUtil.encoder(str)
			
			// decoder
			StringUtil.decoder(str)
			
			// 转义html
			StringUtil.escapeHTML(str)
			
			// 转义js
			StringUtil.escapeJS(str)
			
			// 获得安全的字符，会过滤xss攻击,  isForce：是否强力去除script和html标签
			StringUtil.getSafeString(str,isForce)
			
			// 转义sql，可以过滤sql注入（使用PreparedStatement的sql不需要使用这个方法）
			StringUtil.escapeSql(sql)
			
			// 转义xml
			StringUtil.escapeXml(str)
			
			// 从一个object 转换到 string，如果为null 则返回“”
			StringUtil.getString(obj)
			
			// 从一个object 转换到 string并且trim，如果为null 则返回“”
			StringUtil.getStringTrim(obj)
			
			// 获得uuid
			StringUtil.getUUIDString()
			
			// 拆分字符串为数组，sep为分隔符
			StringUtil.split(str,sep);
			
			// 将集合/数组链接成字符串 ，第二个参数为分隔符
			StringUtil.join(array/collection,sep)
			
			// 清除stringbuffer内容
			StringUtil.cleanStringBuffer(sb....)
			
			// 将1,2,3,4,5,6这样的字符串 转换为integer数组
			StringUtil.toIntegerArray(str)
			
			// 将1,2,3,4,5,6 转换成String 集合
			StringUtil.toStringList(str)
			
			// 将1,2,3,4,5,6 转换成integer 集合
			StringUtil.toIntegerList(str)
		</pre>
	</div>
</body>
</html>