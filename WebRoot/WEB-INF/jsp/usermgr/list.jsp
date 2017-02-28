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
<title>全部访客</title>
</head>
<body>
	<div class="w11 center-block">
		<%if ((String) request.getAttribute("msg") == "添加成功") {%>
		<script>alert("添加成功");</script>
		<%}%>
		<%if ((String) request.getAttribute("msg") == "编辑成功") {%>
		<script>alert("编辑成功");</script>
		<%}%>
		<%if ((String) request.getAttribute("msg") == "删除成功") {%>
		<script>alert("删除成功");</script>
		<%}%>
		<!-- 列表显示该温室的全部访客start -->
		<c:if test="${empty pager.list}">
			<c:if test="${me.user_type=='1'}">
				<h3>温室中还没有访客</h3>
				<a href="<%=request.getContextPath()%>/usermgr/add">添加访客</a>
			</c:if>
			<c:if test="${me.user_type=='2'}">
				<h3>基地中还没有温室管理员</h3>
				<a href="<%=request.getContextPath()%>/ghmgr/addgh">添加温室管理员</a>
			</c:if>
			<c:if test="${me.user_type=='3'}">
				<h3>系统中还没有基地管理员</h3>
				<a href="<%=request.getContextPath()%>/baseadmin/sysadmin/addbase">添加基地管理员</a>
			</c:if>
		</c:if>
		<c:if test="${not empty pager.list}">
			<h3 class="h3">全部用户</h3>
			<table class="table table-bordered table-hover">
				<tr>
					<th>编号</th>
					<th>姓名</th>
					<th>手机</th>
					<th>用户名</th>
					<th>密码</th>
					<th>无编辑权限</th>
					<th>无删除权限</th>
				</tr>
				<c:forEach items="${pager.list}" var="user">
					<tr>
						<td><c:out value="${user.user_id}"></c:out></td>
						<td><c:out value="${user.user_realname}"></c:out></td>
						<td><c:out value="${user.user_mobile}"></c:out></td>
						<td><c:out value="${user.username}"></c:out></td>
						<td><c:out value="${user.password}"></c:out></td>
						<!-- 温室管理员有以下权限 -->
						<td><c:if test="${me.user_type=='1'}">
								<a
									href="<%=request.getContextPath()%>/usermgr/edit?userId=${user.user_id}">编辑</a>
							</c:if></td>
						<!-- 温室管理员有以上权限 -->
						<td><c:if test="${me.user_type=='1'}">
								<a
									href="<%=request.getContextPath()%>/usermgr/delete?userId=${user.user_id}">删除</a>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 温室管理员有以下权限 -->
			<c:if test="${me.user_type=='1'}">
				<div style="position: absolute; right: 20px; width: 100px;">
					<input type="button" value="添加访客" class="btn bcm tcw"
						onclick="location='<%=request.getContextPath()%>/usermgr/add'">
				</div>
			</c:if>
			<!-- 温室管理员有以上权限 -->
			<!-- 列表显示该温室的全部访客end -->
			<!-- 分页start -->
			<div id="page"></div>
			<script src="<%=request.getContextPath()%>/assets/laypage/laypage.js"></script>
			<script type="text/javascript">
			laypage({
				cont : 'page',
				pages : '${pager.pageCount}',
				curr : '${pager.pageNumber}',
				jump : function(e, first) {
					if (!first) {
						location.href = '?pn=' + e.curr;
					}
				}
			});
		</script>
			<!-- 分页end -->
		</c:if>
	</div>
</body>
</html>