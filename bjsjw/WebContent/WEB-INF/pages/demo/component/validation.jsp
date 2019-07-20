<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>JAVA验证框架</title>
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
			// 定制验证规则
			
			@NotNull(message="姓名不能为空")
			@Length(min=1,max=6,message="姓名必须大于1个字小于6个字")
			private String name = null;
			
			@NotNull(message="年龄不能为空")
			@Range(min=12,max=50,message="老人与小孩不可以")
			private Integer age = null;
			
			@NotNull(message="体重不能为空")
			@Max(value=100,message="体重不能超过100")
			@Min(value=10,message="体重不能小于10")
			private Double weight = null;
			
			@NotNull(message="报名日期不能为空")
			@DateRange(min="2013-1-9",max="2013-3-20",message="报名日期在13年1月9日-13年3月20")
			private Date createDate = null;
			
			@NotNull(message="email不能为空")
			@Email(message="email格式不对")
			private String email = null;
			
			@NotNull(message="证书不能为空")
			@MinSize(value=1,message="证书至少需要1个")
			private List&lt;String&gt; list = null;
			
			// 开始验证
			try {
				// 开始验证testFormBean
				ValidationUtil.validation(testFormBean);
			} catch (ValidationException e) {
				// 获得验证失败的message
				String message = e.getMessage();
			}
		</pre>
	</div>
</body>
</html>