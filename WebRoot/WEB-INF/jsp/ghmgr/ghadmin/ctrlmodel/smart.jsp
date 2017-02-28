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
<title>Insert title here</title>
</head>
<body>
	<div style="width: 60%; margin: 20px auto;">
		<table class="table table-bordered">
			<!-- <tr><td class="text-center">切换控制模式:</td>
		<td><select class="form-control" onchange="changeMode();" id="mode">
			<option value="0">智能控制</option>
			<option value="2">手动控制</option>
			<option value="1">设定值控制</option>
		</select></td>
		</tr> -->
			<tr>
				<td class="text-center">选择模型:</td>
				<td><select class="form-control">
						<c:forEach items="${list }" var="i">
							<option>${i.model }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" class=""><button onclick="selectModel()s"
						class="btn bcm tcw w3">提交</button></td>
			</tr>
		</table>
	</div>



	<script type="text/javascript">
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
				alert('密码错误，修改失败')
			}
		});
	}
}
</script>



	<script type="text/javascript">
function selectModel(){
	
}
</script>
</body>
</html>