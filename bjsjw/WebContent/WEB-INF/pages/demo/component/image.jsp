<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>图片缩放</title>
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
			// 构造image处理类
			ImageHandle is = new ImageHandle();
			String outputImageName = "F:\\photo_mh000.jpg";
			String inputImageName = "F:\\test_4.bmp";
			int width = 200;
			int height = 400;
			// outputImageName：输出地址
			// inputImageName：原图地址
			// isLockScale：是否保持比例
			boolean bl = is.scaleImage(outputImageName, inputImageName, width,
					height, isLockScale);
		</pre>
	</div>
</body>
</html>