<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>zip</title>
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
			// 将zip文件解压到指定目录
			// outputDirectory：目标目录
			// zipFilename：zip文件
			ZipUtil.unzip(outputDirectory, zipFilename)
			
			// 将文件压缩成zip到指定文件
			// zipFilePath：zip文件地址
			// files：需要压缩的文件
			ZipUtil.zip(zipFilePath,files)
			
			// 将文件夹压缩为指定zip包
			// outputFileName:zip文件地址
			// inputDirectory:需要压缩的文件夹
			ZipUtil.zip(outputFileName,inputDirectory)
		</pre>
	</div>
</body>
</html>