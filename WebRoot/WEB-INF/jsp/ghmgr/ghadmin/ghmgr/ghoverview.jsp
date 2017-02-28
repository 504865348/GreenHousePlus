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
<title>温室概览</title>
</head>
<body>
	<h3 class="h3">温室概览</h3>
	<div style="width: 60%; margin: 20px auto;">
		<%-- <table class="table table-bordered table-condensed">
	<tr>
		<td class="text-center w3">温室编号:</td>
		<td>${data.GH_id }</td>
	</tr>
	<tr>
		<td class="text-center">温室代号:</td>
		<td>${data.GH_code }</td>
	</tr>
	<tr>
		<td class="text-center">温室作物:</td>
		<td>${data.GH_code }</td>
	</tr>
</table> --%>
		<table class="table table-bordered table-condensed">
			<tr>
				<td class="text-center w3">温室编号:</td>
				<td>${data.GH_id }</td>
			</tr>
			<tr>
				<td class="text-center">温室代号:</td>
				<td>${data.GH_code }</td>
			</tr>
			<tr>
				<td class="text-center">温室面积:</td>
				<td>${data.GH_area }</td>
			</tr>
			<tr>
				<td class="text-center">建造时间:</td>
				<td><fmt:formatDate value="${data.GH_build }"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td class="text-center">温室类型:</td>
				<td><c:if test="${data.GH_type==1 }">文洛型温室</c:if> <c:if
						test="${data.GH_type==2 }">连栋温室</c:if> <c:if
						test="${data.GH_type==3 }">单栋温室</c:if> <c:if
						test="${data.GH_type==4 }">日光</c:if> <c:if
						test="${data.GH_type==0 }">其他</c:if></td>
			</tr>
			<tr>
				<td class="text-center">覆盖材料:</td>
				<td><c:if test="${data.cover==1 }">玻璃</c:if> <c:if
						test="${data.cover==2 }">塑料薄膜</c:if> <c:if
						test="${data.cover==3 }">PC板</c:if> <c:if test="${data.cover==0 }">其他</c:if>
				</td>
			</tr>
			<tr>
				<td class="text-center">高 度:</td>
				<td>${data.height }</td>
			</tr>
			<tr>
				<td class="text-center">跨 度:</td>
				<td>${data.span }</td>
			</tr>
			<tr>
				<td class="text-center">跨 数:</td>
				<td>${data.num_span }</td>
			</tr>
			<tr>
				<td class="text-center">开 间:</td>
				<td>${data.bay }</td>
			</tr>
			<tr>
				<td class="text-center">开间数:</td>
				<td>${data.num_bay }</td>
			</tr>
			<tr>
				<td class="text-center">备 注:</td>
				<td>${data.remark }</td>
			</tr>
			<tr>
				<td class="text-center">基地编号:</td>
				<td>${data.base_id }</td>
			</tr>
			<tr>
				<td class="text-center">温室管理员编号:</td>
				<td>${data.user_id }</td>
			</tr>
			<tr>
				<td class="text-center">温室作物:</td>
				<td>${data.crop.crop.crop_name }</td>
			</tr>
		</table>
		<!-- 温室检测设备 -->
		<%-- <table  class="table table-bordered table-condensed">
	<tr>
		<th class="text-center">设备编号</th>
		<th class="text-center">设备名称</th>
		<th class="text-center">设备类型</th>
		<th class="text-center">控制类别</th>
		<th class="text-center">备注</th>
	</tr>
	<c:forEach items="${data. }" var="i">
	<tr>
		<td class="text-center">${i.Equip_id }</td>
		<td class="text-center">${i.Name }</td>
		<td class="text-center">
			<c:if test="${i.name==0 }">温室设备</c:if>
			<c:if test="${i.name==1 }">室内检测设备</c:if>
			<c:if test="${i.name==2 }">室外检测设备</c:if>
		</td>
		<td class="text-center">
			<c:if test="${i.control==1 }">开关型</c:if>
			<c:if test="${i.control==2 }">正反转型</c:if>
			<c:if test="${i.control==0 }">其他</c:if>
		</td>
		<td class="text-center">
			${i.remark }
		</td>
	</tr>
	</c:forEach>
</table> --%>

		<h3 class="text-center">温室作物信息</h3>
		<c:if test="${!empty data.crop }">
			<table class="table table-bordered table-condensed">
				<tr>
					<td class="text-center w3">农作物批次号</td>
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
		</c:if>
		<c:if test="${empty data.crop }">
	温室中暂无作物<a href="<%=request.getContextPath()%>/ghmgr/ghadmin/gh/init"
				class="btn btn-primary">前往添加</a>
		</c:if>
	</div>
</body>
</html>