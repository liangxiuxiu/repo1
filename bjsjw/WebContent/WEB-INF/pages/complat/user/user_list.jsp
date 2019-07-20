<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户列表</title>
<h:head pagetype="page" grid="true" toggle="true"></h:head>
<script type="text/javascript">
	function toolbarAction(action) {
		switch (action) {
		case 'remove':
			var ids = getCheckedIds();
			if (ids == "") {
				alert("未选中任何记录");
				return;
			}
			confirm("您确定要删除这" + ids.split(",").length + "条记录吗", function() {
				ajaxSubmit("remove.do?ids=" + ids,{success:function(result){
					if(result.success){
						location.reload();
					}else{
						alert(result.message);
					}
				}});
			});
			break;
		case 'add':
			openDialog('user/add_show.do?groupId=${groupId}', 550, 560, {
				title : '用户新增'
			});
			break;
		case 'import':
			openDialog('user/import_show.do', 550, 170, {
				title : '用户导入'
			});
			break;
		case 'export':
			var ids = getCheckedIds();
			iframeSubmit("export.do?ids=" + ids + "&groupId=${groupId}");
			break;
		case 'restDynamicCode':
			var ids = getCheckedIds();
			if (ids == "") {
				confirm('确定要重置所有用户的动态码密钥吗？',function(){
					ajaxSubmit("rest_dynamic_code.do?ids=" + ids,{success:function(result){
						if(result.success){
							location.reload();
						}else{
							alert(result.message);
						}
					}});
				},function(){
					return;
				});
			} else {
				confirm("您确定要重置这" + ids.split(",").length + "个用户的动态码密钥吗", function() {
					ajaxSubmit("rest_dynamic_code.do?ids=" + ids,{success:function(result){
						if(result.success){
							location.reload();
						}else{
							alert(result.message);
						}
					}});
				});
			}
			break;
		}
	}
	function edit(iid, name) {
		openDialog('user/modify_show.do?iid=' + iid, 550, 560, {
			title : '用户编辑'
		});
	}

	function modifyEnable(iid, enable) {
		enable = enable == "1" ? "0" : "1";  //切换当前用户状态
		ajaxSubmit('enable_modify.do', {
			data: "iid=" + iid + "&enable=" + enable,
			success:function(result){
				if(result.success){
					window.location.reload();
				}else{
					alert(result.message);
				}
			}
		});
	}

	$(function() {
		$(':hidden[name=enable]').toggle({
			size: 'small',
			ajax: {
				url: 'enable_modify.do',
				error: function(result) {
					if (result && result.message) {
						alert(result.message, 'warning');
					} else {
						alert('您已退出系统，请重新登录', 'warning');
					}
				}
			}
		});
	});
</script>
</head>
<body>
	<div id="page-title">
		系统管理 / 用户管理 / <span id="page-location">${groupName}</span>
	</div>
	<div id="page-content">
		<div class="grid-advsearch">
			<form>
				姓名<input name="name" type="text" class="input-text" value="${name}" style="width:120px;margin:0 30px 0 10px;"/>
				登录名<input name="loginName" type="text" class="input-text" value="${loginName }" style="width:120px;margin:0 30px 0 10px;"/>
				<input type="button" class="btn btn-primary" value="检索" style="margin-right:5px;" />
				<input type="button" class="btn advsearch-cancel" value="返回" />
				<div class="line-dotted"></div>
			</form>
		</div>
		<h:grid></h:grid>
	</div>
</body>
</html>