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
		<a href="<%=request.getContextPath()%>/stat/livedata" class="nav-header"
						data-toggle="modal">主页</a>
		<a href="<%=request.getContextPath()%>/stat/irrigation" class="nav-header"
						data-toggle="modal">灌溉系统</a>
			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="greenhouse">

					<a href="#${greenhouse.GH_code}" class="nav-header"
						data-toggle="collapse">温室${greenhouse.GH_code}</a>
					<ul id="${greenhouse.GH_code}" class="nav nav-list collapse">
						<li><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=${greenhouse.GH_id}"
							target="main">实时数据</a></li>
						<li><a
							href="<%=request.getContextPath()%>/stat/historydata?ghId=${greenhouse.GH_id}"
							target="main">历史数据</a></li>
						<!-- 袁健炜 2017-02-28  night modify start-->
						
						<li>参数设置>>></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/editgh?ghId=${greenhouse.GH_id}"
							target="main">温室结构信息</a>
					    </li>
						 
						<li>作物信息</li> 
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/ctrl/change-model?ghId=${greenhouse.GH_id}"
							target="main">控制模式</a>
					    </li>
						 
						
						<!-- 袁健炜 2017-02-28  night modify end-->    
						
					</ul>
				</c:forEach>
			</c:if>

		</div>
		<!-- end class="sidebar-nav" -->

		<div class="pull-right rightContent">
			<iframe name="main" class="mainIframe" scrolling="no"
				onload="iw=this.contentWindow;$(this).height(iw.$(iw.document).height())"
				src="<%=request.getContextPath()%>/stat/livedata"></iframe>
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- end class="article" -->
	<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
</body>
</html>