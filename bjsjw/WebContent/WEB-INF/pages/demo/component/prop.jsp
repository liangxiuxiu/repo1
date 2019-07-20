<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Properties配置文件</title>
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
			// 读取Properties，path可以是现有的文件 也可以是想保存的文件
			Properties prop = new Properties(path)
			
			// 增加属性
			prop.addProperty(String key, Object obj);
			
			// 设置属性，没有的话会调用增加属性
			prop.setProperty(String key, Object obj);
			
			// 获取属性值，带自动转换
			prop.getBigDecimal(key)
			prop.getBigInteger(key)
			prop.getBoolean(key)
			prop.getByte(key)
			prop.getDouble(key)
			prop.getFloat(key)
			prop.getInt(key)
			prop.getLong(key)
			prop.getShort(key)
			prop.getString(key)
			
			// 判断是否有对应的key
			prop.containsKey(key)
			
			// 清空文件
			prop.clear();
			
			// 保存文件
			prop.save();
			
			// 另存为
			prop.saveAs(file);
		</pre>
	</div>
</body>
</html>