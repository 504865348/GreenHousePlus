<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
<style>
.th td, .th th {
	font-size: 14px;
}
</style>
<title>基地信息</title>
</head>
<body>
	<h3 class="h3">基地信息</h3>
	<div class="center-block w11">
		<table class="table table-bordered table-hover">
			<tr class="th">
				<th>编号</th>
				<th>名称</th>
				<th>地址</th>
				<th>经度</th>
				<th>纬度</th>
			</tr>
			<tr>
				<td><c:out value="${base.base_id}"></c:out></td>
				<td><c:out value="${base.base_name}"></c:out></td>
				<td><c:out value="${base.base_address}"></c:out></td>
				<td><c:out value="${base.base_lat}"></c:out></td>
				<td><c:out value="${base.base_long}"></c:out></td>
			</tr>
		</table>
	</div>
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
</body>
</html>
