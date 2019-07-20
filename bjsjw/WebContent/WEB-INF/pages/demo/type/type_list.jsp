<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<h:head pagetype="page" grid="true"></h:head>
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
			confirm('您确定要删除这条记录吗', function() {
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
			openDialog('demo/type/add_show.do', 550, 700, {
				title : '新增'
			});
			break;
		}
	}

	function edit(integer_field) {
		openDialog('demo/type/modify_show.do?integer_field=' + integer_field, 550, 700, {
			title : '修改'
		});
	}
</script>
</head>
<body>
	<div id="page-content">
		<h:grid></h:grid>
	</div>
</body>
</html>