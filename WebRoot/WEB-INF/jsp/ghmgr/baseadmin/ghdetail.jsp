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
<script
	src="<%=request.getContextPath() %>/assets/js/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/bootstrap.min.js"></script>
<title>温室详情</title>
</head>
<body>
	<!-- 温室基础信息start -->
	<div style="width: 60%; margin: 20px auto;">
		<table class="table table-bordered table-condensed">
			<tr>
				<td class="text-center">编 号：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.GH_id}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">温室代号：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.GH_code}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">温室面积：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.GH_area}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">建造时间：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<fmt:formatDate
						value="${greenhouse.GH_build}" pattern="yyyy-MM-dd" /></td>
			</tr>

			<tr>
				<td class="text-center">温室类型：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:if test="${greenhouse.GH_type=='0'}">
						<c:out value="其他"></c:out>
					</c:if> <c:if test="${greenhouse.GH_type=='1'}">
						<c:out value="文洛型温室"></c:out>
					</c:if> <c:if test="${greenhouse.GH_type=='2'}">
						<c:out value="连栋温室"></c:out>
					</c:if> <c:if test="${greenhouse.GH_type=='3'}">
						<c:out value="单栋温室"></c:out>
					</c:if> <c:if test="${greenhouse.GH_type=='4'}">
						<c:out value="日光温室"></c:out>
					</c:if></td>
			</tr>
			<tr>
				<td class="text-center">覆盖材料：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:if test="${greenhouse.cover=='0'}">
						<c:out value="其他"></c:out>
					</c:if> <c:if test="${greenhouse.cover=='1'}">
						<c:out value="玻璃"></c:out>
					</c:if> <c:if test="${greenhouse.cover=='2'}">
						<c:out value="塑料薄膜"></c:out>
					</c:if> <c:if test="${greenhouse.cover=='3'}">
						<c:out value="PC板"></c:out>
					</c:if></td>
			</tr>
			<tr>
				<td class="text-center">高 度：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.height}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">跨 度：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.span}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">跨 数：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.num_span}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">开 间：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.bay}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">开间数：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.num_bay}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">备 注：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${greenhouse.remark}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">管理员账号：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${user.username}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">密 码：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${user.password}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">二级密码：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${user.sec_password}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">姓 名：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${user.user_realname}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">手机号：</td>
				<td>&nbsp&nbsp&nbsp&nbsp<c:out value="${user.user_mobile}"></c:out></td>
			</tr>
		</table>
		<div class="row">
			<div class="col-xs-4">
				<input type="button" value="控制设备" class="btn bcm tcw"
					onclick="location='<%=request.getContextPath()%>/device/gh/device_list?ghId=${greenhouse.GH_id}'">
			</div>
			<div class="col-xs-4">
				<input type="button" value="检测参数" class="btn bcm tcw"
					onclick="location='<%=request.getContextPath()%>/device/element/device_list?ghId=${greenhouse.GH_id}'">
			</div>
		</div>
	</div>



</body>
</html>