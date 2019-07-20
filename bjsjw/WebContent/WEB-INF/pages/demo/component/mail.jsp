<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>邮件</title>
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
			// 获取mail实例
			MailSend mail = new MailSend();
			// 设置smtp
			mail.setHostName("smtp.163.com");
			// 设置发信人帐号密码
			mail.setAuthentication("ooo@hanweb.com", "123456");
			// 设置主题
			mail.setSubject("我要发送这个信息");
			// 设置发件人 （可设置多人）
			mail.setFrom("ooo@hanweb.com", "发件人");
			// 添加收件人 （可设置多人）
			mail.addTo("xxxx@hanweb.com", "收件人小王");
			// 设置html格式的信息 当目标邮箱支持接收html格式时，将仅发送html格式信息
			mail.setHtmlMsg("&lt;html&gt;我是信息正文&lt;/html&gt;");
			// 设置文本格式的信息 假如目标邮箱不接收html格式时，显示的文字
			mail.setTextMsg("")
			// 发送
			mail.send();
		</pre>
	</div>
</body>
</html>