<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>XML</title>
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
			// 获得XmlDocument实例
			XmlDocument xml = new XmlDocument(); //utf-8
			XmlDocument xml = new XmlDocument(chartset); // 自定义字符集
			
			// 读取xml
			xml.read(str) // 读取xml字符串
			xml.read(file) // 读取xml文件
			
			// 是否追加而不是覆盖文件内容
			xml.setAppend(append)
			
			// 设置根节点
			xml.createRoot(name)
			
			// 获得xml的node，返回值为 XmlNode
			xml.getXmlNode(path)
			
			// 获得xml的node集合，返回值为List&lt;XmlNode&gt;
			xml.getXmlNodes(path)
			
			// 判断节点是否存在
			xml.isExist(path)
			
			// 创建一个节点
			xml.createPath(path)
			
			// 给一个节点赋CDATA值 
			xml.addNodeCDATA(path,nodeName,value)
			
			// 给一个节点赋值 
			xml.addNode(path,nodeName,value)
			
			// 给一个节点赋值 和 节点属性
			xml.addNode(path,nodeName,value,attrs,isCdata)
			
			// 更新一个CDATA节点
			xml.updateNodeCDATA(path,value)
			
			// 更新一个节点
			xml.updateNode(path,value)
			
			// 删除一个节点
			xml.removeNode(path)
			
			// 保存
			xml.save()
			
			// 另存为
			xml.saveAs(file)
		</pre>
		<h3>注意</h3>
		<pre class='brush:js'>
			// XmlNode的属性参看API
		</pre>
		
		<h3>XmlObject</h3>
		<h4>这里只列出了常用的，具体参看API</h4>
		<pre class='brush:java'>
			// 获得XmlObject实例
			XmlObject xml = new XmlObject()
			// 读取xml
			xml.read(str) // 读取xml字符串
			xml.read(file) // 读取xml文件
			
			// 设置节点名称与class的对应
			xml.setNodeToClass(nodeName,class);
			
			// 设置节点与class属性的对应
			xml.setNodeToField(nodeName,clazz,fieldName)
			
			// xml转obj
			xml.getObject();
			
			// object转xml
			xml.toXml(obj);
		</pre>
	</div>
</body>
</html>