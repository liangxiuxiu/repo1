<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>验证码</title>
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
		<h:verifycode url="verifyCode.do"></h:verifycode>
		<h3>HTML</h3>
		<pre class='brush:html'>
			<!-- width：宽度 -->
			<!-- height：高度 -->
			<!-- url对应的controller需要自行定义 -->
			&lt;h:verifycode url="verifyCode.do" width="宽度" height="高度"&gt;&lt;/h:verifycode&gt;
		</pre>
		<h3>JAVA</h3>
		<pre class='brush:java'>
			@RequestMapping("verifyCode")
			@ResponseBody
			public String showVerifyCode(HttpSession session, HttpServletResponse response) {
				// 第二个参数定义session的key，默认为rand
				return VerifyCode.generate(response, "verifyCode");
				// 第三个参数为是否需要加入干扰线
				return VerifyCode.generate(response, "verifyCode", false);
			}
		</pre>
	</div>
</body>
</html>