<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>列表页</title>
<h:head pagetype="page" highlighter="true"></h:head>
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
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head grid="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>JS模板</h3>
		<pre class='brush:js'>
			/**
			* 列表页功能，这个方法是相应列表页按钮的，必须有
			*/
			function toolbarAction(action) {
				switch (action) {
				case 'remove':
					var ids = getCheckedIds();
					if (ids == '') {
						alert('未选中任何记录');
						return;
					}
					confirm('您确定要删除这' + ids.split(',').length + '条记录吗', function() {
						ajaxSubmit('remove.do?ids='+ids);
					});
					break;
				case 'add':
					openDialog(填写新增url, 550, 560, {
						title : '新增'
					});
					break;
				}
			}
		</pre>
		<h3>HTML模板</h3>
		<pre class='brush:html'>
			&lt;div id="page-title"&gt;
				&lt;!--模块名称 --&gt; / &lt;!--子名称（可以没有） --&gt
			&lt;/div&gt;
			&lt;div id="page-content"&gt;
		    	&lt;!--高级检索开始 --&gt;
				&lt;div class="grid-advsearch"&gt;
					<!-- form无需url -->
					&lt;form&gt;
						机构名称&lt;input name="name" type="text" class="input-text" value="name" style="width: 120px; margin: 0 30px 0 10px;" /&gt; 
						机构标识&lt;input name="codeId" type="text" class="input-text" value="codeId" style="width: 120px; margin: 0 30px 0 10px;" /&gt;
						&lt;input type="button" class="btn btn-primary" value="检索" /&gt;
						&lt;input type="button" class="btn advsearch-cancel" value="返回" /&gt;
						&lt;div class="line-dotted"&gt;&lt;/div&gt;
					&lt;/form&gt;
				&lt;/div&gt;
		        &lt;!--高级检索结束 --&gt;
		        
		        <!-- 这里使用grid标签来输出列表数据 -->
				&lt;h:grid&gt;&lt;/h:grid&gt;
			&lt;/div&gt;
		</pre>
		<h3>JS</h3>
		<pre class='brush:js'>
			// 获得所有checked的id，以逗号分隔
			getCheckedIds()
			
			// 获得checked的行中某列的值
			getCheckedAttr('列名称（不是头名称）')
			
			// 修改，第一个参数为行的序号，第二个为列的属性，可以多个，格式为{列名称:'值',列名称:'值',.....}json格式
			updateCell(index, cellValues)
		</pre>
	</div>
</body>
</html>