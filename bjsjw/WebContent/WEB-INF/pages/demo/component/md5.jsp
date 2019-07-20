<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>MD5</title>
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
			// 默认的 key 为 jcms2008
			
			// 加密
			Md5Util.md5encode(str)
			
			// 解密
			Md5Util.md5decode(str)
			
			// 使用给定的key加密
			Md5Util.md5encode(str, key)
			
			// 使用给定的key解密
			Md5Util.md5decode(str, key)
			
			// md5+base64加密
			Md5Util.md5Base64encode(str,key)
			
			// md5+base64解密
			Md5Util.md5Base64decode(str,key)
		</pre>
	</div>
</body>
</html>