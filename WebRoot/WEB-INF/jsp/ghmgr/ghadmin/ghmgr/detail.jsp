<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<style>
.ghnav-header {
	display: inline-block;
	padding: 10px;
	background: #5C6A85;
	color: #fff;
}

.ghnav-header:hover {
	color: #000;
}

.ghnav {
	list-style: none;
	margin: 0;
	padding: 0;
}

.ghnav li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.ghnav li a {
	display: inline-block;
	color: #000;
	border-bottom: 1px solid #eee;
	padding: 10px;
	background-color: #fff;
}

.ghnav li a:hover {
	background: #eee;
}
</style>
<title>温室详情</title>
</head>
<body>
 
	<div style="width: 60%; margin: 20px auto;">
		<!-- 温室检测元素 -->
		<c:forEach items="${data.typeAndElements }" var="ele">
			<h3 class="h3">${ele.element_type.type }</h3>
			<table class="table table-bordered table-condensed">

				<tr>
					<th>元素编号</th>
					<th>元素名称</th>
					<th>检测频率</th>
					<th>单位</th>
					<th>偏移量</th>
					<th>数据类别</th>
				</tr>
				<c:forEach items="${ele.elements }" var="i">
					<tr>
						<td>${i.element_id }</td>
						<td>${i.element_nam }</td>
						<td>${i.element_rate }</td>
						<td>${i.element_unit }</td>
						<td>${i.element_offset }</td>
						<td>${i.data_type }</td>
					</tr>
				</c:forEach>
			</table>

		</c:forEach>
		<!-- 室外检测设备 -->
		<h3 class="h3">控制设备</h3>
		<table class="table table-bordered table-condensed">
			<tr>
				<th>设备编号</th>
				<th>设备名称</th>
				<th>设备类型</th>
				<th>控制类别</th>
				<th>备注</th>
			</tr>
			<c:forEach items="${data.setupCons }" var="i">
				<tr>
					<td>${i.equip_id }</td>
					<td>${i.name }</td>
					<td>
						<%-- <c:if test="${i.type==0 }">温室设备</c:if>
			<c:if test="${i.type==1 }">室内检测设备</c:if>
			<c:if test="${i.type==2 }">室外检测设备</c:if> --%> <c:out
							value="${i.type }"></c:out>
					</td>
					<td><c:if test="${i.control==1 }">开关型</c:if> <c:if
							test="${i.control==2 }">正反转型</c:if> <c:if test="${i.control==0 }">其他</c:if>
					</td>
					<td>${i.remark }</td>
				</tr>
			</c:forEach>
		</table>

		<!-- 温室作物 -->
		<!-- 结束作物  作物栽培-->
		<h3 class="h3">温室作物</h3>
		<table class="table table-bordered table-condensed">
			<tr>
				<td class="text-center w3">农作物批次号:</td>
				<td>${data.crop.crop_no }</td>
			</tr>
			<tr>
				<td class="text-center">农作物名称:</td>
				<td>${data.crop.crop.crop_name }</td>
			</tr>
			<tr>
				<td class="text-center">栽培面积:</td>
				<td>${data.crop.crop_area }</td>
			</tr>
			<tr>
				<td class="text-center">栽培数量:</td>
				<td>${data.crop.crop_num }</td>
			</tr>
			<tr>
				<td class="text-center">栽培土壤:</td>
				<td>${data.crop.soil.soil_name }</td>
			</tr>
			<tr>
				<td class="text-center">栽培时间:</td>
				<td><fmt:formatDate value="${data.crop.crop_time }"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</table>

		<div class="ghnav">
			<div class="row">
				<div class="col-xs-2">
					<a href="#fert-menu" class="ghnav-header" data-toggle="collapse">肥料管理</a>
					<ul id="fert-menu" class="ghnav ghnav-list collapse">
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/fert/add"
							target="main">添加肥料</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/fert/list"
							target="main">查看肥料</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/fert/use"
							target="main">使用肥料</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<a href="#pest-menu" class="ghnav-header" data-toggle="collapse">农药管理</a>
					<ul id="pest-menu" class="ghnav ghnav-list collapse">
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/pestmgr/add"
							target="main">添加农药</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/pestmgr/list"
							target="main">查看农药</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/pestmgr/use"
							target="main">使用农药</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<a href="#log-menu" class="ghnav-header" data-toggle="collapse">日志管理</a>
					<ul id="log-menu" class="ghnav ghnav-list collapse">
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/log/add"
							target="main">日志记录</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/log/list"
							target="main">查看日志</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<a href="#soil-menu" class="ghnav-header" data-toggle="collapse">土壤管理</a>
					<ul id="soil-menu" class="ghnav ghnav-list collapse">
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/soil/add"
							target="main">添加土壤</a></li>
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/soil/list"
							target="main">查看土壤</a></li>
					</ul>
				</div>
				<div class="col-xs-2">
					<a href="#crop-menu" class="ghnav-header" data-toggle="collapse">作物管理</a>
					<ul id="crop-menu" class="ghnav ghnav-list collapse">
					   <c:if test="${pager.list=='[]'}">   
						  <li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/crop/add?ghid=${data.GH_id }"
							target="main">添加作物</a></li>
						</c:if>   
						
						<li><a
							href="<%=request.getContextPath()%>/ghmgr/ghadmin/crop/list?ghid=${data.GH_id }"
							target="main">查看作物</a></li>
					</ul>
				</div>
			</div>
			<!-- end class="row" -->
		</div>

	</div>

</body>
</html>