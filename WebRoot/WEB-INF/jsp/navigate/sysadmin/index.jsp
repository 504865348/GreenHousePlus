<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

			<a href="#system-menu" class="nav-header" data-toggle="collapse"><span
				class="icon-cog iconSpan"></span>系 统 管 理</a>
			<ul id="system-menu" class="nav nav-list collapse">
				<!-- 
				<li><a href="#" target="main">系统</a></li>
			 -->

				<li><a
					href="<%=request.getContextPath()%>/basemgr/sysadmin/listbase"
					target="main">基 地 管 理</a></li>
			</ul>
			<a href="#model-menu" class="nav-header" data-toggle="collapse"><span
				class="icon-tasks iconSpan"></span>模 型 库 管 理 </a>
			<ul id="model-menu" class="nav nav-list collapse">
				<li><a href="<%=request.getContextPath()%>/modellib/crop/list"
					target="main">作 物 模 型 库</a></li>
				<li><a href="<%=request.getContextPath()%>/modellib/env/list"
					target="main">环 境 模 型 库</a></li>
				<li><a
					href="<%=request.getContextPath()%>/modellib/ctrlcost/list"
					target="main">调控成本模型库</a></li>
				<li><a
					href="<%=request.getContextPath()%>/modellib/optctrl/list"
					target="main">优化控制模型库</a></li>
			</ul>

			<a href="#user-menu" class="nav-header" data-toggle="collapse"><span
				class="icon-group iconSpan"></span>用 户 管 理</a>
			<ul id="user-menu" class="nav nav-list collapse">
				<li><a href="<%=request.getContextPath()%>/usermgr/list"
					target="main">基 地 管 理 员</a></li>
			</ul>
		</div>
		<!-- end class="sidebar-nav" -->

		<!-- 用于显示内容页 -->
		<div class="pull-right rightContent">
			<iframe name="main" class="mainIframe" scrolling="no"
				src="<%=request.getContextPath()%>/basemgr/sysadmin/listbase"></iframe>
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- end class="article" -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
</body>
</html>