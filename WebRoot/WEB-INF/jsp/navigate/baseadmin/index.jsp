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
<title>温室智慧管控系统</title>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>
	<div class="article">
		<div class="sidebar-nav">

			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="greenhouse">

					<a href="#${greenhouse.GH_code}" class="nav-header"
						data-toggle="collapse">温室代号${greenhouse.GH_code}</a>
					<ul id="${greenhouse.GH_code}" class="nav nav-list collapse">
						<li><a
							href="<%=request.getContextPath()%>/stat/livedata?ghId=${greenhouse.GH_id}"
							target="main">实时数据</a></li>
						<li><a
							href="<%=request.getContextPath()%>/stat/historydata?ghId=${greenhouse.GH_id}"
							target="main">历史数据</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/editgh?ghId=${greenhouse.GH_id}"
							target="main">参数设置</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/log/list?ghId=${greenhouse.GH_id}"
							target="main">栽培日志</a></li>
					</ul>
				</c:forEach>
			</c:if>

			<a href="#gh-menu" class="nav-header" data-toggle="collapse"><span
				class="icon-th iconSpan"></span>温室管理</a>
			<ul id="gh-menu" class="nav nav-list collapse">
				<li><a href="<%=request.getContextPath()%>/ghmgr/listgh"
					target="main">温室信息</a></li>
				<li><a href="<%=request.getContextPath()%>/ghmgr/addgh"
					target="main">创建温室</a></li>

			</ul>

			<a href="#base-menu" class="nav-header" data-toggle="collapse"><span
				class="icon-reorder iconSpan"></span>基地管理</a>
			<ul id="base-menu" class="nav nav-list collapse">
				<li><a
					href="<%=request.getContextPath()%>/basemgr/baseadmin/detailbase?userId=${me.user_id}"
					target="main">基地参数</a></li>
				<li><a
					href="<%=request.getContextPath()%>/ghmgr/ghadmin/crop/list"
					target="main">作物管理</a></li>
				<li><a
					href="<%=request.getContextPath()%>/ghmgr/ghadmin/fert/list"
					target="main">肥料管理</a></li>
				<li><a
					href="<%=request.getContextPath()%>/ghmgr/ghadmin/pestmgr/list"
					target="main">农药管理</a></li>
				<li><a
					href="<%=request.getContextPath()%>/ghmgr/ghadmin/soil/list"
					target="main">土壤管理</a></li>
			</ul>

			<a href="#user-menu" class="nav-header" data-toggle="collapse"><span
				class="icon-group iconSpan"></span>用户管理</a>
			<ul id="user-menu" class="nav nav-list collapse">
				<li><a href="<%=request.getContextPath()%>/usermgr/list"
					target="main">温室管理员</a></li>
			</ul>

		</div>
		<!-- end class="sidebar-nav" -->

		<div class="pull-right rightContent">
			<iframe name="main" class="mainIframe" scrolling="no"
				src="<%=request.getContextPath()%>/ghmgr/listgh"></iframe>
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- end class="article" -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
</body>
</html>