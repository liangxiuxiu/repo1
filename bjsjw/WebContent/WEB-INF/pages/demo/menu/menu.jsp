<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>demo目录</title>
<h:head></h:head>
<style type="text/css">
body {
	margin: 0;
	padding: 10px 0 0 10px;
}

.nav-header {
	display: block;
	border-left: 3px solid #3bb4f2;
	padding: 0 1em;
	margin-top: .4em;
	margin-bottom: .4em;
	color: #555;
	font-weight: 700;
	font-size: 15px;
}

.nav li {
	display: block;
	line-height: 25px;
	height: 100%;
}

.nav li a {
	color: #777;
	display: block;
	padding-top: .3em;
	padding-bottom: .3em;
	padding: .3em 1em;
	-webkit-transition: .15s;
	transition: .15s;
	text-decoration: none;
	padding-top: .3em;
}

.nav li a:actived {
	color: #555;
	background-color: #eee;
}

.nav li a:hover { 
	color: #555; 
	background-color: #eee;
	border-radius: 2px; 
} 

.nav li a.active {
	color: #555; 
	background-color: #eee;
}
</style>
<script>
$(function() {
	var link = $('.nav a');
	link.each(function() {
		var linkItem = $(this);
		linkItem.attr('href', linkItem.attr('href') + '?treeNodeName=' + encodeURI(linkItem.text()));
	});
	$('.nav a').click(function() {
		$('.active').removeClass('active');
		$(this).addClass('active');
	});
});
</script>
</head>
<body>
	<ul class="nav">
		<li class="nav-header">CRUD实例</li>
		<li>
			<a href="${contextPath}/manager/demo/person/list.do" target="page">会员管理</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/interest/list.do" target="page">兴趣管理</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/type/list.do" target="page">字段类型测试</a>
		</li>
		<li class="nav-header">前台页面及组件</li>
		<li>
			<a href="${contextPath}/demo/component/front/form.do" target="page">表单</a>
		</li>
		<li>
			<a href="${contextPath}/demo/component/front/form-item.do" target="page">组件</a>
		</li>
		<li class="nav-header">后台页面及组件</li>
		<li>
			<a href="${contextPath}/manager/demo/component/tree.do" target="page">树形菜单</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/pageopr.do" target="page">普通页</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/list.do" target="page">列表页</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/btn.do" target="page">按钮</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/autoCheck.do" target="page">表单控件</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/checkpwd.do" target="page">密码控件</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/calendar.do" target="page">日历</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/fileupload_show.do" target="page">单文件上传/下载</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/multifileupload_show.do" target="page">多文件上传</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/tip.do" target="page">提示帮助</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/validity.do" target="page">脚本验证</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/code.do" target="page">验证码</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/message.do" target="page">弹出消息</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/dialog.do" target="page">弹出窗口</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/tabs.do" target="page">选项卡</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/loadmask.do" target="page">遮罩</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/editor.do" target="page">编辑器</a>
		</li>
		<li>
			<a href="${contextPath}/demo_view/code_editor.do" target="page">代码编辑器</a>
		</li>
		<li>
			<a href="${contextPath}/demo_view/toggle.do" target="page">开关</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/iconfont.do" target="page">图标</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/fsupload/list.do" target="page">云文件操作</a>
		</li>
		<li class="nav-header">工具类</li>
		<li>
			<a href="${contextPath}/manager/demo/component/string.do" target="page">字符串</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/number.do" target="page">数值</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/sys.do" target="page">系统变量</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/date.do" target="page">日期时间</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/file.do" target="page">文件读写</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/json.do" target="page">JSON</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/xml.do" target="page">XML</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/prop.do" target="page">Properties配置文件</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/pinyin.do" target="page">拼音</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/spring.do" target="page">SpringUtil</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/controller.do" target="page">ControllerUtil</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/script.do" target="page">返回脚本</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/cache.do" target="page">缓存</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/freemarker.do" target="page">Freemarker</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/zip.do" target="page">zip</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/rar.do" target="page">rar</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/mail.do" target="page">邮件</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/ip.do" target="page">IP</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/image.do" target="page">图片缩放</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/md5.do" target="page">MD5</a>
		</li>
		<li>
			<a href="${contextPath}/manager/demo/component/validation.do" target="page">JAVA验证</a>
		</li>
	</ul>
</body>
</html>