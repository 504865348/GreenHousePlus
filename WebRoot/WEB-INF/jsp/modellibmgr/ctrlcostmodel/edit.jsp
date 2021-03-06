<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>编辑调控成本模型</title>
</head>
<body>
	<!-- 编辑优化控制模型 start-->
	<script type="text/javascript">
$().ready(function() {
 $("#dForm").validate();
});
</script>
	<form id="dForm"
		action="<%=request.getContextPath()%>/modellib/ctrlcost/update?Model_id=${modelbase.model_id}"
		method="post">
		<div style="width: 60%; margin: 20px auto;">
			<h3 class="h3">编辑调控成本模型</h3>
			<table class="table table-bordered table-condensed">
				<tr>
					<td class="text-center" style="width: 30%;">模型库名称:</td>
					<td><input type="text" value="${modelbase.model_name}"
						id="Model_name" name="Model_name" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">存储地址:</td>
					<td><input type="text" value="${modelbase.monitor_path}"
						id="Monitor_path" name="Monitor_path"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">函数名称:</td>
					<td><input type="text" value="${modelbase.function}"
						id="Function" name="Function" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">输入参数:</td>
					<td><input type="text" value="${modelbase.input}" id="Input"
						name="Input" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">输出参数</td>
					<td><input type="text" value="${modelbase.output}" id="Output"
						name="Output" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center"><input type="submit" value="编辑"
						class="btn bcm tcw"></td>
					<td><input type="button" value="取消"
						onclick="javascript:history.back(-1)" class="btn bcm tcw"></td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 编辑优化控制模型 end -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/messages_zh.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/form-ajax.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.metadata.js"></script>
</body>
</html>