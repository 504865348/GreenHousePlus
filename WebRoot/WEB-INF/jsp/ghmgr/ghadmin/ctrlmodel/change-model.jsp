<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/style.css"
	type="text/css"></link>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/assets/css/theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/assets/css/font-awesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/css/admin.css"
	type="text/css"></link>
<script
	src="<%=request.getContextPath() %>/assets/js/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<title>控制模式</title>
</head>
<body>
	<div style="width: 60%; margin: 20px auto;">

		<h3 class="text-center">
	<!-- 袁健炜 2017-02-28  night modify start-->	
	                           请选择控制模式，当前模式：
	<!-- 袁健炜 2017-02-28  night modify end-->
			<c:if test="${gh.control_mode eq 1}">设定值控制</c:if>
			<c:if test="${gh.control_mode eq 2}">手动控制</c:if>
			<c:if test="${gh.control_mode eq 0}">智能控制</c:if>
		</h3>
		<table class="table table-bordered table-condensed">
			<tr>
				<td class="text-center"><span style="line-height: 40px;">切换控制模式:</span></td>
				<td><select class="form-control" onchange="changeMode();"
					id="mode">
						<option
							<c:if test="${ gh.control_mode eq 1}">selected="selected"</c:if>
							value="1">设定值控制</option>
						<option
							<c:if test="${ gh.control_mode eq 2}">selected="selected"</c:if>
							value="2">手动控制</option>
						<option
							<c:if test="${ gh.control_mode eq 0}">selected="selected"</c:if>
							value="0">智能控制</option>
				</select></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
var current_model = '${gh.control_mode}';
function changeMode(){
	var pass,mode=$('#mode').val(); 
	if(pass = prompt('请输入密码：')){
		$.post('change_mode',{
			password:pass,
			modeType:mode
		},'json')
		.done(function(data){
			if(data){
				alert('模式更改成功！');
				top.window.location.reload();
			}
			else{
				alert('密码错误，修改失败');
				$('#mode').val(current_model);
			}
		});
	}
	else{
		$('#mode').val(current_model)
	}
	
}
</script>
</body>
</html>