<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<h:head pagetype="page" grid="true"></h:head>
<!--使用${contextPath}可以获得应用路径，并无/结尾-->
<script>
	/**
	* 列表页功能
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
				ajaxSubmit('remove.do?ids='+ids, {
					success:function(result){
						if(result.success){
							location.reload();
						}else{
							alert(result.message);
						}
					}
				});
			});
			break;
		case 'add':
			openDialog('demo/interest/add_show.do', 550, 200, {
				title : '新增'
			});
			break;
		}
	}

	function edit(iid, name) {
		openDialog('demo/interest/modify_show.do?iid=' + iid, 550, 200, {
			title : '修改'
		});
	}
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
    	<!--高级检索开始form无需url -->
		<div class="grid-advsearch">
			<form>
            	<!--
				机构名称<input name="name" type="text" class="input-text" value="name" style="width: 120px; margin: 0 30px 0 10px;" /> 
				机构标识<input name="codeId" type="text" class="input-text" value="codeId" style="width: 120px; margin: 0 30px 0 10px;" />
				<input type="button" class="btn btn-primary" value="检索" />
				<input type="button" class="btn advsearch-cancel" value="返回" />
				<div class="line-dotted"></div>
                -->
			</form>
		</div>
        <!--高级检索结束 -->
		<h:grid></h:grid>
	</div>
</body>
</html>