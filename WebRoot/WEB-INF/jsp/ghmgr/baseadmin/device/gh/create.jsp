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
<title>添加温室控制设备</title>
</head>
<body>
	<!-- 添加设备 start-->
	<script type="text/javascript">
$().ready(function() {
 $("#adddeviceForm").validate();
});
</script>
	<form id="adddeviceForm"
		action="<%=request.getContextPath()%>/device/gh/device_save?ghId=<%=request.getSession().getAttribute("ghId")%>"
		method="post">

		<div style="width: 60%; margin: 20px auto;">
			<table class="table table-bordered table-condensed">
				<tr>
					<td class="text-center">设备名称:</td>
					<td><input type="text" id="Name" name="Name"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">设备类型:</td>
					<td><input type="text" id="Type" name="Type"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">控制类别:</td>
					<td><select id="Control" name="Control"
						class="required form-control">
							<option value="1">开关型</option>
							<option value="2">正反转型</option>
							<option value="0">其他</option>
					</select></td>
				</tr>
				<tr>
					<td class="text-center">备注:</td>
					<td><textarea id="Remark" name="Remark" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td class="text-center"><input type="submit" value="添加"
						class="btn bcm tcw"></td>
					<td><input type="button" value="返回" class="btn bcm tcw"
						onclick="javascript:history.back(-1)"></td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 添加设备 end -->
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