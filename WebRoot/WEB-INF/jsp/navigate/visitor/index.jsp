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
<title>温室智慧管控系统--访客首页</title>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/include/header.jsp"></jsp:include>

	<div class="article">

		<div class="sidebar-nav">

			<a href="#livedata" class="nav-header" data-toggle="collapse"><span
				class="icon-pencil iconSpan"></span>实时数据</a>
			<ul id="livedata" class="nav nav-list collapse">
			</ul>


			<a href="historydata" class="nav-header" data-toggle="collapse"><span
				class=" icon-ok iconSpan"></span>历史数据</a>
			<ul id="hisdorydata" class="nav nav-list collapse">
			</ul>

			<a href="#outputdata" class="nav-header" data-toggle="collapse"><span
				class="icon-signout iconSpan"></span>导出数据</a>
			<ul id="outputdata" class="nav nav-list collapse">

			</ul>
		</div>
		<!-- end class="sidebar-nav" -->

		<!-- 用于显示内容页 -->
		<div class="pull-right rightContent">
			<iframe name="main" class="mainIframe" scrolling="no"></iframe>
			<!-- 用于显示内容页 -->
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- end class="article" -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
</body>
</html>