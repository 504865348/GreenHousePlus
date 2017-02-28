<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>温室智慧管理系统 - 个人中心</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<div style="width: 60%; margin: 20px auto;">
		<table class="table table-bordered table-condensed">
			<tr>
				<td class="text-center" style="width: 30%;">编 号：</td>
				<td class="text-center"><c:out value="${user.user_id}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">姓 名：</td>
				<td class="text-center"><c:out value="${user.user_realname}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">手 机：</td>
				<td class="text-center"><c:out value="${user.user_mobile}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">用 户 名：</td>
				<td class="text-center"><c:out value="${user.username}"></c:out></td>
			</tr>
			<tr>
				<td class="text-center">您的身份是：</td>
				<td class="text-center"><c:if test="${me.user_type=='3'}">系统管理员</c:if>
					<c:if test="${me.user_type=='2'}">基地管理员</c:if> <c:if
						test="${me.user_type=='1'}">温室管理员</c:if> <c:if
						test="${me.user_type=='0'}">访客</c:if></td>
			</tr>
		</table>
	</div>


</body>
</html>
