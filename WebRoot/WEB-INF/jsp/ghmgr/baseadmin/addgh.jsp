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
<title>创建温室</title>
</head>
<body>
	<!-- 基地管理员添加温室 start-->
	<script type="text/javascript">
$().ready(function() {
 $("#addghForm").validate();
});
</script>
	<form id="addghForm"
		action="<%=request.getContextPath()%>/ghmgr/savegh" method="post">

		<div style="width: 60%; margin: 20px auto;">
			<table class="table table-bordered table-condensed">
				<tr>
					<td class="text-center" style="width: 30%;">温室代号:</td>
					<td><input type="text" id="GH_code" name="GH_code"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center">温室面积:</td>
					<td><input type="text" id="GH_area" name="GH_area"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center">建造时间:</td>
					<td><input type="text" id="GH_build" name="GH_build"
						class="required dateISO form-control"></td>
				</tr>
				<tr>
					<td class="text-center">温室类型:</td>
					<td><select id="GH_type" name="GH_type"
						class="required form-control">
							<option value="1">文洛型温室</option>
							<option value="2">连栋温室</option>
							<option value="3">单栋温室</option>
							<option value="4">日光温室</option>
							<option value="0">其他</option>
					</select></td>
				</tr>

				<tr>
					<td class="text-center">覆盖材料:</td>
					<td><select id="Cover" name="Cover"
						class="required form-control">
							<option value="1">玻璃</option>
							<option value="2">塑料薄膜</option>
							<option value="3">PC板</option>
							<option value="0">其他</option>
					</select></td>
				</tr>

				<tr>
					<td class="text-center">高 度:</td>
					<td><input type="text" id="Height" name="Height"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center">跨 度:</td>
					<td><input type="text" id="Span" name="Span"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center">跨 数:</td>
					<td><input type="text" id="Num_span" name="Num_span"
						class="required digits form-control"></td>
				</tr>
				<tr>
					<td class="text-center">开 间:</td>
					<td><input type="text" id="Bay" name="Bay"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center">开间数:</td>
					<td><input type="text" id="Num_bay" name="Num_bay"
						class="required digits form-control"></td>
				</tr>
				<tr>
					<td class="text-center">备 注:</td>
					<td><input type="text" id="Remark" name="Remark"
						class="form-control"></td>
				</tr>
				<tr>
					<td class="text-center">管理员账户：</td>
					<td><input type="text" id="Username" name="Username"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">密 码:</td>
					<td><input type="text" id="Password" name="Password"
						class="required form-control" minlength="6" maxlength="20"></td>
				</tr>
				<tr>
					<td class="text-center">二级密码:</td>
					<td><input type="text" id="sec_password" name="sec_password"
						class="required form-control" minlength="6" maxlength="20"></td>
				</tr>
				<tr>
					<td class="text-center">姓 名:</td>
					<td><input type="text" id="User_realname" name="User_realname"
						class="required form-control"></td>
				</tr>
				<tr>
					<td class="text-center">手机号码:</td>
					<td><input type="text" id="User_mobile" name="User_mobile"
						class="required number form-control"></td>
				</tr>
				<tr>
					<td class="text-center"><input type="submit" value="创建"
						class="btn bcm tcw"></td>
					<td><input type="button" value="返回"
						onclick="javascript:history.back(-1)" class="btn bcm tcw"></td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 基地管理员添加温室 end -->
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