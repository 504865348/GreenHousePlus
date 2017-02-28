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
<title>温室管理-日志添加</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/ghmgr/ghadmin/fert/add"
		method="post" success="操作成功" fail="操作失败" forward="list" form-ajax>
		<h3 class="h3">温室管理——日志添加</h3>
		<div style="width: 60%; margin: 20px auto;">
			<table class="table table-bordered table-condensed">
				<tr>
					<td class="text-right">种 植 批 次：</td>
					<td><select name="Crop_no">
							<option value="${shedCrop.crop_no }">${shedCrop.crop_no }[${shedCrop.crop.crop_name }]</option>
					</select></td>
				</tr>
				<tr>
					<td class="text-right">农作物生长描述：</td>
					<td><textarea name="Crop_caption"
							class="required form-control"></textarea></td>
				</tr>
				<tr>
					<td class="text-right">栽培管理时间：</td>
					<td><input type="text" name="Record_time"
						class="required dateISO form-control" /></td>
				</tr>
				<tr>
					<td class="text-right">栽培管理内容：</td>
					<td><textarea name="Content" class="required form-control"></textarea></td>
				</tr>
				<tr>
					<td class="text-right">管 理 人：</td>
					<td><input type="text" name="Record_user"
						class="required form-control" /></td>
				</tr>
				<tr>
					<td class="text-right">备 注：</td>
					<td><textarea name="Remark" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><button class="btn bcm tcw w3"
							style="margin-left: 80px;">提交</button></td>
				</tr>
			</table>
		</div>
	</form>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/messages_zh.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/form-ajax.js"></script>

</body>
</html>