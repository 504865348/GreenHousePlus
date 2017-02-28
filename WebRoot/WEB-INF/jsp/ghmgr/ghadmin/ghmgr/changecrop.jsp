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
<title>更换作物</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/ghmgr/ghadmin/gh/init"
		method="post" success="操作成功" fail="操作失败"
		forward="<%=request.getContextPath()%>/ghmgr/ghadmin/gh/init"
		form-ajax>
		<h3 class="h3">可添加的农作物</h3>
		<ul>
			<c:forEach items="${cropToAdd }" var="i">
				<li><input type="radio" name="Crop_id" value="${i.crop_id }" />${i.crop_name }
				</li>
			</c:forEach>
		</ul>

		<div>
			<label>栽培面积：</label> <input type="text" name="Crop_area"
				class="required number" />
		</div>
		<div>
			<label>栽培数量：</label> <input type="text" name="Crop_num"
				class="required number" />
		</div>
		<div>
			<label>栽培土壤：</label> <select name="Soil_id">
				<c:forEach var="i" items="${soil }">
					<option value="${Soli_id }">[${i.soil_type}]${i.soil_name }</option>
				</c:forEach>
			</select>
		</div>

	</form>
</body>
</html>