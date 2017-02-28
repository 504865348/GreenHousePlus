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
<title>编辑基地</title>
</head>
<body>
	<script type="text/javascript">
$().ready(function() {
 $("#editbaseForm").validate();
});
</script>
	<!-- 系统管理员编辑基地 start-->
	<form id="editbaseForm"
		action="<%=request.getContextPath()%>/basemgr/sysadmin/updatebase?baseId=${base.base_id}&userId=${base.user_id}"
		method="post">
		<div style="width: 60%; margin: 20px auto;">
			<table class="table table-bordered table-condensed">
				<tr>
					<td class="text-center" style="width: 30%;">基地名称:</td>
					<td><input type="text" value="${base.base_name}"
						id="Base_name" name="Base_name" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">基地地址:</td>
					<td><input type="text" value="${base.base_address}"
						id="Base_address" name="Base_address"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">经 度:</td>
					<td><input type="text" value="${base.base_lat}" id="Base_lat"
						name="Base_lat" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">纬 度:</td>
					<td><input type="text" value="${base.base_long}"
						id="Base_long" name="Base_long" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">管理员账号:</td>
					<td><input type="text" value="${user.username}" id="Username"
						name="Username" class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">密 码:</td>
					<td><input type="text" value="${user.password}" id="Password"
						name="Password" class="required form-control" minlength="6"
						maxlength="20"></td>
				</tr>
				<tr>
					<td class="text-center">姓 名:</td>
					<td><input type="text" value="${user.user_realname}"
						id="User_realname" name="User_realname"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">手机号码:</td>
					<td><input type="text" value="${user.user_mobile}"
						id="User_mobile" name="User_mobile"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center"><input type="submit" value="编辑"
						class="btn bcm tcw"></td>
					<td><input type="button" value="返回"
						onclick="javascript:history.back(-1);" class="btn bcm tcw"></td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 系统管理员编辑基地 end -->

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