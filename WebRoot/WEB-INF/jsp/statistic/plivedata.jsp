<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/bootstrap-switch.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/font-awesome.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/admin.css"></link>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/plus.css" />
<script
	src="<%=request.getContextPath()%>/assets/js/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/assets/js/bootstrap-switch.min.js"></script>
<title>温室智慧管控系统</title>
</head>
<body class="container-fluid">
	<div>
		<!-- 取消row -->
		<div class="panel panel-success my-panel">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="glyphicon glyphicon-pushpin" style="font-size: 10px"></span>&nbsp;&nbsp;温室概览
			</div>
			<div class="panel-body">
				<!-- Table -->
				<table class="table table-bordered table-striped table-condensed"
					style="font-size: 14px">
					<tr>
						<th>概况</th>
						<th>温度</th>
						<th>湿度</th>
						<th>光照强度</th>
						<th>CO2浓度</th>
						<th>栽培植物</th>
						<th>定植日期</th>
						<th>灌溉</th>
						<th>控制模式</th>
					</tr>
					<tr>
						<td><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=21"
							class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;001</a></td>
						<td>${gh_1.typeAndElements[0].elements[0].current_value }
							${gh.typeAndElements[0].elements[0].element_unit }</td>
						<td>${gh_1.typeAndElements[0].elements[1].current_value }
							${gh.typeAndElements[0].elements[1].element_unit }</td>
						<td>${gh_1.typeAndElements[0].elements[5].current_value }
							${gh.typeAndElements[0].elements[5].element_unit }</td>
						<td>${gh_1.typeAndElements[0].elements[4].current_value }
							${gh.typeAndElements[0].elements[4].element_unit }</td>
						<td>${pager_1.list[0].crop_name}</td>
						<td>${pager_1.list[0].crop_date}</td>
						<td><c:if test="${irr.gh_one_irrigation_status == 0 }">关</c:if>
							<c:if test="${irr.gh_one_irrigation_status == 1 }">开</c:if></td>
						<td><c:if test="${gh_1.control_mode == 0 }">智能控制</c:if>  
		                    <c:if test="${gh_1.control_mode == 1 }">设定值控制</c:if>
		                    <c:if test="${gh_1.control_mode == 2 }">手动控制</c:if></td> 
					</tr>

					<tr>
						<td><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=22"
							class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;002</a></td>
						<td>${gh_2.typeAndElements[0].elements[0].current_value }
							${gh.typeAndElements[0].elements[0].element_unit }</td>
						<td>${gh_2.typeAndElements[0].elements[1].current_value }
							${gh.typeAndElements[0].elements[1].element_unit }</td>
						<td>${gh_2.typeAndElements[0].elements[5].current_value }
							${gh.typeAndElements[0].elements[5].element_unit }</td>
						<td>${gh_2.typeAndElements[0].elements[4].current_value }
							${gh.typeAndElements[0].elements[4].element_unit }</td>
						<td>${pager_2.list[0].crop_name}</td>
						<td>${pager_2.list[0].crop_date}</td>
						<td><c:if test="${irr.gh_two_irrigation_status == 0 }">关</c:if>
							<c:if test="${irr.gh_two_irrigation_status == 1 }">开</c:if></td>
					    <td><c:if test="${gh_2.control_mode == 0 }">智能控制</c:if>  
		                    <c:if test="${gh_2.control_mode == 1 }">设定值控制</c:if>
		                    <c:if test="${gh_2.control_mode == 2 }">手动控制</c:if></td> 
					</tr>

					<tr>
						<td><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=23"
							class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;003</a></td>
						<td>${gh_3.typeAndElements[0].elements[0].current_value }
							${gh.typeAndElements[0].elements[0].element_unit }</td>
						<td>${gh_3.typeAndElements[0].elements[1].current_value }
							${gh.typeAndElements[0].elements[1].element_unit }</td>
						<td>${gh_3.typeAndElements[0].elements[5].current_value }
							${gh.typeAndElements[0].elements[5].element_unit }</td>
						<td>${gh_3.typeAndElements[0].elements[4].current_value }
							${gh.typeAndElements[0].elements[4].element_unit }</td>
						<td>${pager_3.list[0].crop_name}</td>
						<td>${pager_3.list[0].crop_date}</td>
						<td><c:if test="${irr.gh_three_irrigation_status == 0 }">关</c:if>
							<c:if test="${irr.gh_three_irrigation_status == 1 }">开</c:if></td>
						<td><c:if test="${gh_3.control_mode == 0 }">智能控制</c:if>  
		                    <c:if test="${gh_3.control_mode == 1 }">设定值控制</c:if>
		                    <c:if test="${gh_3.control_mode == 2 }">手动控制</c:if></td> 
					</tr>

					<tr>
						<td><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=24"
							class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;004</a></td>
						<td>${gh_4.typeAndElements[0].elements[0].current_value }
							${gh.typeAndElements[0].elements[0].element_unit }</td>
						<td>${gh_4.typeAndElements[0].elements[1].current_value }
							${gh.typeAndElements[0].elements[1].element_unit }</td>
						<td>${gh_4.typeAndElements[0].elements[5].current_value }
							${gh.typeAndElements[0].elements[5].element_unit }</td>
						<td>${gh_4.typeAndElements[0].elements[4].current_value }
							${gh.typeAndElements[0].elements[4].element_unit }</td>
						<td>${pager_4.list[0].crop_name}</td>
						<td>${pager_4.list[0].crop_date}</td>
						<td><c:if test="${irr.gh_four_irrigation_status == 0 }">关</c:if>
							<c:if test="${irr.gh_four_irrigation_status == 1 }">开</c:if></td>
						<td><c:if test="${gh_4.control_mode == 0 }">智能控制</c:if>  
		                    <c:if test="${gh_4.control_mode == 1 }">设定值控制</c:if>
		                    <c:if test="${gh_4.control_mode == 2 }">手动控制</c:if></td> 
					</tr>

					<tr>
						<td><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=25"
							class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;005</a></td>
						<td>${gh_5.typeAndElements[0].elements[0].current_value }
							${gh.typeAndElements[0].elements[0].element_unit }</td>
						<td>${gh_5.typeAndElements[0].elements[1].current_value }
							${gh.typeAndElements[0].elements[1].element_unit }</td>
						<td>${gh_5.typeAndElements[0].elements[5].current_value }
							${gh.typeAndElements[0].elements[5].element_unit }</td>
						<td>${gh_5.typeAndElements[0].elements[4].current_value }
							${gh.typeAndElements[0].elements[4].element_unit }</td>
						<td>${pager_5.list[0].crop_name}</td>
						<td>${pager_5.list[0].crop_date}</td>
						<td><c:if test="${irr.gh_five_irrigation_status == 0 }">关</c:if>
							<c:if test="${irr.gh_five_irrigation_status == 1 }">开</c:if></td>
						<td><c:if test="${gh_5.control_mode == 0 }">智能控制</c:if>  
		                    <c:if test="${gh_5.control_mode == 1 }">设定值控制</c:if>
		                    <c:if test="${gh_5.control_mode == 2 }">手动控制</c:if></td> 
					</tr>

					<tr>
						<td><a
							href="<%=request.getContextPath()%>/stat/singlelivedata?ghId=26"
							class="text-success"><span class="glyphicon glyphicon-link"></span>&nbsp;&nbsp;温室&nbsp;&nbsp;006</a></td>
						<td>${gh_6.typeAndElements[0].elements[0].current_value }
							${gh.typeAndElements[0].elements[0].element_unit }</td>
						<td>${gh_6.typeAndElements[0].elements[1].current_value }
							${gh.typeAndElements[0].elements[1].element_unit }</td>
						<td>${gh_6.typeAndElements[0].elements[5].current_value }
							${gh.typeAndElements[0].elements[5].element_unit }</td>
						<td>${gh_6.typeAndElements[0].elements[4].current_value }
							${gh.typeAndElements[0].elements[4].element_unit }</td>
						<td>${pager_6.list[0].crop_name}</td>
						<td>${pager_6.list[0].crop_date}</td>
						<td><c:if test="${irr.gh_six_irrigation_status == 0 }">关</c:if>
							<c:if test="${irr.gh_six_irrigation_status == 1 }">开</c:if></td>
						<td><c:if test="${gh_6.control_mode == 0 }">智能控制</c:if>  
		                    <c:if test="${gh_6.control_mode == 1 }">设定值控制</c:if>
		                    <c:if test="${gh_6.control_mode == 2 }">手动控制</c:if></td> 
					</tr>
				</table>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- 温度和气象控制 -->
		<div>
			<!-- 取消row -->
			<div class="col-md-6">
				<div class="panel panel-success my-panel my-panel-height-360">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<span class="glyphicon glyphicon-pushpin" style="font-size: 10px"></span>&nbsp;&nbsp;气象概览
					</div>
					<div class="panel-body">
						<!-- Table -->
						<table class="table table-bordered table-striped table-condensed"
							style="font-size: 14px">
							<tr>
								<th>参数</th>
								<th>数值</th>
								<th>单位</th>
							</tr>
							<tr>
								<td>空气温度</td>
								<td>${mete.air_temperature}</td>
								<td>℃</td>
							</tr>
							<tr>
								<td>空气湿度</td>
								<td>${mete.air_humidity}</td>
								<td>%</td>
							</tr>
							<tr>
								<td>CO2浓度</td>
								<td>${mete.cd_thickness}</td>
								<td>Ppm</td>
							</tr>
							<tr>
								<td>光照度</td>
								<td>${mete.illuminance}</td>
								<td>Lux</td>
							</tr>
							<tr>
								<td>风速</td>
								<td>${mete.wind_speed}</td>
								<td>米/秒</td>
							</tr>
							<tr>
								<td>风向</td>
								<td>${mete.wind_direction}</td>
								<td>度</td>
							</tr>
							<tr>
								<td>雨量</td>
								<td><c:if test="${mete.rainfall==1}">有</c:if> <c:if
										test="${mete.rainfall==0}">无</c:if></td>
								<td></td>
							</tr>
						</table>
					</div>
					<!-- end panel-body -->
				</div>
				<!-- end panel -->
			</div>
			<!-- end col-md-6 -->
		</div>
	</div>
	<!-- end row -->
	<script type="text/javascript">
		$("[name='checkbox1']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});

		$("[name='checkbox2']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});

		$("[name='checkbox3']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});

		$("[name='checkbox4']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});

		$("[name='checkbox5']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});

		$("[name='checkbox6']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});

		$("[name='checkbox1']").bootstrapSwitch({
			onColor : "success",
			offColor : "info",
			size : "mini",
			onSwitchChange : function(event, state) {
				if (state == true) {
					$(this).val("1");
				} else {
					$(this).val("0");
				}
			}
		});
	</script>
</body>
</html>