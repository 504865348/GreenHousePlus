<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>温室初始化信息</title>
</head>
<body>
	<div style="width: 60%; margin: 20px auto;">
		<form action="<%=request.getContextPath()%>/ghmgr/ghadmin/gh/init"
			method="post" success="操作成功" fail="操作失败"
			forward="<%=request.getContextPath()%>/ghmgr/ghadmin/gh/init"
			form-ajax>

			<!-- 初始化农作物信息 -->

			<div id="initCrops"
				<c:if test="${!empty cropAdded }">style="display:none;"</c:if>>
				<h3 class="text-center">可添加的农作物</h3>
				<table class="table table-bordered table-condensed">
					<tr>
						<td class="text-center"><c:forEach items="${cropToAdd }"
								var="i">
								<input type="radio" name="Crop_id" value="${i.crop_id }" />${i.crop_name }</c:forEach></td>
						<td><input type="button" class="btn bcm tcw" value="添加作物"
							onclick="location='<%=request.getContextPath()%>/ghmgr/ghadmin/crop/add'">
						</td>
					</tr>

					<tr>
						<td class="text-center">栽培面积：</td>
						<td><input type="text" name="Crop_area"
							class="required number form-control" /></td>
					</tr>
					<tr>
						<td class="text-center">栽培数量：</td>
						<td><input type="text" name="Crop_num"
							class="required number form-control" /></td>
					</tr>
					<tr>
						<td class="text-center">栽培土壤：</td>
						<td><select name="Soil_id" class="form-control">
								<c:forEach var="i" items="${soil }">
									<option value="${i.soil_id }">[${i.soil_type}]${i.soil_name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
				<button class="btn bcm tcw w3">确定</button>
			</div>

			<!-- 初始化作物结束 -->

		</form>

		<c:if test="${!empty cropAdded }">
			<!-- 显示温室中的农作物信息，考虑修改按钮 -->
			<hr />
			<h3 class="h3">温室中的农作物</h3>
			<table class="table table-bordered">
				<tr>
					<td>农作物批次号</td>
					<td>${cropAdded.crop_no }</td>
				</tr>
				<tr>
					<td>农作物名称</td>
					<td>${cropAdded.crop.crop_name }</td>
				</tr>
				<tr>
					<td>栽培面积</td>
					<td>${cropAdded.crop_area }</td>
				</tr>
				<tr>
					<td>栽培数量</td>
					<td>${cropAdded.crop_num }</td>
				</tr>
				<tr>
					<td>栽培土壤</td>
					<td>${cropAdded.soil.soil_name }</td>
				</tr>
				<tr>
					<td>栽培时间</td>
					<td><fmt:formatDate value="${cropAdded.crop_time }"
							pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>

			</table>

			<button onclick="changeCrop();" class="btn bcm tcw w3">更换作物</button>
			<!-- url:/ghmgr/ghadmin/gh/init?update=false -->
			<!-- 两者的区别是前一个修改当前作物信息，后一个 插入一条温室作物记录-->
		</c:if>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/messages_zh.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/form-ajax.js"></script>
	<script type="text/javascript">
function changeCrop(btn){
	$('#initCrops').show();
}
</script>
</body>
</html>