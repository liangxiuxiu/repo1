<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="h" uri="/WEB-INF/tag/hanweb-tags.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用开发平台${version}</title>
<h:head validity="true" message="true" placeholder="true" iconfont="true" cookie="true" security="true"></h:head>
<h:import type="css" path="/resources/complat/support/login.css"></h:import>
<script>
	window.alert = function(msg, type, fu) {
		$('input, button').blur();
		top.$.messager.alert('消息', msg, type, fu);
	};
	window.confirm = function(msg, okCall, cancelCall) {
		$('input, button').blur();
		top.$.messager.confirm('消息', msg, function(flag) {
			if (flag) {
				if (typeof (okCall) != 'undefined') {
					okCall();
				}
			} else {
				if (typeof (cancelCall) != 'undefined') {
					cancelCall();
				}
			}
		});
	};
	$.validity.setup({
		outputMode : "showErr"
	}); //校验错误弹出

	var loginHeight; //登录框高度
	var loginWidth;

	/**
	 * 计算登录框位置
	 */
	function fixPosition() {
		$('#bg').width($(window).width());

		$('#login-panel').css({
			'top' : ($(window).height() - loginHeight) / 2 + 'px',
			left : ($(window).width() - loginWidth) / 2
		});

		$('#login-mask').css({
			top : $('#login-panel').css('top'),
			left : $('#login-panel').offset().left,
			width : $('#login-panel').outerWidth(),
			height : $('#login-panel').outerHeight()
		});
	}

	$(function() {
		var cookiePath = '${contextPath}/';
		$.cookie('channel', null, {
			path : cookiePath
		});
		$.cookie('pageUrl', null, {
			path : cookiePath
		});
		$.cookie('menuUrl', null, {
			path : cookiePath
		});

		loginHeight = $('#login-panel').outerHeight();
		loginWidth = $('#login-panel').outerWidth();

		fixPosition(); //设置登录框位置
		$('[placeholder]').placeholder();

		$(window).resize(fixPosition);

		/*
		 * 校验输入
		 */
		$('#loginform').validity(function() {
			$('#name').require('请填写用户名!');
			$('input[type=password]').require('请填写密码!');
			<c:if test="${dynamicCodeLogin == true}">
			$('#dynamiccode').require('请填写动态码!').match('intege1','动态码为6位数字!').maxLength(6, '动态码为6位数字!').minLength(6, '动态码为6位数字!');
			</c:if>
			<c:if test="${isVerifyCode == true}">
			$('#randcode').require('请填写验证码!');
			</c:if>
		}, {
			beforeSubmit : function(validateResult) {
				var u_user = $('#name').val();
				var u_password = $('#password').val();
				$('#enc_name').val(RSAencode(u_user));
				$('#enc_password').val(RSAencode(u_password));
				if (validateResult) {
					$('#login-btn').text('登 录 中 ...');
				}
			},
			success : function(ajaxResult) {
				if (ajaxResult.success) {
					top.location.href = 'manager/index.do';
				} else {
					$('#verifyImg').click();
					alert(ajaxResult.message);
				}
				$('#login-btn').text('登 录');
			},
			error : function() {
				$('#login-btn').text('登 录');
			}
		});
	});
	/***********************************扫描二维码登陆***********************************/
	var qrcodeLoginCheck = null;
	function showQrcode(){
		var reloadQrcode = function(){
			var qrcodeSrc = $('#login-qrcode').attr('data-src');
			$('#login-qrcode').attr('src', qrcodeSrc + '?date=' + new Date().getTime());
		}
		// 显示二维码
		reloadQrcode();
		$('#qrcode-wrap').show();
		// 失效之前的轮询
		if(qrcodeLoginCheck){
			clearInterval(qrcodeLoginCheck);
		}
		// 轮询：1秒检测一次扫码登陆情况
		qrcodeLoginCheck = setInterval(function(){
			$.ajax('check_qrcode_login.do',{
				dataType:'json',
				success:function(result){
					if (result.success) {
						hideQrcode();
						top.location.href = 'manager/index.do';
					} else {
						var state = result.params.state;
						switch (state) {
						case -1:
							// 刷新失效二维码
							reloadQrcode();
							break;
						case 0:
							break;
						case 1:
							break;
						default:
							alert(result.message);
							break;
						}
					}
				}
			});
		},1000);
	}
	
	function hideQrcode(){
		$('#qrcode-wrap').hide();
		// 失效轮询
		if(qrcodeLoginCheck){
			clearInterval(qrcodeLoginCheck);
		}
	}
</script>
</head>
<body>
	<div style="border-bottom: 2px solid #43BBEF;"></div>
	<div id="login-panel">
		<form action="${url}" method="post" id="loginform">
			<input id="enc_name" type="hidden" name="name"/>
			<input id="enc_password" type="hidden" name="password"/>
			<input type="submit" id="hiddensubmit" style="width: 0px; height: 0px; margin: 0; padding: 0; border: none;" />
			<div style="margin-bottom: 20px;">
				<img src="${contextPath}/ui/images/logo2.png" width="140" height="140" style="vertical-align: middle; margin-right: 30px;" /> <span id="login-title">${appName} ${version}</span>
			</div>
			<div>
				<div id="browser-info">
					建议使用 IE10 或 Chrome、Safari 浏览器<br />以获得更佳的体验
					<div id="copyright">© 大汉网络</div>
				</div>
				<ul style="float: right;" id="login-wrap">
					<c:if test="${qrcodeLogin == true}">
					<li>
						<div class="login-type">
							<a onclick="showQrcode();">扫码登陆<i class="iconfont">&#xf5066;</i></a>
						</div>
						<div id="qrcode-wrap">
							<div class="login-type">
								<a onclick="hideQrcode();">密码登陆<i class="iconfont">&#xf1018;</i></a>
							</div>
							<div>
								<img id="login-qrcode" data-src="get_login_qrcode.do">
							</div>
						</div>
					</li>
					</c:if>
					<li>
						<span class="input-prepend">
							<i class="iconfont add-on" style="height: 46px; line-height: 46px; width: 40px; font-size: 14px;">&#xf1006;</i><input id="name" type="text" placeholder="登录名" value="${fn:escapeXml(username)}" class="input-text login-input" autocomplete="off" />
						</span>
					</li>
					<li>
						<span class="input-prepend">
							<i class="iconfont add-on" style="height: 46px; line-height: 46px; width: 40px; font-size: 14px;">&#xf5061;</i><input id="password" type="password" placeholder="密码" class="input-text login-input" autocomplete="off" />
						</span>
					</li>
					<c:choose>
						<c:when test="${dynamicCodeLogin == true}">
						<li style="position: relative;">
							<span class="input-prepend">
								<i class="iconfont add-on" style="height: 46px; line-height: 46px; width: 40px; font-size: 14px;">&#xf5063;</i><input id="dynamiccode" type="text" name="dynamiccode" placeholder="动态码（6位数字）" maxlength="6" class="input-text login-input" autocomplete="off" />
							</span>
						</li>
						</c:when>
						<c:when test="${isVerifyCode == true}">
						<li style="position: relative;">
							<span class="input-prepend">
								<i class="iconfont add-on" style="height: 46px; line-height: 46px; width: 40px; font-size: 14px;">&#xf5068;</i><input id="randcode" type="text" name="randcode" placeholder="校验码" maxlength="4" class="input-text login-input" autocomplete="off" />
								<div style="position: absolute; top: 0; right: 0; padding: 3px 8px;">
									<h:verifycode url="verifyCode.do"></h:verifycode>
								</div>
							</span>
						</li>
						</c:when>
					</c:choose>
					<li>
						<div id="login-btn" class="btn btn-primary submit" onclick="$('#hiddensubmit').click();">登 录</div>
						<div style="margin-top: 10px"><a href="resetpwd/show.do" style="text-decoration:none;color: #B0E07D;cursor: pointer;" target="_blank">忘记密码？</a></div>
					</li>
				</ul>
			</div>
		</form>
	</div>
	<div id="console-btn">
		<a href="setup/login.do">控制面板</a>
	</div>
	<img id="bg" src="${contextPath}/ui/images/bg.jpg" style="position: absolute; z-index: -1;" />
	<div id="login-mask"></div>
</body>
</html>