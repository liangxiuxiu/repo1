<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>缓存</title>
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
			// 创建cache
			// cacheName:cache的名称（唯一）
			// maxElementsInMemory:设置基于内存的缓存中可存放的对象最大数目
			// overflowToDisk:将cache中多出的元素放入磁盘文件中。
			// eternal:设置对象是否为永久的,true表示永不过期,此时将忽略timeToIdleSeconds和timeToLiveSeconds属性;
			// timeToLiveSeconds:设置对象空闲最长时间,超过这个时间,对象过期。当对象过期时,EHCache会把它从缓存中清除。
			// timeToIdleSeconds:设置对象生存最长时间,超过这个时间,对象过期。
			CacheUtil.createCache(String cacheName, int maxElementsInMemory,
				boolean overflowToDisk, boolean eternal, long timeToLiveSeconds, long timeToIdleSeconds);
			
			// 缓存一个值
			CacheUtil.setValue(key,value,cachename);
			
			// 获得缓存的值
			CacheUtil.getValue(key,cachename)
			
			// 删除缓存的一个值
			CacheUtil.removeKey(key,cachename)
		</pre>
	</div>
</body>
</html>